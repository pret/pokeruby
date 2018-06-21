UnknownMap_082FF894_MapBorder::
	.incbin "data/layouts/UnknownMap_082FF894/border.bin"

UnknownMap_082FF894_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082FF894/map.bin"

	.align 2
UnknownMap_082FF894_Layout::
	.4byte 0x13
	.4byte 0x13
	.4byte UnknownMap_082FF894_MapBorder
	.4byte UnknownMap_082FF894_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
