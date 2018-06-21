EverGrandeCity_ChampionsRoom_MapBorder:: @ 82D48E8
	.incbin "data/layouts/EverGrandeCity_ChampionsRoom/border.bin"

EverGrandeCity_ChampionsRoom_MapBlockdata:: @ 82D48F0
	.incbin "data/layouts/EverGrandeCity_ChampionsRoom/map.bin"

	.align 2
EverGrandeCity_ChampionsRoom_Layout:: @ 82D4A44
	.4byte 0xd
	.4byte 0xd
	.4byte EverGrandeCity_ChampionsRoom_MapBorder
	.4byte EverGrandeCity_ChampionsRoom_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_EliteFour
