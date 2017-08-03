	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_0840B514:: @ 840B514
	obj_tiles gContestConfetti_Gfx, 0x220, 1001
	.space 8

gUnknown_0840B524:: @ 840B524
	obj_pal gContestConfetti_Pal, 1001
	.space 8

	.align 2
gUnknown_0840B534:: @ 840B534
	.2byte 120,210,120, 40
	.2byte 326,220, 56, 40
	.2byte -86,220,184, 40
	.2byte 120,-62,120, 88
	.2byte -25,-62,200, 88
	.2byte 265,-62, 40, 88

	.align 2
gUnknown_0840B564:: @ 840B564
	.2byte 120,214,120, 64
	.2byte 281,214, 56, 64
	.2byte -41,214,184, 64

	.align 2
sDummyFameMon:: @ 840B57C
	.2byte 1002
	.2byte 1002
	.space 0x10

@ unused data?
	.byte 2, 1, 3, 6, 4, 5

	.align 2
gOamData_840B598:: @ 840B598
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gUnknown_0840B5A0:: @ 840B5A0
	.4byte 0x02008000
	.4byte 0x0200A000
	.4byte 0x0200C000
	.4byte 0x0200E000
	.4byte 0x02010000
	.4byte 0x02014000
	.4byte 0x02018000

	.align 2
gSpriteImageTable_840B5BC:: @ 840B5BC
	obj_frame_tiles 0x02008000, 0x800
	obj_frame_tiles 0x02008800, 0x800
	obj_frame_tiles 0x02009000, 0x800
	obj_frame_tiles 0x02009800, 0x800

	.align 2
gSpriteImageTable_840B5DC:: @ 840B5DC
	obj_frame_tiles 0x0200A000, 0x800
	obj_frame_tiles 0x0200A800, 0x800
	obj_frame_tiles 0x0200B000, 0x800
	obj_frame_tiles 0x0200B800, 0x800

	.align 2
gSpriteImageTable_840B5FC:: @ 840B5FC
	obj_frame_tiles 0x0200C000, 0x800
	obj_frame_tiles 0x0200C800, 0x800
	obj_frame_tiles 0x0200D000, 0x800
	obj_frame_tiles 0x0200D800, 0x800

	.align 2
gSpriteImageTable_840B61C:: @ 840B61C
	obj_frame_tiles 0x0200E000, 0x800
	obj_frame_tiles 0x0200E800, 0x800
	obj_frame_tiles 0x0200F000, 0x800
	obj_frame_tiles 0x0200F800, 0x800

	.align 2
gSpriteImageTable_840B63C:: @ 840B63C
	obj_frame_tiles 0x02010000, 0x800
	obj_frame_tiles 0x02010800, 0x800
	obj_frame_tiles 0x02011000, 0x800
	obj_frame_tiles 0x02011800, 0x800

	.align 2
gSpriteImageTable_840B65C:: @ 840B65C
	obj_frame_tiles 0x02014000, 0x800
	obj_frame_tiles 0x02014800, 0x800
	obj_frame_tiles 0x02015000, 0x800
	obj_frame_tiles 0x02015800, 0x800

	.align 2
gSpriteImageTable_840B67C:: @ 840B67C
	obj_frame_tiles 0x02018000, 0x800
	obj_frame_tiles 0x02018800, 0x800
	obj_frame_tiles 0x02019000, 0x800
	obj_frame_tiles 0x02019800, 0x800

	.align 2
gUnknown_0840B69C:: @ 840B69C
	.4byte gSpriteImageTable_840B5BC
	.4byte gSpriteImageTable_840B5DC
	.4byte gSpriteImageTable_840B5FC
	.4byte gSpriteImageTable_840B61C
	.4byte gSpriteImageTable_840B63C
	.4byte gSpriteImageTable_840B65C
	.4byte gSpriteImageTable_840B67C

gUnknown_0840B6B8:: @ 840B6B8
	spr_template -1, -1, gOamData_840B598, NULL, gSpriteImageTable_840B5BC, gDummySpriteAffineAnimTable, SpriteCB_HallOfFame_Dummy

	.align 2
gOamData_840B6D0:: @ 840B6D0
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteAnim_840B6D8:: @ 840B6D8
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B6E0:: @ 840B6E0
	obj_image_anim_frame 1, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B6E8:: @ 840B6E8
	obj_image_anim_frame 2, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B6F0:: @ 840B6F0
	obj_image_anim_frame 3, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B6F8:: @ 840B6F8
	obj_image_anim_frame 4, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B700:: @ 840B700
	obj_image_anim_frame 5, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B708:: @ 840B708
	obj_image_anim_frame 6, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B710:: @ 840B710
	obj_image_anim_frame 7, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B718:: @ 840B718
	obj_image_anim_frame 8, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B720:: @ 840B720
	obj_image_anim_frame 9, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B728:: @ 840B728
	obj_image_anim_frame 10, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B730:: @ 840B730
	obj_image_anim_frame 11, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B738:: @ 840B738
	obj_image_anim_frame 12, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B740:: @ 840B740
	obj_image_anim_frame 13, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B748:: @ 840B748
	obj_image_anim_frame 14, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B750:: @ 840B750
	obj_image_anim_frame 15, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_840B758:: @ 840B758
	obj_image_anim_frame 16, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B760:: @ 840B760
	.4byte gSpriteAnim_840B6D8
	.4byte gSpriteAnim_840B6E0
	.4byte gSpriteAnim_840B6E8
	.4byte gSpriteAnim_840B6F0
	.4byte gSpriteAnim_840B6F8
	.4byte gSpriteAnim_840B700
	.4byte gSpriteAnim_840B708
	.4byte gSpriteAnim_840B710
	.4byte gSpriteAnim_840B718
	.4byte gSpriteAnim_840B720
	.4byte gSpriteAnim_840B728
	.4byte gSpriteAnim_840B730
	.4byte gSpriteAnim_840B738
	.4byte gSpriteAnim_840B740
	.4byte gSpriteAnim_840B748
	.4byte gSpriteAnim_840B750
	.4byte gSpriteAnim_840B758

	.align 2
gSpriteTemplate_840B7A4:: @ 840B7A4
	spr_template 1001, 1001, gOamData_840B6D0, gSpriteAnimTable_840B760, NULL, gDummySpriteAffineAnimTable, sub_814386C
