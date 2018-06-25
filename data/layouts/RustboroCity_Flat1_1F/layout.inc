RustboroCity_Flat1_1F_MapBorder:: @ 82FF8AC
	.incbin "data/layouts/RustboroCity_Flat1_1F/border.bin"

RustboroCity_Flat1_1F_MapBlockdata:: @ 82FF8B4
	.incbin "data/layouts/RustboroCity_Flat1_1F/map.bin"

	.align 2
RustboroCity_Flat1_1F_Layout:: @ 82FF994
	.4byte 0xe
	.4byte 0x8
	.4byte RustboroCity_Flat1_1F_MapBorder
	.4byte RustboroCity_Flat1_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
