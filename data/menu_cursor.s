	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
OutlineCursorTiles_00:
	.incbin "graphics/interface/outline_cursor_00.4bpp"

	.align 2
OutlineCursorTiles_01:
	.incbin "graphics/interface/outline_cursor_01.4bpp"

	.align 2
OutlineCursorTiles_02:
	.incbin "graphics/interface/outline_cursor_02.4bpp"

	.align 2
OutlineCursorTiles_03:
	.incbin "graphics/interface/outline_cursor_03.4bpp"

	.align 2
OutlineCursorTiles_04:
	.incbin "graphics/interface/outline_cursor_04.4bpp"

	.align 2
OutlineCursorTiles_05:
	.incbin "graphics/interface/outline_cursor_05.4bpp"

	.align 2
OutlineCursorTiles_06:
	.incbin "graphics/interface/outline_cursor_06.4bpp"

	.align 2
OutlineCursorTiles_07:
	.incbin "graphics/interface/outline_cursor_07.4bpp"

	.align 2
OutlineCursorTiles_08:
	.incbin "graphics/interface/outline_cursor_08.4bpp"

	.align 2
OutlineCursorTiles_09:
	.incbin "graphics/interface/outline_cursor_09.4bpp"

	.align 2
OutlineCursorTiles_10:
	.incbin "graphics/interface/outline_cursor_10.4bpp"

	.align 2
OutlineCursorTiles_11:
	.incbin "graphics/interface/outline_cursor_11.4bpp"

	.align 2
OutlineCursorTiles_12:
	.incbin "graphics/interface/outline_cursor_12.4bpp"

	.align 2
OutlineCursorTiles_13:
	.incbin "graphics/interface/outline_cursor_13.4bpp"

	.align 2
OutlineCursorTiles_14:
	.incbin "graphics/interface/outline_cursor_14.4bpp"

	.align 2
OutlineCursorTiles_15:
	.incbin "graphics/interface/outline_cursor_15.4bpp"

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
	obj_tiles OutlineCursorTiles_00, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_01, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_02, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_03, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_04, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_05, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_06, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_07, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_08, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_09, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_10, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_11, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_12, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_13, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_14, 0x1C0, 0xFFF0
	obj_tiles OutlineCursorTiles_15, 0x1C0, 0xFFF0

	.align 2
gUnknown_0842F1C0:: @ 842F1C0
	obj_tiles OutlineCursorTiles_00, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_01, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_02, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_03, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_04, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_05, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_06, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_07, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_08, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_09, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_10, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_11, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_12, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_13, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_14, 0x1C0, 0xFFF1
	obj_tiles OutlineCursorTiles_15, 0x1C0, 0xFFF1

	.align 2
gUnknown_0842F240:: @ 842F240
	obj_pal 0x0203a360, 0xfff0

	.align 2
gUnknown_0842F248:: @ 842F248
	obj_pal 0x0203a360, 0xfff1

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
Unknown_842F2C8: @ 842F2C8
	.incbin "baserom.gba", 0x0042f2c8, 0x10
Unknown_842F2D8: @ 842F2D8
	.incbin "baserom.gba", 0x0042f2d8, 0x18
Unknown_842F2F0: @ 842F2F0
	.incbin "baserom.gba", 0x0042f2f0, 0x20
Unknown_842F310: @ 842F310
	.incbin "baserom.gba", 0x0042f310, 0x18
Unknown_842F328: @ 842F328
	.incbin "baserom.gba", 0x0042f328, 0x18
Unknown_842F340: @ 842F340
	.incbin "baserom.gba", 0x0042f340, 0x20
Unknown_842F360: @ 842F360
	.incbin "baserom.gba", 0x0042f360, 0x20
Unknown_842F380: @ 842F380
	.incbin "baserom.gba", 0x0042f380, 0x20
Unknown_842F3A0: @ 842F3A0
	.incbin "baserom.gba", 0x0042f3a0, 0x20
Unknown_842F3C0: @ 842F3C0
	.incbin "baserom.gba", 0x0042f3c0, 0x28
Unknown_842F3E8: @ 842F3E8
	.incbin "baserom.gba", 0x0042f3e8, 0x28
Unknown_842F410: @ 842F410
	.incbin "baserom.gba", 0x0042f410, 0x28
Unknown_842F438: @ 842F438
	.incbin "baserom.gba", 0x0042f438, 0x28
Unknown_842F460: @ 842F460
	.incbin "baserom.gba", 0x0042f460, 0x30
Unknown_842F490: @ 842F490
	.incbin "baserom.gba", 0x0042f490, 0x30
Unknown_842F4C0: @ 842F4C0
	.incbin "baserom.gba", 0x0042f4c0, 0x30
Unknown_842F4F0: @ 842F4F0
	.incbin "baserom.gba", 0x0042f4f0, 0x30
Unknown_842F520: @ 842F520
	.incbin "baserom.gba", 0x0042f520, 0x38
Unknown_842F558: @ 842F558
	.incbin "baserom.gba", 0x0042f558, 0x18

	.4byte Unknown_842F2C8
	.4byte Unknown_842F2C8
	.4byte Unknown_842F2D8
	.4byte Unknown_842F2F0
	.4byte Unknown_842F310
	.4byte Unknown_842F328
	.4byte Unknown_842F340
	.4byte Unknown_842F360
	.4byte Unknown_842F380
	.4byte Unknown_842F3A0
	.4byte Unknown_842F3C0
	.4byte Unknown_842F3E8
	.4byte Unknown_842F410
	.4byte Unknown_842F438
	.4byte Unknown_842F460
	.4byte Unknown_842F490
	.4byte Unknown_842F4C0
	.4byte Unknown_842F4F0
	.4byte Unknown_842F520

	.align 2
gUnknown_0842F5BC:: @ 842F5BC
	.4byte Unknown_842F558

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
	.4byte  1, gMenuCursorSubsprites
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
gUnknown_0842F6C0:: @ 842F6C0
	.4byte 0x2, Unknown_842F2C8
	.4byte 0x2, Unknown_842F2C8
	.4byte 0x3, Unknown_842F2D8
	.4byte 0x4, Unknown_842F2F0
	.4byte 0x3, Unknown_842F310
	.4byte 0x3, Unknown_842F328
	.4byte 0x4, Unknown_842F340
	.4byte 0x4, Unknown_842F360
	.4byte 0x4, Unknown_842F380
	.4byte 0x4, Unknown_842F3A0
	.4byte 0x5, Unknown_842F3C0
	.4byte 0x5, Unknown_842F3E8
	.4byte 0x5, Unknown_842F410
	.4byte 0x5, Unknown_842F438
	.4byte 0x6, Unknown_842F460
	.4byte 0x6, Unknown_842F490
	.4byte 0x6, Unknown_842F4C0
	.4byte 0x6, Unknown_842F4F0
	.4byte 0x7, Unknown_842F520

	.align 2
gUnknown_0842F758:: @ 842F758
	.4byte 3, gMenuCursorSubsprites
	.4byte 0, 2
	.4byte 0, 66
	.4byte 0, 105
	.4byte 0, 34

	.align 2
gUnknown_0842F780:: @ 842F780
	.4byte 0, 105

	.align 2
gUnknown_0842F788:: @ 842F788
	.4byte 0, 34

	.align 2
gUnknown_0842F790:: @ 842F790
	.4byte 0, 66
