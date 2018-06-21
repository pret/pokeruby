EverGrandeCity_MapBorder:: @ 828FA8C
	.incbin "data/layouts/EverGrandeCity/border.bin"

EverGrandeCity_MapBlockdata:: @ 828FA94
	.incbin "data/layouts/EverGrandeCity/map.bin"

	.align 2
EverGrandeCity_Layout:: @ 8291394
	.4byte 0x28
	.4byte 0x50
	.4byte EverGrandeCity_MapBorder
	.4byte EverGrandeCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_EverGrande
