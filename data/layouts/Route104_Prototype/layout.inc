Route104_Prototype_MapBorder:: @ 82F9A58
	.incbin "data/layouts/Route104_Prototype/border.bin"

Route104_Prototype_MapBlockdata:: @ 82F9A60
	.incbin "data/layouts/Route104_Prototype/map.bin"

	.align 2
Route104_Prototype_Layout:: @ 82F9A64
	.4byte 0x1
	.4byte 0x1
	.4byte Route104_Prototype_MapBorder
	.4byte Route104_Prototype_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Rustboro
