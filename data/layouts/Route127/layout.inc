Route127_MapBorder:: @ 82B67FC
	.incbin "data/layouts/Route127/border.bin"

Route127_MapBlockdata:: @ 82B6804
	.incbin "data/layouts/Route127/map.bin"

	.align 2
Route127_Layout:: @ 82B9A04
	.4byte 0x50
	.4byte 0x50
	.4byte Route127_MapBorder
	.4byte Route127_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mossdeep
