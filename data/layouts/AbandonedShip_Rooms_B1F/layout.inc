AbandonedShip_Rooms_B1F_MapBorder:: @ 82E6F1C
	.incbin "data/layouts/AbandonedShip_Rooms_B1F/border.bin"

AbandonedShip_Rooms_B1F_MapBlockdata:: @ 82E6F24
	.incbin "data/layouts/AbandonedShip_Rooms_B1F/map.bin"

	.align 2
AbandonedShip_Rooms_B1F_Layout:: @ 82E70D4
	.4byte 0x1b
	.4byte 0x8
	.4byte AbandonedShip_Rooms_B1F_MapBorder
	.4byte AbandonedShip_Rooms_B1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
