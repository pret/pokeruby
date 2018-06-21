LavaridgeTown_HerbShop_MapBorder:: @ 82CEA64
	.incbin "data/layouts/LavaridgeTown_HerbShop/border.bin"

LavaridgeTown_HerbShop_MapBlockdata:: @ 82CEA6C
	.incbin "data/layouts/LavaridgeTown_HerbShop/map.bin"

	.align 2
LavaridgeTown_HerbShop_Layout:: @ 82CEB1C
	.4byte 0xb
	.4byte 0x8
	.4byte LavaridgeTown_HerbShop_MapBorder
	.4byte LavaridgeTown_HerbShop_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
