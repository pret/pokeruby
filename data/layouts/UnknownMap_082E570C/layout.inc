UnknownMap_082E570C_MapBorder::
	.incbin "data/layouts/UnknownMap_082E570C/border.bin"

UnknownMap_082E570C_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E570C/map.bin"

	.align 2
UnknownMap_082E570C_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E570C_MapBorder
	.4byte UnknownMap_082E570C_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
