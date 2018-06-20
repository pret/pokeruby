UnknownMap_082E56E8_MapBorder::
	.incbin "data/layouts/UnknownMap_082E56E8/border.bin"

UnknownMap_082E56E8_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082E56E8/map.bin"

	.align 2
UnknownMap_082E56E8_Layout::
	.4byte 0x1
	.4byte 0x1
	.4byte UnknownMap_082E56E8_MapBorder
	.4byte UnknownMap_082E56E8_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
