	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 83C9150
	.string "テストです$" @ "test"

gMatsudaDebugMenu_ActionContestText:
	.string "Contest$"

gMatsudaDebugMenu_ActionContestResultsText:
	.string "Contest results$"
	.string "パラメータへんこう$" @ "Change parameter"
	.string "わざ へんこう$" @ "Change move"

gMatsudaDebugMenu_ActionContestCommText:
	.string "Contest (comm.)$"

gMatsudaDebugMenu_ActionCommTestText:
	.string "Init comm. data$"

gMatsudaDebugMenu_ActionSetHighScoreText:
	.string "Set highest score$"

gMatsudaDebugMenu_ActionResetHighScoreText:
	.string "Reset highest score$"

gMatsudaDebugMenu_ActionSetAllArtMuseumText:
	.string "Set all art museum items$"

	.align 2
gMatsudaDebugMenuActions:: @ 83C91F0
	.4byte gMatsudaDebugMenu_ActionContestText, MatsudaDebugMenu_Contest
	.4byte gMatsudaDebugMenu_ActionContestResultsText, MatsudaDebugMenu_ContestResults
	.4byte gMatsudaDebugMenu_ActionContestCommText, MatsudaDebugMenu_ContestComm
	.4byte gMatsudaDebugMenu_ActionCommTestText, MatsudaDebugMenu_CommTest
	.4byte gMatsudaDebugMenu_ActionSetHighScoreText, MatsudaDebugMenu_SetHighScore
	.4byte gMatsudaDebugMenu_ActionResetHighScoreText, MatsudaDebugMenu_ResetHighScore
	.4byte gMatsudaDebugMenu_ActionSetAllArtMuseumText, MatsudaDebugMenu_SetArtMuseumItems

gMatsudaDebugMenu_UnknownByteArray:: @ 83C9228
	.byte 0xFC, 0x02, 0x0F, 0x00, 0xFF

Unknown_083C922D:
	.incbin "graphics/unknown/ball.4bpp"

	.align 1
Unknown_083C924E:
	.incbin "graphics/unknown/ball.gbapal"

gUnknown_083C926E:: @ 83C926E
	.byte   2,  0
	.byte  17,  0
	.byte   2,  2
	.byte  17,  2

gMatsudaDebugMenuContestTopLeft:: @ 83C9276
	.byte 0, 6
	.byte 15, 6
	.byte 0, 8
	.byte 15, 8
	.byte 0, 10
	.byte 15, 10

gUnknown_083C9282:: @ 83C9282
	.byte   7,  6
	.byte  22,  6
	.byte   7,  8
	.byte  22,  8
	.byte   7, 10
	.byte  22, 10

gUnknown_083C928E:: @ 83C928E
	.byte   2, 14
	.byte  17, 14
	.byte   2, 16
	.byte  17, 16

gUnknown_083C9296:: @ 83C9296
	.byte 0x08, 0x80, 0x08, 0x80, 0x10, 0x10, 0x30, 0xA8, 0x30, 0xA8, 0x30, 0xA8, 0x08, 0x80, 0x08, 0x80, 0x10, 0x88

gUnknown_083C92A8:: @ 83C92A8
	.byte 0x08, 0x18, 0x28, 0x38, 0x48, 0x58, 0x78, 0x88, 0x98

	.align 2
gUnknown_083C92B4:: @ 83C92B4
	obj_tiles Unknown_083C922D, 32, 0x04b0

	.align 2
gUnknown_083C92BC:: @ 83C92BC
	obj_pal Unknown_083C924E, 0x04B0

	.align 2
gOamData_83C92C4:: @ 83C92C4
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteTemplate_83C92CC:: @ 83C92CC
	spr_template 1200, 1200, gOamData_83C92C4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80AA754

	.align 2
