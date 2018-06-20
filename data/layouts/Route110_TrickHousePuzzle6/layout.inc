Route110_TrickHousePuzzle6_MapBorder:: @ 82EF2C8
	.incbin "data/layouts/Route110_TrickHousePuzzle6/border.bin"

Route110_TrickHousePuzzle6_MapBlockdata:: @ 82EF2D0
	.incbin "data/layouts/Route110_TrickHousePuzzle6/map.bin"

	.align 2
Route110_TrickHousePuzzle6_Layout:: @ 82EF564
	.4byte 0xf
	.4byte 0x16
	.4byte Route110_TrickHousePuzzle6_MapBorder
	.4byte Route110_TrickHousePuzzle6_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_TrickHousePuzzle
