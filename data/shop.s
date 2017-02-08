	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083CC6D0:: @ 83CC6D0
	.4byte MartText_Buy, sub_80B2EFC
	.4byte MartText_Sell, sub_80B2F30
	.4byte MartText_Quit2, HandleShopMenuQuit

gUnknown_083CC6E8:: @ 83CC6E8
	.byte 0, 1, 2

gUnknown_083CC6EB:: @ 83CC6EB
	.byte 0, 2

@ unknown, unreferenced data
	.align 1
	.2byte 0x2
	.2byte 0x3
	.2byte 0x4
	.2byte 0xD
	.2byte 0x121
	.2byte 0xE
	.2byte 0xE
	.2byte 0xE
	.2byte 0xE
	.2byte 0xE
	.2byte 0xE
	.2byte 0x0
	.2byte 0x0

	.align 2
gUnknown_083CC708:: @ 83CC708
	.4byte sub_80B3BF4
	.4byte sub_80B3D7C

	.align 1
gUnknown_083CC710:: @ 83CC710
	.2byte 0x41EE,0x7FFF

	.align 1
gUnknown_083CC714:: @ 83CC714
	.2byte 0x284,0x282,0x280

	.align 1
gUnknown_083CC71A:: @ 83CC71A
	.2byte 0x285,0x283,0x281

	.align 1
gUnknown_083CC720:: @ 83CC720
	.2byte 0x28C,0x28A,0x288

	.align 1
gUnknown_083CC726:: @ 83CC726
	.2byte 0x28D,0x28B,0x289

	.align 1
gUnknown_083CC72C:: @ 83CC72C
	.2byte 0x2A0,0x2A2,0x2A4

	.align 1
gUnknown_083CC732:: @ 83CC732
	.2byte 0x2A1,0x2A3,0x2A5

	.align 1
gUnknown_083CC738:: @ 83CC738
	.2byte 0x2A8,0x2AA,0x2AC
