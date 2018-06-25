Route124_MapBorder:: @ 82AEA9C
	.incbin "data/layouts/Route124/border.bin"

Route124_MapBlockdata:: @ 82AEAA4
	.incbin "data/layouts/Route124/map.bin"

	.align 2
Route124_Layout:: @ 82B1CA4
	.4byte 0x50
	.4byte 0x50
	.4byte Route124_MapBorder
	.4byte Route124_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mossdeep
