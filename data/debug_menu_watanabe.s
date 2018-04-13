	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.if DEBUG

gUnknown_Debug_083F7FD4:: @ 0x83F7FD4
	.string "▶$"

gUnknown_Debug_083F7FD6:: @ 0x83F7FD6
	.string "ゆみあく"

gUnknown_Debug_083F7FDA::
	.string "ひりつ$"

gUnknown_Debug_083F7FDE:: @ 0x83F7FDE
	.string "たかさ$"

gUnknown_Debug_083F7FE2:: @ 0x83F7FE2
	.string "Lキー▶しゅくしょう$"

gUnknown_Debug_083F7FED:: @ 0x83F7FED
	.string "Rキー▶かくだい$"

gUnknown_Debug_083F7FF6:: @ 0x83F7FF6
	.string "Uキー▶うえ　いどう$"

gUnknown_Debug_083F8001:: @ 0x83F8001
	.string "Dキー▶した　いどう$"

gUnknown_Debug_083F800C:: @ 0x83F800C
	.string "Aボタン▶そうさきりかえ$"

gUnknown_Debug_083F8019:: @ 0x83F8019
	.string "Bボタン▶やめる$"

gUnknown_Debug_083F8022:: @ 0x83F8022
	.string "スタート:$"

gUnknown_Debug_083F8028:: @ 0x83F8028
	.string ":セレクト$"

gUnknown_Debug_083F802E:: @ 0x83F802E
	.string "やせいたいせん$"

gUnknown_Debug_083F8036:: @ 0x83F8036
	.string "1VS1たいせん$"

gUnknown_Debug_083F803F:: @ 0x83F803F
	.string "2VS2たいせん$"

gUnknown_Debug_083F8048:: @ 0x83F8048
	.string "{COLOR BLUE}1VS1つうしんたいせん$"

gUnknown_Debug_083F8058:: @ 0x83F8058
	.string "{COLOR BLUE}2VS2つうしんたいせん$"

gUnknown_Debug_083F8068:: @ 0x83F8068
	.4byte gUnknown_Debug_083F802E, 0x100
	.4byte gUnknown_Debug_083F8036, 0x108
	.4byte gUnknown_Debug_083F803F, 0x209
	.4byte gUnknown_Debug_083F8048, 0x10A
	.4byte gUnknown_Debug_083F8058, 0x20B

gUnknown_Debug_083F8090:: @ 0x83F8090
	.string "きほんタイプ$"

gUnknown_Debug_083F8097:: @ 0x83F8097
	.string "AIタイプ2$"

gUnknown_Debug_083F809E:: @ 0x83F809E
	.string "AIタイプ3$"

gUnknown_Debug_083F80A5:: @ 0x83F80A5
	.string "AIタイプ4$"

gUnknown_Debug_083F80AC:: @ 0x83F80AC
	.string "AIタイプ5$"

gUnknown_Debug_083F80B3:: @ 0x83F80B3
	.string "AIタイプ6$"

gUnknown_Debug_083F80BA:: @ 0x83F80BA
	.string "AIタイプ7$"

gUnknown_Debug_083F80C1:: @ 0x83F80C1
	.string "AIタイプ8$"

gUnknown_Debug_083F80C8:: @ 0x83F80C8
	.string "AIタイプ9$"

gUnknown_Debug_083F80CF:: @ 0x83F80CF
	.string "AIタイプ10$"

	.align 2
gUnknown_Debug_083F80D8:: @ 0x83F80D8
	.4byte gUnknown_Debug_083F8090, 0x1
	.4byte gUnknown_Debug_083F8097, 0x2
	.4byte gUnknown_Debug_083F809E, 0x4
	.4byte gUnknown_Debug_083F80A5, 0x8
	.4byte gUnknown_Debug_083F80AC, 0x10
	.4byte gUnknown_Debug_083F80B3, 0x20
	.4byte gUnknown_Debug_083F80BA, 0x40
	.4byte gUnknown_Debug_083F80C1, 0x80
	.4byte gUnknown_Debug_083F80C8, 0x100
	.4byte gUnknown_Debug_083F80CF, 0x200

