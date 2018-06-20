MossdeepCity_MapBorder:: @ 828C52C
	.incbin "data/layouts/MossdeepCity/border.bin"

MossdeepCity_MapBlockdata:: @ 828C534
	.incbin "data/layouts/MossdeepCity/map.bin"

	.align 2
MossdeepCity_Layout:: @ 828DE34
	.4byte 0x50
	.4byte 0x28
	.4byte MossdeepCity_MapBorder
	.4byte MossdeepCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mossdeep
