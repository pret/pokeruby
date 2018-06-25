LavaridgeTown_MapBorder:: @ 8291D6C
	.incbin "data/layouts/LavaridgeTown/border.bin"

LavaridgeTown_MapBlockdata:: @ 8291D74
	.incbin "data/layouts/LavaridgeTown/map.bin"

	.align 2
LavaridgeTown_Layout:: @ 8292094
	.4byte 0x14
	.4byte 0x14
	.4byte LavaridgeTown_MapBorder
	.4byte LavaridgeTown_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lavaridge
