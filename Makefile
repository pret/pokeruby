AS      := $(DEVKITARM)/bin/arm-none-eabi-as
ASFLAGS := -mcpu=arm7tdmi

CC1    := tools/agbcc/bin/agbcc
CFLAGS := -mthumb-interwork -O2

CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef

LD      := $(DEVKITARM)/bin/arm-none-eabi-ld
LDFLAGS := -T ld_script.txt -T iwram_syms.txt -T ewram_syms.txt

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

.PHONY: all rom clean compare generated

C_SRCS := $(wildcard src/*.c)
C_OBJS := $(C_SRCS:%.c=%.o)

ASM_OBJS := asm/crt0.o asm/rom3.o asm/rom4.o asm/rom5.o \
	asm/libgcnmultiboot.o asm/m4a_1.o asm/m4a_3.o asm/libagbsyscall.o asm/libc.o

DATA_ASM_OBJS := data/data1.o data/data2.o data/graphics.o data/sound_data.o

OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS)

ROM := pokeruby.gba
ELF := $(ROM:.gba=.elf)

all:
	$(MAKE) generated
	$(MAKE) rom

rom: $(ROM)

# For contributors to make sure a change didn't affect the contents of the ROM.
compare: all
	@$(SHA1) rom.sha1

clean:
	rm -f $(ROM) $(ELF) $(OBJS) $(C_SRCS:%.c=%.i)
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' \) -exec rm {} +

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

src/siirtc.o: CFLAGS := -mthumb-interwork

src/agb_flash.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_1m.o: CFLAGS := -O -mthumb-interwork
src/agb_flash_mx.o: CFLAGS := -O -mthumb-interwork

src/m4a_2.o: CC1 := tools/agbcc/bin/old_agbcc
src/m4a_4.o: CC1 := tools/agbcc/bin/old_agbcc

$(C_OBJS): %.o : %.c
	@$(CPP) $(CPPFLAGS) $< -o $*.i
	@$(PREPROC) $*.i charmap.txt | $(CC1) $(CFLAGS) -o $*.s
	@echo -e ".text\n\t.align\t2, 0\n" >> $*.s
	$(AS) $(ASFLAGS) -o $@ $*.s

%.o : dep = $(shell $(SCANINC) $*.s)

$(ASM_OBJS): %.o: %.s $$(dep)
	$(AS) $(ASFLAGS) -o $@ $<

$(DATA_ASM_OBJS): %.o: %.s $$(dep)
	$(PREPROC) $< charmap.txt | $(AS) $(ASFLAGS) -o $@

# Link objects to produce the ROM.
$(ROM): $(OBJS)
	$(LD) $(LDFLAGS) -o $(ELF) $(OBJS) $(LIBGCC)
	$(OBJCOPY) -O binary --gap-fill 0xFF --pad-to 0x9000000 $(ELF) $(ROM)
