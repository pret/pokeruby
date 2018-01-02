	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSubspriteTable_83ED6E4:: @ 83ED6E4
	subsprite -64, -64, 3,   0, 64x64
	subsprite   0, -64, 3,   0, 64x64
	subsprite -64,   0, 3,   0, 64x64
	subsprite   0,   0, 3,   0, 64x64

	.align 2
gSubspriteTables_83ED704:: @ 83ED704
	.4byte 4, gSubspriteTable_83ED6E4

	.align 2
gSubspriteTable_83ED70C:: @ 83ED70C
	subsprite -32, -12, 1,   0, 32x8
	subsprite   0, -12, 1,   4, 32x8
	subsprite -32,  -4, 1,   8, 32x8
	subsprite   0,  -4, 1,  12, 32x8
	subsprite -32,   4, 1,  16, 32x8
	subsprite   0,   4, 1,  20, 32x8

	.align 2
gSubspriteTables_83ED73C:: @ 83ED73C
	.4byte 6, gSubspriteTable_83ED70C

	.align 2
gSubspriteTable_83ED744:: @ 83ED744
	subsprite -32, -20, 1,   0, 64x32
	subsprite -32,  12, 1,  32, 32x8
	subsprite   0,  12, 1,  36, 32x8

	.align 2
gSubspriteTables_83ED75C:: @ 83ED75C
	.4byte 3, gSubspriteTable_83ED744

	.align 2
gSubspriteTable_83ED764:: @ 83ED764
	subsprite -32, -24, 1,   0, 64x32
	subsprite -32,   8, 1,  32, 32x8
	subsprite   0,   8, 1,  36, 32x8
	subsprite -32,  16, 1,  40, 32x8
	subsprite   0,  16, 1,  44, 32x8

	.align 2
gSubspriteTables_83ED78C:: @ 83ED78C
	.4byte 5, gSubspriteTable_83ED764

	.align 2
gSubspriteTable_83ED794:: @ 83ED794
	subsprite -32,  -8, 1,   0, 32x8
	subsprite   0,  -8, 1,   4, 32x8
	subsprite -32,   0, 1,   8, 32x8
	subsprite   0,   0, 1,  12, 32x8

	.align 2
gSubspriteTables_83ED7B4:: @ 83ED7B4
	.4byte 4, gSubspriteTable_83ED794

	.align 2
gSubspriteTable_83ED7BC:: @ 83ED7BC
	subsprite  -8, -12, 1,   0, 16x8
	subsprite  -8,  -4, 1,   0, 16x8
	subsprite  -8,   4, 1,   0, 16x8

	.align 2
gSubspriteTables_83ED7D4:: @ 83ED7D4
	.4byte 3, gSubspriteTable_83ED7BC

	.align 2
gSubspriteTable_83ED7DC:: @ 83ED7DC
	subsprite -32, -24, 3,   0, 64x32
	subsprite -32,   8, 3,  32, 32x8
	subsprite   0,   8, 3,  36, 32x8
	subsprite -32,  16, 3,  40, 32x8
	subsprite   0,  16, 3,  44, 32x8

	.align 2
gSubspriteTables_83ED804:: @ 83ED804
	.4byte 5, gSubspriteTable_83ED7DC

	.align 2
gSubspriteTable_83ED80C:: @ 83ED80C
	subsprite -32,  -8, 3,   0, 32x8
	subsprite   0,  -8, 3,   4, 32x8
	subsprite -32,   0, 3,   8, 32x8
	subsprite   0,   0, 3,  12, 32x8

	.align 2
gSubspriteTables_83ED82C:: @ 83ED82C
	.4byte 4, gSubspriteTable_83ED80C

	.align 2
gSubspriteTable_83ED834:: @ 83ED834
	subsprite -32,  -8, 3,   0, 32x8
	subsprite   0,  -8, 3,   4, 32x8
	subsprite -32,   0, 3,   8, 32x8
	subsprite   0,   0, 3,  12, 32x8

	.align 2
gSubspriteTables_83ED854:: @ 83ED854
	.4byte 4, gSubspriteTable_83ED834

	.align 2
gSubspriteTable_83ED85C:: @ 83ED85C
	subsprite -32,  -8, 3,   0, 32x8
	subsprite   0,  -8, 3,   4, 32x8
	subsprite -32,   0, 3,   8, 32x8
	subsprite   0,   0, 3,  12, 32x8

	.align 2
