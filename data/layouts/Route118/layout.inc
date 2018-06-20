Route118_MapBorder:: @ 82A637C
	.incbin "data/layouts/Route118/border.bin"

Route118_MapBlockdata:: @ 82A6384
	.incbin "data/layouts/Route118/map.bin"

	.align 2
Route118_Layout:: @ 82A7004
	.4byte 0x50
	.4byte 0x14
	.4byte Route118_MapBorder
	.4byte Route118_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mauville
