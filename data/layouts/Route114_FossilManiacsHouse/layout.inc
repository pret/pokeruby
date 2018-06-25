Route114_FossilManiacsHouse_MapBorder:: @ 82D4E24
	.incbin "data/layouts/Route114_FossilManiacsHouse/border.bin"

Route114_FossilManiacsHouse_MapBlockdata:: @ 82D4E2C
	.incbin "data/layouts/Route114_FossilManiacsHouse/map.bin"

	.align 2
Route114_FossilManiacsHouse_Layout:: @ 82D4ECC
	.4byte 0xa
	.4byte 0x8
	.4byte Route114_FossilManiacsHouse_MapBorder
	.4byte Route114_FossilManiacsHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
