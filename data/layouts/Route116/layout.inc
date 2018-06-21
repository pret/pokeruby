Route116_MapBorder:: @ 82A4A3C
	.incbin "data/layouts/Route116/border.bin"

Route116_MapBlockdata:: @ 82A4A44
	.incbin "data/layouts/Route116/map.bin"

	.align 2
Route116_Layout:: @ 82A59E4
	.4byte 0x64
	.4byte 0x14
	.4byte Route116_MapBorder
	.4byte Route116_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Rustboro
