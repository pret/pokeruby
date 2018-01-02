	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083EDB5C:: @ 83EDB5C
	.4byte gSpriteTemplate_83ED57C
	.4byte gSpriteTemplate_83ED594
	.4byte gSpriteTemplate_83ED5AC
	.4byte gSpriteTemplate_83ED5DC
	.4byte gSpriteTemplate_83ED5F4
	.4byte gSpriteTemplate_83ED654
	.4byte gSpriteTemplate_83ED66C
	.4byte gSpriteTemplate_83ED684
	.4byte gSpriteTemplate_83ED69C
	.4byte gSpriteTemplate_83ED6B4
	.4byte gSpriteTemplate_83ED5C4
	.4byte gSpriteTemplate_83ED5C4
	.4byte gSpriteTemplate_83ED5C4
	.4byte gSpriteTemplate_83ED5C4
	.4byte gSpriteTemplate_83ED60C
	.4byte gSpriteTemplate_83ED60C
	.4byte gSpriteTemplate_83ED60C
	.4byte gSpriteTemplate_83ED60C
	.4byte gSpriteTemplate_83ED60C
	.4byte gSpriteTemplate_83ED624
	.4byte gSpriteTemplate_83ED624
	.4byte gSpriteTemplate_83ED624
	.4byte gSpriteTemplate_83ED63C
	.4byte gSpriteTemplate_83ED63C
	.4byte gSpriteTemplate_83ED63C
	.4byte gDummySpriteTemplate

	.align 2
gUnknown_083EDBC4:: @ 83EDBC4
	.4byte gSubspriteTables_83ED804
	.4byte gSubspriteTables_83ED82C
	.4byte gSubspriteTables_83ED854
	.4byte gSubspriteTables_83ED8B4
	.4byte NULL
	.4byte NULL
	.4byte gSubspriteTables_83ED8CC
	.4byte NULL
	.4byte gSubspriteTables_83ED93C
	.4byte gSubspriteTables_83ED95C
	.4byte gSubspriteTables_83ED974
	.4byte gSubspriteTables_83ED98C
	.4byte gSubspriteTables_83ED9A4
	.4byte gSubspriteTables_83ED9BC
	.4byte gSubspriteTables_83ED9D4
	.4byte gSubspriteTables_83ED9EC
	.4byte gSubspriteTables_83EDA04
	.4byte gSubspriteTables_83EDA1C
	.4byte gSubspriteTables_83EDA34
	.4byte gSubspriteTables_83EDA6C
	.4byte gSubspriteTables_83EDA8C
	.4byte gSubspriteTables_83EDAC4
	.4byte gSubspriteTables_83EDAFC
	.4byte gSubspriteTables_83EDB1C
	.4byte gSubspriteTables_83EDB54
	.4byte NULL

	.align 2
gUnknown_083EDC2C:: @ 83EDC2C
	obj_tiles gSlotMachineReelSymbol1Tiles, 0x200, 0
	obj_tiles gSlotMachineReelSymbol2Tiles, 0x200, 1
	obj_tiles gSlotMachineReelSymbol3Tiles, 0x200, 2
	obj_tiles gSlotMachineReelSymbol4Tiles, 0x200, 3
	obj_tiles gSlotMachineReelSymbol5Tiles, 0x200, 4
	obj_tiles gSlotMachineReelSymbol6Tiles, 0x200, 5
	obj_tiles gSlotMachineReelSymbol7Tiles, 0x200, 6
	obj_tiles gSlotMachineNumber0Tiles, 0x40, 7
	obj_tiles gSlotMachineNumber1Tiles, 0x40, 8
	obj_tiles gSlotMachineNumber2Tiles, 0x40, 9
	obj_tiles gSlotMachineNumber3Tiles, 0x40, 10
	obj_tiles gSlotMachineNumber4Tiles, 0x40, 11
	obj_tiles gSlotMachineNumber5Tiles, 0x40, 12
	obj_tiles gSlotMachineNumber6Tiles, 0x40, 13
	obj_tiles gSlotMachineNumber7Tiles, 0x40, 14
	obj_tiles gSlotMachineNumber8Tiles, 0x40, 15
	obj_tiles gSlotMachineNumber9Tiles, 0x40, 16
	obj_tiles gSharedMem + 0x10A00, 0x200, 18
	obj_tiles gSharedMem + 0x11400, 0x200, 19
	obj_tiles gSharedMem + 0x11600, 0x300, 20
	obj_tiles gSharedMem + 0x11900, 0x300, 21
	null_obj_tiles

	.align 2
