MagmaHideout_B1F_MapBorder:: @ 8300468
	.incbin "data/layouts/MagmaHideout_B1F/border.bin"

MagmaHideout_B1F_MapBlockdata:: @ 8300470
	.incbin "data/layouts/MagmaHideout_B1F/map.bin"

	.align 2
MagmaHideout_B1F_Layout:: @ 8301010
	.4byte 0x3e
	.4byte 0x18
	.4byte MagmaHideout_B1F_MapBorder
	.4byte MagmaHideout_B1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
