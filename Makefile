AS      := pokeas
ASFLAGS := -mcpu=arm7tdmi

CC     := gbacc
CFLAGS := -mthumb-interwork -O2 -Iinclude

SHA1 := sha1sum -c

GFX := @tools/gbagfx/gbagfx

SCANINC := tools/scaninc/scaninc

# Clear the default suffixes.
.SUFFIXES:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

.PRECIOUS: %.1bpp %.4bpp %.8bpp %.gbapal %.lz

.PHONY: rom tools gbagfx scaninc clean compare deps

CSRCS := $(wildcard src/*.c)
OBJS := asm/crt0.o asm/rom1.o asm/rom2.o asm/rom3.o asm/rom4.o asm/rom5.o \
	asm/libgcnmultiboot.o asm/libmks4agb.o asm/libagbsyscall.o asm/libgcc.o \
	src/string_util.o src/rtc.o src/play_time.o src/task.o \
	src/agb_flash.o src/agb_flash_1m.o src/agb_flash_mx.o src/siirtc.o \
	data/data1.o data/data2.o

ROM := pokeruby.gba
ELF := $(ROM:.gba=.elf)

rom: $(ROM)

tools: gbagfx scaninc

gbagfx:
	cd tools/gbagfx && make

scaninc:
	cd tools/scaninc && make

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

$(OBJS): $(CSRCS:src/%.c=src/%.s)

src/siirtc.s: CFLAGS := -mthumb-interwork -Iinclude

src/agb_flash.s: CFLAGS := -O -mthumb-interwork -Iinclude
src/agb_flash_1m.s: CFLAGS := -O -mthumb-interwork -Iinclude
src/agb_flash_mx.s: CFLAGS := -O -mthumb-interwork -Iinclude

src/%.s: src/%.c
	$(CC) $(CFLAGS) -o $@ $< -S
	echo -e ".text\n\t.align\t2, 0\n" >> $@

%.o: dep = $(shell $(SCANINC) $(@D)/$*.s)
%.o: %.s $$(dep)
	$(AS) $(ASFLAGS) -o $@ $<

# Link objects to produce the ROM.
$(ROM): $(OBJS)
	./pokeld -T ld_script.txt -T iwram_syms.txt -T ewram_syms.txt -o $(ELF) $(OBJS)
	./pokeobjcopy -O binary $(ELF) $(ROM)
