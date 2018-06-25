MagmaHideout_1F_MapBorder:: @ 82FFDB8
	.incbin "data/layouts/MagmaHideout_1F/border.bin"

MagmaHideout_1F_MapBlockdata:: @ 82FFDC0
	.incbin "data/layouts/MagmaHideout_1F/map.bin"

	.align 2
MagmaHideout_1F_Layout:: @ 8300450
	.4byte 0x1c
	.4byte 0x1e
	.4byte MagmaHideout_1F_MapBorder
	.4byte MagmaHideout_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
