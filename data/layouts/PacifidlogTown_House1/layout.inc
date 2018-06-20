PacifidlogTown_House1_MapBorder:: @ 82CF6AC
	.incbin "data/layouts/PacifidlogTown_House1/border.bin"

PacifidlogTown_House1_MapBlockdata:: @ 82CF6B4
	.incbin "data/layouts/PacifidlogTown_House1/map.bin"

	.align 2
PacifidlogTown_House1_Layout:: @ 82CF768
	.4byte 0xa
	.4byte 0x9
	.4byte PacifidlogTown_House1_MapBorder
	.4byte PacifidlogTown_House1_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
