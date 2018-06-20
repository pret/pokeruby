UnreferencedMap_MapBorder:: @ 82BD8DC
	.incbin "data/layouts/UnreferencedMap/border.bin"

UnreferencedMap_MapBlockdata: @ 82BD8E4
	.incbin "data/layouts/UnreferencedMap/map.bin"

	.align 2
UnreferencedMap_Layout:: @ 82BF1E4
	.4byte 0x50
	.4byte 0x28
	.4byte UnreferencedMap_MapBorder
	.4byte UnreferencedMap_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
