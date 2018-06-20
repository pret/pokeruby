Route131_MapBorder:: @ 82BF1FC
	.incbin "data/layouts/Route131/border.bin"

Route131_MapBlockdata:: @ 82BF204
	.incbin "data/layouts/Route131/map.bin"

	.align 2
Route131_Layout:: @ 82C04C4
	.4byte 0x3c
	.4byte 0x28
	.4byte Route131_MapBorder
	.4byte Route131_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
