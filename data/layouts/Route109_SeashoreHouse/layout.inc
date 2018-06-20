Route109_SeashoreHouse_MapBorder:: @ 82EDF48
	.incbin "data/layouts/Route109_SeashoreHouse/border.bin"

Route109_SeashoreHouse_MapBlockdata:: @ 82EDF50
	.incbin "data/layouts/Route109_SeashoreHouse/map.bin"

	.align 2
Route109_SeashoreHouse_Layout:: @ 82EE07C
	.4byte 0xf
	.4byte 0xa
	.4byte Route109_SeashoreHouse_MapBorder
	.4byte Route109_SeashoreHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_SeashoreHouse
