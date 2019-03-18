PREFIX := $(CURDIR)/tools/binutils/bin/arm-none-eabi-
include config.mk

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif


#### Tools ####

# We only want to use pipefail shell when we are piping.
# Otherwise, forcing a shell is a slowdown to Make.
ifeq ($(KEEP_TEMPS),)
SHELL     := bash -o pipefail
endif

AS        := $(PREFIX)as
CC1       := tools/agbcc/bin/agbcc$(EXE)
CPP       := $(CC) -E -x c
LD        := $(PREFIX)ld
OBJCOPY   := $(PREFIX)objcopy

# macOS lacks sha1sum, use the Perl-based shasum instead as a drop-in.
ifeq (,$(shell which sha1sum || true 2>/dev/null))
SHA1SUM   := shasum -c
else
SHA1SUM   := sha1sum -c
endif

TOOLS_DIR := tools
GBAGFX    := $(TOOLS_DIR)/gbagfx/gbagfx$(EXE)
RSFONT    := $(TOOLS_DIR)/rsfont/rsfont$(EXE)
AIF2PCM   := $(TOOLS_DIR)/aif2pcm/aif2pcm$(EXE)
MID2AGB   := $(TOOLS_DIR)/mid2agb/mid2agb$(EXE)
PREPROC   := $(TOOLS_DIR)/preproc/preproc$(EXE)
SCANINC   := $(TOOLS_DIR)/scaninc/scaninc$(EXE)
RAMSCRGEN := $(TOOLS_DIR)/ramscrgen/ramscrgen$(EXE)
GBAFIX    := $(TOOLS_DIR)/gbafix/gbafix$(EXE)
MAPJSON   := $(TOOLS_DIR)/mapjson/mapjson$(EXE)

ALL_TOOLS := $(GBAGFX) $(SCANINC) $(PREPROC) $(BIN2C) $(RSFONT) $(AIF2PCM) $(RAMSCRGEN) $(MID2AGB) $(GBAFIX) $(MAPJSON)
ALL_TOOL_NAMES := gbagfx scaninc preproc bin2c rsfont aif2pcm ramscrgen mapjson

ASFLAGS  := -mcpu=arm7tdmi -I include --defsym $(GAME_VERSION)=1 --defsym REVISION=$(GAME_REVISION) --defsym $(GAME_LANGUAGE)=1 --defsym DEBUG=$(DEBUG)
CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Wunused -Werror -O2 -fhex-asm
CPPFLAGS := -I tools/agbcc/include -I include -D$(GAME_VERSION) -DREVISION=$(GAME_REVISION) -D$(GAME_LANGUAGE) -DDEBUG=$(DEBUG)

# Check agbcc's version. The '' prevents old agbcc versions
# from eating stdin, they will simply fail with "No such file
# or directory" and exit non-zero. That is why we silence
# stderr and report 0 if it fails.
CC1_REQ_VER := 1
CC1_VER     := $(shell $(CC1) -agbcc-version '' 2>/dev/null || echo 0)

ifneq ($(CC1_REQ_VER),$(CC1_VER))
    $(error Please update agbcc!)
endif

#### Verbosity flags ####

V ?= 0
ifeq ($(V),0)
ECHO := echo
MAKEFLAGS += -s
else
# no-op the echoing
ECHO := \#
endif

#### Files ####

ROM := poke$(BUILD_NAME).gba
MAP := $(ROM:%.gba=%.map)

BUILD_DIR := build/$(BUILD_NAME)

C_SOURCES    := $(wildcard src/*.c src/*/*.c src/*/*/*.c)
ASM_SOURCES  := $(wildcard src/*.s src/*/*.s asm/*.s data/*.s sound/*.s sound/*/*.s)

C_OBJECTS    := $(addprefix $(BUILD_DIR)/, $(C_SOURCES:%.c=%.o))
ASM_OBJECTS  := $(addprefix $(BUILD_DIR)/, $(ASM_SOURCES:%.s=%.o))
ALL_OBJECTS  := $(C_OBJECTS) $(ASM_OBJECTS)

SUBDIRS      := $(sort $(dir $(ALL_OBJECTS)))

LIBC   := tools/agbcc/lib/libc.a
LIBGCC := tools/agbcc/lib/libgcc.a

LD_SCRIPT := $(BUILD_DIR)/ld_script.ld

# Special configurations required for lib files
%src/libs/siirtc.o:       CC1FLAGS := -mthumb-interwork
%src/libs/agb_flash.o:    CC1FLAGS := -O1 -mthumb-interwork
%src/libs/agb_flash_1m.o: CC1FLAGS := -O1 -mthumb-interwork
%src/libs/agb_flash_mx.o: CC1FLAGS := -O1 -mthumb-interwork
%src/libs/m4a_2.o: CC1 := tools/agbcc/bin/old_agbcc$(EXE)
%src/libs/m4a_4.o: CC1 := tools/agbcc/bin/old_agbcc$(EXE)
%src/libs/libisagbprn.o: CC1 := tools/agbcc/bin/old_agbcc$(EXE)
%src/libs/libisagbprn.o: CC1FLAGS := -mthumb-interwork

