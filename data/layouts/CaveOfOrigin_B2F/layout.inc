CaveOfOrigin_B2F_MapBorder:: @ 82E0694
	.incbin "data/layouts/CaveOfOrigin_B2F/border.bin"

CaveOfOrigin_B2F_MapBlockdata:: @ 82E069C
	.incbin "data/layouts/CaveOfOrigin_B2F/map.bin"

	.align 2
CaveOfOrigin_B2F_Layout:: @ 82E0A10
	.4byte 0x15
	.4byte 0x15
	.4byte CaveOfOrigin_B2F_MapBorder
	.4byte CaveOfOrigin_B2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
