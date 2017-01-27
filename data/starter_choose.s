	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_083F7794:: @ 83F7794
	obj_tiles gBirchBallarrow_Gfx, 0x0800, 0x1000
	.space 8

gUnknown_083F77A4:: @ 83F77A4
	obj_tiles gBirchCircle_Gfx, 0x0800, 0x1001
	.space 8

gUnknown_083F77B4:: @ 83F77B4
	obj_pal gBirchBallarrow_Pal, 0x1000
	obj_pal gBirchCircle_Pal, 0x1001
	.space 8

	.align 2
gSpriteTemplate_83F77CC:: @ 83F77CC
	spr_template 4096, 4096, gOamData_83F76CC, gSpriteAnimTable_83F774C, NULL, gDummySpriteAffineAnimTable, sub_810A62C

	.align 2
gSpriteTemplate_83F77E4:: @ 83F77E4
	spr_template 4096, 4096, gOamData_83F76D4, gSpriteAnimTable_83F7750, NULL, gDummySpriteAffineAnimTable, sub_810A68C

	.align 2
gSpriteTemplate_83F77FC:: @ 83F77FC
	spr_template 4097, 4097, gOamData_83F76DC, gSpriteAnimTable_83F7758, NULL, gSpriteAffineAnimTable_83F7790, StarterPokemonSpriteAnimCallback
