MtPyre_Summit_MapBorder:: @ 82FD804
	.incbin "data/layouts/MtPyre_Summit/border.bin"

MtPyre_Summit_MapBlockdata:: @ 82FD80C
	.incbin "data/layouts/MtPyre_Summit/map.bin"

	.align 2
MtPyre_Summit_Layout:: @ 82FE680
	.4byte 0x32
	.4byte 0x25
	.4byte MtPyre_Summit_MapBorder
	.4byte MtPyre_Summit_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
