DewfordTown_Gym_MapBorder:: @ 82CE42C
	.incbin "data/layouts/DewfordTown_Gym/border.bin"

DewfordTown_Gym_MapBlockdata:: @ 82CE434
	.incbin "data/layouts/DewfordTown_Gym/map.bin"

	.align 2
DewfordTown_Gym_Layout:: @ 82CE824
	.4byte 0x12
	.4byte 0x1c
	.4byte DewfordTown_Gym_MapBorder
	.4byte DewfordTown_Gym_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_DewfordGym
