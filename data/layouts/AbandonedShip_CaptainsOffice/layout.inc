AbandonedShip_CaptainsOffice_MapBorder:: @ 82E74D0
	.incbin "data/layouts/AbandonedShip_CaptainsOffice/border.bin"

AbandonedShip_CaptainsOffice_MapBlockdata:: @ 82E74D8
	.incbin "data/layouts/AbandonedShip_CaptainsOffice/map.bin"

	.align 2
AbandonedShip_CaptainsOffice_Layout:: @ 82E7558
	.4byte 0x9
	.4byte 0x7
	.4byte AbandonedShip_CaptainsOffice_MapBorder
	.4byte AbandonedShip_CaptainsOffice_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
