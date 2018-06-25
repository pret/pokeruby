FortreeCity_Gym_MapBorder:: @ 82D1B54
	.incbin "data/layouts/FortreeCity_Gym/border.bin"

FortreeCity_Gym_MapBlockdata:: @ 82D1B5C
	.incbin "data/layouts/FortreeCity_Gym/map.bin"

	.align 2
FortreeCity_Gym_Layout:: @ 82D1F44
	.4byte 0x14
	.4byte 0x19
	.4byte FortreeCity_Gym_MapBorder
	.4byte FortreeCity_Gym_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_FortreeGym
