AS      := $(DEVKITARM)/bin/arm-none-eabi-as
ASFLAGS := -mcpu=arm7tdmi

CC1    := tools/agbcc/bin/agbcc
CFLAGS := -mthumb-interwork -O2

CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef

LD      := $(DEVKITARM)/bin/arm-none-eabi-ld
pokeruby_LDFLAGS := -T ld_script_ruby.txt -T iwram_syms.txt -T ewram_syms.txt
pokesapphire_LDFLAGS := -T ld_script_sapphire.txt -T iwram_syms.txt -T ewram_syms.txt

OBJCOPY := $(DEVKITARM)/bin/arm-none-eabi-objcopy

LIBGCC := tools/agbcc/lib/libgcc.a

SHA1 := sha1sum -c

GFX := @tools/gbagfx/gbagfx

SCANINC := tools/scaninc/scaninc

PREPROC := tools/preproc/preproc

# Clear the default suffixes.
.SUFFIXES:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

.PRECIOUS: %.1bpp %.4bpp %.8bpp %.gbapal %.lz

.PHONY: all clean compare ruby sapphire

C_SRCS := $(wildcard src/*.c)
C_OBJS := $(C_SRCS:%.c=%.o)

ASM_OBJS := asm/crt0.o asm/rom3.o asm/rom4.o asm/rom_8074BAC.o asm/rom5.o \
	asm/libgcnmultiboot.o asm/m4a_1.o asm/m4a_3.o asm/libagbsyscall.o asm/libc.o

DATA_ASM_OBJS := data/data1.o data/data2.o data/graphics.o data/sound_data.o

OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS)
pokeruby_OBJS := $(OBJS:.o=_ruby.o)
pokesapphire_OBJS := $(OBJS:.o=_sapphire.o)

ROM := pokeruby.gba pokesapphire.gba
ELF := $(ROM:.gba=.elf)

all: ruby
	@:
both: ruby sapphire
	@:
ruby: pokeruby.gba
	@:
sapphire: pokesapphire.gba
	@:

# For contributors to make sure a change didn't affect the contents of the ROM.
compare: both
	@$(SHA1) rom.sha1

clean:
	rm -f $(ROM) $(ELF) $(OBJS) $(pokeruby_OBJS) $(pokesapphire_OBJS) $(C_SRCS:%.c=%.i)
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' \) -exec rm {} +

tidy:
	rm -f $(ROM) $(ELF) $(OBJS) $(pokeruby_OBJS) $(pokesapphire_OBJS) $(C_SRCS:%.c=%.i)

include castform.mk
include tilesets.mk
include fonts.mk
include generated.mk
include menu.mk

%.png: ;
%.pal: ;
%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.lz: % ; $(GFX) $< $@

src/siirtc_ruby.o src/siirtc_sapphire.o: CFLAGS := -mthumb-interwork

src/agb_flash_ruby.o src/agb_flash_sapphire.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_1m_ruby.o src/agb_flash_1m_sapphire.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_mx_ruby.o src/agb_flash_mx_sapphire.o: CFLAGS := -O -mthumb-interwork

src/m4a_2_ruby.o src/m4a_2_sapphire.o: CC1 := tools/agbcc/bin/old_agbcc
src/m4a_4_ruby.o src/m4a_2_sapphire.o: CC1 := tools/agbcc/bin/old_agbcc

src/text_ruby.o src/text_sapphire.o: src/text.c $(GEN_FONT_HEADERS)
src/link_ruby.o src/link_sapphire.o: src/link.c $(GEN_LINK_HEADERS)

src/%_ruby.o: src/%.c
	@$(CPP) $(CPPFLAGS) -D RUBY $< -o $*.i
	@$(PREPROC) $*.i charmap.txt | $(CC1) $(CFLAGS) -o $*.s
	@printf ".text\n\t.align\t2, 0\n" >> $*.s
	$(AS) $(ASFLAGS) -o $@ $*.s
src/%_sapphire.o: src/%.c
	@$(CPP) $(CPPFLAGS) -D SAPPHIRE $< -o $*.i
	@$(PREPROC) $*.i charmap.txt | $(CC1) $(CFLAGS) -o $*.s
	@printf ".text\n\t.align\t2, 0\n" >> $*.s
	$(AS) $(ASFLAGS) -o $@ $*.s

asm/%_ruby.o: dep = $(shell $(SCANINC) asm/$*.s)
asm/%_sapphire.o: dep = $(shell $(SCANINC) asm/$*.s)
asm/%_ruby.o: asm/%.s $$(dep)
	$(AS) $(ASFLAGS) --defsym RUBY=1 -o $@ $<
asm/%_sapphire.o: asm/%.s $$(dep)
	$(AS) $(ASFLAGS) --defsym SAPPHIRE=1 -o $@ $<

data/%_ruby.o: dep = $(shell $(SCANINC) data/$*.s)
data/%_sapphire.o: dep = $(shell $(SCANINC) data/$*.s)
data/%_ruby.o: data/%.s $$(dep)
	$(PREPROC) $< charmap.txt | $(AS) $(ASFLAGS) --defsym RUBY=1 -o $@
data/%_sapphire.o: data/%.s $$(dep)
	$(PREPROC) $< charmap.txt | $(AS) $(ASFLAGS) --defsym SAPPHIRE=1 -o $@

ld_script_ruby.txt: ld_script.txt
	@sed "s/\(\(src\|asm\|data\)\/.*\)\.o/\1_ruby.o/g" $< > $@
ld_script_sapphire.txt: ld_script.txt
	@sed "s/\(\(src\|asm\|data\)\/.*\)\.o/\1_sapphire.o/g" $< > $@

pokeruby.elf: ld_script_ruby.txt $(pokeruby_OBJS)
	$(LD) $(pokeruby_LDFLAGS) -o $@ $(pokeruby_OBJS) $(LIBGCC)
pokesapphire.elf: ld_script_sapphire.txt $(pokesapphire_OBJS)
	$(LD) $(pokesapphire_LDFLAGS) -o $@ $(pokesapphire_OBJS) $(LIBGCC)

%.gba: %.elf
	$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $< $@
