	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ XXX: Unused? Probably aligned because it's at the beginning of an object file.
	.align 2
	.string "タマゴ$"

gUnknown_08401E2C:: @ 8401E2C
	.incbin "baserom.gba", 0x00401e2c, 0x6

gUnknown_08401E32:: @ 8401E32
	.incbin "baserom.gba", 0x00401e32, 0x4

gUnknown_08401E36:: @ 8401E36
	.incbin "baserom.gba", 0x00401e36, 0xa

	.align 2
gUnknown_08401E40:: @ 8401E40
	.4byte sub_81275A0
	.4byte sub_81275C4

	.align 2
gUnknown_08401E48:: @ 8401E48
	.4byte sub_8127DA0
	.4byte sub_8127DD0
	.4byte sub_8127E30

gUnknown_08401E54:: @ 8401E54
	.incbin "baserom.gba", 0x00401e54, 0x6

gUnknown_08401E5A:: @ 8401E5A
	.incbin "baserom.gba", 0x00401e5a, 0x6
