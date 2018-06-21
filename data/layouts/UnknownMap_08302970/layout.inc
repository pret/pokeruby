UnknownMap_08302970_MapBorder::
	.incbin "data/layouts/UnknownMap_08302970/border.bin"

UnknownMap_08302970_MapBlockdata::
	.incbin "data/layouts/UnknownMap_08302970/map.bin"

	.align 2
UnknownMap_08302970_Layout::
	.4byte 0x3C
	.4byte 0x28
	.4byte UnknownMap_08302970_MapBorder
	.4byte UnknownMap_08302970_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Pacifidlog
