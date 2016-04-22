	.global gDigits
gDigits: @ 81E72B3
	.string "0123456789ABCDEF"

	.align 2
	.global gPowersOfTen
gPowersOfTen: @ 81E72C4
	.4byte          1
	.4byte         10
	.4byte        100
	.4byte       1000
	.4byte      10000
	.4byte     100000
	.4byte    1000000
	.4byte   10000000
	.4byte  100000000
	.4byte 1000000000

	.global gUnknown_081E72EC
gUnknown_081E72EC: @ 81E72EC
	.byte 0xFC, 0x06, 0x06, 0xFF

	.global gUnknown_081E72F0
gUnknown_081E72F0: @ 81E72F0
	.byte 0xFE, 0xFC, 0x0E, 0x02, 0xFF

	.align 2
	.global gExpandPlaceholderFuncTable
gExpandPlaceholderFuncTable: @ 81E72F8
	.4byte ExpandPlaceholder_UnknownStringVar
	.4byte ExpandPlaceholder_PlayerName
	.4byte ExpandPlaceholder_StringVar1
	.4byte ExpandPlaceholder_StringVar2
	.4byte ExpandPlaceholder_StringVar3
	.4byte ExpandPlaceholder_UnknownString
	.4byte ExpandPlaceholder_RivalName
	.4byte ExpandPlaceholder_Version
	.4byte ExpandPlaceholder_EvilTeam
	.4byte ExpandPlaceholder_GoodTeam
	.4byte ExpandPlaceholder_EvilTeamLeader
	.4byte ExpandPlaceholder_GoodTeamLeader
	.4byte ExpandPlaceholder_CurVersionMascot
	.4byte ExpandPlaceholder_OppVersionMascot
