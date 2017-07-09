	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_08376420:: @ 8376420
	.byte   3,  0,  1,  0, 15, 39,  0,  2,  0,  0,  0,  0
	.byte   4,  0,  0,  0, 23,  0,  1,  3,  0,  0,  0,  0
	.byte   5,  0,  0,  0, 59,  0,  2,  4,  0,  0,  0,  0
	.byte   6,  0,  0,  0, 59,  0,  3,  5,  0,  0,  0,  0
	.byte   7,  0,  0,  0,  0,  0,  4,  0,  6,  0,  0,  0

	.align 2
gOamData_837645C:: @ 837645C
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteImage_8376464:: @ 8376464
	.incbin "graphics/unknown_sprites/83764AC/0.4bpp"

	.align 2
gSpriteImage_8376484:: @ 8376484
	.incbin "graphics/unknown_sprites/83764AC/1.4bpp"

	.align 2
Palette_3764A4: @ 83764A4
	.incbin "graphics/unknown/83764A4.gbapal"

	.align 2
gSpriteImageTable_83764AC:: @ 83764AC
	obj_frame_tiles gSpriteImage_8376464, 0x20
	obj_frame_tiles gSpriteImage_8376484, 0x20

	.align 2
gUnknown_083764BC:: @ 83764BC
	obj_pal Palette_3764A4, 0x1000

	.align 2
gSpriteAnim_83764C4:: @ 83764C4
	obj_image_anim_frame 0, 30
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83764CC:: @ 83764CC
	obj_image_anim_frame 0, 30, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83764D4:: @ 83764D4
	obj_image_anim_frame 1, 30
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83764DC:: @ 83764DC
	.4byte gSpriteAnim_83764C4
	.4byte gSpriteAnim_83764CC
	.4byte gSpriteAnim_83764D4

	.align 2
gSpriteTemplate_83764E8:: @ 83764E8
	spr_template 0xFFFF, 0x1000, gOamData_837645C, gSpriteAnimTable_83764DC, gSpriteImageTable_83764AC, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_08376500:: @ 8376500
	.string " : $"

@ 0x839AE94
	.string "にっすう$"

@ 0x839AE99
	.string "じかん$"

@ 0x839AE9D
	.string "ゲームない　じかん$"

@ 0x839AEA7
	.string "RTC　じかん$"
