	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gDummyWarpData:: @ 8216624
	.byte -1
	.byte -1
	.byte -1
	.space 1
	.2byte -1
	.2byte -1

@ unused, unknown data
	.byte 0xB0, 0x04, 0x00, 0x00
	.byte 0x10, 0x0E, 0x00, 0x00
	.byte 0xB0, 0x04, 0x00, 0x00
	.byte 0x60, 0x09, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00
	.byte 0xD4, 0xFF, 0xFF, 0xFF
	.byte 0x2C, 0x00, 0x00, 0x00

	.align 2
gUnknown_0821664C:: @ 821664C
	.4byte  0,  0
	.4byte  0,  1
	.4byte  0, -1
	.4byte -1,  0
	.4byte  1,  0
	.4byte -1,  1
	.4byte  1,  1
	.4byte -1, -1
	.4byte  1, -1

	.align 2
gUnknown_08216694:: @ 8216694
	.4byte REG_WIN0H
	.4byte ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1
	.4byte 1

	.align 2
gUnknown_082166A0:: @ 82166A0
	.4byte sub_8055C68
	.4byte sub_8055C88
	.4byte sub_8055C8C

	.align 2
gUnknown_082166AC:: @ 82166AC
	.4byte sub_8055CAC
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CAC
	.4byte sub_8055CAC
	.4byte sub_8055D18
	.4byte sub_8055D18
	.4byte sub_8055D18
	.4byte sub_8055D18

	.align 2
gUnknown_082166D8:: @ 82166D8
	.4byte sub_8055D30
	.4byte sub_8055D38
