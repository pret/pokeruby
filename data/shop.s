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

gUnknown_083CC710:: @ 83CC710
	.incbin "baserom.gba", 0x003cc710, 0x4

gUnknown_083CC714:: @ 83CC714
	.incbin "baserom.gba", 0x003cc714, 0x6

gUnknown_083CC71A:: @ 83CC71A
	.incbin "baserom.gba", 0x003cc71a, 0x6

gUnknown_083CC720:: @ 83CC720
	.incbin "baserom.gba", 0x003cc720, 0x6

gUnknown_083CC726:: @ 83CC726
	.incbin "baserom.gba", 0x003cc726, 0x6

gUnknown_083CC72C:: @ 83CC72C
	.incbin "baserom.gba", 0x003cc72c, 0x6

gUnknown_083CC732:: @ 83CC732
	.incbin "baserom.gba", 0x003cc732, 0x6

gUnknown_083CC738:: @ 83CC738
	.incbin "baserom.gba", 0x003cc738, 0x8
