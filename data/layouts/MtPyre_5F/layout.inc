MtPyre_5F_MapBorder:: @ 82DB8EC
	.incbin "data/layouts/MtPyre_5F/border.bin"

MtPyre_5F_MapBlockdata:: @ 82DB8F4
	.incbin "data/layouts/MtPyre_5F/map.bin"

	.align 2
MtPyre_5F_Layout:: @ 82DBA48
	.4byte 0xd
	.4byte 0xd
	.4byte MtPyre_5F_MapBorder
	.4byte MtPyre_5F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