gSubspriteTables_83ED87C:: @ 83ED87C
	.4byte 4, gSubspriteTable_83ED85C

	.align 2
gSubspriteTable_83ED884:: @ 83ED884
	subsprite -32, -12, 3,   0, 32x8
	subsprite   0, -12, 3,   4, 32x8
	subsprite -32,  -4, 3,   8, 32x8
	subsprite   0,  -4, 3,  12, 32x8
	subsprite -32,   4, 3,  16, 32x8
	subsprite   0,   4, 3,  20, 32x8

	.align 2
gSubspriteTables_83ED8B4:: @ 83ED8B4
	.4byte 6, gSubspriteTable_83ED884

	.align 2
gSubspriteTable_83ED8BC:: @ 83ED8BC
	subsprite -16, -16, 3,   0, 32x32

	.align 2
gSubspriteTable_83ED8C4:: @ 83ED8C4
	subsprite  -8,  -8, 3,  16, 16x16

	.align 2
gSubspriteTables_83ED8CC:: @ 83ED8CC
	.4byte 1, gSubspriteTable_83ED8BC
	.4byte 1, gSubspriteTable_83ED8C4

	.align 2
gSubspriteTable_83ED8DC:: @ 83ED8DC
	subsprite -24, -24, 3,   0, 32x8
	subsprite   8, -24, 3,   4, 16x8
	subsprite -24, -16, 3,   6, 32x8
	subsprite   8, -16, 3,  10, 16x8
	subsprite -24,  -8, 3,  12, 32x8
	subsprite   8,  -8, 3,  16, 16x8
	subsprite -24,   0, 3,  18, 32x8
	subsprite   8,   0, 3,  22, 16x8
	subsprite -24,   8, 3,  24, 32x8
	subsprite   8,   8, 3,  28, 16x8
	subsprite -24,  16, 3,  30, 32x8
	subsprite   8,  16, 3,  34, 16x8

	.align 2
gSubspriteTables_83ED93C:: @ 83ED93C
	.4byte 12, gSubspriteTable_83ED8DC

	.align 2
gSubspriteTable_83ED944:: @ 83ED944
	subsprite -16, -12, 3,   0, 32x16
	subsprite -16,   4, 3,   8, 16x8
	subsprite   0,   4, 3,  10, 16x8

	.align 2
gSubspriteTables_83ED95C:: @ 83ED95C
	.4byte 3, gSubspriteTable_83ED944

	.align 2
gSubspriteTable_83ED964:: @ 83ED964
	subsprite  -8,  -8, 3,   0, 16x8
	subsprite  -8,   0, 3,   8, 16x8

	.align 2
gSubspriteTables_83ED974:: @ 83ED974
	.4byte 2, gSubspriteTable_83ED964

	.align 2
gSubspriteTable_83ED97C:: @ 83ED97C
	subsprite  -8,  -8, 3,   2, 16x8
	subsprite  -8,   0, 3,  10, 16x8

	.align 2
gSubspriteTables_83ED98C:: @ 83ED98C
	.4byte 2, gSubspriteTable_83ED97C

	.align 2
gSubspriteTable_83ED994:: @ 83ED994
	subsprite  -8,  -8, 3,   4, 16x8
	subsprite  -8,   0, 3,  12, 16x8

	.align 2
gSubspriteTables_83ED9A4:: @ 83ED9A4
	.4byte 2, gSubspriteTable_83ED994

	.align 2
gSubspriteTable_83ED9AC:: @ 83ED9AC
	subsprite  -8,  -8, 3,   6, 16x8
	subsprite  -8,   0, 3,  14, 16x8

	.align 2
gSubspriteTables_83ED9BC:: @ 83ED9BC
	.4byte 2, gSubspriteTable_83ED9AC

	.align 2
gSubspriteTable_83ED9C4:: @ 83ED9C4
	subsprite  -8,  -8, 3,   0, 16x8
	subsprite  -8,   0, 3,   8, 16x8

	.align 2
gSubspriteTables_83ED9D4:: @ 83ED9D4
	.4byte 2, gSubspriteTable_83ED9C4

	.align 2
