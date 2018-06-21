Route129_MapBorder:: @ 82BBFBC
	.incbin "data/layouts/Route129/border.bin"

Route129_MapBlockdata:: @ 82BBFC4
	.incbin "data/layouts/Route129/map.bin"

	.align 2
Route129_Layout:: @ 82BD8C4
	.4byte 0x50
	.4byte 0x28
	.4byte Route129_MapBorder
	.4byte Route129_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mossdeep
