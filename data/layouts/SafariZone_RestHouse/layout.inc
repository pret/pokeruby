SafariZone_RestHouse_MapBorder:: @ 830476C
	.incbin "data/layouts/SafariZone_RestHouse/border.bin"

SafariZone_RestHouse_MapBlockdata:: @ 8304774
	.incbin "data/layouts/SafariZone_RestHouse/map.bin"

	.align 2
SafariZone_RestHouse_Layout:: @ 8304828
	.4byte 0xa
	.4byte 0x9
	.4byte SafariZone_RestHouse_MapBorder
	.4byte SafariZone_RestHouse_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
