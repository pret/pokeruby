	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

EggPalette:: @ 8209AD8
	.incbin "graphics/pokemon/egg/palette.gbapal"

EggHatchTiles:: @ 8209AF8
	.incbin "graphics/misc/egg_hatch.4bpp"

EggShardTiles:: @ 820A2F8
	.incbin "graphics/misc/egg_shard.4bpp"

	.align 2
gOamData_820A378:: @ 820A378
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_820A380:: @ 820A380
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A388:: @ 820A388
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A390:: @ 820A390
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A398:: @ 820A398
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820A3A0:: @ 820A3A0
	.4byte gSpriteAnim_820A380
	.4byte gSpriteAnim_820A388
	.4byte gSpriteAnim_820A390
	.4byte gSpriteAnim_820A398

	.align 2
gUnknown_0820A3B0:: @ 820A3B0
	obj_tiles EggHatchTiles, 2048, 12345

	.align 2
gUnknown_0820A3B8:: @ 820A3B8
	obj_tiles EggShardTiles, 128, 23456

	.align 2
gUnknown_0820A3C0:: @ 820A3C0
	obj_pal EggPalette, 54321

	.align 2
gSpriteTemplate_820A3C8:: @ 820A3C8
	spr_template 12345, 54321, gOamData_820A378, gSpriteAnimTable_820A3A0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_820A3E0:: @ 820A3E0
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gSpriteAnim_820A3E8:: @ 820A3E8
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A3F0:: @ 820A3F0
	obj_image_anim_frame 1, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A3F8:: @ 820A3F8
	obj_image_anim_frame 2, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A400:: @ 820A400
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820A408:: @ 820A408
	.4byte gSpriteAnim_820A3E8
	.4byte gSpriteAnim_820A3F0
	.4byte gSpriteAnim_820A3F8
	.4byte gSpriteAnim_820A400

	.align 2
gSpriteTemplate_820A418:: @ 820A418
	spr_template 23456, 54321, gOamData_820A3E0, gSpriteAnimTable_820A408, NULL, gDummySpriteAffineAnimTable, SpriteCB_EggShard

@ The values are Q8.8 fixed-point numbers.
	.align 1
gEggShardVelocities:: @ 820A430
	.2byte 0xFE80, 0xFC40 @ (-1.5, -3.75)
	.2byte 0xFB00, 0xFD00 @ (-5, -3)
	.2byte 0x0380, 0xFD00 @ (3.5, -3)
	.2byte 0xFC00, 0xFC40 @ (-4, -3.75)
	.2byte 0x0200, 0xFE80 @ (2, -1.5)
	.2byte 0xFF80, 0xF940 @ (-0.5, -6.75)
	.2byte 0x0500, 0xFDC0 @ (5, -2.25)
	.2byte 0xFE80, 0xFC40 @ (-1.5, -3.75)
	.2byte 0x0480, 0xFE80 @ (4.5, -1.5)
	.2byte 0xFF00, 0xF940 @ (-1, -6.75)
	.2byte 0x0400, 0xFDC0 @ (4, -2.25)
	.2byte 0xFC80, 0xFC40 @ (-3.5, -3.75)
	.2byte 0x0100, 0xFE80 @ (1, -1.5)
	.2byte 0xFC7C, 0xF940 @ (-3.515625, -6.75)
	.2byte 0x0480, 0xFDC0 @ (4.5, -2.25)
	.2byte 0xFF80, 0xF880 @ (-0.5, -7.5)
	.2byte 0x0100, 0xFB80 @ (1, -4.5)
	.2byte 0xFD80, 0xFDC0 @ (-2.5, -2.25)
	.2byte 0x0280, 0xF880 @ (2.5, -7.5)
