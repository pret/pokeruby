Route106_MapBorder:: @ 829779C
	.incbin "data/layouts/Route106/border.bin"

Route106_MapBlockdata:: @ 82977A4
	.incbin "data/layouts/Route106/map.bin"

	.align 2
Route106_Layout:: @ 8298424
	.4byte 0x50
	.4byte 0x14
	.4byte Route106_MapBorder
	.4byte Route106_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Dewford
