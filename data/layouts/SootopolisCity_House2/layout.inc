SootopolisCity_House2_MapBorder:: @ 82FECD8
	.incbin "data/layouts/SootopolisCity_House2/border.bin"

SootopolisCity_House2_MapBlockdata:: @ 82FECE0
	.incbin "data/layouts/SootopolisCity_House2/map.bin"

	.align 2
SootopolisCity_House2_Layout:: @ 82FED50
	.4byte 0x8
	.4byte 0x7
	.4byte SootopolisCity_House2_MapBorder
	.4byte SootopolisCity_House2_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
