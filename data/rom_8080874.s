	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gUnknown_0839ACDC:: @ 839ACDC
	.2byte 0xC8, 0x48, 0x38, 0x28, 0x18, 0x0

	.align 2
gUnknown_0839ACE8:: @ 839ACE8
	.4byte 4

	.align 2
gUnknown_0839ACEC:: @ 839ACEC
	.4byte REG_WIN0H
	.4byte ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1
	.4byte 1
