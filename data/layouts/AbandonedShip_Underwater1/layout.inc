AbandonedShip_Underwater1_MapBorder:: @ 82E722C
	.incbin "data/layouts/AbandonedShip_Underwater1/border.bin"

AbandonedShip_Underwater1_MapBlockdata:: @ 82E7234
	.incbin "data/layouts/AbandonedShip_Underwater1/map.bin"

	.align 2
AbandonedShip_Underwater1_Layout:: @ 82E72B4
	.4byte 0x8
	.4byte 0x8
	.4byte AbandonedShip_Underwater1_MapBorder
	.4byte AbandonedShip_Underwater1_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
