Route104_MrBrineysHouse_MapBorder:: @ 82D1FDC
	.incbin "data/layouts/Route104_MrBrineysHouse/border.bin"

Route104_MrBrineysHouse_MapBlockdata:: @ 82D1FE4
	.incbin "data/layouts/Route104_MrBrineysHouse/map.bin"

	.align 2
Route104_MrBrineysHouse_Layout:: @ 82D20BC
	.4byte 0xc
	.4byte 0x9
	.4byte Route104_MrBrineysHouse_MapBorder
	.4byte Route104_MrBrineysHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
