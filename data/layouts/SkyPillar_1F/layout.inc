SkyPillar_1F_MapBorder:: @ 8303158
	.incbin "data/layouts/SkyPillar_1F/border.bin"

SkyPillar_1F_MapBlockdata:: @ 8303160
	.incbin "data/layouts/SkyPillar_1F/map.bin"

	.align 2
SkyPillar_1F_Layout:: @ 83032E8
	.4byte 0xe
	.4byte 0xe
	.4byte SkyPillar_1F_MapBorder
	.4byte SkyPillar_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
