	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_83CF558:: @ 83CF558
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0000

	.align 2
gSpriteAnim_83CF560:: @ 83CF560
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83CF568:: @ 83CF568
	.4byte gSpriteAnim_83CF560

	.align 2
gSpriteTemplate_83CF56C:: @ 83CF56C
	spr_template 10018, 10018, gOamData_83CF558, gSpriteAnimTable_83CF568, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_083CF584:: @ 83CF584
	obj_tiles gMenuMoneyGfx, 256, 0x2722

	.align 2
gUnknown_083CF58C:: @ 83CF58C
	obj_pal gMenuMoneyPal, 0x2722
