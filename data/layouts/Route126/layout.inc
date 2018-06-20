Route126_MapBorder:: @ 82B35DC
	.incbin "data/layouts/Route126/border.bin"

Route126_MapBlockdata:: @ 82B35E4
	.incbin "data/layouts/Route126/map.bin"

	.align 2
Route126_Layout:: @ 82B67E4
	.4byte 0x50
	.4byte 0x50
	.4byte Route126_MapBorder
	.4byte Route126_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mossdeep
