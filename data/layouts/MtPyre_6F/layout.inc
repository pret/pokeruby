MtPyre_6F_MapBorder:: @ 82DBA60
	.incbin "data/layouts/MtPyre_6F/border.bin"

MtPyre_6F_MapBlockdata:: @ 82DBA68
	.incbin "data/layouts/MtPyre_6F/map.bin"

	.align 2
MtPyre_6F_Layout:: @ 82DBBBC
	.4byte 0xd
	.4byte 0xd
	.4byte MtPyre_6F_MapBorder
	.4byte MtPyre_6F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
