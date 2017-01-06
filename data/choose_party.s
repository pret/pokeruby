	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_084017B0:: @ 84017B0
	.4byte OtherText_Summary, sub_812265C
	.4byte OtherText_Enter2, sub_8122694
	.4byte OtherText_NoEntry, sub_8122770
	.4byte gUnknownText_Exit, sub_8122838

gUnknown_084017D0:: @ 84017D0
	.byte 1, 0, 3

gUnknown_084017D3: @ 84017D3
	.byte 2, 0, 3

gUnknown_084017D6: @ 84017D6
	.byte 0, 3

	.align 2
gUnknown_084017D8:: @ 84017D8
	.byte 3, 9
	.space 2
	.4byte gUnknown_084017D0

	.byte 3, 9
	.space 2
	.4byte gUnknown_084017D3

	.byte 2, 9
	.space 2
	.4byte gUnknown_084017D6

	.align 2
gUnknown_084017F0:: @ 84017F0
	.4byte OtherText_Store, sub_8122F70
	.4byte OtherText_Summary, sub_81230BC
	.4byte gUnknownText_Exit, sub_81230F4

gUnknown_08401808:: @ 8401808
	.byte 0, 1, 2

gUnknown_0840180B:: @ 840180B
	.byte 1, 2

	.align 2
gUnknown_08401810:: @ 8401810
	.byte 3, 9
	.space 2
	.4byte gUnknown_08401808

	.byte 2, 9
	.space 2
	.4byte gUnknown_0840180B
