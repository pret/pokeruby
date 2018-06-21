EverGrandeCity_PhoebesRoom_MapBorder:: @ 82D4444
	.incbin "data/layouts/EverGrandeCity_PhoebesRoom/border.bin"

EverGrandeCity_PhoebesRoom_MapBlockdata:: @ 82D444C
	.incbin "data/layouts/EverGrandeCity_PhoebesRoom/map.bin"

	.align 2
EverGrandeCity_PhoebesRoom_Layout:: @ 82D45B8
	.4byte 0xd
	.4byte 0xe
	.4byte EverGrandeCity_PhoebesRoom_MapBorder
	.4byte EverGrandeCity_PhoebesRoom_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_EliteFour
