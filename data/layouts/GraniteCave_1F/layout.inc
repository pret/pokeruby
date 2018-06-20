GraniteCave_1F_MapBorder:: @ 82D7F70
	.incbin "data/layouts/GraniteCave_1F/border.bin"

GraniteCave_1F_MapBlockdata:: @ 82D7F78
	.incbin "data/layouts/GraniteCave_1F/map.bin"

	.align 2
GraniteCave_1F_Layout:: @ 82D8464
	.4byte 0x2a
	.4byte 0xf
	.4byte GraniteCave_1F_MapBorder
	.4byte GraniteCave_1F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
