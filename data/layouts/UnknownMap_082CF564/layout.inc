UnknownMap_082CF564_MapBorder::
	.incbin "data/layouts/UnknownMap_082CF564/border.bin"

UnknownMap_082CF564_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082CF564/map.bin"

	.align 2
UnknownMap_082CF564_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082CF564_MapBorder
	.4byte UnknownMap_082CF564_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
