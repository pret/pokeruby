	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_0840B83C:: @ 840B83C
	.byte    0,   1,   0
	.byte 0xFF,   1,0xFF
	.byte 0xFF,   1,0xFF
	.byte 0xFF,   1,0xFF
	.byte 0xFF,   1,0xFF

gUnknown_0840B84B:: @ 840B84B
	.byte    1,0xFF,   1
	.byte    1,0xFF,   1
	.byte    1,   2,   1
	.byte    1,0xFF,   1
	.byte    1,0xFF,   1

gUnknown_0840B85A:: @ 840B85A
	.byte    1,   0,   0
	.byte    1,0xFF,0xFF
	.byte    1,   2,   2
	.byte    1,0xFF,0xFF
	.byte    1,0x80,0x80

gUnknown_0840B869:: @ 840B869
	.byte    1,   3,   1
	.byte    1,   4,   1
	.byte    1,   5,   1
	.byte    1,0xC4,   1
	.byte    1,0xC3,   1

gUnknown_0840B878:: @ 840B878
	.byte    1,   6,   7
	.byte    1,   8,   9
	.byte    1,0xFF,   1
	.byte    1,0x88,0x89
	.byte    1,0x86,0x87

	.byte    1,   0,   0
	.byte    1,0xFF,0xFF
	.byte    1,0x80,0x8A
	.byte    1,0xFF,0xFF
	.byte    1,0xFF,0xFF
	.byte    0,   1,   0
	.byte 0xFF,   1,0xFF
	.byte 0xFF,   1,0xFF
	.byte 0xFF,   1,0xFF
	.byte 0x80,   1,0x80

	.include "data/text/credits.inc"

gUnknown_0840CA00:: @ 840CA00
	.byte 104, 36
	.byte 120, 36
	.byte 136, 36

	.align 2
gSpriteAnim_840CA08:
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 64, 8
	obj_image_anim_frame 128, 8
	obj_image_anim_frame 192, 8
	obj_image_anim_jump 0

gSpriteAnim_840CA1C:
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 128, 4
	obj_image_anim_frame 192, 4
	obj_image_anim_jump 0

gSpriteAnim_840CA30:
	obj_image_anim_frame 256, 4
	obj_image_anim_frame 320, 4
	obj_image_anim_frame 384, 4
	obj_image_anim_end

gSpriteAnim_840CA40:
	obj_image_anim_frame 384, 30
	obj_image_anim_frame 320, 30
	obj_image_anim_frame 256, 30
	obj_image_anim_frame 256, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_0840CA54:: @ 840CA54
	.4byte gSpriteAnim_840CA08
	.4byte gSpriteAnim_840CA1C
	.4byte gSpriteAnim_840CA30
	.4byte gSpriteAnim_840CA40


gSpriteAnim_840CA64:
	obj_image_anim_frame 0, 8
	obj_image_anim_frame 64, 8
	obj_image_anim_frame 128, 8
	obj_image_anim_frame 192, 8
	obj_image_anim_jump 0

gSpriteAnim_840CA78:
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 128, 4
	obj_image_anim_frame 192, 4
	obj_image_anim_jump 0

gSpriteAnim_840CA8C:
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_0840CA94:: @ 840CA94
	.4byte gSpriteAnim_840CA64
	.4byte gSpriteAnim_840CA78
	.4byte gSpriteAnim_840CA8C


gUnknown_0840CAA0:: @ 840CAA0
	obj_tiles gHallOfFame, 6144, 1001
	null_obj_tiles

gUnknown_0840CAB0:: @ 840CAB0
	obj_pal unk_201f800, 1001
	null_obj_pal

	.align 2
gOamData_840CAC0:: @ 840CAC0
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_840CAC8:: @ 840CAC8
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840CAD0:: @ 840CAD0
	obj_image_anim_frame 64, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840CAD8:: @ 840CAD8
	obj_image_anim_frame 128, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840CAE0:: @ 840CAE0
	.4byte gSpriteAnim_840CAC8
	.4byte gSpriteAnim_840CAD0
	.4byte gSpriteAnim_840CAD8

	.align 2
gSpriteTemplate_840CAEC:: @ 840CAEC
	spr_template 1001, 1001, gOamData_840CAC0, gSpriteAnimTable_840CAE0, NULL, gDummySpriteAffineAnimTable, spritecb_814580C
