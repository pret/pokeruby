Route122_MapBorder:: @ 82AC7FC
	.incbin "data/layouts/Route122/border.bin"

Route122_MapBlockdata:: @ 82AC804
	.incbin "data/layouts/Route122/map.bin"

	.align 2
Route122_Layout:: @ 82AD484
	.4byte 0x28
	.4byte 0x28
	.4byte Route122_MapBorder
	.4byte Route122_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
