	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_08376364:: @ 8376364
	.4byte DummyPerStepCallback
	.4byte PerStepCallback_8069F64
	.4byte PerStepCallback_8069AA0
	.4byte PerStepCallback_8069864
	.4byte PerStepCallback_8069DD4
	.4byte EndTruckSequence
	.4byte sub_80BCF1C
	.4byte PerStepCallback_806A07C

gUnknown_08376384:: @ 8376384
	.incbin "baserom.gba", 0x00376384, 0x20

gUnknown_083763A4:: @ 83763A4
	.incbin "baserom.gba", 0x003763a4, 0x20

gUnknown_083763C4:: @ 83763C4
	.incbin "baserom.gba", 0x003763c4, 0x20

gUnknown_083763E4:: @ 83763E4
	.incbin "baserom.gba", 0x003763e4, 0x34

	.align 1
gUnknown_08376418:: @ 8376418
	.2byte 0xE8, 0xEB, 0xEA, 0xE9
