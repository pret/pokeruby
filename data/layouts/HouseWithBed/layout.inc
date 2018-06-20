HouseWithBed_MapBorder:: @ 82D0054
	.incbin "data/layouts/HouseWithBed/border.bin"

HouseWithBed_MapBlockdata:: @ 82D005C
	.incbin "data/layouts/HouseWithBed/map.bin"

	.align 2
HouseWithBed_Layout:: @ 82D00FC
	.4byte 0xa
	.4byte 0x8
	.4byte HouseWithBed_MapBorder
	.4byte HouseWithBed_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
