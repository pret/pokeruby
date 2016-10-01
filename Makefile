SHELL := /bin/bash -o pipefail

AS      := $(DEVKITARM)/bin/arm-none-eabi-as
ASFLAGS := -mcpu=arm7tdmi

CC1    := tools/agbcc/bin/agbcc
CFLAGS := -mthumb-interwork -O2 -g -fhex-asm

CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef

LD      := $(DEVKITARM)/bin/arm-none-eabi-ld

OBJCOPY := $(DEVKITARM)/bin/arm-none-eabi-objcopy

LIBGCC := tools/agbcc/lib/libgcc.a

SHA1 := sha1sum -c

GFX := tools/gbagfx/gbagfx

AIF := tools/aif2pcm/aif2pcm

SCANINC := tools/scaninc/scaninc

PREPROC := tools/preproc/preproc

RAMSCRGEN := tools/ramscrgen/ramscrgen

REVISION := 0

# Clear the default suffixes.
.SUFFIXES:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

.PRECIOUS: %.1bpp %.4bpp %.8bpp %.gbapal %.lz %.rl %.pcm %.bin

.PHONY: all clean tidy compare \
ruby ruby_rev1 ruby_rev2 \
compare_ruby compare_ruby_rev1 compare_ruby_rev2 \
sapphire sapphire_rev1 sapphire_rev2 \
compare_sapphire compare_sapphire_rev1 compare_sapphire_rev2

C_SRCS := $(wildcard src/*.c)
C_OBJS := $(C_SRCS:%.c=%.o)

ASM_OBJS := asm/crt0.o asm/rom3.o asm/rom_8040EB4.o asm/rom4.o asm/rom_8074BAC.o asm/rom5.o asm/rom6.o\
asm/libgcnmultiboot.o asm/m4a_1.o asm/m4a_3.o asm/libagbsyscall.o \
asm/rom_8072DF8.o asm/rom_8065394.o asm/rom_803D1FC.o asm/rom_803BA2C.o

DATA_ASM_OBJS := data/data2.o data/graphics.o data/sound_data.o \
data/event_scripts.o data/battle_anim_scripts.o \
data/battle_scripts_1.o data/battle_scripts_2.o data/field_effect_scripts.o \
data/battle_ai_scripts.o data/contest_ai_scripts.o data/script_funcs.o

SONG_SRCS := $(wildcard sound/songs/*.s)
SONG_OBJS := $(SONG_SRCS:%.s=%.o)

OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS) $(SONG_OBJS)

all: ruby
	@:

ruby: VERSION := RUBY
ruby: pokeruby.gba
	@:

sapphire: VERSION := SAPPHIRE
sapphire: pokesapphire.gba
	@:

ruby_rev1: REVISION := 1
ruby_rev1: ruby
	@:

sapphire_rev1: REVISION := 1
sapphire_rev1: sapphire
	@:

ruby_rev2: REVISION := 2
ruby_rev2: ruby
	@:

sapphire_rev2: REVISION := 2
sapphire_rev2: sapphire
	@:

# For contributors to make sure a change didn't affect the contents of the ROM.

compare: compare_ruby

compare_ruby: ruby
	@$(SHA1) ruby.sha1

compare_sapphire: sapphire
	@$(SHA1) sapphire.sha1

compare_ruby_rev1: ruby_rev1
	@$(SHA1) ruby_rev1.sha1

compare_sapphire_rev1: sapphire_rev1
	@$(SHA1) sapphire_rev1.sha1

compare_ruby_rev2: ruby_rev2
	@$(SHA1) ruby_rev2.sha1

compare_sapphire_rev2: sapphire_rev2
	@$(SHA1) sapphire_rev2.sha1

clean: tidy
	rm -f sound/programmable_wave_samples/*.bin sound/direct_sound_samples/*.bin sound/**/*.pcm
	rm -f $(SONG_OBJS)
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.rl' \) -exec rm {} +

tidy:
	rm -f pokeruby.gba pokesapphire.gba
	rm -f pokeruby.elf pokesapphire.elf
	rm -f ld_script.ld sym_bss.ld sym_common.ld sym_ewram.ld
	rm -f pokeruby.map pokesapphire.map
	rm -f $(C_OBJS)
	rm -f $(ASM_OBJS)
	rm -f $(DATA_ASM_OBJS)
	rm -f $(C_SRCS:%.c=%.i)
	rm -f $(C_SRCS:%.c=%.s)

include castform.mk
include tilesets.mk
include fonts.mk
include generated.mk
include misc.mk

%.s: ;
%.bin: ;
%.png: ;
%.pal: ;
%.aif: ;
%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.lz: % ; $(GFX) $< $@
%.rl: % ; $(GFX) $< $@
%.pcm: %.aif  ; $(AIF) $< $@
%.bin: %.aif  ; $(AIF) $< $@

src/libc.o: CC1 := tools/agbcc/bin/old_agbcc
src/libc.o: CFLAGS := -O2

src/siirtc.o: CFLAGS := -mthumb-interwork

src/agb_flash.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_1m.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_mx.o: CFLAGS := -O -mthumb-interwork

src/m4a_2.o: CC1 := tools/agbcc/bin/old_agbcc
src/m4a_4.o: CC1 := tools/agbcc/bin/old_agbcc

src/text.o: src/text.c $(GEN_FONT_HEADERS)
src/link.o: src/link.c $(GEN_LINK_HEADERS)

$(C_OBJS): %.o : %.c
	@$(CPP) $(CPPFLAGS) -D $(VERSION) -D REVISION=$(REVISION) $< -o $*.i
	@$(PREPROC) $*.i charmap.txt | $(CC1) $(CFLAGS) -o $*.s
	@printf ".text\n\t.align\t2, 0\n" >> $*.s
	$(AS) $(ASFLAGS) -o $@ $*.s

%.o: dep = $(shell $(SCANINC) $*.s)

$(ASM_OBJS): %.o: %.s $$(dep)
	$(AS) $(ASFLAGS) --defsym $(VERSION)=1 --defsym REVISION=$(REVISION) -o $@ $<

$(DATA_ASM_OBJS): %.o: %.s $$(dep)
	$(PREPROC) $< charmap.txt | $(AS) $(ASFLAGS) --defsym $(VERSION)=1 --defsym REVISION=$(REVISION) -o $@

$(SONG_OBJS): %.o: %.s
	$(AS) $(ASFLAGS) -I sound -o $@ $<

sym_bss.ld: sym_bss.txt
	$(RAMSCRGEN) .bss sym_bss.txt >$@

sym_common.ld: sym_common.txt $(C_OBJS) $(wildcard common_syms/*.txt)
	$(RAMSCRGEN) COMMON sym_common.txt -c src,common_syms >$@

sym_ewram.ld: sym_ewram.txt
	$(RAMSCRGEN) ewram_data sym_ewram.txt >$@

ld_script.ld: ld_script.txt sym_bss.ld sym_common.ld sym_ewram.ld
	sed -f ld_script.sed ld_script.txt >ld_script.ld

%.elf: ld_script.ld $(OBJS)
	$(LD) -T ld_script.ld -T shared_syms.txt -Map $*.map -o $@ $(OBJS) $(LIBGCC)

pokeruby.gba pokesapphire.gba: %.gba: %.elf
	$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $< $@
