	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.if DEBUG

gUnknown_Debug_083C0C54:: @ 0x83C0C54
	.string "Contest graphics$"

gUnknown_Debug_083C0C65:: @ 0x83C0C65
	.string "Art Mus. graphics$"

gUnknown_Debug_083C0C77:: @ 0x83C0C77
	.string "Preview data$"

gUnknown_Debug_083C0C84:: @ 0x83C0C84
	.string "TRICK HOUSE$"

gUnknown_Debug_083C0C90:: @ 0x83C0C90
	.string "Control events$"

gUnknown_Debug_083C0C9F:: @ 0x83C0C9F
	.string "Control flags$"

gUnknown_Debug_083C0CAD:: @ 0x83C0CAD
	.string "Control WORK$"

	.align 2
gUnknown_Debug_083C0CBA:: @ 0x83C0CBA
	.4byte gUnknown_Debug_083C0C54, TomomichiDebugMenu_ContestGraphics+1
	.4byte gUnknown_Debug_083C0C65, TomomichiDebugMenu_ArtMusGraphics+1
	.4byte gUnknown_Debug_083C0C77, TomomichiDebugMenu_PreviewData+1
	.4byte gUnknown_Debug_083C0C84, TomomichiDebugMenu_TrickHouse+1
	.4byte gUnknown_Debug_083C0C90, TomomichiDebugMenu_ControlEvents+1
	.4byte gUnknown_Debug_083C0C9F, TomomichiDebugMenu_ControlFlags+1
	.4byte gUnknown_Debug_083C0CAD, TomomichiDebugMenu_ControlWorks+1

gUnknown_Debug_083C0CF4:: @ 0x83C0CF4
	.string "Contest$"

gUnknown_Debug_083C0CFC:: @ 0x83C0CFC
	.string "Pokémon No.$"

gUnknown_Debug_083C0D08:: @ 0x83C0D08
	.string "ID rnd. digit$"

gUnknown_Debug_083C0D16:: @ 0x83C0D16
	.string "Contest Type$"

gUnknown_Debug_083C0D23:: @ 0x83C0D23
	.string "Poké Art$"

	.align 2
gUnknown_Debug_083C0D2C:: @ 0x83C0D2C
	.4byte gUnknown_Debug_083C0CFC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0D08, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0D16, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0D23, TomomichiDebugMenu_ContestGraphics_Show+1

gUnknown_Debug_083C0D4C:: @ 0x83C0D4C
	.string "Art Mus.$"

gUnknown_Debug_083C0D55:: @ 0x83C0D55
	.string "Pokémon No.$"

gUnknown_Debug_083C0D61:: @ 0x83C0D61
	.string "ID rnd. digit$"

gUnknown_Debug_083C0D6F:: @ 0x83C0D6F
	.string "Title Type$"

gUnknown_Debug_083C0D7A:: @ 0x83C0D7A
	.string "Poké Art$"

	.align 2
gUnknown_Debug_083C0D83:: @ 0x83C0D83
	.4byte gUnknown_Debug_083C0D55, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0D61, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0D6F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0D7A, TomomichiDebugMenu_MuseumGraphics_Show+1

gUnknown_Debug_083C0DA4:: @ 0x83C0DA4
	.string "Preview$"

gUnknown_Debug_083C0DAC:: @ 0x83C0DAC
	.string "Pokémon No.$"

gUnknown_Debug_083C0DB8:: @ 0x83C0DB8
	.string "ID rnd. digit$"

gUnknown_Debug_083C0DC6:: @ 0x83C0DC6
	.string "Type$"

gUnknown_Debug_083C0DCB:: @ 0x83C0DCB
	.string "Poké Art$"

	.align 2
gUnknown_Debug_083C0DD4:: @ 0x83C0DD4
	.4byte gUnknown_Debug_083C0DAC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0DB8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0DC6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C0DCB, debug_sub_808ECA4+1

gUnknown_Debug_083C0DF4:: @ 0x83C0DF4
	.string "Trick related$"

gUnknown_Debug_083C0E02:: @ 0x83C0E02
	.string "Level$"

gUnknown_Debug_083C0E08:: @ 0x83C0E08
	.string "Trick Master$"

	.align 2
gUnknown_Debug_083C0E15:: @ 0x83C0E15
	.4byte gUnknown_Debug_083C0E02, debug_sub_808EB58+1
	.4byte gUnknown_Debug_083C0E08, debug_sub_808EBB4+1

gUnknown_Debug_083C0E28:: @ 0x83C0E28
	.string "パート1$"

gUnknown_Debug_083C0E2D:: @ 0x83C0E2D
	.string "パート2$"

	.align 2
gUnknown_Debug_083C0E32:: @ 0x83C0E32
	.4byte gUnknown_Debug_083C0E28, debug_sub_808BFC4+1
	.4byte gUnknown_Debug_083C0E2D, debug_sub_808C014+1

gUnknown_Debug_083C0E44:: @ 0x83C0E44
	.string "イベントFLAG$"

gUnknown_Debug_083C0E4D:: @ 0x83C0E4D
	.string "バニシュFLAG$"

gUnknown_Debug_083C0E56:: @ 0x83C0E56
	.string "トレーナーFLAG$"

gUnknown_Debug_083C0E60:: @ 0x83C0E60
	.string "SYSFLAG$"

gUnknown_Debug_083C0E68:: @ 0x83C0E68
	.string "BALLバニシュFLAG$"

gUnknown_Debug_083C0E75:: @ 0x83C0E75
	.string "FH$"

gUnknown_Debug_083C0E78:: @ 0x83C0E78
	.string "FH-OBJ$"

	.align 2
gUnknown_Debug_083C0E7F:: @ 0x83C0E7F
	.4byte gUnknown_Debug_083C0E44, debug_sub_808C31C+1
	.4byte gUnknown_Debug_083C0E4D, debug_sub_808C7C8+1
	.4byte gUnknown_Debug_083C0E56, debug_sub_808CC74+1
	.4byte gUnknown_Debug_083C0E60, debug_sub_808CF10+1
	.4byte gUnknown_Debug_083C0E68, debug_sub_808D844+1
	.4byte gUnknown_Debug_083C0E75, debug_sub_808D600+1
	.4byte gUnknown_Debug_083C0E78, debug_sub_808D3BC+1

gUnknown_Debug_083C0EB8:: @ 0x83C0EB8
	.string "SAVEWORK$"

gUnknown_Debug_083C0EC1:: @ 0x83C0EC1
	.string "SYSWORK$"

gUnknown_Debug_083C0EC9:: @ 0x83C0EC9
	.string "LOCALWORK$"

gUnknown_Debug_083C0ED3:: @ 0x83C0ED3
	.string "OBJWORK$"

gUnknown_Debug_083C0EDB:: @ 0x83C0EDB
	.string "ANSWORK$"

gUnknown_Debug_083C0EE3:: @ 0x83C0EE3
	.string "SAVEWORK　パート2$"

	.align 2
gUnknown_Debug_083C0EF1:: @ 0x83C0EF1
	.4byte gUnknown_Debug_083C0EB8, debug_sub_808DB0C+1
	.4byte gUnknown_Debug_083C0EC1, debug_sub_808E36C+1
	.4byte gUnknown_Debug_083C0EC9, debug_sub_808E6C0+1
	.4byte gUnknown_Debug_083C0ED3, debug_sub_808E90C+1
	.4byte gUnknown_Debug_083C0EDB, debug_sub_808DA30+1
	.4byte gUnknown_Debug_083C0EE3, debug_sub_808DFC0+1

gUnknown_Debug_083C0F24:: @ 0x83C0F24
	.string "クリアご$"

gUnknown_Debug_083C0F29:: @ 0x83C0F29
	.string "コインこうにゅうかのう$"

gUnknown_Debug_083C0F35:: @ 0x83C0F35
	.string "コトキサポーターセット$"

gUnknown_Debug_083C0F41:: @ 0x83C0F41
	.string "ニューキンセツOPEN$"

gUnknown_Debug_083C0F4D:: @ 0x83C0F4D
	.string "れんらくせんにのれる$"

gUnknown_Debug_083C0F58:: @ 0x83C0F58
	.string "タマゴついか$"

gUnknown_Debug_083C0F5F:: @ 0x83C0F5F
	.string "アイテムいっぱい$"

gUnknown_Debug_083C0F68:: @ 0x83C0F68
	.string "グッズいっぱい$"

gUnknown_Debug_083C0F70:: @ 0x83C0F70
	.string "COINいっぱい$"

	.align 2
gUnknown_Debug_083C0F79:: @ 0x83C0F79
	.4byte gUnknown_Debug_083C0F24, debug_sub_808C0EC+1
	.4byte gUnknown_Debug_083C0F29, debug_sub_808C104+1
	.4byte gUnknown_Debug_083C0F35, debug_sub_808C11C+1
	.4byte gUnknown_Debug_083C0F41, debug_sub_808C134+1
	.4byte gUnknown_Debug_083C0F4D, debug_sub_808C14C+1
	.4byte gUnknown_Debug_083C0F58, debug_sub_808C164+1
	.4byte gUnknown_Debug_083C0F5F, debug_sub_808C17C+1
	.4byte gUnknown_Debug_083C0F68, debug_sub_808C194+1
	.4byte gUnknown_Debug_083C0F70, debug_sub_808C1AC+1

gUnknown_Debug_083C0FC4:: @ 0x83C0FC4
	.string "ムロジムOPEN$"

gUnknown_Debug_083C0FCD:: @ 0x83C0FCD
	.string "おかねを0へ$"

gUnknown_Debug_083C0FD4:: @ 0x83C0FD4
	.string "ドジョッチ　FULL$"

gUnknown_Debug_083C0FDF:: @ 0x83C0FDF
	.string "キノココ　FULL$"

gUnknown_Debug_083C0FE9:: @ 0x83C0FE9
	.string "ドジョッチ　タマゴ$"

gUnknown_Debug_083C0FF3:: @ 0x83C0FF3
	.string "キノココ　タマゴ$"

	.align 2
gUnknown_Debug_083C0FFC:: @ 0x83C0FFC
	.4byte gUnknown_Debug_083C0FC4, debug_sub_808C1C4+1
	.4byte gUnknown_Debug_083C0FCD, debug_sub_808C1DC+1
	.4byte gUnknown_Debug_083C0FD4, debug_sub_808C1F4+1
	.4byte gUnknown_Debug_083C0FDF, debug_sub_808C20C+1
	.4byte gUnknown_Debug_083C0FE9, debug_sub_808C224+1
	.4byte gUnknown_Debug_083C0FF3, debug_sub_808C23C+1

gUnknown_Debug_083C102C:: @ 0x83C102C
	.string "ANSWORK　みかんせい$"

	.align 2
gUnknown_Debug_083C103A:: @ 0x83C103A
	.4byte gUnknown_Debug_083C102C, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1044:: @ 0x83C1044
	.string "FHーOBJ00ー08$"

gUnknown_Debug_083C1050:: @ 0x83C1050
	.string "FHーOBJ09ー15$"

	.align 2
gUnknown_Debug_083C105C:: @ 0x83C105C
	.4byte gUnknown_Debug_083C1044, debug_sub_808D450+1
	.4byte gUnknown_Debug_083C1050, debug_sub_808D4A8+1

gUnknown_Debug_083C106C:: @ 0x83C106C
	.string "FHーOBJ00$"

gUnknown_Debug_083C1075:: @ 0x83C1075
	.string "FHーOBJ01$"

gUnknown_Debug_083C107E:: @ 0x83C107E
	.string "FHーOBJ02$"

gUnknown_Debug_083C1087:: @ 0x83C1087
	.string "FHーOBJ03$"

gUnknown_Debug_083C1090:: @ 0x83C1090
	.string "FHーOBJ04$"

gUnknown_Debug_083C1099:: @ 0x83C1099
	.string "FHーOBJ05$"

gUnknown_Debug_083C10A2:: @ 0x83C10A2
	.string "FHーOBJ06$"

gUnknown_Debug_083C10AB:: @ 0x83C10AB
	.string "FHーOBJ07$"

gUnknown_Debug_083C10B4:: @ 0x83C10B4
	.string "FHーOBJ08$"

	.align 2
