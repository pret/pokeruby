AbandonedShip_Corridors_B1F_MapBorder:: @ 82E6DF8
	.incbin "data/layouts/AbandonedShip_Corridors_B1F/border.bin"

AbandonedShip_Corridors_B1F_MapBlockdata:: @ 82E6E00
	.incbin "data/layouts/AbandonedShip_Corridors_B1F/map.bin"

	.align 2
AbandonedShip_Corridors_B1F_Layout:: @ 82E6F04
	.4byte 0xd
	.4byte 0xa
	.4byte AbandonedShip_Corridors_B1F_MapBorder
	.4byte AbandonedShip_Corridors_B1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
