Route110_TrickHousePuzzle1_MapBorder:: @ 82EE544
	.incbin "data/layouts/Route110_TrickHousePuzzle1/border.bin"

Route110_TrickHousePuzzle1_MapBlockdata:: @ 82EE54C
	.incbin "data/layouts/Route110_TrickHousePuzzle1/map.bin"

	.align 2
Route110_TrickHousePuzzle1_Layout:: @ 82EE7E0
	.4byte 0xf
	.4byte 0x16
	.4byte Route110_TrickHousePuzzle1_MapBorder
	.4byte Route110_TrickHousePuzzle1_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_TrickHousePuzzle
