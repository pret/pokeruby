UnknownMap_082E567C_MapBorder::
	.incbin "data/layouts/UnknownMap_082E567C/border.bin"

UnknownMap_082E567C_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E567C/map.bin"

	.align 2
UnknownMap_082E567C_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E567C_MapBorder
	.4byte UnknownMap_082E567C_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
