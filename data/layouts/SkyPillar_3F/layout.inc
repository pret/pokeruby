SkyPillar_3F_MapBorder:: @ 83034A8
	.incbin "data/layouts/SkyPillar_3F/border.bin"

SkyPillar_3F_MapBlockdata:: @ 83034B0
	.incbin "data/layouts/SkyPillar_3F/map.bin"

	.align 2
SkyPillar_3F_Layout:: @ 8303638
	.4byte 0xe
	.4byte 0xe
	.4byte SkyPillar_3F_MapBorder
	.4byte SkyPillar_3F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
