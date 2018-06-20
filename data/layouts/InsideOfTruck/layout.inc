InsideOfTruck_MapBorder:: @ 82EA08C
	.incbin "data/layouts/InsideOfTruck/border.bin"

InsideOfTruck_MapBlockdata:: @ 82EA094
	.incbin "data/layouts/InsideOfTruck/map.bin"

	.align 2
InsideOfTruck_Layout:: @ 82EA0C8
	.4byte 0x5
	.4byte 0x5
	.4byte InsideOfTruck_MapBorder
	.4byte InsideOfTruck_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_InsideOfTruck
