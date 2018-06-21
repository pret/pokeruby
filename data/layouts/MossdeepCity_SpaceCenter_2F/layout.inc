MossdeepCity_SpaceCenter_2F_MapBorder:: @ 82F6298
	.incbin "data/layouts/MossdeepCity_SpaceCenter_2F/border.bin"

MossdeepCity_SpaceCenter_2F_MapBlockdata:: @ 82F62A0
	.incbin "data/layouts/MossdeepCity_SpaceCenter_2F/map.bin"

	.align 2
MossdeepCity_SpaceCenter_2F_Layout:: @ 82F63E0
	.4byte 0x10
	.4byte 0xa
	.4byte MossdeepCity_SpaceCenter_2F_MapBorder
	.4byte MossdeepCity_SpaceCenter_2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
