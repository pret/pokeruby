Route120_MapBorder:: @ 82A9BFC
	.incbin "data/layouts/Route120/border.bin"

Route120_MapBlockdata:: @ 82A9C04
	.incbin "data/layouts/Route120/map.bin"

	.align 2
Route120_Layout:: @ 82ABB44
	.4byte 0x28
	.4byte 0x64
	.4byte Route120_MapBorder
	.4byte Route120_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Fortree
