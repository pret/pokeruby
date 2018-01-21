
include config.mk


#### Tools ####

SHELL     := /bin/bash -o pipefail
AS        := $(DEVKITARM)/bin/arm-none-eabi-as
CC1       := tools/agbcc/bin/agbcc
CPP       := $(DEVKITARM)/bin/arm-none-eabi-cpp
LD        := $(DEVKITARM)/bin/arm-none-eabi-ld
OBJCOPY   := $(DEVKITARM)/bin/arm-none-eabi-objcopy
SHA1SUM   := sha1sum -c
GBAGFX    := tools/gbagfx/gbagfx
RSFONT    := tools/rsfont/rsfont
AIF2PCM   := tools/aif2pcm/aif2pcm
MID2AGB   := tools/mid2agb/mid2agb
PREPROC   := tools/preproc/preproc
SCANINC   := tools/scaninc/scaninc
RAMSCRGEN := tools/ramscrgen/ramscrgen

ASFLAGS  := -mcpu=arm7tdmi -I include --defsym $(GAME_VERSION)=1 --defsym REVISION=$(GAME_REVISION) --defsym $(GAME_LANGUAGE)=1
CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Wunused -Werror -O2 -fhex-asm
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef -Werror -Wno-trigraphs -D $(GAME_VERSION) -D REVISION=$(GAME_REVISION) -D $(GAME_LANGUAGE)


#### Files ####

ROM := poke$(BUILD_NAME).gba
MAP := $(ROM:%.gba=%.map)

SUBDIRS := \
  sound \
  sound/songs \
  asm \
  data \
  src \
  src/battle \
  src/battle/anim \
  src/field \
  src/debug \
  src/scene \
  src/pokemon \
  src/engine \
  src/libs
BUILD_DIR := build/$(BUILD_NAME)

