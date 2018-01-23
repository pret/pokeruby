	.if DEBUG

#include "constants/moves.h"
	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

Str_839B740: @ 0x839B740
	.string "·WATANABE$"

Str_839B74A: @ 0x839B74A
	.string "SOGABE$"

Str_839B751: @ 0x839B751
	.string "·TAMADA$"

Str_839B759: @ 0x839B759
	.string "KAGAYA$"

Str_839B760: @ 0x839B760
	.string "MATUDA$"

Str_839B767: @ 0x839B767
	.string "NOHARA$"

Str_839B76E: @ 0x839B76E
	.string "NAKAMURA$"

Str_839B777: @ 0x839B777
	.string "EXIT$"

Str_839B77C: @ 0x839B77C
	.string "Teleport$"

Str_839B785: @ 0x839B785
	.string "Switch BG$"

Str_839B78F: @ 0x839B78F
	.string "Edit your {PKMN}$"

Str_839B79C: @ 0x839B79C
	.string "MORI$"

Str_839B7A1: @ 0x839B7A1
	.string "TOMOMITI$"

Str_839B7AA: @ 0x839B7AA
	.string "·AOKI$"

Str_839B7B0: @ 0x839B7B0
	.string "TAYA$"

Str_839B7B5: @ 0x839B7B5
	.string "Control Encounter$"

Str_839B7C7: @ 0x839B7C7
	.string "PTIME$"

Str_839B7CD: @ 0x839B7CD
	.string "Make items$"

Str_839B7D8: @ 0x839B7D8
	.string "Transport$"

Str_839B7E2: @ 0x839B7E2
	.string "See portraits$"

Str_839B7F0: @ 0x839B7F0
	.string "Time records$"

Str_839B7FD: @ 0x839B7FD
	.string "Set time$"

Str_839B806: @ 0x839B806
	.string "National オカDex$"

Str_839B815: @ 0x839B815
	.string "Hoenn オカDex$"

Str_839B821: @ 0x839B821
	.string "Create {PKMN}$"

Str_839B82B: @ 0x839B82B
	.string "See {PKMN} graphics$"

Str_839B83B: @ 0x839B83B
	.string "See trainers$"

Str_839B848: @ 0x839B848
	.string "Battle for debug$"

Str_839B859: @ 0x839B859
	.string "Full set of badges$"

Str_839B86C: @ 0x839B86C
	.string "Hoenn National Dex$"

Str_839B87F: @ 0x839B87F
	.string "Set Ram berry$"

Str_839B88D: @ 0x839B88D
	.string "Use HM$"

Str_839B894: @ 0x839B894
	.string "IWASAWA$"

Str_839B89C: @ 0x839B89C
	.string "BGM ON/OFF$"

Str_839B8A7: @ 0x839B8A7
	.string "Size comparison$"

Str_839B8B7: @ 0x839B8B7
	.string "Clear flag ON/OFF$"

Str_839B8C9: @ 0x839B8C9
	.string "Safari$"

Str_839B8D0: @ 0x839B8D0
	.string "Rematch trainers$"

Str_839B8E1: @ 0x839B8E1
	.string "Mirage island RND$"

Str_839B8F3: @ 0x839B8F3
	.string "Hall of fame$"

Str_839B900: @ 0x839B900
	.string "Mystery event$"

Str_839B90E: @ 0x839B90E
	.string "Legends records$"

Str_839B91E: @ 0x839B91E
	.string "Weather events$"

Str_839B92D: @ 0x839B92D
	.string "Cell info.$"

Str_839B938: @ 0x839B938
	.string "Check {POKEBLOCK}$"

Str_839B944: @ 0x839B944
	.string "Effort values$"

Str_839B952: @ 0x839B952
	.string "Berrie Info$"

Str_839B95E: @ 0x839B95E
	.string "Battle Tower stages$"

Str_839B972: @ 0x839B972
	.string "End sequence demo$"

Str_839B984: @ 0x839B984
	.string "Random number test$"

Str_839B997: @ 0x839B997
	.string "Me-too BackupMan$"

Str_839B9A8: @ 0x839B9A8
	.string "MURAKAWA$"

Str_839B9B1: @ 0x839B9B1
	.string "KINA(FONT)$"

	.align 2