gUnknown_Debug_083C10BD:: @ 0x83C10BD
	.4byte gUnknown_Debug_083C106C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1075, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C107E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1087, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1090, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1099, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C10A2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C10AB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C10B4, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1108:: @ 0x83C1108
	.string "FH-OBJ09$"

gUnknown_Debug_083C1111:: @ 0x83C1111
	.string "FH-OBJ10$"

gUnknown_Debug_083C111A:: @ 0x83C111A
	.string "FH-OBJ11$"

gUnknown_Debug_083C1123:: @ 0x83C1123
	.string "FH-OBJ12$"

gUnknown_Debug_083C112C:: @ 0x83C112C
	.string "FH-OBJ13$"

gUnknown_Debug_083C1135:: @ 0x83C1135
	.string "FH-OBJ14$"

gUnknown_Debug_083C113E:: @ 0x83C113E
	.string "FH-OBJ15$"

gUnknown_Debug_083C1147:: @ 0x83C1147
	.string "$"

gUnknown_Debug_083C1148:: @ 0x83C1148
	.string "$"

	.align 2
gUnknown_Debug_083C1149:: @ 0x83C1149
	.4byte gUnknown_Debug_083C1108, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1111, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C111A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1123, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C112C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1135, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C113E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1147, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1148, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1194:: @ 0x83C1194
	.byte 9, 7

gUnknown_Debug_083C1196:: @ 0x83C1196
	.2byte 0x0011, 0x0012, 0x0013, 0x0014, 0x0015, 0x0016, 0x0017, 0x0018, 0x0019
	.2byte 0x001a, 0x001b, 0x001c, 0x001d, 0x001e, 0x001f, 0x0020, 0x0000, 0x0000

gUnknown_Debug_083C11BA:: @ 0x83C11BA
	.string "FH-00-08$"

gUnknown_Debug_083C11C3:: @ 0x83C11C3
	.string "FH-09-15$"

	.align 2
gUnknown_Debug_083C11CC:: @ 0x83C11CC
	.4byte gUnknown_Debug_083C11BA, debug_sub_808D694+1
	.4byte gUnknown_Debug_083C11C3, debug_sub_808D6EC+1

gUnknown_Debug_083C11DC:: @ 0x83C11DC
	.string "FH-00$"

gUnknown_Debug_083C11E2:: @ 0x83C11E2
	.string "FH-01$"

gUnknown_Debug_083C11E8:: @ 0x83C11E8
	.string "FH-02$"

gUnknown_Debug_083C11EE:: @ 0x83C11EE
	.string "FH-03$"

gUnknown_Debug_083C11F4:: @ 0x83C11F4
	.string "FH-04$"

gUnknown_Debug_083C11FA:: @ 0x83C11FA
	.string "FH-05$"

gUnknown_Debug_083C1200:: @ 0x83C1200
	.string "FH-06$"

gUnknown_Debug_083C1206:: @ 0x83C1206
	.string "FH-07$"

gUnknown_Debug_083C120C:: @ 0x83C120C
	.string "FH-08$"

	.align 2
gUnknown_Debug_083C1212:: @ 0x83C1212
	.4byte gUnknown_Debug_083C11DC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C11E2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C11E8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C11EE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C11F4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C11FA, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1200, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1206, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C120C, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C125C:: @ 0x83C125C
	.string "FHー09$"

gUnknown_Debug_083C1262:: @ 0x83C1262
	.string "FHー10$"

gUnknown_Debug_083C1268:: @ 0x83C1268
	.string "FHー11$"

gUnknown_Debug_083C126E:: @ 0x83C126E
	.string "FHー12$"

gUnknown_Debug_083C1274:: @ 0x83C1274
	.string "FHー13$"

gUnknown_Debug_083C127A:: @ 0x83C127A
	.string "FHー14$"

gUnknown_Debug_083C1280:: @ 0x83C1280
	.string "FHー15$"

gUnknown_Debug_083C1286:: @ 0x83C1286
	.string "$"

gUnknown_Debug_083C1287:: @ 0x83C1287
	.string "$"

	.align 2
gUnknown_Debug_083C1288:: @ 0x83C1288
	.4byte gUnknown_Debug_083C125C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1262, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1268, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C126E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1274, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C127A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1280, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1286, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1287, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C12D0:: @ 0x83C12D0
	.byte 9, 7

gUnknown_Debug_083C12D2:: @ 0x83C12D2
	.2byte 0x0001, 0x0002, 0x0003, 0x0004, 0x0005, 0x0006, 0x0007, 0x0008, 0x0009
	.2byte 0x000a, 0x000b, 0x000c, 0x000d, 0x000e, 0x000f, 0x0010, 0x0000, 0x0000

gUnknown_Debug_083C12F6:: @ 0x83C12F6
	.string "BATCH$"

gUnknown_Debug_083C12FC:: @ 0x83C12FC
	.string "タウンとうちゃく$"

gUnknown_Debug_083C1305:: @ 0x83C1305
	.string "シティとうちゃく$"

gUnknown_Debug_083C130E:: @ 0x83C130E
	.string "GET$"

gUnknown_Debug_083C1312:: @ 0x83C1312
	.string "そのた1$"

gUnknown_Debug_083C1317:: @ 0x83C1317
	.string "そのた2$"

gUnknown_Debug_083C131C:: @ 0x83C131C
	.string "そのた3$"

gUnknown_Debug_083C1321:: @ 0x83C1321
	.string "そのた4$"

gUnknown_Debug_083C1326:: @ 0x83C1326
	.string "そのた　とうちゃく$"

gUnknown_Debug_083C1330:: @ 0x83C1330
	.4byte gUnknown_Debug_083C12F6, debug_sub_808CFA4+1
	.4byte gUnknown_Debug_083C12FC, debug_sub_808CFFC+1
	.4byte gUnknown_Debug_083C1305, debug_sub_808D054+1
	.4byte gUnknown_Debug_083C130E, debug_sub_808D0AC+1
	.4byte gUnknown_Debug_083C1312, debug_sub_808D104+1
	.4byte gUnknown_Debug_083C1317, debug_sub_808D15C+1
	.4byte gUnknown_Debug_083C131C, debug_sub_808D1B4+1
	.4byte gUnknown_Debug_083C1321, debug_sub_808D20C+1
	.4byte gUnknown_Debug_083C1326, debug_sub_808D264+1

gUnknown_Debug_083C1378:: @ 0x83C1378
	.string "BATCH01ーGET$"

gUnknown_Debug_083C1384:: @ 0x83C1384
	.string "BATCH02ーGET$"

gUnknown_Debug_083C1390:: @ 0x83C1390
	.string "BATCH03ーGET$"

gUnknown_Debug_083C139C:: @ 0x83C139C
	.string "BATCH04ーGET$"

gUnknown_Debug_083C13A8:: @ 0x83C13A8
	.string "BATCH05ーGET$"

gUnknown_Debug_083C13B4:: @ 0x83C13B4
	.string "BATCH06ーGET$"

gUnknown_Debug_083C13C0:: @ 0x83C13C0
	.string "BATCH07ーGET$"

gUnknown_Debug_083C13CC:: @ 0x83C13CC
	.string "BATCH08ーGET$"

gUnknown_Debug_083C13D8:: @ 0x83C13D8
	.4byte gUnknown_Debug_083C1378, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1384, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1390, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C139C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C13A8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C13B4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C13C0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C13CC, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1418:: @ 0x83C1418
	.string "T101ARRIVE$"

gUnknown_Debug_083C1423:: @ 0x83C1423
	.string "T102ARRIVE$"

gUnknown_Debug_083C142E:: @ 0x83C142E
	.string "T103ARRIVE$"

gUnknown_Debug_083C1439:: @ 0x83C1439
	.string "T104ARRIVE$"

gUnknown_Debug_083C1444:: @ 0x83C1444
	.string "T105ARRIVE$"

gUnknown_Debug_083C144F:: @ 0x83C144F
	.string "T106ARRIVE$"

gUnknown_Debug_083C145A:: @ 0x83C145A
	.string "T107ARRIVE$"

	.align 2
gUnknown_Debug_083C1465:: @ 0x83C1465
	.4byte gUnknown_Debug_083C1418, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1423, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C142E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1439, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1444, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C144F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C145A, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C14A0:: @ 0x83C14A0
	.string "C101ARRIVE$"

gUnknown_Debug_083C14AB:: @ 0x83C14AB
	.string "C102ARRIVE$"

gUnknown_Debug_083C14B6:: @ 0x83C14B6
	.string "C103ARRIVE$"

gUnknown_Debug_083C14C1:: @ 0x83C14C1
	.string "C104ARRIVE$"

gUnknown_Debug_083C14CC:: @ 0x83C14CC
	.string "C105ARRIVE$"

gUnknown_Debug_083C14D7:: @ 0x83C14D7
	.string "C106ARRIVE$"

gUnknown_Debug_083C14E2:: @ 0x83C14E2
	.string "C107ARRIVE$"

gUnknown_Debug_083C14ED:: @ 0x83C14ED
	.string "C108ARRIVE$"

gUnknown_Debug_083C14F8:: @ 0x83C14F8
	.string "C109ARRIVE$"

	.align 2
gUnknown_Debug_083C1503:: @ 0x83C1503
	.4byte gUnknown_Debug_083C14A0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14AB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14B6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14C1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14CC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14D7, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14E2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14ED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C14F8, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C154C:: @ 0x83C154C
	.string "SYSーPOKEMONーGET$"

gUnknown_Debug_083C155C:: @ 0x83C155C
	.string "SYSーZUKANーGET$"

gUnknown_Debug_083C156A:: @ 0x83C156A
	.string "SYSーPOKEGEARーGET$"

gUnknown_Debug_083C157B:: @ 0x83C157B
	.string "SYSーRIBBONーGET$"

	.align 2
gUnknown_Debug_083C158A:: @ 0x83C158A
	.4byte gUnknown_Debug_083C154C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C155C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C156A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C157B, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C15AC:: @ 0x83C15AC
	.string "SYSーGAMEーCLEAR$"

gUnknown_Debug_083C15BB:: @ 0x83C15BB
	.string "SYSーKAIWAーUSED$"

gUnknown_Debug_083C15CA:: @ 0x83C15CA
	.string "SYSーNOWーOYAJIーMEET$"

gUnknown_Debug_083C15DD:: @ 0x83C15DD
	.string "SYSーUSEーWAZAーFLASH$"

gUnknown_Debug_083C15F0:: @ 0x83C15F0
	.string "SYSーUSEーWAZAーKAIRIKI$"

gUnknown_Debug_083C1605:: @ 0x83C1605
	.string "SYSーWEATHERーCTRL$"

gUnknown_Debug_083C1616:: @ 0x83C1616
	.string "SYSーCYCLINGーROAD$"

gUnknown_Debug_083C1627:: @ 0x83C1627
	.string "SYSーSAFARIーMODE$"

gUnknown_Debug_083C1637:: @ 0x83C1637
	.string "SYSーCRUISEーMODE$"

	.align 2
gUnknown_Debug_083C1647:: @ 0x83C1647
	.4byte gUnknown_Debug_083C15AC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C15BB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C15CA, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C15DD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C15F0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1605, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1616, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1627, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1637, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1690:: @ 0x83C1690
	.string "SYSーTVーHOME$"

gUnknown_Debug_083C169C:: @ 0x83C169C
	.string "SYSーTVーWATCH$"

gUnknown_Debug_083C16A9:: @ 0x83C16A9
	.string "SYSーTVSTART$"

gUnknown_Debug_083C16B5:: @ 0x83C16B5
	.string "SYSーPOPWORDーINPUT$"

gUnknown_Debug_083C16C7:: @ 0x83C16C7
	.string "SYSーMIXーRECORD$"

gUnknown_Debug_083C16D6:: @ 0x83C16D6
	.string "SYSーCLOCKーSET$"

gUnknown_Debug_083C16E4:: @ 0x83C16E4
	.string "SYSーCAVEーSHIP$"

gUnknown_Debug_083C16F2:: @ 0x83C16F2
	.string "SYSーCAVEーWONDER$"

