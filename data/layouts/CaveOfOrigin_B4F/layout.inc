CaveOfOrigin_B4F_MapBorder:: @ 82E0D68
	.incbin "data/layouts/CaveOfOrigin_B4F/border.bin"

CaveOfOrigin_B4F_MapBlockdata:: @ 82E0D70
	.incbin "data/layouts/CaveOfOrigin_B4F/map.bin"

	.align 2
CaveOfOrigin_B4F_Layout:: @ 82E1044
	.4byte 0x13
	.4byte 0x13
	.4byte CaveOfOrigin_B4F_MapBorder
	.4byte CaveOfOrigin_B4F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
