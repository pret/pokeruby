LilycoveCity_MapBorder:: @ 828AC0C
	.incbin "data/layouts/LilycoveCity/border.bin"

LilycoveCity_MapBlockdata:: @ 828AC14
	.incbin "data/layouts/LilycoveCity/map.bin"

	.align 2
LilycoveCity_Layout:: @ 828C514
	.4byte 0x50
	.4byte 0x28
	.4byte LilycoveCity_MapBorder
	.4byte LilycoveCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
