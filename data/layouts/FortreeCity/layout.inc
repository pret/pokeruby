FortreeCity_MapBorder:: @ 828A5AC
	.incbin "data/layouts/FortreeCity/border.bin"

FortreeCity_MapBlockdata:: @ 828A5B4
	.incbin "data/layouts/FortreeCity/map.bin"

	.align 2
FortreeCity_Layout:: @ 828ABF4
	.4byte 0x28
	.4byte 0x14
	.4byte FortreeCity_MapBorder
	.4byte FortreeCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Fortree
