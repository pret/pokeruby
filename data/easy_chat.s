	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gMysteryEventPhrase:: @ 83DB678
	ec_word MYSTERY
	ec_word EVENT
	ec_word IS
	ec_word EXCITING

	.align 1
gBerryMasterWifePhrases:: @ 83DB680
	ec_word GREAT
	ec_word BATTLE

	ec_word CHALLENGE
	ec_word CONTEST

	ec_word OVERWHELMING
	ec_pokemon1 LATIAS

	ec_word COOL
	ec_pokemon1 LATIOS

	ec_word SUPER
	ec_word HUSTLE

gUnknown_083DB694:: @ 83DB694
	.4byte 0x02001000

gUnknown_083DB698:: @ 83DB698
	.incbin "baserom.gba", 0x003db698, 0xc

gUnknown_083DB6A4:: @ 83DB6A4
	.incbin "baserom.gba", 0x003db6a4, 0xe

gUnknown_083DB6B2:: @ 83DB6B2
	.incbin "baserom.gba", 0x003db6b2, 0x42

	.align 2
gUnknown_083DB6F4:: @ 83DB6F4
	.4byte OtherText_MakeProfilePage1, OtherText_MakeProfilePage2, 0x1
	.4byte OtherText_MakeMessagePage1, OtherText_MakeMessagePage2, 0x1
	.4byte OtherText_CombineNinePhrasesPage1, OtherText_CombineNinePhrasesPage2, 0x1
	.4byte OtherText_DescribeFeelingsPage1, OtherText_DescribeFeelingsPage2, 0x1
	.4byte OtherText_ImproveBardSongPage1, OtherText_ImproveBardSongPage2, 0x1
	.4byte OtherText_CombineTwoPhrasesPage1, OtherText_CombineTwoPhrasesPage2, 0x1
	.4byte OtherText_YourProfile, OtherText_ConfirmTrendyPage2, 0x0
	.4byte OtherText_YourFeelingBattle, OtherText_ConfirmTrendyPage2, 0x1
	.4byte OtherText_SetWinMessage, OtherText_ConfirmTrendyPage2, 0x1
	.4byte OtherText_SetLossMessage, OtherText_ConfirmTrendyPage2, 0x1
	.4byte OtherText_MailMessage, OtherText_ConfirmTrendyPage2, 0x1
	.4byte OtherText_MailSalutation, OtherText_ConfirmTrendyPage2, 0x1
	.4byte OtherText_NewSong, OtherText_ConfirmTrendyPage2, 0x0
	.4byte OtherText_TheAnswer, OtherText_ConfirmTrendyPage2, 0x0
	.4byte OtherText_ConfirmTrendyPage1, OtherText_ConfirmTrendyPage2, 0x1
	.4byte OtherText_HipsterPage1, OtherText_HipsterPage2, 0x1
	.4byte OtherText_WithFourPhrases, OtherText_CombineNinePhrasesPage2, 0x1

gUnknown_083DB7C0:: @ 83DB7C0
	.incbin "baserom.gba", 0x003db7c0, 0x1c

	.align 2
gUnknown_083DB7DC:: @ 83DB7DC
	.4byte 0x0200ac80
	.4byte 0x0200acc9
	.4byte 0x0200ad12
	.4byte 0x0200ad5b

gUnknown_083DB7EC:: @ 83DB7EC
	.incbin "baserom.gba", 0x003db7ec, 0x8

gUnknown_083DB7F4:: @ 83DB7F4
	.incbin "baserom.gba", 0x3db7f4, 0xc

	.align 2
InterviewPalette_0:: @ 83DB800
	.incbin "graphics/misc/interview_pal0.gbapal"

	.align 2
InterviewPalette_1:: @ 83DB820
	.incbin "graphics/misc/interview_pal1.gbapal"

	.align 2
InterviewArrowTiles: @ 83DB840
	.incbin "graphics/misc/interview_arrow.4bpp"

	.align 2
InterviewButtonTiles: @ 83DB940
	.incbin "graphics/misc/interview_buttons.4bpp"

	.align 2
gMenuInterviewFrame_Pal::
	.incbin "graphics/misc/interview_frame.gbapal"

	.align 2
gMenuInterviewFrame_Gfx::
	.incbin "graphics/misc/interview_frame.4bpp.lz"

	.align 2
InterviewTriangleCursorTiles: @ 83DBB94
	.incbin "graphics/misc/interview_triangle_cursor.4bpp"

	.align 2
gSpriteSheets_Interview:: @ 83DBBB4
	obj_tiles InterviewTriangleCursorTiles, 0x20, 0
	obj_tiles gInterviewOutlineCursorTiles, 0x700, 1
	obj_tiles InterviewArrowTiles, 0x100, 2
	obj_tiles InterviewButtonTiles, 0x100, 3
	null_obj_tiles

	.align 2
gSpritePalettes_Interview:: @ 83DBBDC
	obj_pal InterviewPalette_0, 0
	obj_pal InterviewPalette_1, 1
	null_obj_pal

	.align 2
gOamData_83DBBF4:: @ 83DBBF4
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteTemplate_83DBBFC:: @ 83DBBFC
	spr_template 0, 0, gOamData_83DBBF4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80E82BC

	.align 2