gUnknown_083EDCDC:: @ 83EDCDC
	obj_tiles gSharedMem + 0x10000, 2048, 0x0011

	.align 2
gUnknown_083EDCE4:: @ 83EDCE4
	.4byte gUnknownPalette_08E997E8

UnknownPalette_83EDCE8:
	.ifdef SAPPHIRE
	.incbin "graphics/unknown/sapphire_83EDD40.gbapal"
	.else
	.incbin "graphics/unknown/ruby_83EDCE8.gbapal"
	.endif

	.align 2
gUnknown_083EDD08:: @ 83EDD08
	.4byte UnknownPalette_83EDCE8 + 10 * 2
	.4byte UnknownPalette_83EDCE8 + 11 * 2
	.4byte UnknownPalette_83EDCE8 + 12 * 2
	.4byte UnknownPalette_83EDCE8 + 13 * 2
	.4byte UnknownPalette_83EDCE8 + 14 * 2

	.align 2
gUnknown_083EDD1C:: @ 83EDD1C
	.4byte gUnknown_08E95A18 + 148
	.4byte gUnknown_08E95A18 + 150
	.4byte gUnknown_08E95A18 + 152
	.4byte gUnknown_08E95A18 + 154
	.4byte gUnknown_08E95A18 + 156

gUnknown_083EDD30:: @ 83EDD30
	.byte 0x4A, 0x4B, 0x4C, 0x4E, 0x4D

gUnknown_083EDD35:: @ 83EDD35
	.byte 0, 0, 1, 2, 3, 4

gUnknown_083EDD3B:: @ 83EDD3B
	.byte 1, 2, 2

	.align 1
Unknown_83EDD3E:
	.ifdef SAPPHIRE
	.incbin "graphics/unknown/sapphire_83EDD96.gbapal"
	.else
	.incbin "graphics/unknown/ruby_83EDD3E.gbapal"
	.endif

	.align 1
Unknown_83EDD5E:
	.ifdef SAPPHIRE
	.incbin "graphics/unknown/sapphire_83EDDB6.gbapal"
	.else
	.incbin "graphics/unknown/ruby_83EDD5E.gbapal"
	.endif

	.align 1
Unknown_83EDD7E:
	.ifdef SAPPHIRE
	.incbin "graphics/unknown/sapphire_83EDDD6.gbapal"
	.else
	.incbin "graphics/unknown/ruby_83EDD7E.gbapal"
	.endif

	.align 2
gUnknown_083EDDA0:: @ 83EDDA0
	.4byte Unknown_83EDD3E
	.4byte Unknown_83EDD5E
	.4byte Unknown_83EDD7E

	.align 2
gUnknown_083EDDAC:: @ 83EDDAC
	.4byte gUnknown_08E95A18 + 32

	.align 1
Palette_83EDDB0:
	.incbin "graphics/slot_machine/83EDDB0.gbapal"

	.align 1
Palette_83EDDD0:
	.incbin "graphics/slot_machine/83EDDD0.gbapal"

	.align 1
Palette_83EDDF0:
	.incbin "graphics/slot_machine/83EDDF0.gbapal"

	.align 2
gUnknown_083EDE10:: @ 83EDE10
	.4byte Palette_83EDDB0
	.4byte Palette_83EDDD0
	.4byte Palette_83EDDF0
	.4byte gSlotMachineSpritePalette6

	.align 2
gUnknown_083EDE20:: @ 83EDE20
	.4byte gSlotMachineSpritePalette6

	.align 1
gPalette_83EDE24:: @ 83EDE24
	.incbin "graphics/slot_machine/83EDE24_pal.bin"

	.align 2
gSlotMachineSpritePalettes:: @ 83EDE44
	obj_pal gSlotMachineSpritePalette0, 0
	obj_pal gSlotMachineSpritePalette1, 1
	obj_pal gSlotMachineSpritePalette2, 2
	obj_pal gSlotMachineSpritePalette3, 3
	obj_pal gSlotMachineSpritePalette4, 4
	obj_pal gSlotMachineSpritePalette5, 5
	obj_pal gSlotMachineSpritePalette6, 6
	obj_pal gSlotMachineSpritePalette4, 7
	null_obj_pal

	.align 2
gUnknown_083EDE8C:: @ 83EDE8C
	.incbin "graphics/slot_machine/reel_time.4bpp.lz"

	.align 2
gReelTimeWindowTilemap:: @ 83EEFE0
	.incbin "graphics/slot_machine/reel_time_window_map.bin"
