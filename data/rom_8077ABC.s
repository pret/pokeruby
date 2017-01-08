	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_0837F578:: @ 837F578
	.byte  72, 80,  0,  0
	.byte 176, 40,  0,  0
	.byte  48, 40,  0,  0
	.byte 112, 80,  0,  0
	.byte  32, 80,  0,  0
	.byte 200, 40,  0,  0
	.byte  90, 88,  0,  0
	.byte 152, 32,  0,  0

@ One entry for each of the four Castform forms.
@ Coords are probably front pic coords or back pic coords, but this data does not seem to be
@ used during battle, party summary, or pokedex screens.
	.align 2
gUnknownCastformCoords_0837F598:: @ 837F598
	.byte  68, 17, 0, 0
	.byte 102,  9, 0, 0
	.byte  70,  9, 0, 0
	.byte 134,  8, 0, 0

@ One entry for each of the four Castform forms. Probably a palette index.
gUnknownCastformData_0837F5A8:: @ 837F5A8
	.byte 0xD, 0xE, 0xD, 0xD

gUnknown_0837F5AC:: @ 837F5AC
	.byte 0, 0, 0, 0

	.align 2
gSpriteTemplate_837F5B0:: @ 837F5B0
	spr_template 55125, 55125, gOamData_837DF9C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_837F5C8:: @ 837F5C8
	spr_template 55126, 55126, gOamData_837DF9C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_0837F5E0:: @ 837F5E0
	obj_tiles gMiscBlank_Gfx, 2048, 0xd755
	obj_tiles gMiscBlank_Gfx, 2048, 0xd756
