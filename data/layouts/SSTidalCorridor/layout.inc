SSTidalCorridor_MapBorder:: @ 82F63F8
	.incbin "data/layouts/SSTidalCorridor/border.bin"

SSTidalCorridor_MapBlockdata:: @ 82F6400
	.incbin "data/layouts/SSTidalCorridor/map.bin"

	.align 2
SSTidalCorridor_Layout:: @ 82F65D4
	.4byte 0x12
	.4byte 0xd
	.4byte SSTidalCorridor_MapBorder
	.4byte SSTidalCorridor_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
