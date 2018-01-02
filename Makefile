SHELL := /bin/bash -o pipefail

AS      := $(DEVKITARM)/bin/arm-none-eabi-as
ASFLAGS := -mcpu=arm7tdmi

CC1             := tools/agbcc/bin/agbcc
override CFLAGS += -mthumb-interwork -Wimplicit -Wparentheses -Wunused -Werror -O2 -fhex-asm $(DEFINES)

CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef -Werror -Wno-trigraphs

LD      := $(DEVKITARM)/bin/arm-none-eabi-ld

OBJCOPY := $(DEVKITARM)/bin/arm-none-eabi-objcopy

LIBGCC := tools/agbcc/lib/libgcc.a

SHA1 := sha1sum -c

GFX := tools/gbagfx/gbagfx
AIF := tools/aif2pcm/aif2pcm
MID := tools/mid2agb/mid2agb
SCANINC := tools/scaninc/scaninc
PREPROC := tools/preproc/preproc
RAMSCRGEN := tools/ramscrgen/ramscrgen

REVISION := 0

VERSIONS := ruby sapphire ruby_rev1 sapphire_rev1 ruby_rev2 sapphire_rev2 ruby_de sapphire_de

# Clear the default suffixes.
.SUFFIXES:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

.PRECIOUS: %.1bpp %.4bpp %.8bpp %.gbapal %.lz %.rl %.pcm %.bin sound/direct_sound_samples/cry_%.bin

.PHONY: all clean tidy all_versions compare compare_all \
$(VERSIONS) $(VERSIONS:%=compare_%)


$(shell mkdir -p build/ $(VERSIONS:%=build/%/{,asm,data,src{,/battle{,/anim},/field,/debug,/scene,/pokemon,/engine,/libs}}))

