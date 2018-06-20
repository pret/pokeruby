GraniteCave_StevensRoom_MapBorder:: @ 82F9A7C
	.incbin "data/layouts/GraniteCave_StevensRoom/border.bin"

GraniteCave_StevensRoom_MapBlockdata:: @ 82F9A84
	.incbin "data/layouts/GraniteCave_StevensRoom/map.bin"

	.align 2
GraniteCave_StevensRoom_Layout:: @ 82F9C28
	.4byte 0xf
	.4byte 0xe
	.4byte GraniteCave_StevensRoom_MapBorder
	.4byte GraniteCave_StevensRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
