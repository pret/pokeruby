	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.if DEBUG

	.align 2
gUnknown_Debug_083C48C4:: @ 0x83C48C4
	.string "TV$"

gUnknown_Debug_083C48C7:: @ 0x83C48C7
	.string "Fan$"

gUnknown_Debug_083C48CB:: @ 0x83C48CB
	.string "Battle　(vs　Dad)$"

gUnknown_Debug_083C48DB:: @ 0x83C48DB
	.string "Dad　after　battle$"

gUnknown_Debug_083C48EC:: @ 0x83C48EC
	.string "SOOTOPOLIS　CITY$"

gUnknown_Debug_083C48FC:: @ 0x83C48FC
	.string "Embark$"

gUnknown_Debug_083C4903:: @ 0x83C4903
	.string "Yes　9999$"

gUnknown_Debug_083C490C:: @ 0x83C490C
	.string "Legends　flag　ON$"

gUnknown_Debug_083C491C:: @ 0x83C491C
	.string "Add　num　of　winning　streaks$"

	.align 2
gUnknown_Debug_083C4938:: @ 0x83C4938
	.4byte gUnknown_Debug_083C48C4, NoharaDebugMenu_TV+1
	.4byte gUnknown_Debug_083C48C7, NoharaDebugMenu_Fan+1
	.4byte gUnknown_Debug_083C48CB, NoharaDebugMenu_BattleVSDad+1
	.4byte gUnknown_Debug_083C48DB, NoharaDebugMenu_DadAfterBattle+1
	.4byte gUnknown_Debug_083C48EC, NoharaDebugMenu_SootopolisCity+1
	.4byte gUnknown_Debug_083C48FC, NoharaDebugMenu_Embark+1
	.4byte gUnknown_Debug_083C4903, NoharaDebugMenu_Yes9999+1
	.4byte gUnknown_Debug_083C490C, NoharaDebugMenu_LegendsFlagOn+1
	.4byte gUnknown_Debug_083C491C, NoharaDebugMenu_AddNumWinningStreaks+1

gUnknown_Debug_083C4980:: @ 0x83C4980
	.string "Want　to　change　data　type{CLEAR_TO 143}Press　Left\n"
	.string "to　see　secret　type　now？{CLEAR_TO 143}to　switch$"

gUnknown_Debug_083C49CA:: @ 0x83C49CA
	.string "Choose　the　TV　data　you　wish　to\n"
	.string "create　to　check　a　transmission。$"

gUnknown_Debug_083C4A09:: @ 0x83C4A09
	.string "ほうそうの　はっせいりつを　セット\n"
	.string "してください　？ぶんの1に　なります$"

gUnknown_Debug_083C4A2E:: @ 0x83C4A2E
	.string "SURVEY$"

gUnknown_Debug_083C4A35:: @ 0x83C4A35
	.string "RECENT　HAPPENINGS$"

gUnknown_Debug_083C4A47:: @ 0x83C4A47
	.string "POKひMON　FAN　CLUB$"

gUnknown_Debug_083C4A58:: @ 0x83C4A58
	.string "ジム$"

gUnknown_Debug_083C4A5B:: @ 0x83C4A5B
	.string "OUTBREAKS$"

gUnknown_Debug_083C4A65:: @ 0x83C4A65
	.string "NAME　RATER$"

gUnknown_Debug_083C4A70:: @ 0x83C4A70
	.string "CONTEST$"

gUnknown_Debug_083C4A78:: @ 0x83C4A78
	.string "INTRODUCTION$"

gUnknown_Debug_083C4A85:: @ 0x83C4A85
	.string "SHOPPING$"

gUnknown_Debug_083C4A8E:: @ 0x83C4A8E
	.string "MISFORTUNE$"

gUnknown_Debug_083C4A99:: @ 0x83C4A99
	.string "FISHING$"

gUnknown_Debug_083C4AA1:: @ 0x83C4AA1
	.string "MEMORABLE　DAY$"

gUnknown_Debug_083C4AAF:: @ 0x83C4AAF
	.string "BRAVO　TRAINER$"

gUnknown_Debug_083C4ABD:: @ 0x83C4ABD
	.string "あいうるおかなにぬねのき　　　んぼざくゅぼざくびぼざくサぼざくナぼざくミぼざくリぼざくュぼざくズぼざくベぼざく0ぼざく·ぼざくBIG　SALE$"

gUnknown_Debug_083C4B05:: @ 0x83C4B05
	.string "SERVICE　DAY$"

gUnknown_Debug_083C4B11:: @ 0x83C4B11
	.string "CLEARーOUT　SALE$"

gUnknown_Debug_083C4B20:: @ 0x83C4B20
	.string "あいう　{0xFC}ぼざくおぱざくちぱざく"

gUnknown_Debug_083C4B30:: @ 0x83C4B30
	.string "Secret　type$"

gUnknown_Debug_083C4B3C:: @ 0x83C4B3C
	.string "Start$"

gUnknown_Debug_083C4B42:: @ 0x83C4B42
	.string "Create　TV$"

gUnknown_Debug_083C4B4C:: @ 0x83C4B4C
	.string "All　clear$"

gUnknown_Debug_083C4B56:: @ 0x83C4B56
	.string "All　seen$"