gUnknown_Debug_083C1702:: @ 0x83C1702
	.string "SYSーCAVEーBATTLE$"

	.align 2
gUnknown_Debug_083C1712:: @ 0x83C1712
	.4byte gUnknown_Debug_083C1690, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C169C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C16A9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C16B5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C16C7, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C16D6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C16E4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C16F2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1702, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C175C:: @ 0x83C175C
	.string "SYSーSPECIALーZUKAN$"

gUnknown_Debug_083C176E:: @ 0x83C176E
	.string "SYSーASASEーTIDE$"

gUnknown_Debug_083C177D:: @ 0x83C177D
	.string "SYSーRIBBONーGET$"

gUnknown_Debug_083C178C:: @ 0x83C178C
	.string "SYSーPASOーMAYUMI$"

gUnknown_Debug_083C179C:: @ 0x83C179C
	.string "SYSーEXDATAーENABLE$"

gUnknown_Debug_083C17AE:: @ 0x83C17AE
	.string "SYSーTENJIーANAWOHORU$"

gUnknown_Debug_083C17C2:: @ 0x83C17C2
	.string "SYSーTENJIーKAIRIKI$"

gUnknown_Debug_083C17D4:: @ 0x83C17D4
	.string "SYSーTENJIーWAIT$"

gUnknown_Debug_083C17E3:: @ 0x83C17E3
	.string "SYSーTENJIーSORAWOTOBU$"

gUnknown_Debug_083C17F8:: @ 0x83C17F8
	.4byte gUnknown_Debug_083C175C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C176E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C177D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C178C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C179C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C17AE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C17C2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C17D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C17E3, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1840:: @ 0x83C1840
	.string "SYSーENCーUPーITEM$"

gUnknown_Debug_083C1850:: @ 0x83C1850
	.string "SYSーENEーDOWNーITEM$"

gUnknown_Debug_083C1862:: @ 0x83C1862
	.string "SYSーKOKOROーEVENT$"

gUnknown_Debug_083C1873:: @ 0x83C1873
	.string "SYSーMOVEーPOKEーNEWS$"

gUnknown_Debug_083C1886:: @ 0x83C1886
	.string "SYSーASASEーITEM$"

gUnknown_Debug_083C1895:: @ 0x83C1895
	.string "SYSーBーDASH$"

gUnknown_Debug_083C18A0:: @ 0x83C18A0
	.string "SYSーCTRLーOBJーDELETE$"

gUnknown_Debug_083C18B4:: @ 0x83C18B4
	.string "$"

gUnknown_Debug_083C18B5:: @ 0x83C18B5
	.string "$"

	.align 2
gUnknown_Debug_083C18B8:: @ 0x83C18B8
	.4byte gUnknown_Debug_083C1840, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1850, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1862, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1873, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1886, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1895, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C18A0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C18B4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C18B5, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1900:: @ 0x83C1900
	.string "SYSーARRIVEーSUBMARINECAVE$"

gUnknown_Debug_083C1919:: @ 0x83C1919
	.string "SYSーARRIVEーBATTLETOWER$"

gUnknown_Debug_083C1930:: @ 0x83C1930
	.string "SYSーARRIVEーISLAND$"

gUnknown_Debug_083C1942:: @ 0x83C1942
	.string "SYSーARRIVEーLEAGUE$"

gUnknown_Debug_083C1954:: @ 0x83C1954
	.string "SYSーARRIVEーSORANOHASHIRA$"

gUnknown_Debug_083C196D:: @ 0x83C196D
	.string "$"

gUnknown_Debug_083C196E:: @ 0x83C196E
	.string "$"

gUnknown_Debug_083C196F:: @ 0x83C196F
	.string "$"

gUnknown_Debug_083C1970:: @ 0x83C1970
	.string "$"

	.align 2
gDebug_0x83C1974:: @ 0x83C1974
	.4byte gUnknown_Debug_083C1900, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1919, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1930, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1942, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1954, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C196D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C196E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C196F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1970, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C19BC:: @ 0x83C19BC
	.byte 0x08, 0x07, 0x09, 0x04, 0x09, 0x09, 0x09, 0x07, 0x05, 0x00

gUnknown_Debug_083C19C6:: @ 0x83C19C6
	.2byte 0x0807, 0x0808, 0x0809, 0x080a, 0x080b, 0x080c, 0x080d, 0x080e, 0x0000
	.2byte 0x080f, 0x0810, 0x0811, 0x0812, 0x0813, 0x0814, 0x0815, 0x0000, 0x0000
	.2byte 0x0816, 0x0817, 0x0818, 0x0819, 0x081a, 0x081b, 0x081c, 0x081d, 0x081e
	.2byte 0x0800, 0x0801, 0x0802, 0x083b, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.2byte 0x0804, 0x0805, 0x0806, 0x0828, 0x0829, 0x082a, 0x082b, 0x082c, 0x082d
	.2byte 0x0830, 0x0831, 0x0832, 0x0833, 0x0834, 0x0835, 0x0837, 0x0838, 0x0839
	.2byte 0x0836, 0x083a, 0x083b, 0x084b, 0x084c, 0x084f, 0x0850, 0x0851, 0x0852
	.2byte 0x084d, 0x084e, 0x0853, 0x085d, 0x085f, 0x0860, 0x0861, 0x0000, 0x0000
	.2byte 0x0847, 0x0848, 0x0849, 0x0854, 0x085e, 0x0000, 0x0000, 0x0000, 0x0000

gDebug_0x83C1A68:: @ 0x83C1A68
	.string "FVーBALL　パート1$"

	.align 2
gUnknown_Debug_083C1A78:: @ 0x83C1A78
	.4byte gDebug_0x83C1A68, debug_sub_808D8D8+1

gUnknown_Debug_083C1A80:: @ 0x83C1A80
	.string "FVーBALL1ー78$"

gUnknown_Debug_083C1A8C:: @ 0x83C1A8C
	.string "FVーBALL1ー133$"

	.align 2
gUnknown_Debug_083C1A9C:: @ 0x83C1A9C
	.4byte gUnknown_Debug_083C1A80, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1A8C, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1AAC:: @ 0x83C1AAC
	.string "い　ょえヘえ　　　　　　　　　　　　　　"

gUnknown_Debug_083C1AC0:: @ 0x83C1AC0
	.string "ジムリーダー$"

gUnknown_Debug_083C1AC7:: @ 0x83C1AC7
	.string "してんのう$"

gUnknown_Debug_083C1ACD:: @ 0x83C1ACD
	.string "みつる/Champロード$"

	.align 2
gUnknown_Debug_083C1ADC:: @ 0x83C1ADC
	.4byte gUnknown_Debug_083C1AC0, debug_sub_808CD08+1
	.4byte gUnknown_Debug_083C1AC7, debug_sub_808CD60+1
	.4byte gUnknown_Debug_083C1ACD, debug_sub_808CDB8+1

gUnknown_Debug_083C1AF4:: @ 0x83C1AF4
	.string "FTーGYMー01ーLEADER$"

gUnknown_Debug_083C1B05:: @ 0x83C1B05
	.string "FTーGYMー02ーLEADER$"

gUnknown_Debug_083C1B16:: @ 0x83C1B16
	.string "FTーGYMー03ーLEADER$"

gUnknown_Debug_083C1B27:: @ 0x83C1B27
	.string "FTーGYMー04ーLEADER$"

gUnknown_Debug_083C1B38:: @ 0x83C1B38
	.string "FTーGYMー05ーLEADER$"

gUnknown_Debug_083C1B49:: @ 0x83C1B49
	.string "FTーGYMー06ーLEADER$"

gUnknown_Debug_083C1B5A:: @ 0x83C1B5A
	.string "FTーGYMー07ーLEADER$"

gUnknown_Debug_083C1B6B:: @ 0x83C1B6B
	.string "FTーGYMー08ーLEADER$"

gUnknown_Debug_083C1B7C:: @ 0x83C1B7C
	.4byte gUnknown_Debug_083C1AF4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1B05, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1B16, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1B27, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1B38, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1B49, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1B5A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1B6B, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1BBC:: @ 0x83C1BBC
	.string "FTーSHITENー01$"

gUnknown_Debug_083C1BC9:: @ 0x83C1BC9
	.string "FTーSHITENー02$"

gUnknown_Debug_083C1BD6:: @ 0x83C1BD6
	.string "FTーSHITENー03$"

gUnknown_Debug_083C1BE3:: @ 0x83C1BE3
	.string "FTーSHITENー04$"

gUnknown_Debug_083C1BF0:: @ 0x83C1BF0
	.4byte gUnknown_Debug_083C1BBC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1BC9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1BD6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1BE3, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1C10:: @ 0x83C1C10
	.string "FTーMITSURUー01ーCAVEーD1301$"

	.align 2
gUnknown_Debug_083C1C2C:: @ 0x83C1C2C
	.4byte gUnknown_Debug_083C1C10, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1C34:: @ 0x83C1C34
	.string "くえあ　“え’え,えCえGえOえSえZえ　　iえjえkえlえ　　　　　　　　　　mえ　　　　　　　　　　　　　　　　"

gUnknown_Debug_083C1C6E:: @ 0x83C1C6E
	.string "120/119ばんどうろカクレオン$"

gUnknown_Debug_083C1C80:: @ 0x83C1C80
	.string "そのた1　/　SUPPORTM/W$"

gUnknown_Debug_083C1C92:: @ 0x83C1C92
	.string "ODAMAKI/FIGHTER1$"

gUnknown_Debug_083C1CA3:: @ 0x83C1CA3
	.string "MITSURU/TENKI$"

gUnknown_Debug_083C1CB1:: @ 0x83C1CB1
	.string "そのた2　/DAIGO$"

gUnknown_Debug_083C1CBD:: @ 0x83C1CBD
	.string "POKE/POKEMON$"

gUnknown_Debug_083C1CCA:: @ 0x83C1CCA
	.string "MAMA/SUPPORT02$"

gUnknown_Debug_083C1CD9:: @ 0x83C1CD9
	.string "HAGI$"

gUnknown_Debug_083C1CDE:: @ 0x83C1CDE
	.string "SUPPORT01$"

gUnknown_Debug_083C1CE8:: @ 0x83C1CE8
	.4byte gUnknown_Debug_083C1C6E, debug_sub_808C85C+1
	.4byte gUnknown_Debug_083C1C80, debug_sub_808C8B4+1
	.4byte gUnknown_Debug_083C1C92, debug_sub_808C90C+1
	.4byte gUnknown_Debug_083C1CA3, debug_sub_808C964+1
	.4byte gUnknown_Debug_083C1CB1, debug_sub_808C9BC+1
	.4byte gUnknown_Debug_083C1CBD, debug_sub_808CA14+1
	.4byte gUnknown_Debug_083C1CCA, debug_sub_808CA6C+1
	.4byte gUnknown_Debug_083C1CD9, debug_sub_808CAC4+1
	.4byte gUnknown_Debug_083C1CDE, debug_sub_808CB1C+1

gUnknown_Debug_083C1D30:: @ 0x83C1D30
	.string "FVーKAKUREONBー01ーFIELDーR120$"

gUnknown_Debug_083C1D4B:: @ 0x83C1D4B
	.string "FVーKAKUREー01ーFIELDーR120$"

gUnknown_Debug_083C1D63:: @ 0x83C1D63
	.string "FVーKAKUREー02ーFIELDーR120$"

gUnknown_Debug_083C1D7B:: @ 0x83C1D7B
	.string "FVーKAKUREー03ーFIELDーR120$"

gUnknown_Debug_083C1D93:: @ 0x83C1D93
	.string "FVーKAKUREー04ーFIELDーR120$"

gUnknown_Debug_083C1DAB:: @ 0x83C1DAB
	.string "FVーKAKUREー05ーFIELDーR120$"

gUnknown_Debug_083C1DC3:: @ 0x83C1DC3
	.string "FVーKAKUREー06ーFIELDーR120$"

gUnknown_Debug_083C1DDB:: @ 0x83C1DDB
	.string "FVーKAKUREー01ーFIELDーR119$"

gUnknown_Debug_083C1DF3:: @ 0x83C1DF3
	.string "FVーKAKUREー02ーFIELDーR119$"

	.align 2