#### Main Rules ####

ALL_BUILDS := ruby ruby_rev1 ruby_rev2 sapphire sapphire_rev1 sapphire_rev2 ruby_de sapphire_de ruby_de_debug

# Available targets
.PHONY: all clean tidy tools $(ALL_BUILDS)
NO_DEPS := clean tidy tools

infoshell = $(foreach line, $(shell $1 | sed "s/ /__SPACE__/g"), $(info $(subst __SPACE__, ,$(line))))

# Build tools when building the rom
# Disable dependency scanning for clean/tidy/tools
ifeq (,$(filter $(NO_DEPS),$(MAKECMDGOALS)))
TOOLS_DEP = tools
else
TOOLS_DEP :=
NODEP := 1
endif

# TODO: make this configurable. scaninc is hardcoded to use .d.
DEPDIR := .d


MAKEFLAGS += --no-print-directory
# Secondary expansion is required for dependency variables in object rules.
# .SECONDEXPANSION:
# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

# Create build subdirectories
$(shell mkdir -p $(SUBDIRS))

all: $(TOOLS_DEP) $(ROM)
ifeq ($(COMPARE),1)
	@$(SHA1SUM) $(BUILD_NAME).sha1
endif

clean: override NODEP = 1
clean: tidy
	@$(ECHO) "Cleaning all files..."
	find sound/direct_sound_samples \( -iname '*.bin' \) -exec rm {} +
	$(RM) $(ALL_OBJECTS)
	$(RM) -r .d
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.rl' \) -exec rm {} +
	rm -f data/layouts/layouts.inc data/layouts/layouts_table.inc
	rm -f data/maps/connections.inc data/maps/events.inc data/maps/groups.inc data/maps/headers.inc
	find data/maps \( -iname 'connections.inc' -o -iname 'events.inc' -o -iname 'header.inc' \) -exec rm {} +
	$(MAKE) clean -C tools/gbagfx
	$(MAKE) clean -C tools/scaninc
	$(MAKE) clean -C tools/preproc
	$(MAKE) clean -C tools/bin2c
	$(MAKE) clean -C tools/rsfont
	$(MAKE) clean -C tools/aif2pcm
	$(MAKE) clean -C tools/ramscrgen
	$(MAKE) clean -C tools/gbafix
	$(MAKE) clean -C tools/mapjson

tools: override NODEP = 1
tools: $(ALL_TOOLS)
	@$(MAKE) -C tools/mapjson

tidy:
	@$(ECHO) "Cleaning normal build files..."
	$(RM) $(ALL_BUILDS:%=poke%{.gba,.elf,.map})
	$(RM) -r build


# Disable dependency scanning when NODEP is used for quick building
ifeq ($(NODEP),)
  # Add the .d files to the dependencies.
  $(BUILD_DIR)/src/%.o: $(DEPDIR)/%*.d
  $(BUILD_DIR)/asm/%.o: $(DEPDIR)/%*.d
  $(BUILD_DIR)/data/%.o: $(DEPDIR)/%*.d

  # scaninc puts the deps files into .d/path/file.Td
  C_DEPS       := $(addprefix $(DEPDIR)/, $(C_SOURCES:%.c=%.d))
  ASM_DEPS     := $(addprefix $(DEPDIR)/, $(ASM_SOURCES:%.s=%.d))
else
  # Dummy things out.
  C_DEPS       :=
  ASM_DEPS     :=
endif

$(ROM): %.gba: %.elf
	@$(ECHO) " OBJCOPY $@"
	$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $< $@
	$(GBAFIX) $@ -p -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent

%.elf: $(LD_SCRIPT) $(ALL_OBJECTS) $(SYNTAXDEPS)
	@$(ECHO) " LD      $@"
	cd $(BUILD_DIR) && $(LD) -T ld_script.ld -Map ../../$(MAP) ../../$(LIBGCC) ../../$(LIBC) -o ../../$@

$(LD_SCRIPT): ld_script.txt $(BUILD_DIR)/sym_common.ld $(BUILD_DIR)/sym_ewram.ld $(BUILD_DIR)/sym_bss.ld
	@$(ECHO) " SED     $@"
	cd $(BUILD_DIR) && sed -e "s#tools/#../../tools/#g" ../../ld_script.txt >ld_script.ld

$(BUILD_DIR)/sym_%.ld: sym_%.txt
	@$(ECHO) " SED     $@"
	$(CPP) -P $(CPPFLAGS) $< | sed -e "s#tools/#../../tools/#g" > $@

$(C_OBJECTS): $(BUILD_DIR)/%.o: %.c
	@$(ECHO) " CC      $@"
ifeq (,$(KEEP_TEMPS))
	$(PREPROC) $(CPPFLAGS) -c charmap.txt $< | $(CC1) $(CC1FLAGS) | $(AS) $(ASFLAGS) -W -o $@
else
	$(PREPROC) $(CPPFLAGS) -c charmap.txt -o $(BUILD_DIR)/$*.i $<
	$(CC1) $(CC1FLAGS) $(BUILD_DIR)/$*.i -o $(BUILD_DIR)/$*.s
	$(AS) $(ASFLAGS) -W -o $@ $(BUILD_DIR)/$*.s
