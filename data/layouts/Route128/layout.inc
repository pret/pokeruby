Route128_MapBorder:: @ 82B9A1C
	.incbin "data/layouts/Route128/border.bin"

Route128_MapBlockdata:: @ 82B9A24
	.incbin "data/layouts/Route128/map.bin"

	.align 2
Route128_Layout:: @ 82BBFA4
	.4byte 0x78
	.4byte 0x28
	.4byte Route128_MapBorder
	.4byte Route128_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mossdeep
