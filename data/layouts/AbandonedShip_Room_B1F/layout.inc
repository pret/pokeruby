AbandonedShip_Room_B1F_MapBorder:: @ 82E72CC
	.incbin "data/layouts/AbandonedShip_Room_B1F/border.bin"

AbandonedShip_Room_B1F_MapBlockdata:: @ 82E72D4
	.incbin "data/layouts/AbandonedShip_Room_B1F/map.bin"

	.align 2
AbandonedShip_Room_B1F_Layout:: @ 82E7364
	.4byte 0x9
	.4byte 0x8
	.4byte AbandonedShip_Room_B1F_MapBorder
	.4byte AbandonedShip_Room_B1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
