Route107_MapBorder:: @ 829843C
	.incbin "data/layouts/Route107/border.bin"

Route107_MapBlockdata:: @ 8298444
	.incbin "data/layouts/Route107/map.bin"

	.align 2
Route107_Layout:: @ 8298DA4
	.4byte 0x3c
	.4byte 0x14
	.4byte Route107_MapBorder
	.4byte Route107_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Dewford
