RustboroCity_Gym_MapBorder:: @ 82D1518
	.incbin "data/layouts/RustboroCity_Gym/border.bin"

RustboroCity_Gym_MapBlockdata:: @ 82D1520
	.incbin "data/layouts/RustboroCity_Gym/map.bin"

	.align 2
RustboroCity_Gym_Layout:: @ 82D16C4
	.4byte 0xb
	.4byte 0x13
	.4byte RustboroCity_Gym_MapBorder
	.4byte RustboroCity_Gym_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_RustboroGym
