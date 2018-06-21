SkyPillar_4F_MapBorder:: @ 8303650
	.incbin "data/layouts/SkyPillar_4F/border.bin"

SkyPillar_4F_MapBlockdata:: @ 8303658
	.incbin "data/layouts/SkyPillar_4F/map.bin"

	.align 2
SkyPillar_4F_Layout:: @ 83037E0
	.4byte 0xe
	.4byte 0xe
	.4byte SkyPillar_4F_MapBorder
	.4byte SkyPillar_4F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