gUnknown_083C92E4:: @ 83C92E4
	.4byte sub_80AA8C8
	.4byte sub_80AA8D8
	.4byte sub_80AA8E8
	.4byte sub_80AA8F8
	.4byte sub_80AAC5C
	.4byte sub_80AAC5C
	.4byte sub_80AA930
	.4byte sub_80AA974
	.4byte sub_80AA9B8
	.4byte sub_80AA9FC
	.4byte sub_80AAA40
	.4byte sub_80AAA84
	.4byte sub_80AAAF0
	.4byte sub_80AAB30
	.4byte sub_80AAB70
	.4byte sub_80AABB0
	.4byte sub_80AABF0
	.4byte sub_80AAD44

gMatsudaDebugMenu_StartText:: @ 83C932C
	.string "{COLOR CYAN}{HIGHLIGHT RED}$"
	.string "かいし$" @ Start

gMatsudaDebugMenu_GoBackText:: @ 83C9337
	.string "もどる$" @ Go Back

gMatsudaDebugMenu_BattlePointsText:: @ 83C933B
	.string "{COLOR MAGENTA}BP,$"

MatsudaDebugMenuText_Cool:
	.string "かっこよさ$" @ coolness
MatsudaDebugMenuText_Cute:
	.string "かわいさ$" @ cuteness
MatsudaDebugMenuText_Beauty:
	.string "うつくしさ$" @ beauty
MatsudaDebugMenuText_Smart:
	.string "かしこさ$" @ smartness
MatsudaDebugMenuText_Tough:
	.string "たくましさ$" @ toughness
MatsudaDebugMenuText_Sheen:
	.string "けづや$" @ sheen

	.align 2
gMatsudaDebugMenuTextList1:: @ 83C9364
	.4byte MatsudaDebugMenuText_Cool
	.4byte MatsudaDebugMenuText_Cute
	.4byte MatsudaDebugMenuText_Beauty
	.4byte MatsudaDebugMenuText_Smart
	.4byte MatsudaDebugMenuText_Tough
	.4byte MatsudaDebugMenuText_Sheen

MatsudaDebugMenuText_CoolContest:
	.string "かっこよさコンテスト$" @ Cool Contest
MatsudaDebugMenuText_BeautyContest:
	.string "うつくしさコンテスト$" @ Beauty Contest
MatsudaDebugMenuText_CuteContest:
	.string "かわいさコンテスト　$" @ Cute Contest
MatsudaDebugMenuText_SmartContest:
	.string "かしこさコンテスト　$" @ Smart Contest
MatsudaDebugMenuText_ToughContest:
	.string "たくましさコンテスト$" @ Tough Contest

	.align 2
gMatsudaDebugMenuTextList2:: @ 83C93B4
	.4byte MatsudaDebugMenuText_CoolContest
	.4byte MatsudaDebugMenuText_BeautyContest
	.4byte MatsudaDebugMenuText_CuteContest
	.4byte MatsudaDebugMenuText_SmartContest
	.4byte MatsudaDebugMenuText_ToughContest

MatsudaDebugMenuText_Fallarbor:
	.string "ハジツゲ/ノーマル$" @ Fallarbor / Normal
MatsudaDebugMenuText_Verdanturf:
	.string "シダケ/スーパー　$" @ Verdanturf / Super
MatsudaDebugMenuText_Slateport:
	.string "カイナ/ハイパー　$" @ Slateport / Hyper
MatsudaDebugMenuText_Lilycove:
	.string "ミナモ/マスター　$" @ Lilycove / Master

	.align 2
gMatsudaDebugMenuTextList3:: @ 83C93F0
	.4byte MatsudaDebugMenuText_Fallarbor @ Normal
	.4byte MatsudaDebugMenuText_Verdanturf @ Super
	.4byte MatsudaDebugMenuText_Slateport @ Hyper
	.4byte MatsudaDebugMenuText_Lilycove @ Master

@ OamData
	.align 2
gUnknown_083C9400:: @ 83C9400
	.2byte 0x4000
	.2byte 0x4000
	.2byte 0xF3FF