C_SRCS := $(shell find src -iname "*.c")
ASM_SRCS := $(wildcard asm/*.s)
DATA_ASM_SRCS := $(wildcard data/*.s)

SONG_SRCS := $(wildcard sound/songs/*.s)
SONG_OBJS := $(SONG_SRCS:%.s=%.o)

all: ruby
	@:

all_versions: $(VERSIONS)
	@:

# For contributors to make sure a change didn't affect the contents of the ROM.
compare: compare_ruby
compare_all: $(VERSIONS:%=compare_%)

clean: tidy
	rm -f sound/direct_sound_samples/*.bin
	rm -f $(SONG_OBJS)
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.rl' \) -exec rm {} +

tidy:
	rm -f $(VERSIONS:%=poke%{.gba,.elf,.map})
	rm -r build/*

include castform.mk
include tilesets.mk
include fonts.mk
include misc.mk
include override.mk

%.s: ;
%.png: ;
%.pal: ;
%.aif: ;

%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.gbapal: %.png ; $(GFX) $< $@
%.lz: % ; $(GFX) $< $@
%.rl: % ; $(GFX) $< $@
sound/direct_sound_samples/cry_%.bin: sound/direct_sound_samples/cry_%.aif ; $(AIF) $< $@ --compress
%.bin: %.aif ; $(AIF) $< $@
sound/songs/%.s: sound/songs/%.mid
	cd $(@D) && ../../$(MID) $(<F)

%src/libs/libc.o: CC1 := tools/agbcc/bin/old_agbcc
%src/libs/libc.o: CFLAGS := -O2

%src/libs/siirtc.o: CFLAGS := -mthumb-interwork

%src/libs/agb_flash.o: CFLAGS := -O -mthumb-interwork
%src/libs/agb_flash_1m.o: CFLAGS := -O -mthumb-interwork
%src/libs/agb_flash_mx.o: CFLAGS := -O -mthumb-interwork

%src/libs/m4a_2.o: CC1 := tools/agbcc/bin/old_agbcc
%src/libs/m4a_4.o: CC1 := tools/agbcc/bin/old_agbcc

$(SONG_OBJS): %.o: %.s
	$(AS) $(ASFLAGS) -I sound -o $@ $<


define VERSION_RULES

$1_C_OBJS := $$(C_SRCS:%.c=build/$1/%.o)
$1_ASM_OBJS := $$(ASM_SRCS:%.s=build/$1/%.o)
$1_DATA_ASM_OBJS := $$(DATA_ASM_SRCS:%.s=build/$1/%.o)

ifeq ($$(NODEP),)
build/$1/src/%.o: c_path = $$(*D)/$$(*F).c
build/$1/src/%.o: c_dep = $$(shell $$(SCANINC) -I include $$(wildcard $$(c_path:build/$1/=)))
build/$1/asm/%.o: asm_dep = $$(shell $$(SCANINC) asm/$$(*F).s)
build/$1/data/%.o: asm_dep = $$(shell $$(SCANINC) data/$$(*F).s)
endif

$1_OBJS := $$($1_C_OBJS) $$($1_ASM_OBJS) $$($1_DATA_ASM_OBJS) $$(SONG_OBJS)
$1_OBJS_REL := $$($1_OBJS:build/$1/%=%)
$1_OBJS_REL := $$($1_OBJS_REL:sound/%=../../sound/%)

$$($1_C_OBJS): VERSION := $2
$$($1_C_OBJS): REVISION := $3
$$($1_C_OBJS): LANGUAGE := $4
build/$1/%.o : %.c $$$$(c_dep)
	@$$(CPP) $$(CPPFLAGS) -D $$(VERSION) -D REVISION=$$(REVISION) -D $$(LANGUAGE) $$< -o build/$1/$$*.i
	@$$(PREPROC) build/$1/$$*.i charmap.txt | $$(CC1) $$(CFLAGS) -o build/$1/$$*.s
	@printf ".text\n\t.align\t2, 0\n" >> build/$1/$$*.s
	$$(AS) $$(ASFLAGS) -o $$@ build/$1/$$*.s

$$($1_ASM_OBJS): VERSION := $2
$$($1_ASM_OBJS): REVISION := $3
$$($1_ASM_OBJS): LANGUAGE := $4
build/$1/asm/%.o: asm/%.s $$$$(asm_dep)
	$$(AS) $$(ASFLAGS) --defsym $$(VERSION)=1 --defsym REVISION=$$(REVISION) --defsym $$(LANGUAGE)=1 -o $$@ $$<

$$($1_DATA_ASM_OBJS): VERSION := $2
$$($1_DATA_ASM_OBJS): REVISION := $3
$$($1_DATA_ASM_OBJS): LANGUAGE := $4
build/$1/data/%.o: data/%.s $$$$(asm_dep)
	$$(PREPROC) $$< charmap.txt | $$(CPP) -I include | $$(AS) $$(ASFLAGS) --defsym $$(VERSION)=1 --defsym REVISION=$$(REVISION) --defsym $$(LANGUAGE)=1 -o $$@

build/$1/sym_bss.ld: LANGUAGE := $4
build/$1/sym_bss.ld: sym_bss.txt
	cd build/$1 && ../../$$(RAMSCRGEN) .bss ../../sym_bss.txt $$(LANGUAGE) >sym_bss.ld

build/$1/sym_common.ld: LANGUAGE := $4
build/$1/sym_common.ld: sym_common.txt $$($1_C_OBJS) $$(wildcard common_syms/*.txt)
	cd build/$1 && ../../$$(RAMSCRGEN) COMMON ../../sym_common.txt $$(LANGUAGE) -c src,../../common_syms >sym_common.ld

build/$1/sym_ewram.ld: LANGUAGE := $4
build/$1/sym_ewram.ld: sym_ewram.txt
	cd build/$1 && ../../$$(RAMSCRGEN) ewram_data ../../sym_ewram.txt $$(LANGUAGE) >sym_ewram.ld

build/$1/ld_script.ld: ld_script.txt build/$1/sym_bss.ld build/$1/sym_common.ld build/$1/sym_ewram.ld
	cd build/$1 && sed -f ../../ld_script.sed ../../ld_script.txt | sed "s#tools/#../../tools/#g" | sed "s#sound/#../../sound/#g" >ld_script.ld

poke$1.elf: build/$1/ld_script.ld $$($1_OBJS)
	cd build/$1 && $$(LD) -T ld_script.ld -Map ../../poke$1.map -o ../../$$@ $$($1_OBJS_REL) ../../$$(LIBGCC)

poke$1.gba: %.gba: %.elf
	$$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $$< $$@

compare_$1: poke$1.gba
	@$$(SHA1) $1.sha1

$1: poke$1.gba
	@:
endef

$(eval $(call VERSION_RULES,ruby,RUBY,0,ENGLISH))
$(eval $(call VERSION_RULES,ruby_rev1,RUBY,1,ENGLISH))
$(eval $(call VERSION_RULES,ruby_rev2,RUBY,2,ENGLISH))
$(eval $(call VERSION_RULES,sapphire,SAPPHIRE,0,ENGLISH))
$(eval $(call VERSION_RULES,sapphire_rev1,SAPPHIRE,1,ENGLISH))
$(eval $(call VERSION_RULES,sapphire_rev2,SAPPHIRE,2,ENGLISH))
$(eval $(call VERSION_RULES,ruby_de,RUBY,0,GERMAN))
$(eval $(call VERSION_RULES,sapphire_de,SAPPHIRE,0,GERMAN))
