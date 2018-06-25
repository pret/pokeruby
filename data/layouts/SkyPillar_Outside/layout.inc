SkyPillar_Outside_MapBorder:: @ 8302C30
	.incbin "data/layouts/SkyPillar_Outside/border.bin"

SkyPillar_Outside_MapBlockdata:: @ 8302C38
	.incbin "data/layouts/SkyPillar_Outside/map.bin"

	.align 2
SkyPillar_Outside_Layout:: @ 8303140
	.4byte 0x1c
	.4byte 0x17
	.4byte SkyPillar_Outside_MapBorder
	.4byte SkyPillar_Outside_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
