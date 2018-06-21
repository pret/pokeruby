CaveOfOrigin_Entrance_MapBorder:: @ 82DFA10
	.incbin "data/layouts/CaveOfOrigin_Entrance/border.bin"

CaveOfOrigin_Entrance_MapBlockdata:: @ 82DFA18
	.incbin "data/layouts/CaveOfOrigin_Entrance/map.bin"

	.align 2
CaveOfOrigin_Entrance_Layout:: @ 82DFDF4
	.4byte 0x13
	.4byte 0x1a
	.4byte CaveOfOrigin_Entrance_MapBorder
	.4byte CaveOfOrigin_Entrance_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
