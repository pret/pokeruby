	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteAnimTable_83EC930:: @ 83EC930
	.4byte gSpriteAnim_83EC928

	.align 2
gSpriteImageTable_83EC934: @ 83EC934
	obj_frame_tiles gUnknown_02038900+0x84, 0x800

	.align 2
gSpriteTemplate_83EC93C:: @ 83EC93C
	spr_template 0xFFFF, 3000, 0x20391AC, gSpriteAnimTable_83EC930, gSpriteImageTable_83EC934, gDummySpriteAffineAnimTable, sub_81009A8

	.align 2
gUnknown_083EC954:: @ 83EC954
	obj_pal gUnknown_02038900+0x884, 3000

	.align 2
gUnknown_083EC95C:: @ 83EC95C
	.4byte sub_81000C4
	.4byte sub_810065C

	.align 2
gUnknown_083EC964:: @ 83EC964
	.4byte sub_810026C
	.4byte sub_810065C

	.align 2
gUnknown_083EC96C:: @ 83EC96C
	.4byte sub_80FFAB0
	.4byte sub_80FFB08
	.4byte sub_8100F88
	.4byte sub_8100FB4

gUnknown_083EC97C:: @ 83EC97C
	.byte 4, 4, 4, 4, 0, 3, 3, 0

gUnknown_083EC984:: @ 83EC984
	.byte 4, 4, 4, 4, 0, 4, 3, 0

	.align 2
gUnknown_083EC98C::
	.incbin "graphics/unknown/83EC98C.gbapal"

	.align 2
Unknown_3EC9AC: @ 83EC9AC
	.incbin "graphics/unknown/83EC9AC.gbapal"

	.align 2
gUnknown_083EC9CC:: @ 83EC9CC
	.4byte sub_810153C
	.4byte sub_8100EEC

	.align 2
gUnknown_083EC9D4:: @ 83EC9D4
	.4byte sub_8101590
	.4byte sub_8100EEC

	.align 2
gSpriteImage_83EC9DC:: @ 83EC9DC
	.incbin "graphics/unknown_sprites/83EC9DC.4bpp"

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
