	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 83BBD20
	.include "data/graphics/pokemon/icon_table.inc"

@ 83BC400
	.include "data/graphics/pokemon/icon_palette_indices.inc"

@ 83BC5B8
	.include "data/graphics/pokemon/icon_palette_table.inc"

	.align 2
gOamData_83BC5E8:: @ 83BC5E8
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_83BC5F0:: @ 83BC5F0
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83BC5FC:: @ 83BC5FC
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 1, 8
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83BC608:: @ 83BC608
	obj_image_anim_frame 0, 14
	obj_image_anim_frame 1, 14
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83BC614:: @ 83BC614
	obj_image_anim_frame 0, 22
	obj_image_anim_frame 1, 22
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83BC620:: @ 83BC620
	obj_image_anim_frame 0, 29
	obj_image_anim_frame 0, 29
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83BC62C:: @ 83BC62C
	.4byte gSpriteAnim_83BC5F0
	.4byte gSpriteAnim_83BC5FC
	.4byte gSpriteAnim_83BC608
	.4byte gSpriteAnim_83BC614
	.4byte gSpriteAnim_83BC620

	.align 2
gSpriteAffineAnim_83BC640:: @ 83BC640
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 10
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83BC650:: @ 83BC650
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, 0, 122
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83BC660:: @ 83BC660
	.4byte gSpriteAffineAnim_83BC640
	.4byte gSpriteAffineAnim_83BC650

	.align 1
gSpriteImageSizes:: @ 83BC668
	@ square
	.2byte  0x20 @ 1×1
	.2byte  0x80 @ 2×2
	.2byte 0x200 @ 4×4
	.2byte 0x800 @ 8×8

	@ horizontal rectangle
	.2byte  0x40 @ 2×1
	.2byte  0x80 @ 4×1
	.2byte 0x100 @ 4×2
	.2byte 0x400 @ 8×4

	@ vertical rectangle
	.2byte  0x40 @ 1×2
	.2byte  0x80 @ 1×4
	.2byte 0x100 @ 2×4
	.2byte 0x400 @ 4×8
