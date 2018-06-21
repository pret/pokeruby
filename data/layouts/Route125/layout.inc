Route125_MapBorder:: @ 82B1CBC
	.incbin "data/layouts/Route125/border.bin"

Route125_MapBlockdata:: @ 82B1CC4
	.incbin "data/layouts/Route125/map.bin"

	.align 2
Route125_Layout:: @ 82B35C4
	.4byte 0x50
	.4byte 0x28
	.4byte Route125_MapBorder
	.4byte Route125_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mossdeep
