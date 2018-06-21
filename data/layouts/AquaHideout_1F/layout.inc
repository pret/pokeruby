AquaHideout_1F_MapBorder:: @ 82DBBD4
	.incbin "data/layouts/AquaHideout_1F/border.bin"

AquaHideout_1F_MapBlockdata:: @ 82DBBDC
	.incbin "data/layouts/AquaHideout_1F/map.bin"

	.align 2
AquaHideout_1F_Layout:: @ 82DC26C
	.4byte 0x1c
	.4byte 0x1e
	.4byte AquaHideout_1F_MapBorder
	.4byte AquaHideout_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
