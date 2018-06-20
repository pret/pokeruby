FieryPath_MapBorder:: @ 82FB574
	.incbin "data/layouts/FieryPath/border.bin"

FieryPath_MapBlockdata:: @ 82FB57C
	.incbin "data/layouts/FieryPath/map.bin"

	.align 2
FieryPath_Layout:: @ 82FBFE0
	.4byte 0x23
	.4byte 0x26
	.4byte FieryPath_MapBorder
	.4byte FieryPath_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lavaridge
