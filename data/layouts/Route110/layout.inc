Route110_MapBorder:: @ 829AA1C
	.incbin "data/layouts/Route110/border.bin"

Route110_MapBlockdata:: @ 829AA24
	.incbin "data/layouts/Route110/map.bin"

	.align 2
Route110_Layout:: @ 829C964
	.4byte 0x28
	.4byte 0x64
	.4byte Route110_MapBorder
	.4byte Route110_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mauville
