SkyPillar_2F_MapBorder:: @ 8303300
	.incbin "data/layouts/SkyPillar_2F/border.bin"

SkyPillar_2F_MapBlockdata:: @ 8303308
	.incbin "data/layouts/SkyPillar_2F/map.bin"

	.align 2
SkyPillar_2F_Layout:: @ 8303490
	.4byte 0xe
	.4byte 0xe
	.4byte SkyPillar_2F_MapBorder
	.4byte SkyPillar_2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
