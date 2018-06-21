UnknownMap_083041B4_MapBorder::
	.incbin "data/layouts/UnknownMap_083041B4/border.bin"

UnknownMap_083041B4_MapBlockdata::
	.incbin "data/layouts/UnknownMap_083041B4/map.bin"

	.align 2
UnknownMap_083041B4_Layout::
	.4byte 0x1B
	.4byte 0x2E
	.4byte UnknownMap_083041B4_MapBorder
	.4byte UnknownMap_083041B4_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
