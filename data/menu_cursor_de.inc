	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
OutlineCursorTiles_00:
	.incbin "graphics/interface/outline_cursor_00_de.4bpp"

	.align 2
OutlineCursorTiles_01:
	.incbin "graphics/interface/outline_cursor_01_de.4bpp"

	.align 2
OutlineCursorTiles_02:
	.incbin "graphics/interface/outline_cursor_02_de.4bpp"

	.align 2
OutlineCursorTiles_03:
	.incbin "graphics/interface/outline_cursor_03_de.4bpp"

	.align 2
OutlineCursorTiles_04:
	.incbin "graphics/interface/outline_cursor_04_de.4bpp"

	.align 2
OutlineCursorTiles_05:
	.incbin "graphics/interface/outline_cursor_05_de.4bpp"

	.align 2
OutlineCursorTiles_06:
	.incbin "graphics/interface/outline_cursor_06_de.4bpp"

	.align 2
OutlineCursorTiles_07:
	.incbin "graphics/interface/outline_cursor_07_de.4bpp"

	.align 2
OutlineCursorTiles_08:
	.incbin "graphics/interface/outline_cursor_08_de.4bpp"

	.align 2
OutlineCursorTiles_09:
	.incbin "graphics/interface/outline_cursor_09_de.4bpp"

	.align 2
OutlineCursorTiles_10:
	.incbin "graphics/interface/outline_cursor_10_de.4bpp"

	.align 2
OutlineCursorTiles_11:
	.incbin "graphics/interface/outline_cursor_11_de.4bpp"

	.align 2
OutlineCursorTiles_12:
	.incbin "graphics/interface/outline_cursor_12_de.4bpp"

	.align 2
OutlineCursorTiles_13:
	.incbin "graphics/interface/outline_cursor_13_de.4bpp"

	.align 2
OutlineCursorTiles_14:
	.incbin "graphics/interface/outline_cursor_14_de.4bpp"

	.align 2
OutlineCursorTiles_15:
	.incbin "graphics/interface/outline_cursor_15_de.4bpp"

	.align 2
gOamData_842F11C:: @ 842F11C
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_842F124:: @ 842F124
	.2byte 0x8800
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_842F12C:: @ 842F12C
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteAnim_842F134:: @ 842F134
	obj_image_anim_frame 0, 63
	obj_image_anim_end

	.align 2
gSpriteAnimTable_842F13C:: @ 842F13C
	.4byte gSpriteAnim_842F134

	.align 2
gUnknown_0842F140:: @ 842F140
	obj_tiles OutlineCursorTiles_00, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_01, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_02, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_03, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_04, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_05, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_06, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_07, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_08, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_09, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_10, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_11, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_12, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_13, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_14, 0x380, 0xFFF0
	obj_tiles OutlineCursorTiles_15, 0x380, 0xFFF0

	.align 2
gUnknown_0842F1C0:: @ 842F1C0
	obj_tiles OutlineCursorTiles_00, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_01, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_02, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_03, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_04, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_05, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_06, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_07, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_08, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_09, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_10, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_11, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_12, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_13, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_14, 0x380, 0xFFF1
	obj_tiles OutlineCursorTiles_15, 0x380, 0xFFF1

	.align 2
gUnknown_0842F240:: @ 842F240
	obj_pal gUnknown_0203A360, 0xfff0

	.align 2
gUnknown_0842F248:: @ 842F248
	obj_pal gUnknown_0203A360, 0xfff1

	.align 2
gSpriteTemplate_842F250:: @ 842F250
	spr_template 65520, 65520, gOamData_842F11C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_842F268:: @ 842F268
	spr_template 65520, 0xFFFF, gOamData_842F11C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_842F280:: @ 842F280
	spr_template 65520, 0xFFFF, gOamData_842F124, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_842F298:: @ 842F298
	spr_template 65521, 65521, gOamData_842F12C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_842F2B0:: @ 842F2B0
	spr_template 65521, 0xFFFF, gOamData_842F12C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSubspriteTable_842F2C8:: @ 842F2C8
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F2D8:: @ 842F2D8
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,   4, 8x32
	subsprite   9,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F2F0:: @ 842F2F0
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,   4, 8x32
	subsprite   9,  -1, 0,   4, 8x32
	subsprite  17,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F310:: @ 842F310
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  25,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F328:: @ 842F328
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F340:: @ 842F340
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,   4, 8x32
	subsprite   9,  -1, 0,  12, 32x32
	subsprite  41,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F360:: @ 842F360
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  17,  -1, 0,  12, 32x32
	subsprite  49,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F380:: @ 842F380
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  25,  -1, 0,  12, 32x32
	subsprite  57,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F3A0:: @ 842F3A0
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,  12, 32x32
	subsprite  65,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F3C0:: @ 842F3C0
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,   4, 8x32
	subsprite   9,  -1, 0,  12, 32x32
	subsprite  41,  -1, 0,  12, 32x32
	subsprite  73,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F3E8:: @ 842F3E8
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,  12, 32x32
	subsprite  49,  -1, 0,  12, 32x32
	subsprite  81,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F410:: @ 842F410
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,  12, 32x32
	subsprite  57,  -1, 0,  12, 32x32
	subsprite  89,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F438:: @ 842F438
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,  12, 32x32
	subsprite  65,  -1, 0,  12, 32x32
	subsprite  97,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F460:: @ 842F460
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,   4, 8x32
	subsprite   9,  -1, 0,  12, 32x32
	subsprite  41,  -1, 0,  12, 32x32
	subsprite  73,  -1, 0,  12, 32x32
	subsprite 105,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F490:: @ 842F490
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,  12, 32x32
	subsprite  65,  -1, 0,  12, 32x32
	subsprite  81,  -1, 0,  12, 32x32
	subsprite 113,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F4C0:: @ 842F4C0
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,  12, 32x32
	subsprite  65,  -1, 0,  12, 32x32
	subsprite  89,  -1, 0,  12, 32x32
	subsprite 121,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F4F0:: @ 842F4F0
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,  12, 32x32
	subsprite  33,  -1, 0,  12, 32x32
	subsprite  65,  -1, 0,  12, 32x32
	subsprite  97,  -1, 0,  12, 32x32
	subsprite 129,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F520:: @ 842F520
	subsprite  -1,  -1, 0,   0, 8x32
	subsprite   1,  -1, 0,   4, 8x32
	subsprite   9,  -1, 0,  12, 32x32
	subsprite  41,  -1, 0,  12, 32x32
	subsprite  73,  -1, 0,  12, 32x32
	subsprite 105,  -1, 0,  12, 32x32
	subsprite 137,  -1, 0,   8, 8x32

	.align 2
