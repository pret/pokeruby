MagmaHideout_B2F_MapBorder:: @ 8301028
	.incbin "data/layouts/MagmaHideout_B2F/border.bin"

MagmaHideout_B2F_MapBlockdata:: @ 8301030
	.incbin "data/layouts/MagmaHideout_B2F/map.bin"

	.align 2
MagmaHideout_B2F_Layout:: @ 8301690
	.4byte 0x22
	.4byte 0x18
	.4byte MagmaHideout_B2F_MapBorder
	.4byte MagmaHideout_B2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
