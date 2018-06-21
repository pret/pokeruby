UnknownMap_082E5610_MapBorder::
	.incbin "data/layouts/UnknownMap_082E5610/border.bin"

UnknownMap_082E5610_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E5610/map.bin"

	.align 2
UnknownMap_082E5610_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E5610_MapBorder
	.4byte UnknownMap_082E5610_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
