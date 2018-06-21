EverGrandeCity_SidneysRoom_MapBorder:: @ 82D42B8
	.incbin "data/layouts/EverGrandeCity_SidneysRoom/border.bin"

EverGrandeCity_SidneysRoom_MapBlockdata:: @ 82D42C0
	.incbin "data/layouts/EverGrandeCity_SidneysRoom/map.bin"

	.align 2
EverGrandeCity_SidneysRoom_Layout:: @ 82D442C
	.4byte 0xd
	.4byte 0xe
	.4byte EverGrandeCity_SidneysRoom_MapBorder
	.4byte EverGrandeCity_SidneysRoom_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_EliteFour
