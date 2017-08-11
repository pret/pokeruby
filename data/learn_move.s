	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.4byte 0xFF00FFEF
	.4byte gTileBuffer

	.align 2
gOamData_8402D50:: @ 8402D50
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_8402D58:: @ 8402D58
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_8402D60:: @ 8402D60
	.2byte 0x4000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteAnim_8402D68:: @ 8402D68
	obj_image_anim_frame 2, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402D70:: @ 8402D70
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402D78:: @ 8402D78
	.4byte gSpriteAnim_8402D68
	.4byte gSpriteAnim_8402D70

	.align 2
gUnknown_08402D80:: @ 8402D80
	obj_tiles gDexArrows_Gfx, 384, 0x1595

	.align 2
gUnknown_08402D88:: @ 8402D88
	obj_pal gDexArrows_Pal, 0x1596

	.align 2
gSpriteTemplate_8402D90:: @ 8402D90
	spr_template 5525, 5526, gOamData_8402D58, gSpriteAnimTable_8402D78, NULL, gDummySpriteAffineAnimTable, sub_8133300

	.align 2
gSpriteAnim_8402DA8:: @ 8402DA8
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DB0:: @ 8402DB0
	obj_image_anim_frame 6, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402DB8:: @ 8402DB8
	.4byte gSpriteAnim_8402DA8
	.4byte gSpriteAnim_8402DB0

	.align 2
gSpriteTemplate_8402DC0:: @ 8402DC0
	spr_template 5525, 5526, gOamData_8402D60, gSpriteAnimTable_8402DB8, NULL, gDummySpriteAffineAnimTable, sub_8133300

	.align 2
gSpriteAnim_8402DD8:: @ 8402DD8
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DE0:: @ 8402DE0
	obj_image_anim_frame 9, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DE8:: @ 8402DE8
	obj_image_anim_frame 10, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_8402DF0:: @ 8402DF0
	obj_image_anim_frame 11, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8402DF8:: @ 8402DF8
	.4byte gSpriteAnim_8402DD8
	.4byte gSpriteAnim_8402DE0
	.4byte gSpriteAnim_8402DE8
	.4byte gSpriteAnim_8402DF0

	.align 2
gSpriteTemplate_8402E08:: @ 8402E08
	spr_template 5525, 5526, gOamData_8402D50, gSpriteAnimTable_8402DF8, NULL, gDummySpriteAffineAnimTable, sub_8133300

	.string "あきと$" @ programmer Akito Mori?

gUnknown_08402E24:: @ 8402E24
	.byte 11,  1,  1
	.byte  3,  6,  2
	.byte 24,  1,  3
	.byte  3, 11,  4
	.byte  5,  4,  5
	.byte  3,  6,  6
	.byte  3, 11,  7

gUnknown_08402E39:: @ 8402E39
	.byte 0, 1, 2, 3

gUnknown_08402E3D:: @ 8402E3D
	.byte 4, 5, 6
