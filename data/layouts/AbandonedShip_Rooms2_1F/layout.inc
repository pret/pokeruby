AbandonedShip_Rooms2_1F_MapBorder:: @ 82E737C
	.incbin "data/layouts/AbandonedShip_Rooms2_1F/border.bin"

AbandonedShip_Rooms2_1F_MapBlockdata:: @ 82E7384
	.incbin "data/layouts/AbandonedShip_Rooms2_1F/map.bin"

	.align 2
AbandonedShip_Rooms2_1F_Layout:: @ 82E74B8
	.4byte 0x9
	.4byte 0x11
	.4byte AbandonedShip_Rooms2_1F_MapBorder
	.4byte AbandonedShip_Rooms2_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
