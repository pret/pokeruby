	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSubspriteTable_83931B8:: @ 83931B8
	subsprite -16, -16, 2,   0, 64x64
	subsprite -16,  48, 2,  64, 64x32
	subsprite  48, -16, 2,  96, 32x64
	subsprite  48,  48, 2, 128, 32x32

	.align 2
gSubspriteTables_83931D8:: @ 83931D8
	.4byte 4, gSubspriteTable_83931B8

	.align 2
gSpriteTemplate_83931E0:: @ 83931E0
	spr_template 10010, 10010, gOamData_837E05C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83931F8:: @ 83931F8
	spr_template 10136, 10136, gOamData_837DF24, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_807B870
