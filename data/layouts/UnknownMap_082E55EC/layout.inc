UnknownMap_082E55EC_MapBorder::
	.incbin "data/layouts/UnknownMap_082E55EC/border.bin"

UnknownMap_082E55EC_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E55EC/map.bin"

	.align 2
UnknownMap_082E55EC_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E55EC_MapBorder
	.4byte UnknownMap_082E55EC_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
