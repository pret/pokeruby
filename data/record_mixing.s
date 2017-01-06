	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
recordMixingSecretBases:: @ 83D026C
	@ gSaveBlock1.secretBases
	.4byte gSaveBlock1 + 0x1A08

	.align 2
recordMixingTvShows:: @ 83D0270
	@ gSaveBlock1.tvShows
	.4byte gSaveBlock1 + 0x2738

	.align 2
gUnknown_083D0274:: @ 83D0274
	.4byte gSaveBlock1 + 0x2ABC

	.align 2
gUnknown_083D0278:: @ 83D0278
	.4byte gSaveBlock1 + 0x2D94

	.align 2
recordMixingEasyChatPairs:: @ 83D027C
	@ gSaveBlock1.easyChatPairs
	.4byte gSaveBlock1 + 0x2DD4

	.align 2
gUnknown_083D0280:: @ 83D0280
	.4byte 0x02038738

	.align 2
gUnknown_083D0284:: @ 83D0284
	.4byte 0x02024f4c

gUnknown_083D0288:: @ 83D0288
	.byte 1, 0

gUnknown_083D028A:: @ 83D028A
	.byte 1, 2, 0
	.byte 2, 0, 1

gUnknown_083D0290:: @ 83D0290
	.byte 1, 0, 3, 2
	.byte 3, 0, 1, 2
	.byte 2, 0, 3, 1
	.byte 1, 3, 0, 2
	.byte 2, 3, 0, 1
	.byte 3, 2, 0, 1
	.byte 1, 2, 3, 0
	.byte 2, 3, 1, 0
	.byte 3, 2, 1, 0

gUnknown_083D02B4:: @ 83D02B4
	.byte 0, 1
	.byte 1, 2
	.byte 2, 0

gUnknown_083D02BA:: @ 83D02BA
	.byte 0, 1
	.byte 2, 3

	.byte 0, 2
	.byte 1, 3

	.byte 0, 3
	.byte 2, 1
