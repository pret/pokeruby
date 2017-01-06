	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_0839ACDC:: @ 839ACDC
	.incbin "baserom.gba", 0x0039acdc, 0xc

	.align 2
gUnknown_0839ACE8:: @ 839ACE8
	.byte 4

	.align 2
gUnknown_0839ACEC:: @ 839ACEC
	.4byte REG_WIN0H
	.4byte ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1
	.4byte 1