gDebug0x839B9BC::
	.4byte Str_839B777, DebugMenu_Exit+1
	.4byte Str_839B740, DebugMenu_OpenWatanabe+1
	.4byte Str_839B74A, DebugMenu_OpenSogabe+1
	.4byte Str_839B751, DebugMenu_OpenTamada+1
	.4byte Str_839B759, DebugMenu_OpenKagaya+1
	.4byte Str_839B760, DebugMenu_OpenMatsuda+1
	.4byte Str_839B767, DebugMenu_OpenNohara+1
	.4byte Str_839B76E, DebugMenu_OpenNakamura+1
	.4byte Str_839B77C, DebugMenu_Teleport+1
	.4byte Str_839B78F, DebugMenu_EditPKMN+1
	.4byte Str_839B785, DebugMenu_SwitchBG+1
	.4byte Str_839B79C, DebugMenu_OpenMori+1
	.4byte Str_839B7A1, DebugMenu_OpenTomomichi+1
	.4byte Str_839B7AA, DebugMenu_OpenAoki+1
	.4byte Str_839B7B0, DebugMenu_OpenTaya+1
	.4byte Str_839B8B7, DebugMenu_ToggleClearFlag+1
	.4byte Str_839B7B5, DebugMenu_ControlEncounter+1
	.4byte Str_839B7C7, DebugMenu_PTime+1
	.4byte Str_839B7CD, DebugMenu_MakeItems+1
	.4byte Str_839B7D8, debug_sub_8091300+1
	.4byte Str_839B7E2, DebugMenu_ViewPortraits+1
	.4byte Str_839B7F0, DebugMenu_TimeRecords+1
	.4byte Str_839B7FD, DebugMenu_SetTime+1
	.4byte Str_839B806, DebugMenu_NationalDex+1
	.4byte Str_839B821, DebugMenu_CreatePKMN+1
	.4byte Str_839B82B, DebugMenu_ViewPokemonGraphics+1
	.4byte Str_839B848, DebugMenu_BattleForDebug+1
	.4byte Str_839B859, DebugMenu_AllBadges+1
	.4byte Str_839B86C, DebugMenu_HoennNationalDex+1
	.4byte Str_839B87F, DebugMenu_SetRamBerry+1
	.4byte Str_839B88D, DebugMenu_UseHM+1
	.4byte Str_839B894, DebugMenu_OpenIwasawa+1
	.4byte Str_839B89C, DebugMenu_ToggleBGM+1
	.4byte Str_839B8A7, DebugMenu_OpenSizeComparison+1
	.4byte Str_839B8C9, DebugMenu_Safari+1
	.4byte Str_839B8D0, DebugMenu_RematchTrainers+1
	.4byte Str_839B8E1, DebugMenu_MiragaIslandRND+1
	.4byte Str_839B8F3, DebugMenu_HallOfFame+1
	.4byte Str_839B900, DebugMenu_OpenMysteryEvent+1
	.4byte Str_839B90E, DebugMenu_OpenLegendsRecord+1
	.4byte Str_839B91E, DebugMenu_OpenWeatherEvents+1
	.4byte Str_839B92D, DebugMenu_CellInfo+1
	.4byte Str_839B938, DebugMenu_CheckPKBLCK+1
	.4byte Str_839B944, DebugMenu_EffortValues+1
	.4byte Str_839B815, DebugMenu_HoennDex+1
	.4byte Str_839B83B, DebugMenu_OpenSeeTrainers+1
	.4byte Str_839B952, DebugMenu_OpenBerryInfo+1
	.4byte Str_839B95E, DebugMenu_BattleTowerStages+1
	.4byte Str_839B972, DebugMenu_EndSequenceDemo+1
	.4byte Str_839B984, DebugMenu_RandomNumberTest+1
	.4byte Str_839B997, DebugMenu_MeTooBackupMan+1
	.4byte Str_839B9A8, DebugMenu_OpenMurakawa+1
	.4byte Str_839B9B1, DebugMenu_OpenKiwa+1

gUnknown_Debug_839BB64::
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x00, 0x0b, 0x0c, 0x0d, 0x0e, 0x1f, 0x12, 0x13, 0x00, 0x08, 0x09, 0x0a, 0x1e, 0x10, 0x24, 0x0f, 0x00, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x00
	.byte 0x1c, 0x1d, 0x14, 0x20, 0x21, 0x22, 0x23, 0x00, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x00, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x00, 0x11, 0x33, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00

