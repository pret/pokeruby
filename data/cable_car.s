	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_8401D28:: @ 8401D28
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_8401D30:: @ 8401D30
	.2byte 0x4300
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gOamData_8401D38:: @ 8401D38
	.2byte 0x0300
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteTemplate_8401D40:: @ 8401D40
	spr_template 1, 1, gOamData_8401D28, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8123CB8

	.align 2
gSpriteTemplate_8401D58:: @ 8401D58
	spr_template 2, 1, gOamData_8401D30, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8123CB8

	.align 2
gSpriteTemplate_8401D70:: @ 8401D70
	spr_template 3, 1, gOamData_8401D38, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, nullsub_76

gCableCarPlayerGraphicsIDs:: @ 8401D88
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL
	.byte MAP_OBJ_GFX_RIVAL_MAY_NORMAL

gMtChimneyHikerGraphicsIDs:: @ 8401D8A
	.byte MAP_OBJ_GFX_HIKER
	.byte MAP_OBJ_GFX_CAMPER
	.byte MAP_OBJ_GFX_PICNICKER
	.byte MAP_OBJ_GFX_POOCHYENA @ not used

	.align 1
gMtChimneyHikerCoords:: @ 8401D8E
	.2byte   0,  80
	.2byte 240, 146

gMtChimneyHikerMovementDelayTable:: @ 8401D96
	.byte   0
	.byte  60
	.byte 120
	.byte 170

	.align 2
gUnknown_08401D9C:: @ 8401D9C
	.4byte sub_8123EB8
	.4byte sub_8123F44
