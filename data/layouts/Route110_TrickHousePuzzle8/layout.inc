Route110_TrickHousePuzzle8_MapBorder:: @ 82EF830
	.incbin "data/layouts/Route110_TrickHousePuzzle8/border.bin"

Route110_TrickHousePuzzle8_MapBlockdata:: @ 82EF838
	.incbin "data/layouts/Route110_TrickHousePuzzle8/map.bin"

	.align 2
Route110_TrickHousePuzzle8_Layout:: @ 82EFACC
	.4byte 0xf
	.4byte 0x16
	.4byte Route110_TrickHousePuzzle8_MapBorder
	.4byte Route110_TrickHousePuzzle8_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_TrickHousePuzzle
