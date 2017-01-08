	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 83E9FD0
	.include "data/decorations.inc"

	.align 2
gUnknown_083EC5E4:: @ 83EC5E4
	.4byte SecretBaseText_Desk
	.4byte SecretBaseText_Chair
	.4byte SecretBaseText_Plant
	.4byte SecretBaseText_Ornament
	.4byte SecretBaseText_Mat
	.4byte SecretBaseText_Poster
	.4byte SecretBaseText_Doll
	.4byte SecretBaseText_Cushion

	.align 2
gUnknown_083EC604:: @ 83EC604
	.4byte SecretBaseText_Decorate, sub_80FF160
	.4byte SecretBaseText_PutAway, sub_8100A0C
	.4byte SecretBaseText_Toss, sub_8101700
	.4byte gUnknownText_Exit, gpu_pal_decompress_alloc_tag_and_upload

	.align 2
gUnknown_083EC624:: @ 83EC624
	.4byte SecretBaseText_PutOutDecor
	.4byte SecretBaseText_StoreChosenDecor
	.4byte SecretBaseText_ThrowAwayDecor
	.4byte gMenuText_GoBackToPrev

	.align 2
gUnknown_083EC634:: @ 83EC634
	.4byte sub_80FF5BC
	.4byte sub_80FF058
	.4byte sub_81017A0
	.4byte sub_80FF058
	.4byte sub_81017A0
	.4byte sub_80FF058
	.4byte sub_8109D04
	.4byte sub_80FF058

	.align 2
gUnknown_083EC654:: @ 83EC654
	.2byte 0x6318, 0x739C, 0x7FFF

gUnknown_083EC65A:: @ 83EC65A
	.string "{PALETTE 13}{STR_VAR_1}$"

Unknown_3EC660: @ 83EC660
	.byte 0, 1, 2, 3

Unknown_3EC664: @ 83EC664
	.byte 0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13

Unknown_3EC670: @ 83EC670
	.byte 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

Unknown_3EC680: @ 83EC680
	.byte 0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21

Unknown_3EC68C: @ 83EC68C
	.byte 0, 1, 2, 3, 4, 5, 6, 7

Unknown_3EC694: @ 83EC694
	.byte 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31

Unknown_3EC6B4: @ 83EC6B4
	.byte 0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 24, 25, 26, 27, 28, 29, 32, 33, 34, 35, 36, 37, 40, 41, 42, 43, 44, 45

Unknown_3EC6D8: @ 83EC6D8
	.byte 0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 24, 25, 26, 27, 28, 29

Unknown_3EC6F0: @ 83EC6F0
	.byte 0, 0, 0, 0

Unknown_3EC6F4: @ 83EC6F4
	.byte 0, 0, 1, 1, 0, 0, 1, 1

Unknown_3EC6FC: @ 83EC6FC
	.byte 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2

Unknown_3EC708: @ 83EC708
	.byte 0, 0, 1, 1, 2, 2, 3, 3, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 4, 4, 5, 5, 6, 6, 7, 7

Unknown_3EC728: @ 83EC728
	.byte 0, 0, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 2, 2, 3, 3

Unknown_3EC738: @ 83EC738
	.byte 0, 0, 0, 0, 1, 1, 1, 1

Unknown_3EC740: @ 83EC740
	.byte 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2

Unknown_3EC74C: @ 83EC74C
	.byte 0, 0, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 4, 4, 5, 5, 4, 4, 5, 5, 6, 6, 7, 7, 6, 6, 7, 7

Unknown_3EC76C: @ 83EC76C
	.byte 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 6, 6, 7, 7, 8, 8

Unknown_3EC790: @ 83EC790
	.byte 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 4, 4, 5, 5

Unknown_3EC7A8: @ 83EC7A8
	.byte 4, 5, 6, 7

Unknown_3EC7AC: @ 83EC7AC
	.byte 4, 5, 4, 5, 6, 7, 6, 7

Unknown_3EC7B4: @ 83EC7B4
	.byte 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7

Unknown_3EC7C0: @ 83EC7C0
	.byte 4, 5, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 6, 7

Unknown_3EC7E0: @ 83EC7E0
	.byte 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7

Unknown_3EC7F0: @ 83EC7F0
	.byte 4, 5, 6, 7, 4, 5, 6, 7

Unknown_3EC7F8: @ 83EC7F8
	.byte 4, 5, 6, 7, 4, 5, 6, 7, 4, 5, 6, 7

Unknown_3EC804: @ 83EC804
	.byte 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7

Unknown_3EC824: @ 83EC824
	.byte 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7

Unknown_3EC848: @ 83EC848
	.byte 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7

	.align 2
gUnknown_083EC860:: @ 83EC860
	.4byte Unknown_3EC660, Unknown_3EC6F0, Unknown_3EC7A8, 0x4
	.4byte Unknown_3EC68C, Unknown_3EC6F4, Unknown_3EC7AC, 0x8
	.4byte Unknown_3EC664, Unknown_3EC6FC, Unknown_3EC7B4, 0xc
	.4byte Unknown_3EC694, Unknown_3EC708, Unknown_3EC7C0, 0x20
	.4byte Unknown_3EC670, Unknown_3EC728, Unknown_3EC7E0, 0x10
	.4byte Unknown_3EC68C, Unknown_3EC738, Unknown_3EC7F0, 0x8
	.4byte Unknown_3EC680, Unknown_3EC740, Unknown_3EC7F8, 0xc
	.4byte Unknown_3EC694, Unknown_3EC74C, Unknown_3EC804, 0x20
	.4byte Unknown_3EC6B4, Unknown_3EC76C, Unknown_3EC824, 0x24
	.4byte Unknown_3EC6D8, Unknown_3EC790, Unknown_3EC848, 0x18

gUnknown_083EC900:: @ 83EC900
	.byte 0, 1,  120, 78
	.byte 1, 2, -128, 78
	.byte 1, 3, -112, 86
	.byte 1, 3, -112, 70
	.byte 0, 2, -128, 70
	.byte 2, 2,  120, 70
	.byte 2, 3, -128, 86
	.byte 2, 3, -128, 54
	.byte 0, 3, -112, 70
	.byte 1, 3, -112, 70

	.align 2
gSpriteAnim_83EC928:: @ 83EC928
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83EC930:: @ 83EC930
	.4byte gSpriteAnim_83EC928

	.align 2
gSpriteImageTable_83EC934: @ 83EC934
	obj_frame_tiles 0x02038984, 0x800

	.align 2
gSpriteTemplate_83EC93C:: @ 83EC93C
	spr_template 0xFFFF, 3000, 0x20391AC, gSpriteAnimTable_83EC930, gSpriteImageTable_83EC934, gDummySpriteAffineAnimTable, sub_81009A8

	.align 2
gUnknown_083EC954:: @ 83EC954
	obj_pal 0x02039184, 3000

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