C_SOURCES    := $(foreach dir, $(SUBDIRS), $(wildcard $(dir)/*.c))
ASM_SOURCES  := $(foreach dir, $(SUBDIRS), $(wildcard $(dir)/*.s))

C_OBJECTS    := $(addprefix $(BUILD_DIR)/, $(C_SOURCES:%.c=%.o))
ASM_OBJECTS  := $(addprefix $(BUILD_DIR)/, $(ASM_SOURCES:%.s=%.o))
ALL_OBJECTS  := $(C_OBJECTS) $(ASM_OBJECTS)

LIBC   := tools/agbcc/lib/libc.a
LIBGCC := tools/agbcc/lib/libgcc.a

LD_SCRIPT := $(BUILD_DIR)/ld_script.ld

# Special configurations required for lib files
%src/libs/siirtc.o:       CC1FLAGS := -mthumb-interwork
%src/libs/agb_flash.o:    CC1FLAGS := -O1 -mthumb-interwork
%src/libs/agb_flash_1m.o: CC1FLAGS := -O1 -mthumb-interwork
%src/libs/agb_flash_mx.o: CC1FLAGS := -O1 -mthumb-interwork
%src/libs/m4a_2.o: CC1 := tools/agbcc/bin/old_agbcc
%src/libs/m4a_4.o: CC1 := tools/agbcc/bin/old_agbcc
%src/libs/libisagbprn.o: CC1 := tools/agbcc/bin/old_agbcc
%src/libs/libisagbprn.o: CC1FLAGS := -mthumb-interwork


#### Main Rules ####

# Disable dependency scanning when NODEP is used for quick building
ifeq ($(NODEP),)
  $(BUILD_DIR)/src/%.o:  C_FILE = $(*D)/$(*F).c
  $(BUILD_DIR)/src/%.o:  C_DEP = $(shell $(SCANINC) -I include $(C_FILE:$(BUILD_DIR)/=))
  $(BUILD_DIR)/asm/%.o:  ASM_DEP = $(shell $(SCANINC) asm/$(*F).s)
  $(BUILD_DIR)/data/%.o: ASM_DEP = $(shell $(SCANINC) data/$(*F).s)
endif

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:
# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

# Create build subdirectories
$(shell mkdir -p $(addprefix $(BUILD_DIR)/, $(SUBDIRS)))

all: $(ROM)
ifeq ($(COMPARE),1)
	@$(SHA1SUM) $(BUILD_NAME).sha1
endif

clean: tidy
	$(RM) sound/direct_sound_samples/*.bin
	$(RM) $(ALL_OBJECTS)
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.rl' \) -exec rm {} +

ALL_BUILDS := ruby ruby_rev1 ruby_rev1 sapphire sapphire_rev1 sapphire_rev2 ruby_de sapphire_de
tidy:
	$(RM) $(ALL_BUILDS:%=poke%{.gba,.elf,.map})
	$(RM) -r build

%.gba: %.elf
	$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $< $@

%.elf: $(LD_SCRIPT) $(ALL_OBJECTS)
	cd $(BUILD_DIR) && $(LD) -T ld_script.ld -Map ../../$(MAP) -o ../../$@ ../../$(LIBGCC) ../../$(LIBC)

$(LD_SCRIPT): $(BUILD_DIR)/sym_bss.ld $(BUILD_DIR)/sym_common.ld $(BUILD_DIR)/sym_ewram.ld ld_script.txt
	cd $(BUILD_DIR) && sed -f ../../ld_script.sed ../../ld_script.txt | sed "s#tools/#../../tools/#g" >ld_script.ld
$(BUILD_DIR)/sym_bss.ld: sym_bss.txt
	cd $(BUILD_DIR) && ../../$(RAMSCRGEN) .bss ../../sym_bss.txt $(GAME_LANGUAGE) >sym_bss.ld
$(BUILD_DIR)/sym_common.ld: sym_common.txt $(C_OBJECTS) $(wildcard common_syms/*.txt)
	cd $(BUILD_DIR) && ../../$(RAMSCRGEN) COMMON ../../sym_common.txt $(GAME_LANGUAGE) -c src,../../common_syms >sym_common.ld
$(BUILD_DIR)/sym_ewram.ld: sym_ewram.txt
	cd $(BUILD_DIR) && ../../$(RAMSCRGEN) ewram_data ../../sym_ewram.txt $(GAME_LANGUAGE) >sym_ewram.ld

$(C_OBJECTS): $(BUILD_DIR)/%.o: %.c $$(C_DEP)
	$(CPP) $(CPPFLAGS) $< -o $(BUILD_DIR)/$*.i
	$(PREPROC) $(BUILD_DIR)/$*.i charmap.txt | $(CC1) $(CC1FLAGS) -o $(BUILD_DIR)/$*.s
	@printf ".text\n\t.align\t2, 0\n" >> $(BUILD_DIR)/$*.s
	@$(AS) $(ASFLAGS) -o $@ $(BUILD_DIR)/$*.s

# Only .s files in data need preproc
$(BUILD_DIR)/data/%.o: data/%.s $$(ASM_DEP)
	$(PREPROC) $< charmap.txt | $(CPP) -I include | $(AS) $(ASFLAGS) -o $@

$(BUILD_DIR)/%.o: %.s $$(ASM_DEP)
	$(AS) $(ASFLAGS) $< -o $@

# "friendly" target names for convenience sake
ruby:          ; @$(MAKE) --no-print-directory GAME_VERSION=RUBY
ruby_rev1:     ; @$(MAKE) --no-print-directory GAME_VERSION=RUBY GAME_REVISION=1
ruby_rev2:     ; @$(MAKE) --no-print-directory GAME_VERSION=RUBY GAME_REVISION=2
sapphire:      ; @$(MAKE) --no-print-directory GAME_VERSION=SAPPHIRE
sapphire_rev1: ; @$(MAKE) --no-print-directory GAME_VERSION=SAPPHIRE GAME_REVISION=1
sapphire_rev2: ; @$(MAKE) --no-print-directory GAME_VERSION=SAPPHIRE GAME_REVISION=2
ruby_de:       ; @$(MAKE) --no-print-directory GAME_VERSION=RUBY GAME_LANGUAGE=GERMAN
sapphire_de:   ; @$(MAKE) --no-print-directory GAME_VERSION=SAPPHIRE GAME_LANGUAGE=GERMAN


#### Graphics Rules ####

GFX_OPTS :=

include castform.mk
include tilesets.mk
include fonts.mk
include misc.mk
include override.mk

%.1bpp:   %.png ; $(GBAGFX) $< $@ $(GFX_OPTS)
%.4bpp:   %.png ; $(GBAGFX) $< $@ $(GFX_OPTS)
%.8bpp:   %.png ; $(GBAGFX) $< $@ $(GFX_OPTS)
%.gbapal: %.pal ; $(GBAGFX) $< $@ $(GFX_OPTS)
%.gbapal: %.png ; $(GBAGFX) $< $@ $(GFX_OPTS)
%.lz:     %     ; $(GBAGFX) $< $@ $(GFX_OPTS)
%.rl:     %     ; $(GBAGFX) $< $@ $(GFX_OPTS)

#### Sound Rules ####

sound/direct_sound_samples/cry_%.bin: sound/direct_sound_samples/cry_%.aif
	$(AIF2PCM) $< $@ --compress

sound/%.bin: sound/%.aif
	$(AIF2PCM) $< $@

sound/songs/%.s: sound/songs/%.mid
	cd $(@D) && ../../$(MID2AGB) $(<F)
