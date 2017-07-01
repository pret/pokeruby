	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083E49F4:: @ 83E49F4
	.incbin "graphics/misc/mon_markings.gbapal"

	.align 2
gUnknown_083E4A14:: @ 83E4A14
	.incbin "graphics/misc/mon_markings.4bpp"

	.align 2
gOamData_83E5214:: @ 83E5214
	.2byte 0x0
	.2byte 0xC000
	.2byte 0x0

	.align 2
gOamData_83E521C:: @ 83E521C
	.2byte 0x0
	.2byte 0x0
	.2byte 0x0

	.align 2
gSpriteAnim_83E5224:: @ 83E5224
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E522C:: @ 83E522C
	obj_image_anim_frame 1, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5234:: @ 83E5234
	obj_image_anim_frame 2, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E523C:: @ 83E523C
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5244:: @ 83E5244
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E524C:: @ 83E524C
	obj_image_anim_frame 5, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5254:: @ 83E5254
	obj_image_anim_frame 6, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E525C:: @ 83E525C
	obj_image_anim_frame 7, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5264:: @ 83E5264
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E526C:: @ 83E526C
	obj_image_anim_frame 9, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E5274:: @ 83E5274
	.4byte gSpriteAnim_83E5224
	.4byte gSpriteAnim_83E522C
	.4byte gSpriteAnim_83E5234
	.4byte gSpriteAnim_83E523C
	.4byte gSpriteAnim_83E5244
	.4byte gSpriteAnim_83E524C
	.4byte gSpriteAnim_83E5254
	.4byte gSpriteAnim_83E525C
	.4byte gSpriteAnim_83E5264
	.4byte gSpriteAnim_83E526C

	.align 2
gSpriteAnim_83E529C:: @ 83E529C
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52A4:: @ 83E52A4
	obj_image_anim_frame 64, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E52AC:: @ 83E52AC
	.4byte gSpriteAnim_83E529C
	.4byte gSpriteAnim_83E52A4

	.align 2
gOamData_83E52B4:: @ 83E52B4
	.2byte 0x4000
	.2byte 0x4000
	.2byte 0x0

	.align 2
gSpriteAnim_83E52BC:: @ 83E52BC
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52C4:: @ 83E52C4
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52CC:: @ 83E52CC
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52D4:: @ 83E52D4
	obj_image_anim_frame 12, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52DC:: @ 83E52DC
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52E4:: @ 83E52E4
	obj_image_anim_frame 20, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52EC:: @ 83E52EC
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52F4:: @ 83E52F4
	obj_image_anim_frame 28, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E52FC:: @ 83E52FC
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5304:: @ 83E5304
	obj_image_anim_frame 36, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E530C:: @ 83E530C
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5314:: @ 83E5314
	obj_image_anim_frame 44, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E531C:: @ 83E531C
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5324:: @ 83E5324
	obj_image_anim_frame 52, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E532C:: @ 83E532C
	obj_image_anim_frame 56, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E5334:: @ 83E5334
	obj_image_anim_frame 60, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E533C:: @ 83E533C
	.4byte gSpriteAnim_83E52BC
	.4byte gSpriteAnim_83E52C4
	.4byte gSpriteAnim_83E52CC
	.4byte gSpriteAnim_83E52D4
	.4byte gSpriteAnim_83E52DC
	.4byte gSpriteAnim_83E52E4
	.4byte gSpriteAnim_83E52EC
	.4byte gSpriteAnim_83E52F4
	.4byte gSpriteAnim_83E52FC
	.4byte gSpriteAnim_83E5304
	.4byte gSpriteAnim_83E530C
	.4byte gSpriteAnim_83E5314
	.4byte gSpriteAnim_83E531C
	.4byte gSpriteAnim_83E5324
	.4byte gSpriteAnim_83E532C
	.4byte gSpriteAnim_83E5334