gOamData_83DBC14:: @ 83DBC14
	.2byte 0x4400
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_83DBC1C:: @ 83DBC1C
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC24:: @ 83DBC24
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC2C:: @ 83DBC2C
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC34:: @ 83DBC34
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC3C:: @ 83DBC3C
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC44:: @ 83DBC44
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC4C:: @ 83DBC4C
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC54:: @ 83DBC54
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC5C:: @ 83DBC5C
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC64:: @ 83DBC64
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC6C:: @ 83DBC6C
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBC74:: @ 83DBC74
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DBC7C:: @ 83DBC7C
	.4byte gSpriteAnim_83DBC1C
	.4byte gSpriteAnim_83DBC24
	.4byte gSpriteAnim_83DBC2C
	.4byte gSpriteAnim_83DBC34

	.align 2
gSpriteAnimTable_83DBC8C:: @ 83DBC8C
	.4byte gSpriteAnim_83DBC3C
	.4byte gSpriteAnim_83DBC44
	.4byte gSpriteAnim_83DBC4C
	.4byte gSpriteAnim_83DBC54

	.align 2
gSpriteAnimTable_83DBC9C:: @ 83DBC9C
	.4byte gSpriteAnim_83DBC5C
	.4byte gSpriteAnim_83DBC64
	.4byte gSpriteAnim_83DBC6C
	.4byte gSpriteAnim_83DBC74

	.align 2
gSpriteTemplate_83DBCAC:: @ 83DBCAC
	spr_template 1, 1, gOamData_83DBC14, gSpriteAnimTable_83DBC7C, NULL, gDummySpriteAffineAnimTable, sub_80E85F8

	.align 2
gUnknown_083DBCC4:: @ 83DBCC4
	.incbin "baserom.gba", 0x003dbcc4, 0x1c

	.align 2
gOamData_83DBCE0:: @ 83DBCE0
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_83DBCE8:: @ 83DBCE8
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBCF0:: @ 83DBCF0
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DBCF8:: @ 83DBCF8
	.4byte gSpriteAnim_83DBCE8
	.4byte gSpriteAnim_83DBCF0

Unknown_83DBD00:
	.incbin "baserom.gba", 0x003dbd00, 0x8
Unknown_83DBD08:
	.incbin "baserom.gba", 0x003dbd08, 0x8

gUnknown_083DBD10:: @ 83DBD10
	.4byte Unknown_83DBD00
	.4byte Unknown_83DBD08

	.align 2
gSpriteTemplate_83DBD18:: @ 83DBD18
	spr_template 2, 0, gOamData_83DBCE0, gSpriteAnimTable_83DBCF8, NULL, gDummySpriteAffineAnimTable, sub_80E8B78

	.align 2
gUnknown_083DBD30:: @ 83DBD30
	obj_tiles gMenuInterviewFrame_Gfx, 2048, 0x0006

	.align 2
gUnknown_083DBD38:: @ 83DBD38
	obj_pal gMenuInterviewFrame_Pal, 0x0004

	.align 2
gOamData_83DBD40:: @ 83DBD40
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteTemplate_83DBD48:: @ 83DBD48
	spr_template 6, 4, gOamData_83DBD40, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_083DBD60:: @ 83DBD60
	obj_tiles gMenuWordGroupIndicator_Gfx, 4096, 0x0007

	.align 2
gUnknown_083DBD68:: @ 83DBD68
	obj_pal gMenuWordGroupIndicator_Pal, 0x0005

	.align 2
gOamData_83DBD70:: @ 83DBD70
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteAnim_83DBD78:: @ 83DBD78
	obj_image_anim_frame 96, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBD80:: @ 83DBD80
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 96, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBD94:: @ 83DBD94
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 96, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBDA8:: @ 83DBDA8
	obj_image_anim_frame 64, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBDB4:: @ 83DBDB4
	obj_image_anim_frame 64, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBDC0:: @ 83DBDC0
	obj_image_anim_frame 64, 2
	obj_image_anim_frame 96, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DBDCC:: @ 83DBDCC
	.4byte gSpriteAnim_83DBD78
	.4byte gSpriteAnim_83DBD80
	.4byte gSpriteAnim_83DBD94
	.4byte gSpriteAnim_83DBDA8
	.4byte gSpriteAnim_83DBDB4
	.4byte gSpriteAnim_83DBDC0

	.align 2
gSpriteTemplate_83DBDE4:: @ 83DBDE4
	spr_template 7, 5, gOamData_83DBD70, gSpriteAnimTable_83DBDCC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_083DBDFC:: @ 83DBDFC
	.incbin "graphics/unknown/unknown_3DBDFC.gbapal"

gUnknown_083DBE1C:: @ 83DBE1C
	.incbin "baserom.gba", 0x003dbe1c, 0x24

gUnknown_083DBE40:: @ 83DBE40
	.incbin "graphics/unknown/unknown_3DBE40.gbapal"

	.incbin "baserom.gba", 0x003dbe60, 0x48

gUnknown_083DBEA8:: @ 83DBEA8
	.string "{CLEAR_TO 88}$"

	.align 2
gUnknown_083DBEAC:: @ 83DBEAC
	.string "{UNKNOWN_14 8} A B C  D E F  {UNKNOWN_14 0}others$", 0x20
	.string "{UNKNOWN_14 8} G H I  J K L      $", 0x20
	.string "{UNKNOWN_14 8} M N O  P Q R S    $", 0x20
	.string "{UNKNOWN_14 8} T U V  W X Y Z    $", 0x20

@ 83DBF2C
	.include "data/text/easy_chat/group_words.inc"

@ 83DE138
	.include "data/text/easy_chat/words_by_letter.inc"

@ 83DEFFA
	.include "data/text/easy_chat/group_sizes.inc"

@ 83DF010
	.include "data/text/easy_chat/group_orders.inc"

@ 83DFE6C
	.include "data/text/easy_chat/group_name_table.inc"
