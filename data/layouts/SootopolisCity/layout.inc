SootopolisCity_MapBorder:: @ 828DE4C
	.incbin "data/layouts/SootopolisCity/border.bin"

SootopolisCity_MapBlockdata:: @ 828DE54
	.incbin "data/layouts/SootopolisCity/map.bin"

	.align 2
SootopolisCity_Layout:: @ 828FA74
	.4byte 0x3c
	.4byte 0x3c
	.4byte SootopolisCity_MapBorder
	.4byte SootopolisCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Sootopolis
