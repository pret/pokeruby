Route110_TrickHousePuzzle2_MapBorder:: @ 82EE7F8
	.incbin "data/layouts/Route110_TrickHousePuzzle2/border.bin"

Route110_TrickHousePuzzle2_MapBlockdata:: @ 82EE800
	.incbin "data/layouts/Route110_TrickHousePuzzle2/map.bin"

	.align 2
Route110_TrickHousePuzzle2_Layout:: @ 82EEA94
	.4byte 0xf
	.4byte 0x16
	.4byte Route110_TrickHousePuzzle2_MapBorder
	.4byte Route110_TrickHousePuzzle2_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_TrickHousePuzzle
