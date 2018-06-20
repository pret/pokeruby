SkyPillar_Top_MapBorder:: @ 83049E8
	.incbin "data/layouts/SkyPillar_Top/border.bin"

SkyPillar_Top_MapBlockdata:: @ 83049F0
	.incbin "data/layouts/SkyPillar_Top/map.bin"

	.align 2
SkyPillar_Top_Layout:: @ 8304F00
	.4byte 0x1b
	.4byte 0x18
	.4byte SkyPillar_Top_MapBorder
	.4byte SkyPillar_Top_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
