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
	.4byte gUnknown_02038738

	.align 2
gUnknown_083D0284:: @ 83D0284
	.4byte gSaveBlock2+0xA8
