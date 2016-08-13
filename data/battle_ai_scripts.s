	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits

gUnknown_081DA01C:: @ 81DA01C
	.incbin "baserom.gba", 0x001da01c, 0x20fc