gUnknown_Debug_083F8128:: @ 0x83F8128
	.string "くさ$"

gUnknown_Debug_083F812B:: @ 0x83F812B
	.string "ながい　くさ$"

gUnknown_Debug_083F8132:: @ 0x83F8132
	.string "すな$"

gUnknown_Debug_083F8135:: @ 0x83F8135
	.string "みず$"

gUnknown_Debug_083F8138:: @ 0x83F8138
	.string "うみ$"

gUnknown_Debug_083F813B:: @ 0x83F813B
	.string "いけ$"

gUnknown_Debug_083F813E:: @ 0x83F813E
	.string "いわ$"

gUnknown_Debug_083F8141:: @ 0x83F8141
	.string "どうくつ$"

gUnknown_Debug_083F8146:: @ 0x83F8146
	.string "そのた$"

	.align 2
gUnknown_Debug_083F814C:: @ 0x83F814C
	.4byte gUnknown_Debug_083F8128, 0x0
	.4byte gUnknown_Debug_083F812B, 0x1
	.4byte gUnknown_Debug_083F8132, 0x2
	.4byte gUnknown_Debug_083F8135, 0x3
	.4byte gUnknown_Debug_083F8138, 0x4
	.4byte gUnknown_Debug_083F813B, 0x5
	.4byte gUnknown_Debug_083F813E, 0x6
	.4byte gUnknown_Debug_083F8141, 0x7
	.4byte gUnknown_Debug_083F8146, 0x8

gUnknown_Debug_083F8194:: @ 0x83F8194
	.string "ポケモンを　えらんでね$"

gUnknown_Debug_083F81A0:: @ 0x83F81A0
	.string "{COLOR RED}START:つぎへ$"

gUnknown_Debug_083F81AD:: @ 0x83F81AD
	.string "{COLOR RED}じぶんの　ポケモン$"

gUnknown_Debug_083F81BA:: @ 0x83F81BA
	.string "{COLOR RED}あいての　ポケモン$"

gUnknown_Debug_083F81C7:: @ 0x83F81C7
	.string "たいせんモードを　えらんでね$"

gUnknown_Debug_083F81D6:: @ 0x83F81D6
	.string "{COLOR RED}バトルモード　せんたく$"

gUnknown_Debug_083F81E5:: @ 0x83F81E5
	.string "{COLOR RED}トレーナーAI　せんたく$"

gUnknown_Debug_083F81F5:: @ 0x83F81F5
	.string "{COLOR RED}START:かいし$"

gUnknown_Debug_083F8202:: @ 0x83F8202
	.string "{COLOR RED}バトルちけい　せんたく$"

gUnknown_Debug_083F8211:: @ 0x83F8211
	.string "じぶんの　せいべつを　えらんでね$"

gUnknown_Debug_083F8222:: @ 0x83F8222
	.string "{COLOR RED}せいべつ　せんたく$"

gUnknown_Debug_083F822F:: @ 0x83F822F
	.string "おとこ$"

gUnknown_Debug_083F8233:: @ 0x83F8233
	.string "おんな$"
Str_83F8237:
	.string "Kind$"

	.align 2
_83F823C:
	.4byte 1
	.byte 0x82, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8248:
	.string "Level$"

	.align 2
_83F8250:
	.4byte 1
	.byte 0x64, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F825C:
	.string "EXP Points$"

	.align 2
_83F8268:
	.4byte 1
	.byte 0x80, 0x84, 0x1E, 0x00, 0x00, 0x07, 0x00, 0x00

Str_83F8274:
	.string "ID$"

	.align 2
_83F8278:
	.4byte 0
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x0A, 0x00, 0x00

Str_83F8284:
	.string "Rnd Numbers$"

	.align 2
_83F8290:
	.4byte 0
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x0A, 0x00, 0x00

Str_83F829C:
	.string "Sex$"

	.align 2
_83F82A0:
	.4byte 0
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00

Str_83F82AC:
	.string "Character$"

	.align 2
_83F82B8:
	.4byte 0
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00

Str_83F82C4:
	.string "Move1$"

	.align 2
