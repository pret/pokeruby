PokeMart_MapBorder:: @ 82CE29C
	.incbin "data/layouts/PokeMart/border.bin"

PokeMart_MapBlockdata:: @ 82CE2A4
	.incbin "data/layouts/PokeMart/map.bin"

	.align 2
PokeMart_Layout:: @ 82CE354
	.4byte 0xb
	.4byte 0x8
	.4byte PokeMart_MapBorder
	.4byte PokeMart_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
