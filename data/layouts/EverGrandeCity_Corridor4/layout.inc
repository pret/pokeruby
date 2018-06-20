EverGrandeCity_Corridor4_MapBorder:: @ 82FFAAC
	.incbin "data/layouts/EverGrandeCity_Corridor4/border.bin"

EverGrandeCity_Corridor4_MapBlockdata:: @ 82FFAB4
	.incbin "data/layouts/EverGrandeCity_Corridor4/map.bin"

	.align 2
EverGrandeCity_Corridor4_Layout:: @ 82FFDA0
	.4byte 0xb
	.4byte 0x22
	.4byte EverGrandeCity_Corridor4_MapBorder
	.4byte EverGrandeCity_Corridor4_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_EliteFour
