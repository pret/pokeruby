Route133_MapBorder:: @ 82C1DFC
	.incbin "data/layouts/Route133/border.bin"

Route133_MapBlockdata:: @ 82C1E04
	.incbin "data/layouts/Route133/map.bin"

	.align 2
Route133_Layout:: @ 82C3704
	.4byte 0x50
	.4byte 0x28
	.4byte Route133_MapBorder
	.4byte Route133_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
