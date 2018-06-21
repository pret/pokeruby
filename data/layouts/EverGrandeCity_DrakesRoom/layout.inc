EverGrandeCity_DrakesRoom_MapBorder:: @ 82D475C
	.incbin "data/layouts/EverGrandeCity_DrakesRoom/border.bin"

EverGrandeCity_DrakesRoom_MapBlockdata:: @ 82D4764
	.incbin "data/layouts/EverGrandeCity_DrakesRoom/map.bin"

	.align 2
EverGrandeCity_DrakesRoom_Layout:: @ 82D48D0
	.4byte 0xd
	.4byte 0xe
	.4byte EverGrandeCity_DrakesRoom_MapBorder
	.4byte EverGrandeCity_DrakesRoom_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_EliteFour
