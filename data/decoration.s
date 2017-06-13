	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083ECA5C:: @ 83ECA5C
	obj_pal gUnknown_083EC98C, 0x0008

	.align 2
gUnknown_083ECA64:: @ 83ECA64
	obj_pal Unknown_3EC9AC, 0x0008

	.align 2
gOamData_83ECA6C:: @ 83ECA6C
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_83ECA74:: @ 83ECA74
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83ECA7C:: @ 83ECA7C
	.4byte gSpriteAnim_83ECA74

	.align 2
gSpriteImageTable_83ECA80:: @ 83ECA80
	obj_frame_tiles gSpriteImage_83EC9DC, 0x80

	.align 2
gSpriteTemplate_83ECA88:: @ 83ECA88
	spr_template 0xFFFF, 8, gOamData_83ECA6C, gSpriteAnimTable_83ECA7C, gSpriteImageTable_83ECA80, gDummySpriteAffineAnimTable, sub_8101698

	.align 2
gUnknown_083ECAA0:: @ 83ECAA0
	.4byte sub_8101848
	.4byte sub_80FED3C

@ XXX: what is this?
	.align 2
	.4byte 0x2000000
