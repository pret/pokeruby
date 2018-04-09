	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.if DEBUG

	.align 2

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
