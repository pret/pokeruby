Route115_MapBorder:: @ 82A311C
	.incbin "data/layouts/Route115/border.bin"

Route115_MapBlockdata:: @ 82A3124
	.incbin "data/layouts/Route115/map.bin"

	.align 2
Route115_Layout:: @ 82A4A24
	.4byte 0x28
	.4byte 0x50
	.4byte Route115_MapBorder
	.4byte Route115_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Fallarbor
