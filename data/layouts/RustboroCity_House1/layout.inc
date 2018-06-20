RustboroCity_House1_MapBorder:: @ 82D18FC
	.incbin "data/layouts/RustboroCity_House1/border.bin"

RustboroCity_House1_MapBlockdata:: @ 82D1904
	.incbin "data/layouts/RustboroCity_House1/map.bin"

	.align 2
RustboroCity_House1_Layout:: @ 82D19D4
	.4byte 0xd
	.4byte 0x8
	.4byte RustboroCity_House1_MapBorder
	.4byte RustboroCity_House1_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