gUnknown_Debug_0839BBA4:: @ 0x839BBA4
	.string "Debugging Version$"

gUnknown_Debug_0839BBB6:: @ 0x839BBB6
	.string "{VERSION} Version$"

gUnknown_Debug_0839BBC1:: @ 0x839BBC1
	.string "Normal RTC compatible$"

Str_839BBD7: @ 0x839BBD7
	.string "か　の　じっけん$"

Str_839BBE0: @ 0x839BBE0
	.string "じっけん2$"

Str_839BBE6: @ 0x839BBE6
	.string "BGじっけん$"

Str_839BBED: @ 0x839BBED
	.string "Battle$"

Str_839BBF4: @ 0x839BBF4
	.string "つうしん　じっけん$"

Str_839BBFE: @ 0x839BBFE
	.string "LINK Test2$"

Str_839BC09: @ 0x839BC09
	.string "フィールド　はじめる$"

Str_839BC14: @ 0x839BC14
	.string "フィールド　つづき$"

Str_839BC1E: @ 0x839BC1E
	.string "Sound test$"

Str_839BC29: @ 0x839BC29
	.string "{POKEBLOCK} test$"

Str_839BC34: @ 0x839BC34
	.string "Crash backup data$"

Str_839BC46: @ 0x839BC46
	.string "e-Card test$"

Str_839BC52: @ 0x839BC52
	.string "こうかんデモ　　　$"

Str_839BC5C: @ 0x839BC5C
	.string "Time in game$"

Str_839BC69: @ 0x839BC69
	.string "フェスタ　モード$"

Str_839BC72: @ 0x839BC72
	.string "Mimic e-Card$"

Str_839BC7F: @ 0x839BC7F
	.string "RTC reset$"

Str_839BC89: @ 0x839BC89
	.string "Converter$"

	.align 2
gUnknown_Debug_839BC94:: @ 0x839BC94
	.4byte Str_839BBD7, DebugMenu_8076CBC+1
	.4byte Str_839BBE0, DebugMenu_8076CC0+1
	.4byte Str_839BBE6, DebugMenu_8076CD4+1
	.4byte Str_839BBED, DebugMenu_8076C6C+1
	.4byte Str_839BC29, DebugMenu_8076CD8+1
	.4byte Str_839BBFE, DebugMenu_8076D28+1
	.4byte Str_839BC1E, DebugMenu_8076D3C+1
	.4byte Str_839BC09, DebugMenu_8076C80+1
	.4byte Str_839BC14, DebugMenu_8076C90+1
	.4byte Str_839BC34, DebugMenu_8076D50+1
	.4byte Str_839BC46, DebugMenu_8076CEC+1
	.4byte Str_839BC52, DebugMenu_8076D14+1
	.4byte Str_839BC72, DebugMenu_8076D00+1
	.4byte Str_839BC5C, DebugMenu_8076D5C+1
	.4byte Str_839BC7F, DebugMenu_8076E18+1
	.4byte Str_839BC89, DebugMenu_8076EDC+1

Str_839BD14:: @ 0x839BD14
	.string "うかえ$"

Str_839BD18:: @ 0x839BD18
	.string "　　　　　　おけこしすせそ$"

Str_839BD26:: @ 0x839BD26
	.string "　　い　　　"
Str_839BD2C::
	.string "RTCを　リセット　します\n"
	.string "Aで　じっこう　　　Bでキャンセル$"

Str_839BD4C:: @ 0x839BD4C
	.string "RTCを　リセット　した！$"

Str_839BD5A:: @ 0x839BD5A
	.string "セーブデータを　コンバートします\n"
	.string "Aで　けってい　　Bで　キャンセル$"

Str_839BD7D:: @ 0x839BD7D
	.string "へんかんが　しゅうりょう　しました！$"

Str_839BD90:: @ 0x839BD90
	.string "ジュンイチ$"

Str_839BD96:: @ 0x839BD96
	.string "ダイゴロウ$"

Str_839BD9C:: @ 0x839BD9C
	.string "テツジ$"

Str_839BDA0:: @ 0x839BDA0
	.string "バレンシア$"

Str_839BDA6:: @ 0x839BDA6
	.string "ハルコマチ$"

