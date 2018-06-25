SootopolisCity_House1_MapBorder:: @ 82FEC48
	.incbin "data/layouts/SootopolisCity_House1/border.bin"

SootopolisCity_House1_MapBlockdata:: @ 82FEC50
	.incbin "data/layouts/SootopolisCity_House1/map.bin"

	.align 2
SootopolisCity_House1_Layout:: @ 82FECC0
	.4byte 0x8
	.4byte 0x7
	.4byte SootopolisCity_House1_MapBorder
	.4byte SootopolisCity_House1_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
