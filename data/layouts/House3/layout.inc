House3_MapBorder:: @ 82CE36C
	.incbin "data/layouts/House3/border.bin"

House3_MapBlockdata:: @ 82CE374
	.incbin "data/layouts/House3/map.bin"

	.align 2
House3_Layout:: @ 82CE414
	.4byte 0xa
	.4byte 0x8
	.4byte House3_MapBorder
	.4byte House3_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
