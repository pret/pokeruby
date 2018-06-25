UnknownMap_082E5754_MapBorder::
	.incbin "data/layouts/UnknownMap_082E5754/border.bin"

UnknownMap_082E5754_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E5754/map.bin"

	.align 2
UnknownMap_082E5754_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E5754_MapBorder
	.4byte UnknownMap_082E5754_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
