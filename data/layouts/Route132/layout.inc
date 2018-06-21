Route132_MapBorder:: @ 82C04DC
	.incbin "data/layouts/Route132/border.bin"

Route132_MapBlockdata:: @ 82C04E4
	.incbin "data/layouts/Route132/map.bin"

	.align 2
Route132_Layout:: @ 82C1DE4
	.4byte 0x50
	.4byte 0x28
	.4byte Route132_MapBorder
	.4byte Route132_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
