	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ XXX: Unused? Probably aligned because it's at the beginning of an object file.
	.align 2
	.string "タマゴ$"

	.align 1
gUnknown_08401E2C:: @ 8401E2C
	.2byte 0xC, 0x1C, 0x2C

gUnknown_08401E32:: @ 8401E32
	.byte 0, 1, 2, 3

	.align 1
gUnknown_08401E36:: @ 8401E36
	.2byte 4, 4, 4, 16

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
	.byte 0, 0, 1, 2, 3

	.align 1
gUnknown_08401E5A:: @ 8401E5A
	.2byte 3, 7