_83F82CC:
	.4byte 0
	.byte 0x62, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F82D8:
	.string "Move2$"

	.align 2
_83F82E0:
	.4byte 0
	.byte 0x62, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F82EC:
	.string "Move3$"

	.align 2
_83F82F4:
	.4byte 0
	.byte 0x62, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8300:
	.string "Move4$"

	.align 2
_83F8308:
	.4byte 0
	.byte 0x62, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8314:
	.string "Hold$"

	.align 2
_83F831C:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8328:
	.string "SP. Ability$"

	.align 2
_83F8334:
	.4byte 0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00

Str_83F8340:
	.string "HPrnd$"

	.align 2
_83F8348:
	.4byte 0
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00

Str_83F8354:
	.string "HPexp$"

	.align 2
_83F835C:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8368:
	.string "ATKrnd$"

	.align 2
_83F8370:
	.4byte 0
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00

Str_83F837C:
	.string "ATKexp$"

	.align 2
_83F8384:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8390:
	.string "DEFrnd$"

	.align 2
_83F8398:
	.4byte 0
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00

Str_83F83A4:
	.string "DEFexp$"

	.align 2
_83F83AC:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F83B8:
	.string "SPDrnd$"

	.align 2
_83F83C0:
	.4byte 0
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00

Str_83F83CC:
	.string "SPDexp$"

	.align 2
_83F83D4:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F83E0:
	.string "SP. ATK$"
	.string "rnd$"

	.align 2
_83F83EC:
	.4byte 0
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00

Str_83F83F8:
	.string "SP. ATK$"
	.string "exp$"

	.align 2
_83F8404:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8410:
	.string "SP. DEF$"
	.string "rnd$"

	.align 2
_83F841C:
	.4byte 0
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00

Str_83F8428:
	.string "SP. DEF$"
	.string "exp$"

	.align 2
_83F8434:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8440:
	.string "Cool$"

	.align 2
_83F8448:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8454:
	.string "Beauty$"

	.align 2
_83F845C:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8468:
	.string "Cute$"

	.align 2
_83F8470:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F847C:
	.string "Smart$"

	.align 2
_83F8484:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F8490:
	.string "Tough$"

	.align 2
_83F8498:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F84A4:
	.string "Sheen$"

	.align 2
_83F84AC:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F84B8:
	.string "Tameness$"

	.align 2
_83F84C4:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F84D0:
	.string "{PK}RUS$"

	.align 2
_83F84D8:
	.4byte 0
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00

Str_83F84E4:
	.string "EGG$"
	.string "$"

	.align 2
_83F84EC:
	.4byte 0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00

Str_83F84F8:
	.string "Status$"

	.align 2
_83F8500:
	.4byte 0
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00


gUnknown_Debug_083F850A:: @ 0x83F850A
	.string "{COLOR RED}HP　　$"

gUnknown_Debug_083F8514:: @ 0x83F8514
	.string "{COLOR RED}ATK　$"

gUnknown_Debug_083F851C:: @ 0x83F851C
	.string "{COLOR RED}DEF　$"

gUnknown_Debug_083F8524:: @ 0x83F8524
	.string "{COLOR RED}SPEED$"

gUnknown_Debug_083F852D:: @ 0x83F852D
	.string "{COLOR RED}SP。ATK$"

gUnknown_Debug_083F8537:: @ 0x83F8537
	.string "{COLOR RED}SP。DEF$"

gUnknown_Debug_083F8541:: @ 0x83F8541
	.string "なし$"

gUnknown_Debug_083F8544:: @ 0x83F8544
	.string "♂$"

gUnknown_Debug_083F8546:: @ 0x83F8546
	.string "♀$"

gUnknown_Debug_083F8548:: @ 0x83F8548
	.string "ー$"

gUnknown_Debug_083F854A:: @ 0x83F854A
	.string "ON$"

gUnknown_Debug_083F854D:: @ 0x83F854D
	.string "OFF$"

	.align 2
