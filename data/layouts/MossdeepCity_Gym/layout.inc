MossdeepCity_Gym_MapBorder:: @ 82D36C0
	.incbin "data/layouts/MossdeepCity_Gym/border.bin"

MossdeepCity_Gym_MapBlockdata:: @ 82D36C8
	.incbin "data/layouts/MossdeepCity_Gym/map.bin"

	.align 2
MossdeepCity_Gym_Layout:: @ 82D3B78
	.4byte 0x14
	.4byte 0x1e
	.4byte MossdeepCity_Gym_MapBorder
	.4byte MossdeepCity_Gym_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_MossdeepGym