gSubspriteTable_842F558:: @ 842F558
	subsprite  -1,  -1, 0,   0, 8x16
	subsprite   7,  -1, 0,  12, 32x32
	subsprite  35,  -1, 0,   8, 8x16

	.align 2
gUnknown_0842F5BC:: @ 842F5BC
	.4byte gSubspriteTable_842F558

	.align 2
gSubspriteTables_842F5C0:: @ 842F5C0
	.4byte  1, gMenuCursorSubsprites
	.4byte  1, gMenuCursorSubsprites
	.4byte  2, gMenuCursorSubsprites
	.4byte  3, gMenuCursorSubsprites
	.4byte  4, gMenuCursorSubsprites
	.4byte  5, gMenuCursorSubsprites
	.4byte  6, gMenuCursorSubsprites
	.4byte  7, gMenuCursorSubsprites
	.4byte  8, gMenuCursorSubsprites
	.4byte  9, gMenuCursorSubsprites
	.4byte 10, gMenuCursorSubsprites
	.4byte 11, gMenuCursorSubsprites
	.4byte 12, gMenuCursorSubsprites
	.4byte 13, gMenuCursorSubsprites
	.4byte 14, gMenuCursorSubsprites
	.4byte 15, gMenuCursorSubsprites
	.4byte 16, gMenuCursorSubsprites
	.4byte 17, gMenuCursorSubsprites
	.4byte 18, gMenuCursorSubsprites
	.4byte 19, gMenuCursorSubsprites
	.4byte 20, gMenuCursorSubsprites
	.4byte 21, gMenuCursorSubsprites
	.4byte 22, gMenuCursorSubsprites
	.4byte 23, gMenuCursorSubsprites
	.4byte 24, gMenuCursorSubsprites
	.4byte 25, gMenuCursorSubsprites
	.4byte 26, gMenuCursorSubsprites
	.4byte 27, gMenuCursorSubsprites
	.4byte 28, gMenuCursorSubsprites
	.4byte 29, gMenuCursorSubsprites
	.4byte 30, gMenuCursorSubsprites
	.4byte 31, gMenuCursorSubsprites

	.align 2
gSubspriteTables_842F6C0:: @ 842F6C0
	.4byte 2, gSubspriteTable_842F2C8
	.4byte 2, gSubspriteTable_842F2C8
	.4byte 3, gSubspriteTable_842F2D8
	.4byte 4, gSubspriteTable_842F2F0
	.4byte 3, gSubspriteTable_842F310
	.4byte 3, gSubspriteTable_842F328
	.4byte 4, gSubspriteTable_842F340
	.4byte 4, gSubspriteTable_842F360
	.4byte 4, gSubspriteTable_842F380
	.4byte 4, gSubspriteTable_842F3A0
	.4byte 5, gSubspriteTable_842F3C0
	.4byte 5, gSubspriteTable_842F3E8
	.4byte 5, gSubspriteTable_842F410
	.4byte 5, gSubspriteTable_842F438
	.4byte 6, gSubspriteTable_842F460
	.4byte 6, gSubspriteTable_842F490
	.4byte 6, gSubspriteTable_842F4C0
	.4byte 6, gSubspriteTable_842F4F0
	.4byte 7, gSubspriteTable_842F520

	.align 2
gUnknown_0842F758:: @ 842F758
	.4byte 3, gMenuCursorSubsprites
	.4byte 0xFFFF0000, 6
	.4byte 0xFFFF0000, 134
	.4byte 0xFFFF0000, 200
	.4byte 0xFFFF0000, 70

	.align 2
gUnknown_0842F780:: @ 842F780
	.4byte 0xFFFF0000, 6

	.align 2
gUnknown_0842F788:: @ 842F788
	.4byte 0xFFFF0000, 200

	.align 2
gUnknown_0842F790:: @ 842F790
	.4byte 0xFFFF0000, 70

gUnknown_0842F798:: @ 842F798
	.4byte 0xFFFF0000, 134
