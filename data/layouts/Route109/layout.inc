Route109_MapBorder:: @ 829973C
	.incbin "data/layouts/Route109/border.bin"

Route109_MapBlockdata:: @ 8299744
	.incbin "data/layouts/Route109/map.bin"

	.align 2
Route109_Layout:: @ 829AA04
	.4byte 0x28
	.4byte 0x3c
	.4byte Route109_MapBorder
	.4byte Route109_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Slateport
