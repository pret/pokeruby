MtPyre_4F_MapBorder:: @ 82DB778
	.incbin "data/layouts/MtPyre_4F/border.bin"

MtPyre_4F_MapBlockdata:: @ 82DB780
	.incbin "data/layouts/MtPyre_4F/map.bin"

	.align 2
MtPyre_4F_Layout:: @ 82DB8D4
	.4byte 0xd
	.4byte 0xd
	.4byte MtPyre_4F_MapBorder
	.4byte MtPyre_4F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