Str_839BDAC:: @ 0x839BDAC
	.string "RAYMOND$"

Str_839BDB4:: @ 0x839BDB4
	.string "TIFFANY$"

Str_839BDBC:: @ 0x839BDBC
	.string "くまxちえ$"

	.align 2
gUnknown_Debug_839BDC4:: @ 0x839BDC4
	.4byte Str_839BD90, 0x0
	.4byte Str_839BD96, 0x0
	.4byte Str_839BDA0, 0x1
	.4byte Str_839BDA6, 0x1
	.4byte Str_839BDAC, 0x80
	.4byte Str_839BDB4, 0x81
	.4byte Str_839BD9C, 0x0
	.4byte Str_839BDBC, 0x1

Str_839BE04:: @ 0x839BE04
	.string "ID$"

Str_839BE07:: @ 0x839BE07
	.string "X$"

Str_839BE09:: @ 0x839BE09
	.string " Y$"

Str_839BE0C:: @ 0x839BE0C
	.string " H$"

Str_839BE0F:: @ 0x839BE0F
	.string "HP$"

Str_839BE12:: @ 0x839BE12
	.string "PAR$"

Str_839BE16:: @ 0x839BE16
	.string "SLP$"

Str_839BE1A:: @ 0x839BE1A
	.string "PSN$"

Str_839BE1E:: @ 0x839BE1E
	.string "ウマイ$"

	.align 2
gUnknown_Debug_839BE24:: @ 0x839BE24
	.4byte Str_839BE0F, DebugMenu_8077434+1
	.4byte Str_839BE12, DebugMenu_8077434+1
	.4byte Str_839BE16, DebugMenu_8077434+1
	.4byte Str_839BE1A, DebugMenu_8077434+1
	.4byte Str_839BE1E, DebugMenu_8077434+1

Str_839BE4C:: @ 0x839BE4C
	.string "OFF$"

Str_839BE50:: @ 0x839BE50
	.string "ON$"

Str_839BE53:: @ 0x839BE53
	.string "BG0\n"
	.string "BG1\n"
	.string "BG2\n"
	.string "BG3\n"
	.string "$"

Str_839BE64:: @ 0x839BE64
	.string "ON$"

Str_839BE67:: @ 0x839BE67
	.string "OFF$"

Str_839BE6B:: @ 0x839BE6B
	.string "さいせんかのうトレーナー:{STR_VAR_1}\n"
	.string "さいせんじょうたいトレーナー:{STR_VAR_2}$"

Str_839BE8D:: @ 0x839BE8D
	.string "いる$"

Str_839BE90:: @ 0x839BE90
	.string "いない$"

Str_839BE94:: @ 0x839BE94
	.string "Max num of steps$"

Str_839BEA5:: @ 0x839BEA5
	.string "Clear num of steps$"

Str_839BEB8:: @ 0x839BEB8
	.string "See trainers$"

Str_839BEC5:: @ 0x839BEC5
	.string "Flag all clear$"

Str_839BED4:: @ 0x839BED4
	.string "Flag all set$"

	.align 2
gUnknown_Debug_839BEE4:: @ 0x839BEE4
	.4byte Str_839BEB8, DebugMenu_8077974+1
	.4byte Str_839BE94, DebugMenu_8077A20+1
	.4byte Str_839BEA5, DebugMenu_8077A40+1
	.4byte Str_839BED4, DebugMenu_8077934+1
	.4byte Str_839BEC5, DebugMenu_8077954+1

Str_839BF0C:: @ 0x839BF0C
	.string "のこり　{STR_VAR_1}ほ$"

Str_839BF14:: @ 0x839BF14
	.string "{STR_VAR_1}\n"
	.string "のこり　{STR_VAR_2}ほ$"

Str_839BF1F:: @ 0x839BF1F
	.string "めのまえには\n"
	.string "キューブが　ありません！$"

Str_839BF33:: @ 0x839BF33
	.string "ほすうをのこり1にする$"

Str_839BF3F:: @ 0x839BF3F
	.string "ボールをのこり1にする$"

Str_839BF4B:: @ 0x839BF4B
	.string "キューブおきば$"

Str_839BF53:: @ 0x839BF53
	.string "ボールをのこり30に$"

