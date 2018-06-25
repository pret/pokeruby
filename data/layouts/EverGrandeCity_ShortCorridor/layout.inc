EverGrandeCity_ShortCorridor_MapBorder:: @ 82D4A5C
	.incbin "data/layouts/EverGrandeCity_ShortCorridor/border.bin"

EverGrandeCity_ShortCorridor_MapBlockdata:: @ 82D4A64
	.incbin "data/layouts/EverGrandeCity_ShortCorridor/map.bin"

	.align 2
EverGrandeCity_ShortCorridor_Layout:: @ 82D4B84
	.4byte 0xb
	.4byte 0xd
	.4byte EverGrandeCity_ShortCorridor_MapBorder
	.4byte EverGrandeCity_ShortCorridor_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_EliteFour