gUnknown_Debug_083C1E0C:: @ 0x83C1E0C
	.4byte gUnknown_Debug_083C1D30, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1D4B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1D63, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1D7B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1D93, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1DAB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1DC3, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1DDB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1DF3, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1E54:: @ 0x83C1E54
	.string "FVーBALLー01ーC107ーR0501$"

gUnknown_Debug_083C1E6A:: @ 0x83C1E6A
	.string "FVーWORKERM1ー04ーFIELDーC104$"

gUnknown_Debug_083C1E84:: @ 0x83C1E84
	.string "FVーSUBMARINEー06ーCAVEーD1101$"

gUnknown_Debug_083C1E9F:: @ 0x83C1E9F
	.string "FVーGUESTーALLーC106ーR0102$"

gUnknown_Debug_083C1EB7:: @ 0x83C1EB7
	.string "FVーHORIDASIー01ーC106ーR1106$"

gUnknown_Debug_083C1ED1:: @ 0x83C1ED1
	.string "FVーMIDDLEM1ー01ーR110ーR0101$"

gUnknown_Debug_083C1EEB:: @ 0x83C1EEB
	.string "FVーFUNEー01ーC102ーR0601$"

gUnknown_Debug_083C1F01:: @ 0x83C1F01
	.string "FVーSUPPORTWー01ーT101ーR0202$"

gUnknown_Debug_083C1F1B:: @ 0x83C1F1B
	.string "FVーSUPPORTMー01ーT101ーR0102$"

	.align 2
gUnknown_Debug_083C1F38:: @ 0x83C1F38
	.4byte gUnknown_Debug_083C1E54, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1E6A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1E84, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1E9F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1EB7, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1ED1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1EEB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1F01, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1F1B, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C1F80:: @ 0x83C1F80
	.string "FVーODAMAKIー01ーFIELDーR101$"

gUnknown_Debug_083C1F99:: @ 0x83C1F99
	.string "FVーODAMAKIー01ーT101ーR0301$"

gUnknown_Debug_083C1FB2:: @ 0x83C1FB2
	.string "FVーODAMAKIーHYOKAーT101ーR0301$"

gUnknown_Debug_083C1FCE:: @ 0x83C1FCE
	.string "FVーODAMAKIーHYOKAーFIELDーR101$"

gUnknown_Debug_083C1FEA:: @ 0x83C1FEA
	.string "FVーODAMAKIーHYOKAーFIELDーR103$"

gUnknown_Debug_083C2006:: @ 0x83C2006
	.string "FVーODAMAKIー01ーC109ーR0105$"

gUnknown_Debug_083C201F:: @ 0x83C201F
	.string "FVーFIGHTERー01ーCAVEーD0201$"

gUnknown_Debug_083C2038:: @ 0x83C2038
	.string "FVーFIGHTERー01ーT106ーR0201$"

gUnknown_Debug_083C2051:: @ 0x83C2051
	.string "FVーFIGHTERー01ーFIELDーR116$"

	.align 2
gUnknown_Debug_083C206C:: @ 0x83C206C
	.4byte gUnknown_Debug_083C1F80, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1F99, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1FB2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1FCE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C1FEA, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2006, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C201F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2038, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2051, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C20B4:: @ 0x83C20B4
	.string "FVーMITSURUー01ーFIELDーC101$"

gUnknown_Debug_083C20CD:: @ 0x83C20CD
	.string "FVーMITSURUー02ーCAVEーD1301$"

gUnknown_Debug_083C20E6:: @ 0x83C20E6
	.string "FVーMITSURUー01ーFIELDーC103$"

gUnknown_Debug_083C20FF:: @ 0x83C20FF
	.string "FVーMITSURUー01ーT106ーR0201$"

gUnknown_Debug_083C2118:: @ 0x83C2118
	.string "FVーMITSURUー01ーCAVEーD1301$"

gUnknown_Debug_083C2131:: @ 0x83C2131
	.string "FVーMITSURUー01ーC101ーR0201$"

gUnknown_Debug_083C214A:: @ 0x83C214A
	.string "FVーMITSURUー01ーFIELDーR102$"

gUnknown_Debug_083C2163:: @ 0x83C2163
	.string "FVーTENKIー01ーR119ーR101$"

gUnknown_Debug_083C2179:: @ 0x83C2179
	.string "FVーTENKIー01ーR119ーR102$"

	.align 2
gUnknown_Debug_083C2190:: @ 0x83C2190
	.4byte gUnknown_Debug_083C20B4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C20CD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C20E6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C20FF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2118, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2131, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C214A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2163, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2179, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C21D8:: @ 0x83C21D8
	.string "FVーDAIGOー01ーCAVEーD0504$"

gUnknown_Debug_083C21EF:: @ 0x83C21EF
	.string "FVーDAIGOー01ーFIELDーR128$"

gUnknown_Debug_083C2206:: @ 0x83C2206
	.string "FVーDAIGOー01ーFIELDーR118$"

gUnknown_Debug_083C221D:: @ 0x83C221D
	.string "FVーDAIGOー01ーC107ーR0501$"

gUnknown_Debug_083C2234:: @ 0x83C2234
	.string "FVーDAIGOー01ーFIELDーR120$"

gUnknown_Debug_083C224B:: @ 0x83C224B
	.string "FVーDAIGOー01ーFIELDーR108$"

	.align 2
gUnknown_Debug_083C2264:: @ 0x83C2264
	.4byte gUnknown_Debug_083C21D8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C21EF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2206, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C221D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2234, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C224B, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2294:: @ 0x83C2294
	.string "FVーPOKE1ー02ーCAVEーD1111$"

gUnknown_Debug_083C22AB:: @ 0x83C22AB
	.string "FVーPOKE1ー01ーCAVEーD0601$"

gUnknown_Debug_083C22C2:: @ 0x83C22C2
	.string "FVーPOKE1ー02ーCAVEーD0601$"

gUnknown_Debug_083C22D9:: @ 0x83C22D9
	.string "FVーPOKE1ー01ーFIELDーR101$"

gUnknown_Debug_083C22F0:: @ 0x83C22F0
	.string "FVーPOKE1ー01ーOPENINGーROOM01$"

gUnknown_Debug_083C230B:: @ 0x83C230B
	.string "FVーPOKE1ー02ーOPENINGーROOM01$"

gUnknown_Debug_083C2326:: @ 0x83C2326
	.string "FVーPOKE1ー01ーCAVEーD2308$"

gUnknown_Debug_083C233D:: @ 0x83C233D
	.string "FVーPOKEMONー01ーCAVEーD0201$"

gUnknown_Debug_083C2356:: @ 0x83C2356
	.string "FVーPOKEMONー01ーR104ーR0101$"

	.align 2
gUnknown_Debug_083C2370:: @ 0x83C2370
	.4byte gUnknown_Debug_083C2294, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C22AB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C22C2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C22D9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C22F0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C230B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2326, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C233D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2356, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C23B8:: @ 0x83C23B8
	.string "FVーMAMAー01ーFIELDーT101$"

gUnknown_Debug_083C23CE:: @ 0x83C23CE
	.string "FVーMAMAー01ーOPENINGーROOM02$"

gUnknown_Debug_083C23E8:: @ 0x83C23E8
	.string "FVーMAMAー01ーT101ーR0101$"

gUnknown_Debug_083C23FE:: @ 0x83C23FE
	.string "FVーMAMAー01ーT101ーR0201$"

gUnknown_Debug_083C2414:: @ 0x83C2414
	.string "FVーMAMAー02ーT101ーR0101$"

gUnknown_Debug_083C242A:: @ 0x83C242A
	.string "FVーMAMAー02ーT101ーR0201$"

gUnknown_Debug_083C2440:: @ 0x83C2440
	.string "FVーSUPPORTー02ーFIELDーR110$"

gUnknown_Debug_083C2459:: @ 0x83C2459
	.string "FVーSUPPORTー02ーFIELDーR119$"

gUnknown_Debug_083C2472:: @ 0x83C2472
	.string "FVーSUPPORTー02ーFIELDーT104$"

	.align 2
gUnknown_Debug_083C248C:: @ 0x83C248C
	.4byte gUnknown_Debug_083C23B8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C23CE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C23E8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C23FE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2414, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C242A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2440, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2459, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2472, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C24D4:: @ 0x83C24D4
	.string "FVーHAGIー01ーFIELDーR104$"

gUnknown_Debug_083C24EA:: @ 0x83C24EA
	.string "FVーHAGIー01ーR104ーR0101$"

gUnknown_Debug_083C2500:: @ 0x83C2500
	.string "FVーHAGIー01ーFIELDーT103$"

gUnknown_Debug_083C2516:: @ 0x83C2516
	.string "FVーHAGIー01ーFIELDーR109$"

gUnknown_Debug_083C252C:: @ 0x83C252C
	.string "FVーHAGIー01ーC102ーR0601$"

gUnknown_Debug_083C2542:: @ 0x83C2542
	.string "FVーHAGIー01ーC102ーR0101$"

gUnknown_Debug_083C2558:: @ 0x83C2558
	.string "FVーHAGIー01ーCAVEーD0201$"

gUnknown_Debug_083C256E:: @ 0x83C256E
	.string "FVーHAGIー01ーFIELDーR116$"

gUnknown_Debug_083C2584:: @ 0x83C2584
	.string "FVーHAGIー01ーSPーSHIP01$"

	.align 2
gUnknown_Debug_083C259C:: @ 0x83C259C
	.4byte gUnknown_Debug_083C24D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C24EA, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2500, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2516, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C252C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2542, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2558, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C256E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2584, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C25E4:: @ 0x83C25E4
	.string "FVーSUPPORTー01ーT101ーR0301$"

gUnknown_Debug_083C25FD:: @ 0x83C25FD
	.string "FVーSUPPORTー01ーC109ーR0105$"

gUnknown_Debug_083C2616:: @ 0x83C2616
	.string "FVーSUPPORTー01ーFIELDーC104$"

gUnknown_Debug_083C262F:: @ 0x83C262F
	.string "FVーSUPPORTー01ーFIELDーC106$"

gUnknown_Debug_083C2648:: @ 0x83C2648
	.string "FVーSUPPORTー01ーFIELDーR103$"

gUnknown_Debug_083C2661:: @ 0x83C2661
	.string "FVーSUPPORTー01ーFIELDーR110$"

gUnknown_Debug_083C267A:: @ 0x83C267A
	.string "FVーSUPPORTー01ーFIELDーR119$"

gUnknown_Debug_083C2693:: @ 0x83C2693
	.string "FVーSUPPORTー01ーFIELDーT104$"

gUnknown_Debug_083C26AC:: @ 0x83C26AC
	.string "FVーSUPPORTー01ーFIELDーT102$"

	.align 2
gUnknown_Debug_083C26C8:: @ 0x83C26C8
	.4byte gUnknown_Debug_083C25E4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C25FD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2616, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C262F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2648, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2661, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C267A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2693, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C26AC, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2710:: @ 0x83C2710
	.string "けけけけかけけけけ　aうPうbうeうfうgうhうiうjうNうhいZうプうHうネうイうXい{0xF8}いVいWいィうゥうェうベうらうりうンうbい▶いやうようコうツうテうワうヲうだうぢうLうMうRうSう　　　　　　iいmいxいzいÖいÜいおうミうムう:いöいüい{0xF7}いせうそうボうパう1うnいoいpいqいぽうナうマうロう♀うルうブうんうQうYいビうウう0うYう"

gUnknown_Debug_083C27BC:: @ 0x83C27BC
	.string "FEひでんわざ/デボンかんれん$"

gUnknown_Debug_083C27CC:: @ 0x83C27CC
	.string "FEだいじなアイテムPART1$"

gUnknown_Debug_083C27DC:: @ 0x83C27DC
	.string "そのた1$"

gUnknown_Debug_083C27E1:: @ 0x83C27E1
	.string "MITSURU/DOOR$"

gUnknown_Debug_083C27EE:: @ 0x83C27EE
	.string "カラクリやしき10のやじるし/GYM07$"

gUnknown_Debug_083C2803:: @ 0x83C2803
	.string "SUPPORT/そのた4$"

