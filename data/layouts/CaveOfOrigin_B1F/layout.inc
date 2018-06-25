CaveOfOrigin_B1F_MapBorder:: @ 82E0250
	.incbin "data/layouts/CaveOfOrigin_B1F/border.bin"

CaveOfOrigin_B1F_MapBlockdata:: @ 82E0258
	.incbin "data/layouts/CaveOfOrigin_B1F/map.bin"

	.align 2
CaveOfOrigin_B1F_Layout:: @ 82E067C
	.4byte 0x17
	.4byte 0x17
	.4byte CaveOfOrigin_B1F_MapBorder
	.4byte CaveOfOrigin_B1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
