SlateportCity_MapBorder:: @ 828798C
	.incbin "data/layouts/SlateportCity/border.bin"

SlateportCity_MapBlockdata:: @ 8287994
	.incbin "data/layouts/SlateportCity/map.bin"

	.align 2
SlateportCity_Layout:: @ 8288C54
	.4byte 0x28
	.4byte 0x3c
	.4byte SlateportCity_MapBorder
	.4byte SlateportCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Slateport