gUnknown_Debug_083C2810:: @ 0x83C2810
	.string "DAISUKI/そのた5$"

gUnknown_Debug_083C281D:: @ 0x83C281D
	.string "そのた2$"

gUnknown_Debug_083C2822:: @ 0x83C2822
	.string "そのた6$"

	.align 2
gUnknown_Debug_083C2828:: @ 0x83C2828
	.4byte gUnknown_Debug_083C27BC, debug_sub_808C3B0+1
	.4byte gUnknown_Debug_083C27CC, debug_sub_808C408+1
	.4byte gUnknown_Debug_083C27DC, debug_sub_808C460+1
	.4byte gUnknown_Debug_083C27E1, debug_sub_808C4B8+1
	.4byte gUnknown_Debug_083C27EE, debug_sub_808C510+1
	.4byte gUnknown_Debug_083C2803, debug_sub_808C568+1
	.4byte gUnknown_Debug_083C2810, debug_sub_808C5C0+1
	.4byte gUnknown_Debug_083C281D, debug_sub_808C618+1
	.4byte gUnknown_Debug_083C2822, debug_sub_808C670+1

gUnknown_Debug_083C2870:: @ 0x83C2870
	.string "FEーHWAZA01ーGET$"

gUnknown_Debug_083C287F:: @ 0x83C287F
	.string "FEーHWAZA02ー01ーFIELDR119$"

gUnknown_Debug_083C2897:: @ 0x83C2897
	.string "FEーHWAZA03ーGET$"

gUnknown_Debug_083C28A6:: @ 0x83C28A6
	.string "FEーHWAZA04ー01ーT106ーR0201$"

gUnknown_Debug_083C28BF:: @ 0x83C28BF
	.string "FEーHWAZA05ー01ーCAVEーD0502$"

gUnknown_Debug_083C28D8:: @ 0x83C28D8
	.string "FEーHWAZA04ー01ーC103ーR0301$"

gUnknown_Debug_083C28F1:: @ 0x83C28F1
	.string "FEーDEBONーNIMOTSUーRETURN$"

gUnknown_Debug_083C2909:: @ 0x83C2909
	.string "FEーDEBONー01ーFIELDーC104$"

gUnknown_Debug_083C2920:: @ 0x83C2920
	.string "FEーDEBONー02ーFIELDーC104$"

	.align 2
gUnknown_Debug_083C2938:: @ 0x83C2938
	.4byte gUnknown_Debug_083C2870, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C287F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2897, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C28A6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C28BF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C28D8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C28F1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2909, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2920, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2980:: @ 0x83C2980
	.string "FEーCYCLEー01ーP01ーP01ーC103ーR0201$"

gUnknown_Debug_083C299F:: @ 0x83C299F
	.string "FEーSCOOPー01ーP01ーFIELDーR115$"

gUnknown_Debug_083C29BA:: @ 0x83C29BA
	.string "FEーROPEー01ーP01ーFIELDーR114$"

gUnknown_Debug_083C29D4:: @ 0x83C29D4
	.string "FEーKAMAー01ーP01ーFIELDーR119$"

gUnknown_Debug_083C29EE:: @ 0x83C29EE
	.string "FEーZYOUROーGET$"

gUnknown_Debug_083C29FC:: @ 0x83C29FC
	.string "FEーCUBECASEーGET$"

gUnknown_Debug_083C2A0C:: @ 0x83C2A0C
	.string "FEーBORONOTURIZAOーGET$"

gUnknown_Debug_083C2A21:: @ 0x83C2A21
	.string "FEーIITURIZAOーGET$"

gUnknown_Debug_083C2A32:: @ 0x83C2A32
	.string "FEーSUGOITURIZAOーGET$"

	.align 2
gUnknown_Debug_083C2A48:: @ 0x83C2A48
	.4byte gUnknown_Debug_083C2980, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C299F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C29BA, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C29D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C29EE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C29FC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2A0C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2A21, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2A32, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2A90:: @ 0x83C2A90
	.string "FEーBOSSー01ーCAVEーD0701$"

gUnknown_Debug_083C2AA6:: @ 0x83C2AA6
	.string "FEーTANTIKIーRETURN$"

gUnknown_Debug_083C2AB8:: @ 0x83C2AB8
	.string "FEーPOKE1ー01ーCAVEーD1111$"

gUnknown_Debug_083C2ACF:: @ 0x83C2ACF
	.string "FEーPOKE1ー01ーCAVEーD1206$"

gUnknown_Debug_083C2AE6:: @ 0x83C2AE6
	.string "FEーSHOPー01ーC104ーFS01$"

gUnknown_Debug_083C2AFB:: @ 0x83C2AFB
	.string "FEーHUNENOTIKETTーGET$"

gUnknown_Debug_083C2B0F:: @ 0x83C2B0F
	.string "FEーKAKUREー01ーFIELDーC105$"

gUnknown_Debug_083C2B27:: @ 0x83C2B27
	.string "FEーKASEKIーRETURN$"

gUnknown_Debug_083C2B38:: @ 0x83C2B38
	.string "FEーWINー01ーSPーSHIP01$"

gUnknown_Debug_083C2B4C:: @ 0x83C2B4C
	.4byte gUnknown_Debug_083C2A90, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2AA6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2AB8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2ACF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2AE6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2AFB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2B0F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2B27, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2B38, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2B94:: @ 0x83C2B94
	.string "FEーMITSURUー01ーT106ーR0201$"

gUnknown_Debug_083C2BAD:: @ 0x83C2BAD
	.string "FEーMITSURUー01ーCAVEーD1301$"

gUnknown_Debug_083C2BC6:: @ 0x83C2BC6
	.string "FEーMITSURUー02ーFIELDーC103$"

gUnknown_Debug_083C2BDF:: @ 0x83C2BDF
	.string "FEーMITSURUー02ーT106ーR0201$"

gUnknown_Debug_083C2BF8:: @ 0x83C2BF8
	.string "FEーMITSURUー01ーFIELDーC103$"

gUnknown_Debug_083C2C11:: @ 0x83C2C11
	.string "FEーDOORーOPENー01ーCAVEーD1712$"

gUnknown_Debug_083C2C2C:: @ 0x83C2C2C
	.string "FEーDOORーOPENー02ーCAVEーD1712$"

gUnknown_Debug_083C2C47:: @ 0x83C2C47
	.string "FEーDOORーOPENー04ーCAVEーD1712$"

gUnknown_Debug_083C2C62:: @ 0x83C2C62
	.string "FEーDOORーOPENー06ーCAVEーD1712$"

	.align 2
gUnknown_Debug_083C2C80:: @ 0x83C2C80
	.4byte gUnknown_Debug_083C2B94, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2BAD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2BC6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2BDF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2BF8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2C11, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2C2C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2C47, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2C62, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2CC8:: @ 0x83C2CC8
	.string "FEーKARAKURI10ーSWITCHー01$"

gUnknown_Debug_083C2CE0:: @ 0x83C2CE0
	.string "FEーKARAKURI10ーSWITCHー02$"

gUnknown_Debug_083C2CF8:: @ 0x83C2CF8
	.string "FEーKARAKURI10ーSWITCHー03$"

gUnknown_Debug_083C2D10:: @ 0x83C2D10
	.string "FEーKARAKURI10ーSWITCHー04$"

gUnknown_Debug_083C2D28:: @ 0x83C2D28
	.string "FEーKARAKURI10ーSWITCHー05$"

gUnknown_Debug_083C2D40:: @ 0x83C2D40
	.string "FEーGYM07ーSWITCHー01$"

gUnknown_Debug_083C2D53:: @ 0x83C2D53
	.string "FEーGYM07ーSWITCHー02$"

gUnknown_Debug_083C2D66:: @ 0x83C2D66
	.string "FEーGYM07ーSWITCHー03$"

gUnknown_Debug_083C2D79:: @ 0x83C2D79
	.string "FEーGYM07ーSWITCHー04$"

gUnknown_Debug_083C2D8C:: @ 0x83C2D8C
	.4byte gUnknown_Debug_083C2CC8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2CE0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2CF8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2D10, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2D28, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2D40, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2D53, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2D66, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2D79, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2DD4:: @ 0x83C2DD4
	.string "FEーSUPPORTー01ーFIELDーR103$"

gUnknown_Debug_083C2DED:: @ 0x83C2DED
	.string "FEーSUPPORTー01ーFIELDーC106$"

gUnknown_Debug_083C2E06:: @ 0x83C2E06
	.string "FEーSUPPORTー01ーFIELDーR104$"

gUnknown_Debug_083C2E1F:: @ 0x83C2E1F
	.string "FEーSUPPORTー02ーFIELDーC106$"

gUnknown_Debug_083C2E38:: @ 0x83C2E38
	.string "FEーSUPPORTー01ーT101ーR0202$"

gUnknown_Debug_083C2E51:: @ 0x83C2E51
	.string "FEーMAMAー01ーP01ーT101ーR0101$"

gUnknown_Debug_083C2E6B:: @ 0x83C2E6B
	.string "FEーCLOCKーSET$"

gUnknown_Debug_083C2E78:: @ 0x83C2E78
	.string "FEーODAMAKIー01ーP01ーT101ーR03$"

gUnknown_Debug_083C2E93:: @ 0x83C2E93
	.string "FEーPAPAー01ーP01ーC101ーR0201$"

	.align 2
gUnknown_Debug_083C2EB0:: @ 0x83C2EB0
	.4byte gUnknown_Debug_083C2DD4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2DED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2E06, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2E1F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2E38, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2E51, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2E6B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2E78, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2E93, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C2EF8:: @ 0x83C2EF8
	.string "FEーDAISUKIーGOODSーFLAG01$"

gUnknown_Debug_083C2F10:: @ 0x83C2F10
	.string "FEーDAISUKIーGOODSーFLAG02$"

gUnknown_Debug_083C2F28:: @ 0x83C2F28
	.string "FEーDAISUKIーGOODSーFLAG03$"

gUnknown_Debug_083C2F40:: @ 0x83C2F40
	.string "FEーDAISUKIーGOODSーFLAG04$"

gUnknown_Debug_083C2F58:: @ 0x83C2F58
	.string "FEーDAISUKIーGOODSーFLAG05$"

gUnknown_Debug_083C2F70:: @ 0x83C2F70
	.string "FEーBASHAー01ーP01ーFIELDーC101ー$"

gUnknown_Debug_083C2F8C:: @ 0x83C2F8C
	.string "FEーBASHAー01ーP02ーFIELDーC101ー$"

gUnknown_Debug_083C2FA8:: @ 0x83C2FA8
	.string "FEーBALLー01ーP01ーSPーCONTEST$"

gUnknown_Debug_083C2FC2:: @ 0x83C2FC2
	.string "FEーWOMAN2ー01ーP01ーT101ーR0201$"

	.align 2
gUnknown_Debug_083C2FE0:: @ 0x83C2FE0
	.4byte gUnknown_Debug_083C2EF8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2F10, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2F28, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2F40, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2F58, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2F70, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2F8C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2FA8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C2FC2, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C3028:: @ 0x83C3028
	.string "FEーSOUKOーOPENーCAVEーD1704$"

gUnknown_Debug_083C3041:: @ 0x83C3041
	.string "FEーSORAISIー01ーCAVEーD0101$"

gUnknown_Debug_083C305A:: @ 0x83C305A
	.string "FEーMAYUMIー01ーーR114ーR0201$"

gUnknown_Debug_083C3073:: @ 0x83C3073
	.string "FEーKUSUNOKIー01ーC102ーR0601$"

gUnknown_Debug_083C308D:: @ 0x83C308D
	.string "FEーOLDWOMAN1ー01ーCAVEーD0808$"

gUnknown_Debug_083C30A8:: @ 0x83C30A8
	.string "FEーTRAINERM1ー01ーC109ーR0206$"

gUnknown_Debug_083C30C3:: @ 0x83C30C3
	.string "FEーSOONANOーTAMAGOーGET$"

gUnknown_Debug_083C30D9:: @ 0x83C30D9
	.string "FEーDASHーSHOESーGET$"

