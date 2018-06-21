UnknownMap_25_34_MapBorder:: @ 82E994C
	.incbin "data/layouts/UnknownMap_25_34/border.bin"

UnknownMap_25_34_MapBlockdata:: @ 82E9954
	.incbin "data/layouts/UnknownMap_25_34/map.bin"

	.align 2
UnknownMap_25_34_Layout:: @ 82E9958
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_25_34_MapBorder
	.4byte UnknownMap_25_34_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
