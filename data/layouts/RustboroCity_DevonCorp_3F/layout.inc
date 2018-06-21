RustboroCity_DevonCorp_3F_MapBorder:: @ 82F2768
	.incbin "data/layouts/RustboroCity_DevonCorp_3F/border.bin"

RustboroCity_DevonCorp_3F_MapBlockdata:: @ 82F2770
	.incbin "data/layouts/RustboroCity_DevonCorp_3F/map.bin"

	.align 2
RustboroCity_DevonCorp_3F_Layout:: @ 82F28C8
	.4byte 0x13
	.4byte 0x9
	.4byte RustboroCity_DevonCorp_3F_MapBorder
	.4byte RustboroCity_DevonCorp_3F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
