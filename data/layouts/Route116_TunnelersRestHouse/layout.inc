Route116_TunnelersRestHouse_MapBorder:: @ 82D5278
	.incbin "data/layouts/Route116_TunnelersRestHouse/border.bin"

Route116_TunnelersRestHouse_MapBlockdata:: @ 82D5280
	.incbin "data/layouts/Route116_TunnelersRestHouse/map.bin"

	.align 2
Route116_TunnelersRestHouse_Layout:: @ 82D5334
	.4byte 0xa
	.4byte 0x9
	.4byte Route116_TunnelersRestHouse_MapBorder
	.4byte Route116_TunnelersRestHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
