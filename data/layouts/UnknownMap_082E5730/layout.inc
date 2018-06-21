UnknownMap_082E5730_MapBorder::
	.incbin "data/layouts/UnknownMap_082E5730/border.bin"

UnknownMap_082E5730_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E5730/map.bin"

	.align 2
UnknownMap_082E5730_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E5730_MapBorder
	.4byte UnknownMap_082E5730_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
