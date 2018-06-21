RustboroCity_MapBorder:: @ 82892CC
	.incbin "data/layouts/RustboroCity/border.bin"

RustboroCity_MapBlockdata:: @ 82892D4
	.incbin "data/layouts/RustboroCity/map.bin"

	.align 2
RustboroCity_Layout:: @ 828A594
	.4byte 0x28
	.4byte 0x3c
	.4byte RustboroCity_MapBorder
	.4byte RustboroCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Rustboro
