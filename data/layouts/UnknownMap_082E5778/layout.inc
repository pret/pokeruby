UnknownMap_082E5778_MapBorder::
	.incbin "data/layouts/UnknownMap_082E5778/border.bin"

UnknownMap_082E5778_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E5778/map.bin"

	.align 2
UnknownMap_082E5778_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E5778_MapBorder
	.4byte UnknownMap_082E5778_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
