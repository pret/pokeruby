RustboroCity_DevonCorp_1F_MapBorder:: @ 82D1228
	.incbin "data/layouts/RustboroCity_DevonCorp_1F/border.bin"

RustboroCity_DevonCorp_1F_MapBlockdata:: @ 82D1230
	.incbin "data/layouts/RustboroCity_DevonCorp_1F/map.bin"

	.align 2
RustboroCity_DevonCorp_1F_Layout:: @ 82D1388
	.4byte 0x13
	.4byte 0x9
	.4byte RustboroCity_DevonCorp_1F_MapBorder
	.4byte RustboroCity_DevonCorp_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
