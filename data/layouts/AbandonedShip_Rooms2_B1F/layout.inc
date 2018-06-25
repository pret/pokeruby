AbandonedShip_Rooms2_B1F_MapBorder:: @ 82E70EC
	.incbin "data/layouts/AbandonedShip_Rooms2_B1F/border.bin"

AbandonedShip_Rooms2_B1F_MapBlockdata:: @ 82E70F4
	.incbin "data/layouts/AbandonedShip_Rooms2_B1F/map.bin"

	.align 2
AbandonedShip_Rooms2_B1F_Layout:: @ 82E7214
	.4byte 0x12
	.4byte 0x8
	.4byte AbandonedShip_Rooms2_B1F_MapBorder
	.4byte AbandonedShip_Rooms2_B1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
