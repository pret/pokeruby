AquaHideout_B2F_MapBorder:: @ 82DCC34
	.incbin "data/layouts/AquaHideout_B2F/border.bin"

AquaHideout_B2F_MapBlockdata:: @ 82DCC3C
	.incbin "data/layouts/AquaHideout_B2F/map.bin"

	.align 2
AquaHideout_B2F_Layout:: @ 82DD29C
	.4byte 0x22
	.4byte 0x18
	.4byte AquaHideout_B2F_MapBorder
	.4byte AquaHideout_B2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
