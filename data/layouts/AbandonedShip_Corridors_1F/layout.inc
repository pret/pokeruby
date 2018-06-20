AbandonedShip_Corridors_1F_MapBorder:: @ 82E69A4
	.incbin "data/layouts/AbandonedShip_Corridors_1F/border.bin"

AbandonedShip_Corridors_1F_MapBlockdata:: @ 82E69AC
	.incbin "data/layouts/AbandonedShip_Corridors_1F/map.bin"

	.align 2
AbandonedShip_Corridors_1F_Layout:: @ 82E6B5C
	.4byte 0x12
	.4byte 0xc
	.4byte AbandonedShip_Corridors_1F_MapBorder
	.4byte AbandonedShip_Corridors_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
