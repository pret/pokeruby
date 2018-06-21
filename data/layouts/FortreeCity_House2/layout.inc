FortreeCity_House2_MapBorder:: @ 82D1F5C
	.incbin "data/layouts/FortreeCity_House2/border.bin"

FortreeCity_House2_MapBlockdata:: @ 82D1F64
	.incbin "data/layouts/FortreeCity_House2/map.bin"

	.align 2
FortreeCity_House2_Layout:: @ 82D1FC4
	.4byte 0x8
	.4byte 0x6
	.4byte FortreeCity_House2_MapBorder
	.4byte FortreeCity_House2_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
