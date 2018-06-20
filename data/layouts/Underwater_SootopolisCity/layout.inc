Underwater_SootopolisCity_MapBorder:: @ 82D793C
	.incbin "data/layouts/Underwater_SootopolisCity/border.bin"

Underwater_SootopolisCity_MapBlockdata:: @ 82D7944
	.incbin "data/layouts/Underwater_SootopolisCity/map.bin"

	.align 2
Underwater_SootopolisCity_Layout:: @ 82D7AD4
	.4byte 0x14
	.4byte 0xa
	.4byte Underwater_SootopolisCity_MapBorder
	.4byte Underwater_SootopolisCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Underwater
