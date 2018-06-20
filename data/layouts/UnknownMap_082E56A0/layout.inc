UnknownMap_082E56A0_MapBorder::
	.incbin "data/layouts/UnknownMap_082E56A0/border.bin"

UnknownMap_082E56A0_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E56A0/map.bin"

	.align 2
UnknownMap_082E56A0_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E56A0_MapBorder
	.4byte UnknownMap_082E56A0_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