Str_839BF5E:: @ 0x839BF5E
	.string "ほすうをのこり500に$"

	.align 2
gUnknown_Debug_839BF6C:: @ 0x839BF6C
	.4byte Str_839BF4B, DebugMenu_8077B00+1
	.4byte Str_839BF5E, DebugMenu_8077ACC+1
	.4byte Str_839BF33, DebugMenu_8077AE8+1
	.4byte Str_839BF53, DebugMenu_8077A9C+1
	.4byte Str_839BF3F, DebugMenu_8077AB4+1

gUnknown_Debug_839BF94:: @ 0x839BF94
	.4byte gMoveNames + 13 * MOVE_CUT, DebugMenu_8077BB4+1
	.4byte gMoveNames + 13 * MOVE_FLASH, DebugMenu_8077BC0+1
	.4byte gMoveNames + 13 * MOVE_ROCK_SMASH, DebugMenu_8077BCC+1
	.4byte gMoveNames + 13 * MOVE_STRENGTH, DebugMenu_8077BD8+1
	.4byte gMoveNames + 13 * MOVE_SURF, debug_sub_80B0770+1
	.4byte gMoveNames + 13 * MOVE_FLY, debug_sub_80B07B0+1
	.4byte gMoveNames + 13 * MOVE_WATERFALL, DebugMenu_8077BE4+1
	.4byte gMoveNames + 13 * MOVE_DIVE, debug_sub_80B0800+1
	.4byte gMoveNames + 13 * MOVE_SECRET_POWER, DebugMenu_8077BF4+1

Str_839BFDC:: @ 0x839BFDC
	.string "　じかん　ふん　びょう$"

gUnknown_Debug_839BFE8::
	.byte 0x63, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1a, 0x00, 0x00, 0x00

Str_839C008: @ 0x839C008
gDebug0x839C008::
	.string "Which item?$"

Str_839C014:: @ 0x839C014
	.string "How　many？$"

Str_839C01E:: @ 0x839C01E
	.string "にがおえ　ばんごう\n"
	.string "ポケモンナンバー\n"
	.string "ポケモンめい\n"
	.string "ブリーダーめい\n"
	.string "しゅるい\n"
	.string "こせいらんすう$"

Str_839C04D:: @ 0x839C04D
	.string "データなし$"

Str_839C053:: @ 0x839C053
	.string "Miracle Island emerged\n"
	.string "Random numbers:{STR_VAR_1}$"

Str_839C07C:: @ 0x839C07C
	.string "{STR_VAR_1}:{STR_VAR_2}\n"
	.string "{STR_VAR_3}$"

Str_839C085:: @ 0x839C085
	.string "みしよう　データ$"

Str_839C08E:: @ 0x839C08E
	.string "Confirmation$"

Str_839C09B:: @ 0x839C09B
	.string "Max-1 set$"

Str_839C0A5:: @ 0x839C0A5
	.string "Zero clear$"

Str_839C0B0:: @ 0x839C0B0
	.string "レポート$"

Str_839C0B5:: @ 0x839C0B5
    .string "クリア　じかん$"

Str_839C0BD:: @ 0x839C0BD
	.string "りゅうこう　さくせい$"

Str_839C0C8:: @ 0x839C0C8
	.string "きのみを　うえたかいすう$"

Str_839C0D5:: @ 0x839C0D5
	.string "じてんしゃこうかん$"

Str_839C0DF:: @ 0x839C0DF
	.string "ほすう$"

Str_839C0E3:: @ 0x839C0E3
	.string "インタビュー$"

Str_839C0EA:: @ 0x839C0EA
	.string "バトル$"

Str_839C0EE:: @ 0x839C0EE
	.string "やせいバトル$"

Str_839C0F5:: @ 0x839C0F5
	.string "トレーナーバトル$"

Str_839C0FE:: @ 0x839C0FE
	.string "でんどういり$"

Str_839C105:: @ 0x839C105
	.string "ポケモンほかく$"

Str_839C10D:: @ 0x839C10D
	.string "つった　かいすう$"

Str_839C116:: @ 0x839C116
	.string "タマゴかえった$"

Str_839C11E:: @ 0x839C11E
	.string "しんかした$"

Str_839C124:: @ 0x839C124
	.string "ポケセン　かいふく$"

