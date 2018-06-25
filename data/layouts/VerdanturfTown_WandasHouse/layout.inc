VerdanturfTown_WandasHouse_MapBorder:: @ 82CF57C
	.incbin "data/layouts/VerdanturfTown_WandasHouse/border.bin"

VerdanturfTown_WandasHouse_MapBlockdata:: @ 82CF584
	.incbin "data/layouts/VerdanturfTown_WandasHouse/map.bin"

	.align 2
VerdanturfTown_WandasHouse_Layout:: @ 82CF694
	.4byte 0x11
	.4byte 0x8
	.4byte VerdanturfTown_WandasHouse_MapBorder
	.4byte VerdanturfTown_WandasHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
