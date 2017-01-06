	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
ClockGfx_Misc: @ 83F7814
	.incbin "graphics/misc/clock_misc.4bpp.lz"

	.align 2
gUnknown_083F7A90:: @ 83F7A90
	obj_tiles ClockGfx_Misc, 0x2000, 0x1000
	.space 8

	.align 2
gUnknown_083F7AA0:: @ 83F7AA0
	obj_pal gMiscClockMale_Pal, 0x1000
	obj_pal gMiscClockFemale_Pal, 0x1001
	.space 8

	.align 2
gOamData_83F7AB8:: @ 83F7AB8
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_83F7AC0:: @ 83F7AC0
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83F7AC8:: @ 83F7AC8
	obj_image_anim_frame 64, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83F7AD0:: @ 83F7AD0
	.4byte gSpriteAnim_83F7AC0

	.align 2
gSpriteAnimTable_83F7AD4:: @ 83F7AD4
	.4byte gSpriteAnim_83F7AC8

	.align 2
gSpriteTemplate_83F7AD8:: @ 83F7AD8
	spr_template 4096, 4096, gOamData_83F7AB8, gSpriteAnimTable_83F7AD0, NULL, gDummySpriteAffineAnimTable, sub_810B05C

	.align 2
gSpriteTemplate_83F7AF0:: @ 83F7AF0
	spr_template 4096, 4096, gOamData_83F7AB8, gSpriteAnimTable_83F7AD4, NULL, gDummySpriteAffineAnimTable, sub_810B0F4

	.align 2
gOamData_83F7B08:: @ 83F7B08
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteAnim_83F7B10:: @ 83F7B10
	obj_image_anim_frame 132, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_83F7B18:: @ 83F7B18
	obj_image_anim_frame 128, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83F7B20:: @ 83F7B20
	.4byte gSpriteAnim_83F7B10

	.align 2
gSpriteAnimTable_83F7B24:: @ 83F7B24
	.4byte gSpriteAnim_83F7B18

	.align 2
gSpriteTemplate_83F7B28:: @ 83F7B28
	spr_template 4096, 4096, gOamData_83F7B08, gSpriteAnimTable_83F7B20, NULL, gDummySpriteAffineAnimTable, sub_810B18C

	.align 2
gSpriteTemplate_83F7B40:: @ 83F7B40
	spr_template 4096, 4096, gOamData_83F7B08, gSpriteAnimTable_83F7B24, NULL, gDummySpriteAffineAnimTable, sub_810B230

@ 83F7B58
	.include "data/clock_hand_coords.inc"
