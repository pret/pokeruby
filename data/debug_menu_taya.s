	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.ifdef DEBUG

gUnknown_Debug_083C4E54:: @ 0x83C4E54
	.string "Profile$"

gUnknown_Debug_083C4E5C:: @ 0x83C4E5C
	.string "Battle’s　start$"

gUnknown_Debug_083C4E6B:: @ 0x83C4E6B
	.string "Good　saying$"

gUnknown_Debug_083C4E77:: @ 0x83C4E77
	.string "Lose　a　battle$"

gUnknown_Debug_083C4E85:: @ 0x83C4E85
	.string "MAIL$"

gUnknown_Debug_083C4E8A:: @ 0x83C4E8A
	.string "MAIL　salutation$"

gUnknown_Debug_083C4E9A:: @ 0x83C4E9A
	.string "BARD’s　song$"

gUnknown_Debug_083C4EA6:: @ 0x83C4EA6
	.string "Interview$"

gUnknown_Debug_083C4EB0:: @ 0x83C4EB0
	.string "InterviewシBTス$"

	.align 2
gUnknown_Debug_083C4EC0:: @ 0x83C4EC0
	.4byte gUnknown_Debug_083C4E54, 0x0
	.4byte gUnknown_Debug_083C4E5C, 0x1
	.4byte gUnknown_Debug_083C4E6B, 0xD
	.4byte gUnknown_Debug_083C4E77, 0x3
	.4byte gUnknown_Debug_083C4E85, 0x4
	.4byte gUnknown_Debug_083C4E8A, 0x5
	.4byte gUnknown_Debug_083C4E9A, 0x6
	.4byte gUnknown_Debug_083C4EA6, 0x7
	.4byte gUnknown_Debug_083C4EB0, 0xC

gUnknown_Debug_083C4F08:: @ 0x83C4F08
	.string "サえぃえそい"

gUnknown_Debug_083C4F0E:: @ 0x83C4F0E
	.string "BARD$"

gUnknown_Debug_083C4F13:: @ 0x83C4F13
	.string "HIPSTER$"

gUnknown_Debug_083C4F1B:: @ 0x83C4F1B
	.string "RECYCLE$"

gUnknown_Debug_083C4F23:: @ 0x83C4F23
	.string "STORYTELLER$"

gUnknown_Debug_083C4F2F:: @ 0x83C4F2F
	.string "GIDDY　GUY$"

gUnknown_Debug_083C4F39:: @ 0x83C4F39
	.string "Flag　OFF$"

gUnknown_Debug_083C4F42:: @ 0x83C4F42
	.string "21　letters$"

gUnknown_Debug_083C4F4D:: @ 0x83C4F4D
	.string "ナウくなる$"

	.align 2
gUnknown_Debug_083C4F54:: @ 0x83C4F54
	.4byte gUnknown_Debug_083C4F0E, 0x0
	.4byte gUnknown_Debug_083C4F13, 0x0
	.4byte gUnknown_Debug_083C4F1B, 0x0
	.4byte gUnknown_Debug_083C4F23, 0x0
	.4byte gUnknown_Debug_083C4F2F, 0x0
	.4byte gUnknown_Debug_083C4F39, 0x0
	.4byte gUnknown_Debug_083C4F42, 0x0
	.4byte gUnknown_Debug_083C4F4D, 0x0

gUnknown_Debug_083C4F94:: @ 0x83C4F94
	.string "しょうしょうおまちください！$"

gUnknown_Debug_083C4FA3:: @ 0x83C4FA3
	.string "Weather$"

gUnknown_Debug_083C4FAB:: @ 0x83C4FAB
	.string "LANETTE’S　PC$"

gUnknown_Debug_083C4FB8:: @ 0x83C4FB8
	.string "SimpleText$"

gUnknown_Debug_083C4FC3:: @ 0x83C4FC3
	.string "Old　man$"

gUnknown_Debug_083C4FCB:: @ 0x83C4FCB
	.string "Trend$"

gUnknown_Debug_083C4FD1:: @ 0x83C4FD1
	.string "Trend　R$"

gUnknown_Debug_083C4FD9:: @ 0x83C4FD9
	.string "Town　flag$"

gUnknown_Debug_083C4FE3:: @ 0x83C4FE3
	.string "Award　a　ribbon$"

gUnknown_Debug_083C4FF2:: @ 0x83C4FF2
	.string "{PKMN}LOTTERY$"

gUnknown_Debug_083C4FFC:: @ 0x83C4FFC
	.string "Trainer$"

