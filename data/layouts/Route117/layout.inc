Route117_MapBorder:: @ 82A59FC
	.incbin "data/layouts/Route117/border.bin"

Route117_MapBlockdata:: @ 82A5A04
	.incbin "data/layouts/Route117/map.bin"

	.align 2
Route117_Layout:: @ 82A6364
	.4byte 0x3c
	.4byte 0x14
	.4byte Route117_MapBorder
	.4byte Route117_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mauville
