LilycoveCity_LilycoveMuseum_2F_MapBorder:: @ 82D2340
	.incbin "data/layouts/LilycoveCity_LilycoveMuseum_2F/border.bin"

LilycoveCity_LilycoveMuseum_2F_MapBlockdata:: @ 82D2348
	.incbin "data/layouts/LilycoveCity_LilycoveMuseum_2F/map.bin"

	.align 2
LilycoveCity_LilycoveMuseum_2F_Layout:: @ 82D2584
	.4byte 0x16
	.4byte 0xd
	.4byte LilycoveCity_LilycoveMuseum_2F_MapBorder
	.4byte LilycoveCity_LilycoveMuseum_2F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_LilycoveMuseum
