House4_MapBorder:: @ 82CE990
	.incbin "data/layouts/House4/border.bin"

House4_MapBlockdata:: @ 82CE998
	.incbin "data/layouts/House4/map.bin"

	.align 2
House4_Layout:: @ 82CEA4C
	.4byte 0xa
	.4byte 0x9
	.4byte House4_MapBorder
	.4byte House4_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
