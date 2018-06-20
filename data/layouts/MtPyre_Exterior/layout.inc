MtPyre_Exterior_MapBorder:: @ 82FC8C0
	.incbin "data/layouts/MtPyre_Exterior/border.bin"

MtPyre_Exterior_MapBlockdata:: @ 82FC8C8
	.incbin "data/layouts/MtPyre_Exterior/map.bin"

	.align 2
MtPyre_Exterior_Layout:: @ 82FD7EC
	.4byte 0x26
	.4byte 0x33
	.4byte MtPyre_Exterior_MapBorder
	.4byte MtPyre_Exterior_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