Str_839C12E:: @ 0x839C12E
	.string "じたく　かいふく$"

Str_839C137:: @ 0x839C137
	.string "サファリ　りよう$"

Str_839C140:: @ 0x839C140
	.string "ひでん:いあいぎり$"

Str_839C14A:: @ 0x839C14A
	.string "ひでん:いわくだき$"

Str_839C154:: @ 0x839C154
	.string "きち　ひっこし$"

Str_839C15C:: @ 0x839C15C
	.string "つうしんこうかん$"

Str_839C165:: @ 0x839C165
	.string "つうしんたいせん$"

Str_839C16E:: @ 0x839C16E
	.string "つうしん　かち$"

Str_839C176:: @ 0x839C176
	.string "つうしん　まけ$"

Str_839C17E:: @ 0x839C17E
	.string "つうしん　ひきわけ$"

Str_839C188:: @ 0x839C188
	.string "わざ:はねる$"

Str_839C18F:: @ 0x839C18F
	.string "わざ:わるあがき$"

Str_839C198:: @ 0x839C198
	.string "スロットおおあたりかいすう$"

Str_839C1A6:: @ 0x839C1A6
	.string "ルーレット　れんしょう$"

Str_839C1B2:: @ 0x839C1B2
	.string "バトルタワー$"

Str_839C1B9:: @ 0x839C1B9
	.string "バトルタワーかち$"

Str_839C1C2:: @ 0x839C1C2
	.string "バトルタワーれんしょう$"

Str_839C1CE:: @ 0x839C1CE
	.string "ポロックさくせい$"

Str_839C1D7:: @ 0x839C1D7
	.string "つうしんでポロックつくった$"

Str_839C1E5:: @ 0x839C1E5
	.string "つうしんコンテストかち$"

Str_839C1F1:: @ 0x839C1F1
	.string "CPUコンテストさんか$"

Str_839C1FD:: @ 0x839C1FD
	.string "CPUコンテストかち$"

Str_839C208:: @ 0x839C208
	.string "かいもの$"

Str_839C20D:: @ 0x839C20D
	.string "ダウジングマシン$"

Str_839C216:: @ 0x839C216
	.string "あめふり$"

Str_839C21B:: @ 0x839C21B
	.string "ずかんをみた$"

Str_839C222:: @ 0x839C222
	.string "リボン　もらった$"

Str_839C22B:: @ 0x839C22B
	.string "だんさ　とびおり$"

Str_839C234:: @ 0x839C234
	.string "TVを　みた$"

Str_839C23B:: @ 0x839C23B
	.string "とけいを　みた$"

Str_839C243:: @ 0x839C243
	.string "くじが　あたった$"

Str_839C24C:: @ 0x839C24C
	.string "ポケモンあずけた$"

Str_839C255:: @ 0x839C255
	.string "ロープウェイりよう$"

Str_839C25F:: @ 0x839C25F
	.string "おんせん　はいった$"

	.align 2
