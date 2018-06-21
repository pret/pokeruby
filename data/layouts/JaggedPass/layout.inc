JaggedPass_MapBorder:: @ 82FAA8C
	.incbin "data/layouts/JaggedPass/border.bin"

JaggedPass_MapBlockdata:: @ 82FAA94
	.incbin "data/layouts/JaggedPass/map.bin"

	.align 2
JaggedPass_Layout:: @ 82FB55C
	.4byte 0x1e
	.4byte 0x2e
	.4byte JaggedPass_MapBorder
	.4byte JaggedPass_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lavaridge
