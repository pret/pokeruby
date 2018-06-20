UnknownMap_082D05FC_MapBorder::
	.incbin "data/layouts/UnknownMap_082D05FC/border.bin"

UnknownMap_082D05FC_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082D05FC/map.bin"

	.align 2
UnknownMap_082D05FC_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082D05FC_MapBorder
	.4byte UnknownMap_082D05FC_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
