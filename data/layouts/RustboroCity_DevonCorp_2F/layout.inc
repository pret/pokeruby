RustboroCity_DevonCorp_2F_MapBorder:: @ 82D13A0
	.incbin "data/layouts/RustboroCity_DevonCorp_2F/border.bin"

RustboroCity_DevonCorp_2F_MapBlockdata:: @ 82D13A8
	.incbin "data/layouts/RustboroCity_DevonCorp_2F/map.bin"

	.align 2
RustboroCity_DevonCorp_2F_Layout:: @ 82D1500
	.4byte 0x13
	.4byte 0x9
	.4byte RustboroCity_DevonCorp_2F_MapBorder
	.4byte RustboroCity_DevonCorp_2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
