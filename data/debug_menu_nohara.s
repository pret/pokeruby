	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.if DEBUG

	.align 2

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
	.4byte gUnknown_Debug_083C4C77
	.4byte gUnknown_Debug_083C4C7D
	.4byte gUnknown_Debug_083C4C83
	.4byte gUnknown_Debug_083C4C89
	.4byte gUnknown_Debug_083C4C8F
	.4byte gUnknown_Debug_083C4C95
	.4byte gUnknown_Debug_083C4C9B
	.4byte gUnknown_Debug_083C4CA1

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
