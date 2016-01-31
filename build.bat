as -mcpu=arm7tdmi asm/rom.s -o rom.o
ld -T ld_script.txt -T iwram_syms.txt -T ewram_syms.txt -o pokeruby.elf rom.o
objcopy -O binary pokeruby.elf pokeruby.gba
diff baserom.gba pokeruby.gba