gSubspriteTable_83ED9DC:: @ 83ED9DC
	subsprite  -4,  -8, 3,   2,  8x8
	subsprite  -4,   0, 3,  10,  8x8

	.align 2
gSubspriteTables_83ED9EC:: @ 83ED9EC
	.4byte 2, gSubspriteTable_83ED9DC

	.align 2
gSubspriteTable_83ED9F4:: @ 83ED9F4
	subsprite  -8,  -8, 3,   3, 16x8
	subsprite  -8,   0, 3,  11, 16x8

	.align 2
gSubspriteTables_83EDA04:: @ 83EDA04
	.4byte 2, gSubspriteTable_83ED9F4

	.align 2
gSubspriteTable_83EDA0C:: @ 83EDA0C
	subsprite  -4,  -8, 3,   5,  8x8
	subsprite  -4,   0, 3,  13,  8x8

	.align 2
gSubspriteTables_83EDA1C:: @ 83EDA1C
	.4byte 2, gSubspriteTable_83EDA0C

	.align 2
gSubspriteTable_83EDA24:: @ 83EDA24
	subsprite  -8,  -8, 3,   6, 16x8
	subsprite  -8,   0, 3,  14, 16x8

	.align 2
gSubspriteTables_83EDA34:: @ 83EDA34
	.4byte 2, gSubspriteTable_83EDA24

	.align 2
gSubspriteTable_83EDA3C:: @ 83EDA3C
	subsprite -12, -12, 3,   0, 16x8
	subsprite   4, -12, 3,   2,  8x8
	subsprite -12,  -4, 3,   8, 16x8
	subsprite   4,  -4, 3,  10,  8x8
	subsprite -12,   4, 3,  16, 16x8
	subsprite   4,   4, 3,  18,  8x8

	.align 2
gSubspriteTables_83EDA6C:: @ 83EDA6C
	.4byte 6, gSubspriteTable_83EDA3C

	.align 2
gSubspriteTable_83EDA74:: @ 83EDA74
	subsprite  -8, -12, 3,   3, 16x8
	subsprite  -8,  -4, 3,  11, 16x8
	subsprite  -8,   4, 3,  19, 16x8

	.align 2
gSubspriteTables_83EDA8C:: @ 83EDA8C
	.4byte 3, gSubspriteTable_83EDA74

	.align 2
gSubspriteTable_83EDA94:: @ 83EDA94
	subsprite -12, -12, 3,   5, 16x8
	subsprite   4, -12, 3,   7,  8x8
	subsprite -12,  -4, 3,  13, 16x8
	subsprite   4,  -4, 3,  15,  8x8
	subsprite -12,   4, 3,  21, 16x8
	subsprite   4,   4, 3,  23,  8x8

	.align 2
gSubspriteTables_83EDAC4:: @ 83EDAC4
	.4byte 6, gSubspriteTable_83EDA94

	.align 2
gSubspriteTable_83EDACC:: @ 83EDACC
	subsprite -12, -12, 3,   0, 16x8
	subsprite   4, -12, 3,   2,  8x8
	subsprite -12,  -4, 3,   8, 16x8
	subsprite   4,  -4, 3,  10,  8x8
	subsprite -12,   4, 3,  16, 16x8
	subsprite   4,   4, 3,  18,  8x8

	.align 2
gSubspriteTables_83EDAFC:: @ 83EDAFC
	.4byte 6, gSubspriteTable_83EDACC

	.align 2
gSubspriteTable_83EDB04:: @ 83EDB04
	subsprite  -8, -12, 3,   3, 16x8
	subsprite  -8,  -4, 3,  11, 16x8
	subsprite  -8,   4, 3,  19, 16x8

	.align 2
gSubspriteTables_83EDB1C:: @ 83EDB1C
	.4byte 3, gSubspriteTable_83EDB04

	.align 2
gSubspriteTable_83EDB24:: @ 83EDB24
	subsprite -12, -12, 3,   5, 16x8
	subsprite   4, -12, 3,   7,  8x8
	subsprite -12,  -4, 3,  13, 16x8
	subsprite   4,  -4, 3,  15,  8x8
	subsprite -12,   4, 3,  21, 16x8
	subsprite   4,   4, 3,  23,  8x8

	.align 2
gSubspriteTables_83EDB54:: @ 83EDB54
	.4byte 6, gSubspriteTable_83EDB24

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