gUnknown_Debug_083C30EB:: @ 0x83C30EB
	.string "FEーDEBONSUKOOPUーGET$"

	.align 2
gUnknown_Debug_083C3100:: @ 0x83C3100
	.4byte gUnknown_Debug_083C3028, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3041, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C305A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3073, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C308D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C30A8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C30C3, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C30D9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C30EB, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C3148:: @ 0x83C3148
	.string "FEーSTUDYM1ー01ーP01ーT101R0301$"

gUnknown_Debug_083C3164:: @ 0x83C3164
	.string "FEーWORKERM1ー01ーC103ーR0201$"

gUnknown_Debug_083C317E:: @ 0x83C317E
	.string "FEーHIMITSUーGET$"

gUnknown_Debug_083C318D:: @ 0x83C318D
	.string "$"

gUnknown_Debug_083C318E:: @ 0x83C318E
	.string "$"

gUnknown_Debug_083C318F:: @ 0x83C318F
	.string "$"

gUnknown_Debug_083C3190:: @ 0x83C3190
	.string "$"

gUnknown_Debug_083C3191:: @ 0x83C3191
	.string "$"

gUnknown_Debug_083C3192:: @ 0x83C3192
	.string "$"

	.align 2
gUnknown_Debug_083C3194:: @ 0x83C3194
	.4byte gUnknown_Debug_083C3148, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3164, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C317E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C318D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C318E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C318F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3190, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3191, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3192, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C31DC:: @ 0x83C31DC
	.string "けけけけけけけけう　グ　ホ　レ　ハ　ヘ　ヒ　ゾ　ズ　ゼ　コ　サ　シ　ス　セ　ソ　ああo　ブ　ゴ　よあゥ　ム　　あもあらあさあ{0xF7}　フ　ン　D　G　ふあ:　Ä　Ö　Ü　H　I　J　K　L　ト　ナ　ニ　ヌ　ェ　ほあみあやあゆあっ　ア　イ　オ　N　O　P　Q　R　ウ　エ　カ　キ　▶　ä　ォ　そあうあきあこあつあへあク　ケ　タ　　　　　　　　　　　　　"

gUnknown_Debug_083C3288:: @ 0x83C3288
	.string "CYCLEかんれん$"

gUnknown_Debug_083C3292:: @ 0x83C3292
	.string "おおきさくらべ$"

gUnknown_Debug_083C329A:: @ 0x83C329A
	.string "カウンタ$"

gUnknown_Debug_083C329F:: @ 0x83C329F
	.string "そのた1$"

gUnknown_Debug_083C32A4:: @ 0x83C32A4
	.string "そのた2$"

	.align 2
gUnknown_Debug_083C32AC:: @ 0x83C32AC
	.4byte gUnknown_Debug_083C3288, debug_sub_808E400+1
	.4byte gUnknown_Debug_083C3292, debug_sub_808E458+1
	.4byte gUnknown_Debug_083C329A, debug_sub_808E4B0+1
	.4byte gUnknown_Debug_083C329F, debug_sub_808E508+1
	.4byte gUnknown_Debug_083C32A4, debug_sub_808E560+1

gUnknown_Debug_083C32D4:: @ 0x83C32D4
	.string "WKーCYCLEーROADーHIT$"

gUnknown_Debug_083C32E6:: @ 0x83C32E6
	.string "WKーCYCLEーROADーTIMエ1$"

gUnknown_Debug_083C32FA:: @ 0x83C32FA
	.string "WKーCYCLEーROADーTIMエ2$"

gUnknown_Debug_083C330E:: @ 0x83C330E
	.string "WKーSIZEーKINOKOKOーOYAJI$"

gUnknown_Debug_083C3325:: @ 0x83C3325
	.string "WKーSIZEーNAMAZOーOYAJI$"

gUnknown_Debug_083C333A:: @ 0x83C333A
	.string "WKーSPRAYーCOUNT$"

gUnknown_Debug_083C3349:: @ 0x83C3349
	.string "WKーICEーCOUNT$"

gUnknown_Debug_083C3356:: @ 0x83C3356
	.string "WKーASHーGATHERーCOUNT$"

gUnknown_Debug_083C336A:: @ 0x83C336A
	.string "WKーCRUISEーCOUNT$"

gUnknown_Debug_083C337A:: @ 0x83C337A
	.string "WKーFRIENDLYーSTEPーCOUNT$"

gUnknown_Debug_083C3391:: @ 0x83C3391
	.string "WKーPOISONーSTEPーCOUNT$"

gUnknown_Debug_083C33A6:: @ 0x83C33A6
	.string "WKRECYCLEーGOODS$"

gUnknown_Debug_083C33B6:: @ 0x83C33B6
	.string "WKーFIRSTーPOKE$"

gUnknown_Debug_083C33C4:: @ 0x83C33C4
	.string "WKーMABOROSIRNDーH$"

gUnknown_Debug_083C33D5:: @ 0x83C33D5
	.string "WKーMABOROSIRNDーL$"

gUnknown_Debug_083C33E6:: @ 0x83C33E6
	.string "EVーONEーDAYーWORK$"

gUnknown_Debug_083C33F6:: @ 0x83C33F6
	.string "EVーFANWORK$"

gUnknown_Debug_083C3401:: @ 0x83C3401
	.string "EVーFANTIME$"

gUnknown_Debug_083C340C:: @ 0x83C340C
	.string "WKーKARAKURIーLEVEL$"

gUnknown_Debug_083C341E:: @ 0x83C341E
	.string "WKーPOKELOTーPRIZE$"

gUnknown_Debug_083C342F:: @ 0x83C342F
	.string "WKーSPECIALーZUKN$"

gUnknown_Debug_083C343F:: @ 0x83C343F
	.string "WKーHYOUKAーDAYS$"

gUnknown_Debug_083C344E:: @ 0x83C344E
	.string "WKーPOKELOTーRND1$"

gUnknown_Debug_083C345E:: @ 0x83C345E
	.string "WKーPOKELOTーRND2$"

gUnknown_Debug_083C346E:: @ 0x83C346E
	.string "WKーBASEーMAPNO$"

	.align 2
gUnknown_Debug_083C347C:: @ 0x83C347C
	.4byte gUnknown_Debug_083C32D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C32E6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C32FA, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C3494::
	.4byte gUnknown_Debug_083C330E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3325, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C34A4::
	.4byte gUnknown_Debug_083C333A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3349, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3356, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C336A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C337A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3391, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C34D4::
	.4byte gUnknown_Debug_083C33A6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33B6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33C4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33D5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33E6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C33F6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3401, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C340C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C341E, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C351C::
	.4byte gUnknown_Debug_083C342F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C343F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C344E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C345E, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C346E, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C3544:: @ 0x83C3544
	.string "ういかけお　らぞりぞるぞ　　　　　　　　　　　　びぞぽぞ　　　　　　　　　　　　　　むぞめぞぶぞぼぞれぞろぞ　　　　　　みぞもぞやぞゆぞぞぞだぞぢぞでぞどぞばぞべぞぱぞぴぞよぞ　　　　　　　　"

gUnknown_Debug_083C35A4:: @ 0x83C35A4
	.string "OBJCHRWORK0ー8$"

gUnknown_Debug_083C35B2:: @ 0x83C35B2
	.string "OBJCHRWORK9ー15$"

	.align 2
gUnknown_Debug_083C35C4:: @ 0x83C35C4
	.4byte gUnknown_Debug_083C35A4, debug_sub_808E9A0+1
	.4byte gUnknown_Debug_083C35B2, debug_sub_808E9F8+1

gUnknown_Debug_083C35D4:: @ 0x83C35D4
	.string "OBJCHRWORK1$"

gUnknown_Debug_083C35E0:: @ 0x83C35E0
	.string "OBJCHRWORK2$"

gUnknown_Debug_083C35EC:: @ 0x83C35EC
	.string "OBJCHRWORK3$"

gUnknown_Debug_083C35F8:: @ 0x83C35F8
	.string "OBJCHRWORK4$"

gUnknown_Debug_083C3604:: @ 0x83C3604
	.string "OBJCHRWORK5$"

gUnknown_Debug_083C3610:: @ 0x83C3610
	.string "OBJCHRWORK6$"

gUnknown_Debug_083C361C:: @ 0x83C361C
	.string "OBJCHRWORK7$"

gUnknown_Debug_083C3628:: @ 0x83C3628
	.string "OBJCHRWORK8$"

gUnknown_Debug_083C3634:: @ 0x83C3634
	.string "OBJCHRWORK9$"

gUnknown_Debug_083C3640:: @ 0x83C3640
	.string "OBJCHRWORK10$"

gUnknown_Debug_083C364D:: @ 0x83C364D
	.string "OBJCHRWORK11$"

gUnknown_Debug_083C365A:: @ 0x83C365A
	.string "OBJCHRWORK12$"

gUnknown_Debug_083C3667:: @ 0x83C3667
	.string "OBJCHRWORK13$"

gUnknown_Debug_083C3674:: @ 0x83C3674
	.string "OBJCHRWORK14$"

gUnknown_Debug_083C3681:: @ 0x83C3681
	.string "OBJCHRWORK15$"

gUnknown_Debug_083C368E:: @ 0x83C368E
	.string "OBJCHRWORK16$"

	.align 2
gUnknown_Debug_083C369C:: @ 0x83C369C
	.4byte gUnknown_Debug_083C35D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C35E0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C35EC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C35F8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3604, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3610, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C361C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3628, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3634, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C36E4::
	.4byte gUnknown_Debug_083C3640, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C364D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C365A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3667, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3674, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3681, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C368E, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C371C:: @ 0x83C371C
	.string "けきたぞちぞつぞてぞとぞなぞにぞぬぞねぞのぞはぞひぞふぞへぞほぞまぞ　　　　"

gUnknown_Debug_083C3742:: @ 0x83C3742
	.string "SP$"

gUnknown_Debug_083C3745:: @ 0x83C3745
	.string "ルーム　R110　PART1/カラクリ$"

gUnknown_Debug_083C3759:: @ 0x83C3759
	.string "ルーム　R110　PART2$"

gUnknown_Debug_083C3768:: @ 0x83C3768
	.string "ルーム　ロード$"

gUnknown_Debug_083C3770:: @ 0x83C3770
	.string "ソノタ1$"

gUnknown_Debug_083C3775:: @ 0x83C3775
	.string "ソノタ2$"

	.align 2
gUnknown_Debug_083C377C:: @ 0x83C377C
	.4byte gUnknown_Debug_083C3742, debug_sub_808E054+1
	.4byte gUnknown_Debug_083C3745, debug_sub_808E0AC+1
	.4byte gUnknown_Debug_083C3759, debug_sub_808E104+1
	.4byte gUnknown_Debug_083C3768, debug_sub_808E15C+1
	.4byte gUnknown_Debug_083C3770, debug_sub_808E1B4+1
	.4byte gUnknown_Debug_083C3775, debug_sub_808E20C+1

gUnknown_Debug_083C37AC:: @ 0x83C37AC
	.string "WKーSCENEーSPーCONTEST$"

gUnknown_Debug_083C37C0:: @ 0x83C37C0
	.string "WKーSCENEーSPーPC$"

gUnknown_Debug_083C37CF:: @ 0x83C37CF
	.string "WKーSCENEーSPーCONTEST03$"

gUnknown_Debug_083C37E5:: @ 0x83C37E5
	.string "WKーSCENEーSPーCONTESTITEM$"

gUnknown_Debug_083C37FD:: @ 0x83C37FD
	.string "WKーSCENEーSPーOPENING$"

gUnknown_Debug_083C3811:: @ 0x83C3811
	.string "WKーSCENEーSPーSHIP01$"

gUnknown_Debug_083C3824:: @ 0x83C3824
	.string "$"

gUnknown_Debug_083C3825:: @ 0x83C3825
	.string "$"

gUnknown_Debug_083C3826:: @ 0x83C3826
	.string "$"

gUnknown_Debug_083C3827:: @ 0x83C3827
	.string "WKーSCENEーR110ーR0101$"

gUnknown_Debug_083C383B:: @ 0x83C383B
	.string "WKーSCENEーR110ーR0102$"

