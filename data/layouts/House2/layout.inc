House2_MapBorder:: @ 82CDF94
	.incbin "data/layouts/House2/border.bin"

House2_MapBlockdata:: @ 82CDF9C
	.incbin "data/layouts/House2/map.bin"

	.align 2
House2_Layout:: @ 82CE04C
	.4byte 0xb
	.4byte 0x8
	.4byte House2_MapBorder
	.4byte House2_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
