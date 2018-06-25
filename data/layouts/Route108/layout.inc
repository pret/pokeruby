Route108_MapBorder:: @ 8298DBC
	.incbin "data/layouts/Route108/border.bin"

Route108_MapBlockdata:: @ 8298DC4
	.incbin "data/layouts/Route108/map.bin"

	.align 2
Route108_Layout:: @ 8299724
	.4byte 0x3c
	.4byte 0x14
	.4byte Route108_MapBorder
	.4byte Route108_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Slateport
