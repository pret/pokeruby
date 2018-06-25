CaveOfOrigin_B3F_MapBorder:: @ 82E0A28
	.incbin "data/layouts/CaveOfOrigin_B3F/border.bin"

CaveOfOrigin_B3F_MapBlockdata:: @ 82E0A30
	.incbin "data/layouts/CaveOfOrigin_B3F/map.bin"

	.align 2
CaveOfOrigin_B3F_Layout:: @ 82E0D50
	.4byte 0x13
	.4byte 0x15
	.4byte CaveOfOrigin_B3F_MapBorder
	.4byte CaveOfOrigin_B3F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
