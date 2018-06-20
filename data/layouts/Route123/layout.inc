Route123_MapBorder:: @ 82AD49C
	.incbin "data/layouts/Route123/border.bin"

Route123_MapBlockdata:: @ 82AD4A4
	.incbin "data/layouts/Route123/map.bin"

	.align 2
Route123_Layout:: @ 82AEA84
	.4byte 0x8c
	.4byte 0x14
	.4byte Route123_MapBorder
	.4byte Route123_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
