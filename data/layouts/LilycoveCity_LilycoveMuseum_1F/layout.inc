LilycoveCity_LilycoveMuseum_1F_MapBorder:: @ 82D20D4
	.incbin "data/layouts/LilycoveCity_LilycoveMuseum_1F/border.bin"

LilycoveCity_LilycoveMuseum_1F_MapBlockdata:: @ 82D20DC
	.incbin "data/layouts/LilycoveCity_LilycoveMuseum_1F/map.bin"

	.align 2
LilycoveCity_LilycoveMuseum_1F_Layout:: @ 82D2328
	.4byte 0x15
	.4byte 0xe
	.4byte LilycoveCity_LilycoveMuseum_1F_MapBorder
	.4byte LilycoveCity_LilycoveMuseum_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_LilycoveMuseum
