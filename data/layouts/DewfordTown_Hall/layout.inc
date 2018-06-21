DewfordTown_Hall_MapBorder:: @ 82CE83C
	.incbin "data/layouts/DewfordTown_Hall/border.bin"

DewfordTown_Hall_MapBlockdata:: @ 82CE844
	.incbin "data/layouts/DewfordTown_Hall/map.bin"

	.align 2
DewfordTown_Hall_Layout:: @ 82CE978
	.4byte 0x11
	.4byte 0x9
	.4byte DewfordTown_Hall_MapBorder
	.4byte DewfordTown_Hall_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