gUnknown_Debug_083F8554:: @ 0x83F8554
	.4byte Str_83F8237, _83F823C
	.4byte Str_83F8248, _83F8250
	.4byte Str_83F825C, _83F8268
	.4byte Str_83F8274, _83F8278
	.4byte Str_83F8284, _83F8290
	.4byte Str_83F829C, _83F82A0
	.4byte Str_83F82AC, _83F82B8
	.4byte Str_83F82C4, _83F82CC
	.4byte Str_83F82D8, _83F82E0
	.4byte Str_83F82EC, _83F82F4
	.4byte Str_83F8300, _83F8308
	.4byte Str_83F8314, _83F831C
	.4byte Str_83F8328, _83F8334
	.4byte Str_83F8340, _83F8348
	.4byte Str_83F8354, _83F835C
	.4byte Str_83F8368, _83F8370
	.4byte Str_83F837C, _83F8384
	.4byte Str_83F8390, _83F8398
	.4byte Str_83F83A4, _83F83AC
	.4byte Str_83F83B8, _83F83C0
	.4byte Str_83F83CC, _83F83D4
	.4byte Str_83F83E0, _83F83EC
	.4byte Str_83F83F8, _83F8404
	.4byte Str_83F8410, _83F841C
	.4byte Str_83F8428, _83F8434
	.4byte Str_83F8440, _83F8448
	.4byte Str_83F8454, _83F845C
	.4byte Str_83F8468, _83F8470
	.4byte Str_83F847C, _83F8484
	.4byte Str_83F8490, _83F8498
	.4byte Str_83F84A4, _83F84AC
	.4byte Str_83F84B8, _83F84C4
	.4byte Str_83F84D0, _83F84D8
	.4byte Str_83F84E4, _83F84EC
	.4byte Str_83F84F8, _83F8500

gUnknown_Debug_083F866C:: @ 0x83F866C
	.string "　あいうえおか$"

gUnknown_Debug_083F8674:: @ 0x83F8674
	.string "めまみ$"

gUnknown_Debug_083F8678:: @ 0x83F8678
	.string "きくけこさし$"

gUnknown_Debug_083F867F:: @ 0x83F867F
	.string "すせそたちつ\n"
	.string "$"

gUnknown_Debug_083F8687:: @ 0x83F8687
	.string "てとなにぬね{STRING 255}のはひふへほ$"

	.align 2
gUnknown_Debug_083F8698:: @ 0x83F8698
	.4byte gUnknown_Debug_083F866C, 0x5
	.4byte gUnknown_Debug_083F8674, 0x3
	.4byte gUnknown_Debug_083F8678, 0x6
	.4byte gUnknown_Debug_083F867F, 0x6
	.4byte gUnknown_Debug_083F8687, 0x6
	.4byte 0x83F868F, 0x6

gUnknown_Debug_083F86C8:: @ 0x83F86C8
	.string "ーーー$"

gUnknown_Debug_083F86CC:: @ 0x83F86CC
	.string "SLP$"

gUnknown_Debug_083F86D0:: @ 0x83F86D0
	.string "PSN$"

gUnknown_Debug_083F86D4:: @ 0x83F86D4
	.string "BRN$"

gUnknown_Debug_083F86D8:: @ 0x83F86D8
	.string "FRZ$"

gUnknown_Debug_083F86DC:: @ 0x83F86DC
	.string "PAR$"

gUnknown_Debug_083F86E0:: @ 0x83F86E0
	.string "PSN2$"

	.align 2
gUnknown_Debug_083F86E8:: @ 0x83F86E8
	.4byte gUnknown_Debug_083F86C8, 0x0
	.4byte gUnknown_Debug_083F86CC, 0x1
	.4byte gUnknown_Debug_083F86D0, 0x8
	.4byte gUnknown_Debug_083F86D4, 0x10
	.4byte gUnknown_Debug_083F86D8, 0x20
	.4byte gUnknown_Debug_083F86DC, 0x40
	.4byte gUnknown_Debug_083F86E0, 0x80

gUnknown_Debug_083F8720:: @ 0x83F8720
	.string "PKMNワLIST$"

gUnknown_Debug_083F872A:: @ 0x83F872A
	.string "PKMNワBOX$"

