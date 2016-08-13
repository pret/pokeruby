	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits

gUnknown_081DC118:: @ 81DC118
	.incbin "baserom.gba", 0x001dc118, 0x9dc
