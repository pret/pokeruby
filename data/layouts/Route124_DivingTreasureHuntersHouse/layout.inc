Route124_DivingTreasureHuntersHouse_MapBorder:: @ 82FC7EC
	.incbin "data/layouts/Route124_DivingTreasureHuntersHouse/border.bin"

Route124_DivingTreasureHuntersHouse_MapBlockdata:: @ 82FC7F4
	.incbin "data/layouts/Route124_DivingTreasureHuntersHouse/map.bin"

	.align 2
Route124_DivingTreasureHuntersHouse_Layout:: @ 82FC8A8
	.4byte 0xa
	.4byte 0x9
	.4byte Route124_DivingTreasureHuntersHouse_MapBorder
	.4byte Route124_DivingTreasureHuntersHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