gUnknown_Debug_083C5004:: @ 0x83C5004
	.string "POKéNAV　D$"

	.align 2
gUnknown_Debug_083C5010:: @ 0x83C5010
	.4byte gUnknown_Debug_083C4FA3, debug_sub_808560C+1
	.4byte gUnknown_Debug_083C4FAB, TayaDebugMenu_LanettesPC+1
	.4byte gUnknown_Debug_083C4FB8, TayaDebugMenu_SimpleText+1
	.4byte gUnknown_Debug_083C4FC3, TayaDebugMenu_OldMan+1
	.4byte gUnknown_Debug_083C4FCB, TayaDebugMenu_Trend+1
	.4byte gUnknown_Debug_083C4FD1, TayaDebugMenu_TrendR+1
	.4byte gUnknown_Debug_083C4FD9, TayaDebugMenu_TownFlags+1
	.4byte gUnknown_Debug_083C4FE3, TayaDebugMenu_AwardARibbon+1
	.4byte gUnknown_Debug_083C4FF2, TayaDebugMenu_PKMNLottery+1

gUnknown_Debug_083C5058:: @ 0x83C5058
	.4byte gUnknown_Debug_083C4FFC, TayaDebugMenu_Trainer+1
	.4byte gUnknown_Debug_083C5004, TayaDebugMenu_PokenavD+1

gUnknown_Debug_83C5068::
	.4byte gUnknown_Debug_083C5010, 0x9
	.4byte gUnknown_Debug_083C5058, 0x2

gUnknown_Debug_083C5078:: @ 0x83C5078
	.string "CHANP$"

gUnknown_Debug_083C507E:: @ 0x83C507E
	.string "COOL$"

gUnknown_Debug_083C5083:: @ 0x83C5083
	.string "BEAUTY$"

gUnknown_Debug_083C508A:: @ 0x83C508A
	.string "CUTE$"

gUnknown_Debug_083C508F:: @ 0x83C508F
	.string "SMART$"

gUnknown_Debug_083C5095:: @ 0x83C5095
	.string "TOUGH$"

gUnknown_Debug_083C509B:: @ 0x83C509B
	.string "WIN$"

gUnknown_Debug_083C509F:: @ 0x83C509F
	.string "VICTORY$"

gUnknown_Debug_083C50A7:: @ 0x83C50A7
	.string "BROMIDE$"

gUnknown_Debug_083C50AF:: @ 0x83C50AF
	.string "ACCESSIT$"

gUnknown_Debug_083C50B8:: @ 0x83C50B8
	.string "MARINE$"

gUnknown_Debug_083C50BF:: @ 0x83C50BF
	.string "LAND$"

gUnknown_Debug_083C50C4:: @ 0x83C50C4
	.string "SKY$"

gUnknown_Debug_083C50C8:: @ 0x83C50C8
	.string "COUNTRY$"

gUnknown_Debug_083C50D0:: @ 0x83C50D0
	.string "NATIONAL$"

gUnknown_Debug_083C50D9:: @ 0x83C50D9
	.string "EARTH$"

gUnknown_Debug_083C50DF:: @ 0x83C50DF
	.string "WORLD$"

gUnknown_Debug_083C50E5:: @ 0x83C50E5
	.string "　　　　　$"

	.align 2
gUnknown_Debug_083C50EC:: @ 0x83C50EC
	.4byte gUnknown_Debug_083C5078, 0x43
	.4byte gUnknown_Debug_083C507E, 0x32
	.4byte gUnknown_Debug_083C5083, 0x33
	.4byte gUnknown_Debug_083C508A, 0x34
	.4byte gUnknown_Debug_083C508F, 0x35
	.4byte gUnknown_Debug_083C5095, 0x36
	.4byte gUnknown_Debug_083C509B, 0x44
	.4byte gUnknown_Debug_083C509F, 0x45
	.4byte gUnknown_Debug_083C50A7, 0x46
	.4byte gUnknown_Debug_083C50AF, 0x47
	.4byte gUnknown_Debug_083C50B8, 0x48
	.4byte gUnknown_Debug_083C50BF, 0x49
	.4byte gUnknown_Debug_083C50C4, 0x4A
	.4byte gUnknown_Debug_083C50C8, 0x4B
	.4byte gUnknown_Debug_083C50D0, 0x4C
	.4byte gUnknown_Debug_083C50D9, 0x4D
	.4byte gUnknown_Debug_083C50DF, 0x4E
	.4byte gUnknown_Debug_083C50E5, 0x0

gUnknown_Debug_083C517C:: @ 0x83C517C
	.string "Select　Ribbon$"

	.endif
