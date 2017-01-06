	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteImage_839B308:: @ 839B308
	.incbin "graphics/unknown_sprites/839B4E0/0.4bpp"

	.align 2
gSpriteImage_839B388:: @ 839B388
	.incbin "graphics/unknown_sprites/839B4E0/1.4bpp"

	.align 2
gSpriteImage_839B408:: @ 839B408
	.incbin "graphics/unknown_sprites/839B408.4bpp"

	.align 2
gIsTrainerInRange:: @ 839B488
	.4byte IsTrainerInRangeSouth
	.4byte IsTrainerInRangeNorth
	.4byte IsTrainerInRangeWest
	.4byte IsTrainerInRangeEast

	.align 2
gTrainerSeeFuncList:: @ 839B498
	.4byte sub_8084394
	.4byte sub_8084398
	.4byte sub_80843DC
	.4byte sub_808441C
	.4byte sub_8084478
	.4byte sub_8084534
	.4byte sub_8084578
	.4byte sub_80845AC
	.4byte sub_80845C8
	.4byte sub_80845FC
	.4byte sub_8084654
	.4byte sub_80846C8

	.align 2
gTrainerSeeFuncList2:: @ 839B4C8
	.4byte sub_80845C8
	.4byte sub_80845FC
	.4byte sub_8084654
	.4byte sub_80846C8

	.align 2
gOamData_839B4D8:: @ 839B4D8
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteImageTable_839B4E0:: @ 839B4E0
	obj_frame_tiles gSpriteImage_839B308, 0x80
	obj_frame_tiles gSpriteImage_839B388, 0x80

	.align 2
gSpriteImageTable_839B4F0:: @ 839B4F0
	obj_frame_tiles gSpriteImage_839B408, 0x80

	.align 2
gSpriteAnim_839B4F8:: @ 839B4F8
	obj_image_anim_frame 0, 60
	obj_image_anim_end

	.align 2
gSpriteAnim_839B500:: @ 839B500
	obj_image_anim_frame 1, 60
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839B508:: @ 839B508
	.4byte gSpriteAnim_839B4F8
	.4byte gSpriteAnim_839B500

	.align 2
gSpriteTemplate_839B510:: @ 839B510
	spr_template 0xFFFF, 0xFFFF, gOamData_839B4D8, gSpriteAnimTable_839B508, gSpriteImageTable_839B4E0, gDummySpriteAffineAnimTable, objc_exclamation_mark_probably

	.align 2
gSpriteTemplate_839B528:: @ 839B528
	spr_template 0xFFFF, 4100, gOamData_839B4D8, gSpriteAnimTable_839B508, gSpriteImageTable_839B4F0, gDummySpriteAffineAnimTable, objc_exclamation_mark_probably
