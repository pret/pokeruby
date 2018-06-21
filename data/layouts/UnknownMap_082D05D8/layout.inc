UnknownMap_082D05D8_MapBorder::
	.incbin "data/layouts/UnknownMap_082D05D8/border.bin"

UnknownMap_082D05D8_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082D05D8/map.bin"

	.align 2
UnknownMap_082D05D8_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082D05D8_MapBorder
	.4byte UnknownMap_082D05D8_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
