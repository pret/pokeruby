	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
Unknown_083931B8:
	.incbin "baserom.gba", 0x003931b8, 0x20

gUnknown_083931D8:: @ 83931D8
	.4byte 4, Unknown_083931B8

	.align 2
gSpriteTemplate_83931E0:: @ 83931E0
	spr_template 10010, 10010, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83931F8:: @ 83931F8
	spr_template 10136, 10136, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807B870
