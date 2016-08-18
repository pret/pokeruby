	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits

@ unknown what the 2nd AI incbin is for. possibly contest AI.

	.align 2
gUnknown_081DC118:: @ 81DC118
	.4byte Unknown_081DC7FB
	.4byte Unknown_081DC348
	.4byte Unknown_081DC27F
	.4byte Unknown_081DC2AB
	.4byte Unknown_081DCA4C
	.4byte Unknown_081DC3C7
	.4byte Unknown_081DC7DE
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.4byte Unknown_081DCAF3
	.incbin "baserom.gba", 0x001dc198, 0xE7 @ unreferenced?
Unknown_081DC27F:
	.incbin "baserom.gba", 0x001dc27f, 0x2C
Unknown_081DC2AB:
	.incbin "baserom.gba", 0x001dc2ab, 0x9D
Unknown_081DC348:
	.incbin "baserom.gba", 0x001dc348, 0x7F
Unknown_081DC3C7:
	.incbin "baserom.gba", 0x001dc3c7, 0x417
Unknown_081DC7DE:
	.incbin "baserom.gba", 0x001dc7de, 0x1D
Unknown_081DC7FB:
	.incbin "baserom.gba", 0x001dc7fb, 0x251
Unknown_081DCA4C:
	.incbin "baserom.gba", 0x001dca4c, 0xA7
Unknown_081DCAF3:
	.incbin "baserom.gba", 0x001dcaf3, 0x1