gUnknown_Debug_083C384F:: @ 0x83C384F
	.string "WKーSCENEーR110ーR0103$"

gUnknown_Debug_083C3863:: @ 0x83C3863
	.string "WKーKARAKURIーDAIOU$"

gUnknown_Debug_083C3875:: @ 0x83C3875
	.string "WKーSCENEーSHISEN$"

gUnknown_Debug_083C3885:: @ 0x83C3885
	.string "$"

gUnknown_Debug_083C3886:: @ 0x83C3886
	.string "$"

gUnknown_Debug_083C3887:: @ 0x83C3887
	.string "$"

gUnknown_Debug_083C3888:: @ 0x83C3888
	.string "$"

gUnknown_Debug_083C3889:: @ 0x83C3889
	.string "WKーSCENEーR110ーR0104$"

gUnknown_Debug_083C389D:: @ 0x83C389D
	.string "WKーSCENEーR110ーR0105$"

gUnknown_Debug_083C38B1:: @ 0x83C38B1
	.string "WKーSCENEーR110ーR0106$"

gUnknown_Debug_083C38C5:: @ 0x83C38C5
	.string "WKーSCENEーR110ーR0107$"

gUnknown_Debug_083C38D9:: @ 0x83C38D9
	.string "WKーSCENEーR110ーR0108$"

gUnknown_Debug_083C38ED:: @ 0x83C38ED
	.string "WKーSCENEーR110ーR0109$"

gUnknown_Debug_083C3901:: @ 0x83C3901
	.string "WKーSCENEーR110ーR0110$"

gUnknown_Debug_083C3915:: @ 0x83C3915
	.string "WKーSCENEーR110ーR0111$"

gUnknown_Debug_083C3929:: @ 0x83C3929
	.string "WKーSCENEー02ーR110ーR0110$"

gUnknown_Debug_083C3940:: @ 0x83C3940
	.string "WKーSCENEーR104ーR0101$"

gUnknown_Debug_083C3954:: @ 0x83C3954
	.string "WKーSCENEーR113ーR0101$"

gUnknown_Debug_083C3968:: @ 0x83C3968
	.string "$"

gUnknown_Debug_083C3969:: @ 0x83C3969
	.string "$"

gUnknown_Debug_083C396A:: @ 0x83C396A
	.string "$"

gUnknown_Debug_083C396B:: @ 0x83C396B
	.string "$"

gUnknown_Debug_083C396C:: @ 0x83C396C
	.string "$"

gUnknown_Debug_083C396D:: @ 0x83C396D
	.string "$"

gUnknown_Debug_083C396E:: @ 0x83C396E
	.string "$"

gUnknown_Debug_083C396F:: @ 0x83C396F
	.string "WKーSCENEーBASEーGDOODS$"

gUnknown_Debug_083C3984:: @ 0x83C3984
	.string "WKーSCENEーHAGIーFUNE$"

gUnknown_Debug_083C3997:: @ 0x83C3997
	.string "WKーSCENEーFUNEーPOS$"

gUnknown_Debug_083C39A9:: @ 0x83C39A9
	.string "WKーSCENEーBASEーMAKE$"

gUnknown_Debug_083C39BC:: @ 0x83C39BC
	.string "WKーSCENEーARTISTーC106ーR$"

gUnknown_Debug_083C39D3:: @ 0x83C39D3
	.string "WKーSCENEーPOKEーLEAGUE$"

gUnknown_Debug_083C39E8:: @ 0x83C39E8
	.string "WKーSCENEーROPEWAY$"

gUnknown_Debug_083C39F9:: @ 0x83C39F9
	.string "WKーSCENEーSAFARIーZONE$"

gUnknown_Debug_083C3A0E:: @ 0x83C3A0E
	.string "WKーSCENEーCYCLEーROAD$"

gUnknown_Debug_083C3A22:: @ 0x83C3A22
	.string "WKーSCENEーR119ーTENKI$"

gUnknown_Debug_083C3A36:: @ 0x83C3A36
	.string "WKーSCENEー01ーC102ーR0401$"

gUnknown_Debug_083C3A4D:: @ 0x83C3A4D
	.string "WKーFUTAGOー01ーFIELDーR104$"

gUnknown_Debug_083C3A65:: @ 0x83C3A65
	.string "WKーSCENEーBATTLEーTOWER$"

gUnknown_Debug_083C3A7B:: @ 0x83C3A7B
	.string "WKーSCENEーTRーHOUSE$"

gUnknown_Debug_083C3A8D:: @ 0x83C3A8D
	.string "WKーKASEKIーTYPE$"

gUnknown_Debug_083C3A9C:: @ 0x83C3A9C
	.string "$"

gUnknown_Debug_083C3A9D:: @ 0x83C3A9D
	.string "$"

gUnknown_Debug_083C3A9E:: @ 0x83C3A9E
	.string "$"

	.align 2
gUnknown_Debug_083C3AA0:: @ 0x83C3AA0
	.4byte gUnknown_Debug_083C37AC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37C0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37CF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37E5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C37FD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3811, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3824, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3825, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3AE0:: @ 0x83C3AE0
	.4byte gUnknown_Debug_083C3827, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C383B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C384F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3863, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3875, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3885, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3886, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3887, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3888, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3B28:: @ 0x83C3B28
	.4byte gUnknown_Debug_083C3889, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C389D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38B1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38C5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38D9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C38ED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3901, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3915, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3929, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3B70:: @ 0x83C3B70
	.4byte gUnknown_Debug_083C3940, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3954, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3968, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3969, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C396E, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3BB8::
	.4byte gUnknown_Debug_083C396F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3984, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3997, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39A9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39BC, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39D3, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39E8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C39F9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A0E, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C3C00::
	.4byte gUnknown_Debug_083C3A22, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A36, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A4D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A65, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A7B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A8D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A9C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A9D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3A9E, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C3C48:: @ 0x83C3C48
	.string "かおけいけかョぞガぞギぞゲぞヂぞ’ぞ　　　　　　5ぞGぞ♂ぞ6ぞ4ぞ　　　　　　　　！ぞ？ぞ。ぞーぞ·ぞ‥ぞ“ぞ”ぞ♀ぞゾぞDぞ　　　　　　　　　　　　　　グぞズぞバぞビぞベぞピぞ2ぞ3ぞ8ぞ‘ぞ¥ぞAぞBぞFぞKぞ　　　　　　"

gUnknown_Debug_083C3CBA:: @ 0x83C3CBA
	.string "タウン$"

gUnknown_Debug_083C3CBE:: @ 0x83C3CBE
	.string "シティ$"

gUnknown_Debug_083C3CC2:: @ 0x83C3CC2
	.string "ロード101ー109$"

gUnknown_Debug_083C3CCD:: @ 0x83C3CCD
	.string "ロード110ー118$"

gUnknown_Debug_083C3CD8:: @ 0x83C3CD8
	.string "ロード119ー127$"

gUnknown_Debug_083C3CE3:: @ 0x83C3CE3
	.string "ロード128ー134$"

gUnknown_Debug_083C3CEE:: @ 0x83C3CEE
	.string "ルーム　タウン$"

gUnknown_Debug_083C3CF6:: @ 0x83C3CF6
	.string "ルーム　シティ$"

gUnknown_Debug_083C3CFE:: @ 0x83C3CFE
	.string "ダンジョンない$"

	.align 2
gUnknown_Debug_083C3D08:: @ 0x83C3D08
	.4byte gUnknown_Debug_083C3CBA, debug_sub_808DBA0+1
	.4byte gUnknown_Debug_083C3CBE, debug_sub_808DBF8+1
	.4byte gUnknown_Debug_083C3CC2, debug_sub_808DC50+1
	.4byte gUnknown_Debug_083C3CCD, debug_sub_808DCA8+1
	.4byte gUnknown_Debug_083C3CD8, debug_sub_808DD00+1
	.4byte gUnknown_Debug_083C3CE3, debug_sub_808DD58+1
	.4byte gUnknown_Debug_083C3CEE, debug_sub_808DDB0+1
	.4byte gUnknown_Debug_083C3CF6, debug_sub_808DE08+1
	.4byte gUnknown_Debug_083C3CFE, debug_sub_808DE60+1

gUnknown_Debug_083C3D50:: @ 0x83C3D50
	.string "WKーSCENEーFIELDーT101$"

gUnknown_Debug_083C3D64:: @ 0x83C3D64
	.string "WKーSCENEーFIELDーT102$"

gUnknown_Debug_083C3D78:: @ 0x83C3D78
	.string "WKーSCENEーFIELDーT103$"

gUnknown_Debug_083C3D8C:: @ 0x83C3D8C
	.string "WKーSCENEーFIELDーT104$"

gUnknown_Debug_083C3DA0:: @ 0x83C3DA0
	.string "WKーBASEーPOSNO$"

gUnknown_Debug_083C3DAE:: @ 0x83C3DAE
	.string "WKーSCENEーFIELDーT106$"

gUnknown_Debug_083C3DC2:: @ 0x83C3DC2
	.string "WKーSCENEーFIELDーT107$"

gUnknown_Debug_083C3DD6:: @ 0x83C3DD6
	.string "WKーSCENEー02ーFIELDーT102$"

gUnknown_Debug_083C3DED:: @ 0x83C3DED
	.string "WKーSCENEーFIELDーC101$"

gUnknown_Debug_083C3E01:: @ 0x83C3E01
	.string "WKーSCENEーFIELDーC102$"

gUnknown_Debug_083C3E15:: @ 0x83C3E15
	.string "WKーSCENEーFIELDーC103$"

gUnknown_Debug_083C3E29:: @ 0x83C3E29
	.string "WKーSCENEーFIELDーC104$"

gUnknown_Debug_083C3E3D:: @ 0x83C3E3D
	.string "WKーSCENEーFIELDーC105$"

gUnknown_Debug_083C3E51:: @ 0x83C3E51
	.string "WKーSCENEーFIELDーC106$"

gUnknown_Debug_083C3E65:: @ 0x83C3E65
	.string "WKーSCENEーFIELDーC107$"

gUnknown_Debug_083C3E79:: @ 0x83C3E79
	.string "WKーSCENEーFIELDーC108$"

gUnknown_Debug_083C3E8D:: @ 0x83C3E8D
	.string "WKーSCENEーFIELDーC109$"

gUnknown_Debug_083C3EA1:: @ 0x83C3EA1
	.string "WKーSCENEーFIELDーR101$"

gUnknown_Debug_083C3EB5:: @ 0x83C3EB5
	.string "WKーSCENEーFIELDーR102$"

gUnknown_Debug_083C3EC9:: @ 0x83C3EC9
	.string "WKーSCENEーFIELDーR103$"

gUnknown_Debug_083C3EDD:: @ 0x83C3EDD
	.string "WKーSCENEーFIELDーR104$"

gUnknown_Debug_083C3EF1:: @ 0x83C3EF1
	.string "WKーSCENEーFIELDーR105$"

gUnknown_Debug_083C3F05:: @ 0x83C3F05
	.string "WKーSCENEーFIELDーR106$"

gUnknown_Debug_083C3F19:: @ 0x83C3F19
	.string "WKーSCENEーFIELDーR107$"

gUnknown_Debug_083C3F2D:: @ 0x83C3F2D
	.string "WKーSCENEーFIELDーR108$"

gUnknown_Debug_083C3F41:: @ 0x83C3F41
	.string "WKーSCENEーFIELDーR109$"

gUnknown_Debug_083C3F55:: @ 0x83C3F55
	.string "WKーSCENEーFIELDーR110$"

gUnknown_Debug_083C3F69:: @ 0x83C3F69
	.string "WKーSCENEーFIELDーR111$"

gUnknown_Debug_083C3F7D:: @ 0x83C3F7D
	.string "WKーSCENEーFIELDーR112$"

gUnknown_Debug_083C3F91:: @ 0x83C3F91
	.string "WKーSCENEーFIELDーR113$"

gUnknown_Debug_083C3FA5:: @ 0x83C3FA5
	.string "WKーSCENEーFIELDーR114$"

gUnknown_Debug_083C3FB9:: @ 0x83C3FB9
	.string "WKーSCENEーFIELDーR115$"

