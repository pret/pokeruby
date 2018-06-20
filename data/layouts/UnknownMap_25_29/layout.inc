UnknownMap_25_29_MapBorder:: @ 82E9898
	.incbin "data/layouts/UnknownMap_25_29/border.bin"

UnknownMap_25_29_MapBlockdata:: @ 82E98A0
	.incbin "data/layouts/UnknownMap_25_29/map.bin"

	.align 2
UnknownMap_25_29_Layout:: @ 82E98A4
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_25_29_MapBorder
	.4byte UnknownMap_25_29_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
