MtPyre_1F_MapBorder:: @ 82DB12C
	.incbin "data/layouts/MtPyre_1F/border.bin"

MtPyre_1F_MapBlockdata:: @ 82DB134
	.incbin "data/layouts/MtPyre_1F/map.bin"

	.align 2
MtPyre_1F_Layout:: @ 82DB478
	.4byte 0x16
	.4byte 0x13
	.4byte MtPyre_1F_MapBorder
	.4byte MtPyre_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