gUnknown_Debug_839C26C:: @ 0x839C26C
	.4byte 0xFFFFFF, Str_839C0B0
	.4byte 0x3E73B3B, Str_839C0B5
	.4byte 0xFFFFFF, Str_839C0BD
	.4byte 0xFFFFFF, Str_839C0C8
	.4byte 0xFFFFFF, Str_839C0D5
	.4byte 0xFFFFFF, Str_839C0DF
	.4byte 0xFFFFFF, Str_839C0E3
	.4byte 0xFFFFFF, Str_839C0EA
	.4byte 0xFFFFFF, Str_839C0EE
	.4byte 0xFFFFFF, Str_839C0F5
	.4byte 0x3E7, Str_839C0FE
	.4byte 0xFFFFFF, Str_839C105
	.4byte 0xFFFFFF, Str_839C10D
	.4byte 0xFFFFFF, Str_839C116
	.4byte 0xFFFFFF, Str_839C11E
	.4byte 0xFFFFFF, Str_839C124
	.4byte 0xFFFFFF, Str_839C12E
	.4byte 0xFFFFFF, Str_839C137
	.4byte 0xFFFFFF, Str_839C140
	.4byte 0xFFFFFF, Str_839C14A
	.4byte 0xFFFFFF, Str_839C154
	.4byte 0xFFFFFF, Str_839C15C
	.4byte 0xFFFFFF, Str_839C165
	.4byte 0x270F, Str_839C16E
	.4byte 0x270F, Str_839C176
	.4byte 0x270F, Str_839C17E
	.4byte 0xFFFFFF, Str_839C188
	.4byte 0xFFFFFF, Str_839C18F
	.4byte 0xFFFFFF, Str_839C198
	.4byte 0xFFFFFF, Str_839C1A6
	.4byte 0xFFFFFF, Str_839C1B2
	.4byte 0x0, Str_839C1B9
	.4byte 0x0, Str_839C1C2
	.4byte 0xFFFFFF, Str_839C1CE
	.4byte 0xFFFFFF, Str_839C1D7
	.4byte 0xFFFFFF, Str_839C1E5
	.4byte 0xFFFFFF, Str_839C1F1
	.4byte 0xFFFFFF, Str_839C1FD
	.4byte 0xFFFFFF, Str_839C208
	.4byte 0xFFFFFF, Str_839C20D
	.4byte 0xFFFFFF, Str_839C216
	.4byte 0xFFFFFF, Str_839C21B
	.4byte 0xFFFFFF, Str_839C222
	.4byte 0xFFFFFF, Str_839C22B
	.4byte 0xFFFFFF, Str_839C234
	.4byte 0xFFFFFF, Str_839C23B
	.4byte 0xFFFFFF, Str_839C243
	.4byte 0xFFFFFF, Str_839C24C
	.4byte 0xFFFFFF, Str_839C255
	.4byte 0xFFFFFF, Str_839C25F

gUnknown_Debug_839C3FC:: @ 0x839C3FC
	.4byte Str_839C08E, DebugMenu_8078774+1
	.4byte Str_839C09B, DebugMenu_8078788+1
	.4byte Str_839C0A5, DebugMenu_807879C+1

Str_839C414:: @ 0x839C414
	.string "ATTR:{STR_VAR_1}　HEIGHT:{STR_VAR_3}\n"
	.string "CODE:{STR_VAR_2}$"

Str_839C42E:: @ 0x839C42E
	.string "レベル　　ステージ$"

Str_839C438:: @ 0x839C438
	.string "ポロック　グループ{STR_VAR_1}$"

gUnknown_Debug_839C444::
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00
	.byte 0x0c, 0x03, 0x03, 0x03, 0x03, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

Str_839C574:: @ 0x839C574
gDebug0x839C574::
	.string "write to flash$"

Str_839C583:: @ 0x839C583
	.string "read from flash$"

	.align 2
gUnknown_Debug_839C594:: @ 0x839C594
	.4byte gDebug0x839C574, DebugMenu_8078C80+1
	.4byte Str_839C583, DebugMenu_8078D30+1

Str_839C5A4:: @ 0x839C5A4
	.string "Press A, begin to write\n"
	.string "Press B, cancel$"

Str_839C5CC:: @ 0x839C5CC
	.string "かきこみ　せいこう$"

Str_839C5D6:: @ 0x839C5D6
	.string "よみこみせいこう$"

Str_839C5DF:: @ 0x839C5DF
	.string "かきこみ　しっぱい$"

Str_839C5E9:: @ 0x839C5E9
	.string "よみこみ　しっぱい$"

	.align 1
gUnknown_Debug_839C5F4::
	.byte 0x00, 0x00, 0xe7, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x3b, 0x00, 0x06, 0x02, 0x00, 0x00, 0x00, 0x00, 0x3b, 0x00, 0x09, 0x03, 0x00, 0x00

Str_839C60C:: @ 0x839C60C
gDebug0x839C60C::
	.string "Set FLASH ERR$"

Str_839C61A:: @ 0x839C61A
	.string "abcde;　abcde:　ABCDE;　ABCDE:\p"
	.string "Tableaux　des　verbes　du　2{SUPER_E}　groupe.\p"
	.string "La1{SUPER_RE}　chose　à apprendre　c’est　de　lire.\p"
	.string "Tableaux　des　verbes　du　1{SUPER_ER}　groupe.\p"
	.string "“あいうえおかきくけコさしすせそたちつてとな”\n"
	.string "<にぬネのはひふへほマみむめもやゆよらりるれろわャッ>\p"
	.string "をんゃゅょアイウエオカキクケサシスルレロワ,$"

	.endif
