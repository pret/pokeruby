AbandonedShip_HiddenFloorCorridors_MapBorder:: @ 82F9C40
	.incbin "data/layouts/AbandonedShip_HiddenFloorCorridors/border.bin"

AbandonedShip_HiddenFloorCorridors_MapBlockdata:: @ 82F9C48
	.incbin "data/layouts/AbandonedShip_HiddenFloorCorridors/map.bin"

	.align 2
AbandonedShip_HiddenFloorCorridors_Layout:: @ 82F9D68
	.4byte 0xd
	.4byte 0xb
	.4byte AbandonedShip_HiddenFloorCorridors_MapBorder
	.4byte AbandonedShip_HiddenFloorCorridors_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
