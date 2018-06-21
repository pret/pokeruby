PetalburgWoods_MapBorder:: @ 82D91BC
	.incbin "data/layouts/PetalburgWoods/border.bin"

PetalburgWoods_MapBlockdata:: @ 82D91C4
	.incbin "data/layouts/PetalburgWoods/map.bin"

	.align 2
PetalburgWoods_Layout:: @ 82DA244
	.4byte 0x30
	.4byte 0x2c
	.4byte PetalburgWoods_MapBorder
	.4byte PetalburgWoods_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Rustboro
