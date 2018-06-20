UnknownMap_082E5658_MapBorder::
	.incbin "data/layouts/UnknownMap_082E5658/border.bin"

UnknownMap_082E5658_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E5658/map.bin"

	.align 2
UnknownMap_082E5658_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E5658_MapBorder
	.4byte UnknownMap_082E5658_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
