	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

UnknownString_1stRound:
	.string "1st round$"
UnknownString_2ndRound:
	.string "2nd round$"
UnknownString_3rdRound:
	.string "3rd round$"
UnknownString_4thRound:
	.string "4th round$"
UnknownString_5thRound:
	.string "5th round$"
UnknownString_6thRound:
	.string "6th round$"
UnknownString_7thRound:
	.string "7th round$"
UnknownString_8thRound:
	.string "8th round$"

	.align 2
gUnknown_0842C29C:: @ 842C29C
	.4byte UnknownString_1stRound, sub_814A4B8
	.4byte UnknownString_2ndRound, sub_814A4B8
	.4byte UnknownString_3rdRound, sub_814A4B8
	.4byte UnknownString_4thRound, sub_814A4B8
	.4byte UnknownString_5thRound, sub_814A4B8
	.4byte UnknownString_6thRound, sub_814A4B8
	.4byte UnknownString_7thRound, sub_814A4B8
	.4byte UnknownString_8thRound, sub_814A4B8
