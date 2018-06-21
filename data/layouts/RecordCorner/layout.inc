RecordCorner_MapBorder:: @ 82E9460
	.incbin "data/layouts/RecordCorner/border.bin"

RecordCorner_MapBlockdata:: @ 82E9468
	.incbin "data/layouts/RecordCorner/map.bin"

	.align 2
RecordCorner_Layout:: @ 82E95F8
	.4byte 0x14
	.4byte 0xa
	.4byte RecordCorner_MapBorder
	.4byte RecordCorner_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_CableClub
