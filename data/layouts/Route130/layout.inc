Route130_MapBorder:: @ 82F0448
	.incbin "data/layouts/Route130/border.bin"

Route130_MapBlockdata:: @ 82F0450
	.incbin "data/layouts/Route130/map.bin"

	.align 2
Route130_Layout:: @ 82F1D50
	.4byte 0x50
	.4byte 0x28
	.4byte Route130_MapBorder
	.4byte Route130_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
