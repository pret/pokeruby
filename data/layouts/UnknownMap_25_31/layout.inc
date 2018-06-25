UnknownMap_25_31_MapBorder:: @ 82E98E0
	.incbin "data/layouts/UnknownMap_25_31/border.bin"

UnknownMap_25_31_MapBlockdata:: @ 82E98E8
	.incbin "data/layouts/UnknownMap_25_31/map.bin"

	.align 2
UnknownMap_25_31_Layout:: @ 82E98EC
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_25_31_MapBorder
	.4byte UnknownMap_25_31_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
