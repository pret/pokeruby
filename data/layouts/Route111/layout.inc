Route111_MapBorder:: @ 829C97C
	.incbin "data/layouts/Route111/border.bin"

Route111_MapBlockdata:: @ 829C984
	.incbin "data/layouts/Route111/map.bin"

	.align 2
Route111_Layout:: @ 829F544
	.4byte 0x28
	.4byte 0x8c
	.4byte Route111_MapBorder
	.4byte Route111_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mauville