gUnknown_Debug_083C3FCD:: @ 0x83C3FCD
	.string "WKーSCENEーFIELDーR116$"

gUnknown_Debug_083C3FE1:: @ 0x83C3FE1
	.string "WKーSCENEーFIELDーR117$"

gUnknown_Debug_083C3FF5:: @ 0x83C3FF5
	.string "WKーSCENEーFIELDーR118$"

gUnknown_Debug_083C4009:: @ 0x83C4009
	.string "WKーSCENEーFIELDーR119$"

gUnknown_Debug_083C401D:: @ 0x83C401D
	.string "WKーSCENEーFIELDーR120$"

gUnknown_Debug_083C4031:: @ 0x83C4031
	.string "WKーSCENEーFIELDーR121$"

gUnknown_Debug_083C4045:: @ 0x83C4045
	.string "WKーSCENEーFIELDーR122$"

gUnknown_Debug_083C4059:: @ 0x83C4059
	.string "WKーSCENEーFIELDーR123$"

gUnknown_Debug_083C406D:: @ 0x83C406D
	.string "WKーSCENEーFIELDーR124$"

gUnknown_Debug_083C4081:: @ 0x83C4081
	.string "WKーSCENEーFIELDーR125$"

gUnknown_Debug_083C4095:: @ 0x83C4095
	.string "WKーSCENEーFIELDーR126$"

gUnknown_Debug_083C40A9:: @ 0x83C40A9
	.string "WKーSCENEーFIELDーR127$"

gUnknown_Debug_083C40BD:: @ 0x83C40BD
	.string "WKーSCENEーFIELDーR128$"

gUnknown_Debug_083C40D1:: @ 0x83C40D1
	.string "WKーSCENEーFIELDーR129$"

gUnknown_Debug_083C40E5:: @ 0x83C40E5
	.string "WKーSCENEーFIELDーR130$"

gUnknown_Debug_083C40F9:: @ 0x83C40F9
	.string "WKーSCENEーFIELDーR131$"

gUnknown_Debug_083C410D:: @ 0x83C410D
	.string "WKーSCENEーFIELDーR132$"

gUnknown_Debug_083C4121:: @ 0x83C4121
	.string "WKーSCENEーFIELDーR133$"

gUnknown_Debug_083C4135:: @ 0x83C4135
	.string "WKーSCENEーFIELDーR134$"

gUnknown_Debug_083C4149:: @ 0x83C4149
	.string "WKーSCENEーT101ーR0101$"

gUnknown_Debug_083C415D:: @ 0x83C415D
	.string "WKーSCENEーT101ーR0102$"

gUnknown_Debug_083C4171:: @ 0x83C4171
	.string "WKーSCENEーT101ーR0301$"

gUnknown_Debug_083C4185:: @ 0x83C4185
	.string "WKーSCENEーT101ーR0201$"

gUnknown_Debug_083C4199:: @ 0x83C4199
	.string "WKーSCENEーT101ーR0202$"

gUnknown_Debug_083C41AD:: @ 0x83C41AD
	.string "WKーSCENEーT107ーR0201$"

gUnknown_Debug_083C41C1:: @ 0x83C41C1
	.string "WKーSCENEーC101ーR0201$"

gUnknown_Debug_083C41D5:: @ 0x83C41D5
	.string "WKーSCENEーC104ーR0103$"

gUnknown_Debug_083C41E9:: @ 0x83C41E9
	.string "WKーSCENEーC103ーR0101$"

gUnknown_Debug_083C41FD:: @ 0x83C41FD
	.string "WKーSCENEーC106ーR0202$"

gUnknown_Debug_083C4211:: @ 0x83C4211
	.string "WKーSCENEーC106ーR0401$"

gUnknown_Debug_083C4225:: @ 0x83C4225
	.string "WKーSCENEーC102ーR0601$"

gUnknown_Debug_083C4239:: @ 0x83C4239
	.string "WKーSCENEーC102ーR0501$"

gUnknown_Debug_083C424D:: @ 0x83C424D
	.string "WKーSCENEーC104ーR0102$"

gUnknown_Debug_083C4261:: @ 0x83C4261
	.string "WKーSCENEーC107ーR0501$"

gUnknown_Debug_083C4275:: @ 0x83C4275
	.string "WKーSCENEーCAVEーD0601$"

gUnknown_Debug_083C4289:: @ 0x83C4289
	.string "WKーSCENEーCAVEーD0201$"

gUnknown_Debug_083C429D:: @ 0x83C429D
	.string "WKーSCENEーCAVEーD1206$"

gUnknown_Debug_083C42B1:: @ 0x83C42B1
	.string "WKーSCENEーCAVEーD1111$"

gUnknown_Debug_083C42C5:: @ 0x83C42C5
	.string "WKーSCENEーCAVEーD0701$"

gUnknown_Debug_083C42D9:: @ 0x83C42D9
	.string "WKーSCENEーCAVEーD0808$"

gUnknown_Debug_083C42ED:: @ 0x83C42ED
	.string "WKーSCENEーCAVEーD1602$"

gUnknown_Debug_083C4301:: @ 0x83C4301
	.string "WKーSCENEーCAVEーD0101$"

gUnknown_Debug_083C4315:: @ 0x83C4315
	.string "WKーSCENEーCAVEーD1301$"

	.align 2
gUnknown_Debug_083C432C:: @ 0x83C432C
	.4byte gUnknown_Debug_083C3D50, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3D64, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3D78, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3D8C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DA0, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DAE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DC2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3DD6, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C436C::
	.4byte gUnknown_Debug_083C3DED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E01, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E15, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E29, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E3D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E51, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E65, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E79, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3E8D, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C43B4::
	.4byte gUnknown_Debug_083C3EA1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EB5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EC9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EDD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3EF1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F05, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F19, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F2D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F41, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C43FC::
	.4byte gUnknown_Debug_083C3F55, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F69, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F7D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3F91, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FA5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FB9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FCD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FE1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C3FF5, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4444::
	.4byte gUnknown_Debug_083C4009, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C401D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4031, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4045, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4059, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C406D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4081, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4095, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40A9, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C448C::
	.4byte gUnknown_Debug_083C40BD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40D1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40E5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C40F9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C410D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4121, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4135, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C44C4::
	.4byte gUnknown_Debug_083C4149, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C415D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4171, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4185, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4199, TomomichiDebugMenu_Config+1

gUnknown_Debug_83C44EC::
	.4byte gUnknown_Debug_083C41C1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C41D5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C41E9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C41FD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4211, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4225, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4239, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C424D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4261, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4534::
	.4byte gUnknown_Debug_083C4275, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4289, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C429D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42B1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42C5, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42D9, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C42ED, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4301, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4315, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C457C:: @ 0x83C457C
	.string "くけけけけきかけけ　っぞアぞイぞウぞエぞオぞカぞMぞ　　キぞクぞケぞコぞサぞシぞスぞセぞソぞタぞチぞツぞテぞトぞナぞニぞヌぞネぞノぞハぞヒぞフぞヘぞホぞマぞミぞムぞメぞモぞヤぞユぞヨぞラぞリぞルぞレぞロぞワぞヲぞンぞァぞィぞゥぞ　　　　ェぞォぞャぞザぞジぞHぞ　　　　　　ュぞゼぞヅぞデぞドぞッぞ9ぞJぞLぞブぞボぞパぞ1ぞ7ぞ×ぞ/ぞEぞIぞ"

gUnknown_Debug_083C4628:: @ 0x83C4628
	.string "LOCALWORK0ー8$"

gUnknown_Debug_083C4635:: @ 0x83C4635
	.string "LOCALWORK9ー15$"

	.align 2
gUnknown_Debug_083C4644:: @ 0x83C4644
	.4byte gUnknown_Debug_083C4628, debug_sub_808E754+1
	.4byte gUnknown_Debug_083C4635, debug_sub_808E7AC+1

gUnknown_Debug_083C4654:: @ 0x83C4654
	.string "LOCALWORK0$"

gUnknown_Debug_083C465F:: @ 0x83C465F
	.string "LOCALWORK1$"

gUnknown_Debug_083C466A:: @ 0x83C466A
	.string "LOCALWORK2$"

gUnknown_Debug_083C4675:: @ 0x83C4675
	.string "LOCALWORK3$"

gUnknown_Debug_083C4680:: @ 0x83C4680
	.string "LOCALWORK4$"

gUnknown_Debug_083C468B:: @ 0x83C468B
	.string "LOCALWORK5$"

gUnknown_Debug_083C4696:: @ 0x83C4696
	.string "LOCALWORK6$"

gUnknown_Debug_083C46A1:: @ 0x83C46A1
	.string "LOCALWORK7$"

gUnknown_Debug_083C46AC:: @ 0x83C46AC
	.string "LOCALWORK8$"

gUnknown_Debug_083C46B7:: @ 0x83C46B7
	.string "LOCALWORK9$"

gUnknown_Debug_083C46C2:: @ 0x83C46C2
	.string "LOCALWORK10$"

gUnknown_Debug_083C46CE:: @ 0x83C46CE
	.string "LOCALWORK11$"

gUnknown_Debug_083C46DA:: @ 0x83C46DA
	.string "LOCALWORK12$"

gUnknown_Debug_083C46E6:: @ 0x83C46E6
	.string "LOCALWORK13$"

gUnknown_Debug_083C46F2:: @ 0x83C46F2
	.string "LOCALWORK14$"

gUnknown_Debug_083C46FE:: @ 0x83C46FE
	.string "LOCALWORK15$"

	.align 2
gUnknown_Debug_083C470C:: @ 0x83C470C
	.4byte gUnknown_Debug_083C4654, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C465F, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C466A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4675, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4680, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C468B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4696, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46A1, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46AC, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4754C::
	.4byte gUnknown_Debug_083C46B7, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46C2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46CE, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46DA, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46E6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46F2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C46FE, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C478C:: @ 0x83C478C
	.string "けき　ぞあぞいぞうぞえぞおぞかぞきぞくぞけぞこぞさぞしぞすぞせぞそぞ　　　　"

gUnknown_Debug_083C47B2::
	.string "Level$"

gUnknown_Debug_083C47B8:: @ 0x83C47B8
	.string "Scene1$"

gUnknown_Debug_083C47BF:: @ 0x83C47BF
	.string "Scene2$"

gUnknown_Debug_083C47C6:: @ 0x83C47C6
	.string "Scene3$"

gUnknown_Debug_083C47CD:: @ 0x83C47CD
	.string "Scene4$"

gUnknown_Debug_083C47D4:: @ 0x83C47D4
	.string "Scene5$"

gUnknown_Debug_083C47DB:: @ 0x83C47DB
	.string "Scene6$"

gUnknown_Debug_083C47E2:: @ 0x83C47E2
	.string "Scene7$"

gUnknown_Debug_083C47E9:: @ 0x83C47E9
	.string "Scene8$"

	.align 2
gUnknown_Debug_083C47F0:: @ 0x83C47F0
	.4byte gUnknown_Debug_083C47B8, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47BF, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47C6, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47CD, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47D4, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47DB, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47E2, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C47E9, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C4830:: @ 0x83C4830
	.string "Trick　Master$"

gUnknown_Debug_083C483D:: @ 0x83C483D
	.string "Hidden　MASTER$"

gUnknown_Debug_083C484B:: @ 0x83C484B
	.string "Inside　the　HOUSE$"

gUnknown_Debug_083C485C:: @ 0x83C485C
	.string "Pass　a　reward$"

gUnknown_Debug_083C486A:: @ 0x83C486A
	.string "Rig　a　trick$"

gUnknown_Debug_083C4876:: @ 0x83C4876
	.string "MASTER　is　gone$"

	.align 2
gUnknown_Debug_083C4888:: @ 0x83C4888
	.4byte gUnknown_Debug_083C483D, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C484B, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C485C, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C486A, TomomichiDebugMenu_Config+1
	.4byte gUnknown_Debug_083C4876, TomomichiDebugMenu_Config+1

gUnknown_Debug_083C48B0:: @ 0x83C48B0
	.string "PMNICKNAME$"

gUnknown_Debug_083C48BB:: @ 0x83C48BB
	.string "BREEDER$"
	.endif
