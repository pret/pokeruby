Route103_MapBorder:: @ 82938BC
	.incbin "data/layouts/Route103/border.bin"

Route103_MapBlockdata:: @ 82938C4
	.incbin "data/layouts/Route103/map.bin"

	.align 2
Route103_Layout:: @ 8294544
	.4byte 0x50
	.4byte 0x14
	.4byte Route103_MapBorder
	.4byte Route103_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Petalburg
