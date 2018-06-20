Route121_SafariZoneEntrance_MapBorder:: @ 82D5444
	.incbin "data/layouts/Route121_SafariZoneEntrance/border.bin"

Route121_SafariZoneEntrance_MapBlockdata:: @ 82D544C
	.incbin "data/layouts/Route121_SafariZoneEntrance/map.bin"

	.align 2
Route121_SafariZoneEntrance_Layout:: @ 82D5644
	.4byte 0x12
	.4byte 0xe
	.4byte Route121_SafariZoneEntrance_MapBorder
	.4byte Route121_SafariZoneEntrance_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
