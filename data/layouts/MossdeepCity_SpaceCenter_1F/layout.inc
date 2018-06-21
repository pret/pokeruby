MossdeepCity_SpaceCenter_1F_MapBorder:: @ 82F6138
	.incbin "data/layouts/MossdeepCity_SpaceCenter_1F/border.bin"

MossdeepCity_SpaceCenter_1F_MapBlockdata:: @ 82F6140
	.incbin "data/layouts/MossdeepCity_SpaceCenter_1F/map.bin"

	.align 2
MossdeepCity_SpaceCenter_1F_Layout:: @ 82F6280
	.4byte 0x10
	.4byte 0xa
	.4byte MossdeepCity_SpaceCenter_1F_MapBorder
	.4byte MossdeepCity_SpaceCenter_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
