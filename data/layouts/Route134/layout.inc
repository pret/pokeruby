Route134_MapBorder:: @ 82C371C
	.incbin "data/layouts/Route134/border.bin"

Route134_MapBlockdata:: @ 82C3724
	.incbin "data/layouts/Route134/map.bin"

	.align 2
Route134_Layout:: @ 82C5024
	.4byte 0x50
	.4byte 0x28
	.4byte Route134_MapBorder
	.4byte Route134_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