gUnknown_Debug_083C4B5F:: @ 0x83C4B5F
	.string "Create　CM$"

gUnknown_Debug_083C4B69:: @ 0x83C4B69
	.string "Not　yet　seen$"

gUnknown_Debug_083C4B76:: @ 0x83C4B76
	.string "Hit　Table$"

gUnknown_Debug_083C4B80:: @ 0x83C4B80
	.string "Set　full$"

	.align 2
gUnknown_Debug_083C4B8C:: @ 0x83C4B8C
	.4byte gUnknown_Debug_083C4B30, debug_sub_808F4EC+1
	.4byte gUnknown_Debug_083C4B3C, debug_sub_808F8AC+1
	.4byte gUnknown_Debug_083C4B42, debug_sub_808F8CC+1
	.4byte gUnknown_Debug_083C4B4C, debug_sub_808FEBC+1
	.4byte gUnknown_Debug_083C4B56, debug_sub_808F560+1
	.4byte gUnknown_Debug_083C4B5F, debug_sub_808FECC+1
	.4byte gUnknown_Debug_083C4B69, debug_sub_808F594+1
	.4byte gUnknown_Debug_083C4B76, debug_sub_808F5D8+1
	.4byte gUnknown_Debug_083C4B80, debug_sub_80900AC+1

gUnknown_Debug_083C4BD4:: @ 0x83C4BD4
	.string "しえ　　　　　　　　　　しく　　　　　　　　　　しこ　　　　　　　　　　せか　　　　　　　　　　せく　　　　　　　　　　せこ　　　　　　　　　　たえ　　　　　　　　　　たか　　　　　　　　　　たこ　　　　　　　　　　つえ　　　　　　　　　　つか　　　　　　　　　　つこ　　　　　　　　　　"

gUnknown_Debug_083C4C64:: @ 0x83C4C64
	.string "TERUKUN$"

gUnknown_Debug_083C4C6C:: @ 0x83C4C6C
	.string "TERUTERUDA$"

gUnknown_Debug_083C4C77:: @ 0x83C4C77
	.string "1　スクル$"

gUnknown_Debug_083C4C7D:: @ 0x83C4C7D
	.string "2　ミドル$"

gUnknown_Debug_083C4C83:: @ 0x83C4C83
	.string "3　オジヨ$"

gUnknown_Debug_083C4C89:: @ 0x83C4C89
	.string "4　ボーヤ$"

gUnknown_Debug_083C4C8F:: @ 0x83C4C8F
	.string "5　ボーイ$"

gUnknown_Debug_083C4C95:: @ 0x83C4C95
	.string "6　ヤング$"

gUnknown_Debug_083C4C9B:: @ 0x83C4C9B
	.string "7　ヲーカ$"

gUnknown_Debug_083C4CA1:: @ 0x83C4CA1
	.string "8　オルド$"

	.align 2
gUnknown_Debug_083C4CA8:: @ 0x83C4CA8
	.4byte gUnknown_Debug_083C4C77, gUnknown_Debug_083C4C7D
	.4byte gUnknown_Debug_083C4C83, gUnknown_Debug_083C4C89
	.4byte gUnknown_Debug_083C4C8F, gUnknown_Debug_083C4C95
	.4byte gUnknown_Debug_083C4C9B, gUnknown_Debug_083C4CA1

gUnknown_Debug_083C4CC8:: @ 0x83C4CC8
	.string "Start$"

gUnknown_Debug_083C4CCE:: @ 0x83C4CCE
	.string "Increase$"

gUnknown_Debug_083C4CD7:: @ 0x83C4CD7
	.string "Reduce$"

gUnknown_Debug_083C4CDE:: @ 0x83C4CDE
	.string "Points$"

gUnknown_Debug_083C4CE5:: @ 0x83C4CE5
	.string "Play　time　6$"

gUnknown_Debug_083C4CF1:: @ 0x83C4CF1
	.string "P　ELITE　FOUR$"

gUnknown_Debug_083C4CFE:: @ 0x83C4CFE
	.string "P　SECRET　BASE$"

gUnknown_Debug_083C4D0C:: @ 0x83C4D0C
	.string "P　CONTEST$"

gUnknown_Debug_083C4D16:: @ 0x83C4D16
	.string "P　BATTLE　TOWER$"

	.align 2
gUnknown_Debug_083C4D28:: @ 0x83C4D28
	.4byte gUnknown_Debug_083C4CC8, debug_sub_80901E4+1
	.4byte gUnknown_Debug_083C4CCE, debug_sub_80901F8+1
	.4byte gUnknown_Debug_083C4CD7, debug_sub_8090238+1
	.4byte gUnknown_Debug_083C4CDE, debug_sub_809029C+1
	.4byte gUnknown_Debug_083C4CE5, debug_sub_80902E4+1
	.4byte gUnknown_Debug_083C4CF1, debug_sub_80902FC+1
	.4byte gUnknown_Debug_083C4CFE, debug_sub_8090310+1
	.4byte gUnknown_Debug_083C4D0C, debug_sub_8090324+1
	.4byte gUnknown_Debug_083C4D16, debug_sub_8090338+1

	.endif