gUnknown_Debug_083F8733:: @ 0x83F8733
	.string "Create　POKひMON　　　LR:Shift　　START:Add$"

gUnknown_Debug_083F8758:: @ 0x83F8758
	.string "たまご$"

gUnknown_Debug_083F875C:: @ 0x83F875C
	.string "DebugーG$"

gUnknown_Debug_083F8764::
	.string " $"
	.byte 0, 0

gUnknown_Debug_083F8768::
	.4byte 0x00000001
	.4byte 0x0000000a
    .4byte 0x00000064
    .4byte 0x000003e8
    .4byte 0x00002710
    .4byte 0x000186a0
    .4byte 0x000f4240
    .4byte 0x00989680
	.4byte 0x05f5e100
	.4byte 0x3b9aca00

gUnknown_Debug_083F8790::
	.2byte 0x0000
    .2byte 0x0002
    .2byte 0x0004
    .2byte 0x0006
    .2byte 0x0008
    .2byte 0x000a
    .2byte 0x000c
    .2byte 0x000e
    .2byte 0x0010
    .2byte 0x0012
    .2byte 0x0014
    .2byte 0x0016
    .2byte 0x0018
    .2byte 0x001a
    .2byte 0x001c
    .2byte 0x001e
	.2byte 0x001f
    .2byte 0x001e
    .2byte 0x001c
    .2byte 0x001a
    .2byte 0x0018
    .2byte 0x0016
    .2byte 0x0014
    .2byte 0x0012
    .2byte 0x0010
    .2byte 0x000e
    .2byte 0x000c
    .2byte 0x000a
    .2byte 0x0008
    .2byte 0x0006
    .2byte 0x0004
    .2byte 0x0002

gUnknown_Debug_083F87D0:: @ 0x83F87D0
	.string "{COLOR RED}L{ESCAPE}ロ$"

gUnknown_Debug_083F87D8:: @ 0x83F87D8
	.string "{COLOR RED}{ESCAPE}ワR$"

gUnknown_Debug_083F87E0:: @ 0x83F87E0
	.string "かいはつナンバー$"

gUnknown_Debug_083F87E9:: @ 0x83F87E9
	.string "グラフィックナンバー$"

gUnknown_Debug_083F87F4:: @ 0x83F87F4
	.string "{COLOR RED}A:カラーせってい$"

gUnknown_Debug_083F8801:: @ 0x83F8801
	.string "{COLOR RED}A:けってい　B:キャンセル$"

gUnknown_Debug_083F8813:: @ 0x83F8813
	.string ":$"

gUnknown_Debug_083F8815::
	.byte 0x00
    .byte 0x10
    .byte 0x20
    .byte 0x20
    .byte 0x20
    .byte 0x21
    .byte 0x20
    .byte 0x20
    .byte 0x20
    .byte 0x21
    .byte 0x20
    .byte 0x20
    .byte 0x20
    .byte 0x21
    .byte 0x20
    .byte 0x20
    .byte 0x20
    .byte 0x21

	.align 2
stru_83F8828::
	obj_tiles byte_83F88EC, 0x800, 0x1000
	null_obj_tiles

stru_83F8838::
	obj_pal word_83F888C, 0x1000
	null_obj_pal

gOamData_83F8848:
	.2byte 0x00a0
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gSpriteAnim_83F8850:
    obj_image_anim_frame 38, 30
    obj_image_anim_end

gSpriteAnim_83F8858:
    obj_image_anim_frame 39, 30
    obj_image_anim_end

gSpriteAnim_83F8860:
    obj_image_anim_frame 40, 30
    obj_image_anim_end

gSpriteAnimTable_83F8868::
	.4byte gSpriteAnim_83F8850, gSpriteAnim_83F8858, gSpriteAnim_83F8860

gSpriteTemplate_83F8874::
	spr_template 0x1000, 0x1000, gOamData_83F8848, gSpriteAnimTable_83F8868, 0, gDummySpriteAffineAnimTable, debug_80C7584

word_83F888C::
	.incbin "graphics/debug/sprite_browser.gbapal"

byte_83F88EC::
	.incbin "graphics/debug/sprite_browser.4bpp"

	.endif
