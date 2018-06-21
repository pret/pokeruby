Route110_TrickHousePuzzle7_MapBorder:: @ 82EF57C
	.incbin "data/layouts/Route110_TrickHousePuzzle7/border.bin"

Route110_TrickHousePuzzle7_MapBlockdata:: @ 82EF584
	.incbin "data/layouts/Route110_TrickHousePuzzle7/map.bin"

	.align 2
Route110_TrickHousePuzzle7_Layout:: @ 82EF818
	.4byte 0xf
	.4byte 0x16
	.4byte Route110_TrickHousePuzzle7_MapBorder
	.4byte Route110_TrickHousePuzzle7_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_TrickHousePuzzle
