UnknownMap_082EDF30_MapBorder::
	.incbin "data/layouts/UnknownMap_082EDF30/border.bin"

UnknownMap_082EDF30_MapBlockdata::
	.incbin "data/layouts/UnknownMap_082EDF30/map.bin"

	.align 2
UnknownMap_082EDF30_Layout::
	.4byte 0x3A
	.4byte 0x1A
	.4byte UnknownMap_082EDF30_MapBorder
	.4byte UnknownMap_082EDF30_MapBlockdata
	.4byte gTileset_General
	.4byte 0