endif

# Only .s files in data need preproc
$(BUILD_DIR)/data/%.o: data/%.s
	@$(ECHO) " AS      $@"
ifeq (,$(KEEP_TEMPS))
	$(PREPROC) -n -c charmap.txt $< | $(CPP) - -P -I include | $(AS) $(ASFLAGS) -o $@
else
	$(PREPROC) -n -c charmap.txt -o $(BUILD_DIR)/data/$*.preproc.S $<
	$(CPP) $(BUILD_DIR)/data/$*.preproc.S -P -I include -o $(BUILD_DIR)/data/$*.s
	$(AS) $(ASFLAGS) -W -o $@ $(BUILD_DIR)/data/$*.s
endif

$(BUILD_DIR)/%.o: %.s
	@$(ECHO) " AS      $@"
	@$(AS) $(ASFLAGS) $< -o $@

# Dependency scanning. The new scaninc creates similar output
# to gcc -M and only does it when needed.
# If NODEP is enabled, these rules will be orphaned.
$(C_DEPS): $(DEPDIR)/%.d: %.c | $(DEPDIR)
	@$(SCANINC) -I include $<

$(ASM_DEPS): $(DEPDIR)/%.d: %.s | $(DEPDIR)
	@$(SCANINC) -I include $<

$(DEPDIR): | $(SCANINC) $(ALL_TOOLS)
	@$(ECHO) "Scanning dependencies for the first time, please wait."
	@mkdir -p .d

.PRECIOUS: $(DEPDIR)/%.d

# Include our dependencies. This will be empty on NODEP.
ifeq (,$(NO_INCLUDE))
-include $(C_DEPS)
-include $(ASM_DEPS)
endif
$(SCANINC): NODEP = 1
include tools.mk

depend: $(C_DEPS) $(ASM_DEPS)
.PHONY: depend

# "friendly" target names for convenience sake
ruby:          ; @$(MAKE) GAME_VERSION=RUBY
ruby_rev1:     ; @$(MAKE) GAME_VERSION=RUBY GAME_REVISION=1
ruby_rev2:     ; @$(MAKE) GAME_VERSION=RUBY GAME_REVISION=2
sapphire:      ; @$(MAKE) GAME_VERSION=SAPPHIRE
sapphire_rev1: ; @$(MAKE) GAME_VERSION=SAPPHIRE GAME_REVISION=1
sapphire_rev2: ; @$(MAKE) GAME_VERSION=SAPPHIRE GAME_REVISION=2
ruby_de:       ; @$(MAKE) GAME_VERSION=RUBY GAME_LANGUAGE=GERMAN
sapphire_de:   ; @$(MAKE) GAME_VERSION=SAPPHIRE GAME_LANGUAGE=GERMAN
ruby_de_debug: ; @$(MAKE) GAME_VERSION=RUBY GAME_LANGUAGE=GERMAN DEBUG=1
syntax:        ; @$(MAKE) GAME_VERSION=RUBY SYNTAX=1

%.mk: ;
#### Graphics Rules ####

GFX_OPTS :=

include castform.mk
include tilesets.mk
include fonts.mk
include misc.mk
include spritesheet_rules.mk
include override.mk
include map_data_rules.mk

%.1bpp:   %.png
	@$(ECHO) " GBAGFX  $@"
	$(GBAGFX) $< $@ $(GFX_OPTS)
%.4bpp:   %.png
	@$(ECHO) " GBAGFX  $@"
	$(GBAGFX) $< $@ $(GFX_OPTS)
%.8bpp:   %.png
	@$(ECHO) " GBAGFX  $@"
	$(GBAGFX) $< $@ $(GFX_OPTS)
%.gbapal: %.pal
	@$(ECHO) " GBAGFX  $@"
	$(GBAGFX) $< $@ $(GFX_OPTS)
%.gbapal: %.png
	@$(ECHO) " GBAGFX  $@"
	$(GBAGFX) $< $@ $(GFX_OPTS)
%.lz:     %
	@$(ECHO) " GBAGFX  $@"
	$(GBAGFX) $< $@ $(GFX_OPTS)
%.rl:     %
	@$(ECHO) " GBAGFX  $@"
	$(GBAGFX) $< $@ $(GFX_OPTS)

#### Sound Rules ####

sound/direct_sound_samples/cries/cry_%.bin: sound/direct_sound_samples/cries/cry_%.aif
	@$(ECHO) " AIF2PCM $@"
	$(AIF2PCM) $< $@ --compress

sound/%.bin: sound/%.aif
	@$(ECHO) " AIF2PCM $@"
	$(AIF2PCM) $< $@

sound/songs/%.s: sound/songs/%.mid
	@$(ECHO) " MID2AGB $@"
	cd $(@D) && ../../$(MID2AGB) $(<F)

# Don't 'remake' source files.
%.h: ;
%.png: ;
%.mid: ;
%.c: ;
%.s: ;
%.pal: ;
%.aif: ;
%.bin: ;
%.inc: ;
include/%.s: ;
