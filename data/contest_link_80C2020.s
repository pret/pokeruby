	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083D1624:: @ 83D1624
	.incbin "graphics/unknown/unknown_3D1624/0.4bpp"

gUnknown_083D1644:: @ 83D1644
	.incbin "graphics/unknown/unknown_3D1624/1.4bpp"
	.incbin "graphics/unknown/unknown_3D1624/2.4bpp"
	.incbin "graphics/unknown/unknown_3D1624/3.4bpp"
	.incbin "graphics/unknown/unknown_3D1624/4.4bpp"
	.incbin "graphics/unknown/unknown_3D1624/5.4bpp"

gUnknown_083D16E4:: @ 83D16E4
	.incbin "graphics/unknown/unknown_3D1624/6.4bpp"
	.incbin "graphics/unknown/unknown_3D1624/7.4bpp"

	.align 2
gMiscBlank_Pal::
	.incbin "graphics/interface/blank.gbapal"

	.align 2
gOamData_83D1744:: @ 83D1744
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x2C00

	.align 2
gSpriteTemplate_83D174C:: @ 83D174C
	spr_template 3009, 3009, gOamData_83D1744, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_083D1764:: @ 83D1764
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc1
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc2
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc3
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc4
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc5
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc6
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc7
	obj_tiles gMiscBlank_Gfx, 1024, 0x0bc8

	.align 2
gUnknown_083D17A4:: @ 83D17A4
	obj_pal gMiscBlank_Pal, 0x0BC1

	.align 2
gOamData_83D17AC:: @ 83D17AC
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteTemplate_83D17B4:: @ 83D17B4
	spr_template 3017, 3017, gOamData_83D17AC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80C3DF0

	.align 2
gUnknown_083D17CC:: @ 83D17CC
	obj_tiles gContestConfetti_Gfx, 544, 0x0bc9

	.align 2
gUnknown_083D17D4:: @ 83D17D4
	obj_pal gContestConfetti_Pal, 0x0bc9

gUnknown_083D17DC:: @ 83D17DC
	.string "{COLOR RED}$"

gUnknown_083D17E0:: @ 83D17E0
	.string "/$"

gUnknown_083D17E2:: @ 83D17E2
	.string "{SIZE 3}{COLOR_HIGHLIGHT_SHADOW WHITE2 DARK_GREY LIGHT_BLUE}$"

	.align 2
	.incbin "graphics/unknown/unknown_3D17EC.gbapal"
