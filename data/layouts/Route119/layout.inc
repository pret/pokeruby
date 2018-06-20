Route119_MapBorder:: @ 82A701C
	.incbin "data/layouts/Route119/border.bin"

Route119_MapBlockdata:: @ 82A7024
	.incbin "data/layouts/Route119/map.bin"

	.align 2
Route119_Layout:: @ 82A9BE4
	.4byte 0x28
	.4byte 0x8c
	.4byte Route119_MapBorder
	.4byte Route119_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Fortree
