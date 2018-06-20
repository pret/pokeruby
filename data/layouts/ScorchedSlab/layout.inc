ScorchedSlab_MapBorder:: @ 82FF340
	.incbin "data/layouts/ScorchedSlab/border.bin"

ScorchedSlab_MapBlockdata:: @ 82FF348
	.incbin "data/layouts/ScorchedSlab/map.bin"

	.align 2
ScorchedSlab_Layout:: @ 82FF5A0
	.4byte 0xf
	.4byte 0x14
	.4byte ScorchedSlab_MapBorder
	.4byte ScorchedSlab_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
