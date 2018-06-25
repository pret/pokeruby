UnknownMap_082E5634_MapBorder::
	.incbin "data/layouts/UnknownMap_082E5634/border.bin"

UnknownMap_082E5634_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E5634/map.bin"

	.align 2
UnknownMap_082E5634_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E5634_MapBorder
	.4byte UnknownMap_082E5634_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
