UnknownMap_25_33_MapBorder:: @ 82E9928
	.incbin "data/layouts/UnknownMap_25_33/border.bin"

UnknownMap_25_33_MapBlockdata:: @ 82E9930
	.incbin "data/layouts/UnknownMap_25_33/map.bin"

	.align 2
UnknownMap_25_33_Layout:: @ 82E9934
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_25_33_MapBorder
	.4byte UnknownMap_25_33_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
