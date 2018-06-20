Route110_TrickHousePuzzle5_MapBorder:: @ 82EF014
	.incbin "data/layouts/Route110_TrickHousePuzzle5/border.bin"

Route110_TrickHousePuzzle5_MapBlockdata:: @ 82EF01C
	.incbin "data/layouts/Route110_TrickHousePuzzle5/map.bin"

	.align 2
Route110_TrickHousePuzzle5_Layout:: @ 82EF2B0
	.4byte 0xf
	.4byte 0x16
	.4byte Route110_TrickHousePuzzle5_MapBorder
	.4byte Route110_TrickHousePuzzle5_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_TrickHousePuzzle
