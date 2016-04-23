AS      := arm-none-eabi-as
ASFLAGS := -mcpu=arm7tdmi

CC     := gbacc
CFLAGS := -mthumb-interwork -O2 -Iinclude

SHA1 := sha1sum -c

GFX := @tools/gbagfx/gbagfx

SCANINC := tools/scaninc/scaninc

PREPROC := tools/preproc/preproc

# Clear the default suffixes.
.SUFFIXES:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

.PRECIOUS: %.1bpp %.4bpp %.8bpp %.gbapal %.lz

.PHONY: rom tools gbagfx scaninc clean compare deps

C_SRCS := $(wildcard src/*.c)
C_OBJS := $(C_SRCS:%.c=%.o)

ASM_OBJS := asm/crt0.o asm/rom1.o asm/rom2.o asm/rom3.o asm/rom4.o asm/rom5.o \
	asm/libgcnmultiboot.o asm/libmks4agb.o asm/libagbsyscall.o asm/libgcc.o

DATA_ASM_OBJS := data/data1.o data/data2.o

OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS)

ROM := pokeruby.gba
ELF := $(ROM:.gba=.elf)

rom: $(ROM)

tools: gbagfx scaninc preproc

gbagfx:
	cd tools/gbagfx && make

scaninc:
	cd tools/scaninc && make

preproc:
	cd tools/preproc && make

# For contributors to make sure a change didn't affect the contents of the ROM.
compare: $(ROM)
	@$(SHA1) rom.sha1

clean:
	$(RM) $(ROM) $(ELF) $(OBJS)
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec rm {} +

include castform.mk
include tilesets.mk

%.png: ;
%.pal: ;
%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.lz: % ; $(GFX) $< $@

src/siirtc.o: CFLAGS := -mthumb-interwork -Iinclude

src/agb_flash.o: CFLAGS := -O -mthumb-interwork -Iinclude
src/agb_flash_1m.o: CFLAGS := -O -mthumb-interwork -Iinclude
src/agb_flash_mx.o: CFLAGS := -O -mthumb-interwork -Iinclude

$(C_OBJS): %.o : %.c
	$(CC) $(CFLAGS) -o $*.s $< -S
	echo -e ".text\n\t.align\t2, 0\n" >> $*.s
	$(AS) $(ASFLAGS) -o $@ $*.s

%.o : dep = $(shell $(SCANINC) $*.s)

$(ASM_OBJS): %.o: %.s $$(dep)
	$(AS) $(ASFLAGS) -o $@ $<

$(DATA_ASM_OBJS): %.o: %.s $$(dep)
	$(PREPROC) $< charmap.txt | $(AS) $(ASFLAGS) -o $@

# Link objects to produce the ROM.
$(ROM): $(OBJS)
	arm-none-eabi-ld -T ld_script.txt -T iwram_syms.txt -T ewram_syms.txt -o $(ELF) $(OBJS)
	arm-none-eabi-objcopy -O binary $(ELF) $(ROM)
