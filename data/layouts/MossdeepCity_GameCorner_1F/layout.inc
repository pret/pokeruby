MossdeepCity_GameCorner_1F_MapBorder:: @ 82FEA80
	.incbin "data/layouts/MossdeepCity_GameCorner_1F/border.bin"

MossdeepCity_GameCorner_1F_MapBlockdata:: @ 82FEA88
	.incbin "data/layouts/MossdeepCity_GameCorner_1F/map.bin"

	.align 2
MossdeepCity_GameCorner_1F_Layout:: @ 82FEB38
	.4byte 0xb
	.4byte 0x8
	.4byte MossdeepCity_GameCorner_1F_MapBorder
	.4byte MossdeepCity_GameCorner_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
