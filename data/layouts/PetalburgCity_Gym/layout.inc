PetalburgCity_Gym_MapBorder:: @ 82CF854
	.incbin "data/layouts/PetalburgCity_Gym/border.bin"

PetalburgCity_Gym_MapBlockdata:: @ 82CF85C
	.incbin "data/layouts/PetalburgCity_Gym/map.bin"

	.align 2
PetalburgCity_Gym_Layout:: @ 82D003C
	.4byte 0x9
	.4byte 0x70
	.4byte PetalburgCity_Gym_MapBorder
	.4byte PetalburgCity_Gym_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_PetalburgGym
