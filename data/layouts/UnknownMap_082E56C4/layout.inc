UnknownMap_082E56C4_MapBorder::
	.incbin "data/layouts/UnknownMap_082E56C4/border.bin"

UnknownMap_082E56C4_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E56C4/map.bin"

	.align 2
UnknownMap_082E56C4_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E56C4_MapBorder
	.4byte UnknownMap_082E56C4_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
