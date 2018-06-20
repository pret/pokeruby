Route121_MapBorder:: @ 82ABB5C
	.incbin "data/layouts/Route121/border.bin"

Route121_MapBlockdata:: @ 82ABB64
	.incbin "data/layouts/Route121/map.bin"

	.align 2
Route121_Layout:: @ 82AC7E4
	.4byte 0x50
	.4byte 0x14
	.4byte Route121_MapBorder
	.4byte Route121_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
