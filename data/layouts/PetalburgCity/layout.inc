PetalburgCity_MapBorder:: @ 8287264
	.incbin "data/layouts/PetalburgCity/border.bin"

PetalburgCity_MapBlockdata:: @ 828726C
	.incbin "data/layouts/PetalburgCity/map.bin"

	.align 2
PetalburgCity_Layout:: @ 8287974
	.4byte 0x1e
	.4byte 0x1e
	.4byte PetalburgCity_MapBorder
	.4byte PetalburgCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Petalburg
