SootopolisCity_House8_MapBorder:: @ 82FC34C
	.incbin "data/layouts/SootopolisCity_House8/border.bin"

SootopolisCity_House8_MapBlockdata:: @ 82FC354
	.incbin "data/layouts/SootopolisCity_House8/map.bin"

	.align 2
SootopolisCity_House8_Layout:: @ 82FC3C4
	.4byte 0x8
	.4byte 0x7
	.4byte SootopolisCity_House8_MapBorder
	.4byte SootopolisCity_House8_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
