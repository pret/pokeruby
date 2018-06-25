RustboroCity_House_MapBorder:: @ 82D1804
	.incbin "data/layouts/RustboroCity_House/border.bin"

RustboroCity_House_MapBlockdata:: @ 82D180C
	.incbin "data/layouts/RustboroCity_House/map.bin"

	.align 2
RustboroCity_House_Layout:: @ 82D18E4
	.4byte 0xc
	.4byte 0x9
	.4byte RustboroCity_House_MapBorder
	.4byte RustboroCity_House_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
