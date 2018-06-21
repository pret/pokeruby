FortreeCity_DecorationShop_MapBorder:: @ 82EFAE4
	.incbin "data/layouts/FortreeCity_DecorationShop/border.bin"

FortreeCity_DecorationShop_MapBlockdata:: @ 82EFAEC
	.incbin "data/layouts/FortreeCity_DecorationShop/map.bin"

	.align 2
FortreeCity_DecorationShop_Layout:: @ 82EFB4C
	.4byte 0x8
	.4byte 0x6
	.4byte FortreeCity_DecorationShop_MapBorder
	.4byte FortreeCity_DecorationShop_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
