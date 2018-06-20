Route114_LanettesHouse_MapBorder:: @ 82D51A8
	.incbin "data/layouts/Route114_LanettesHouse/border.bin"

Route114_LanettesHouse_MapBlockdata:: @ 82D51B0
	.incbin "data/layouts/Route114_LanettesHouse/map.bin"

	.align 2
Route114_LanettesHouse_Layout:: @ 82D5260
	.4byte 0xb
	.4byte 0x8
	.4byte Route114_LanettesHouse_MapBorder
	.4byte Route114_LanettesHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Lab
