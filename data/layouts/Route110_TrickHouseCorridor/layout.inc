Route110_TrickHouseCorridor_MapBorder:: @ 82EE254
	.incbin "data/layouts/Route110_TrickHouseCorridor/border.bin"

Route110_TrickHouseCorridor_MapBlockdata:: @ 82EE25C
	.incbin "data/layouts/Route110_TrickHouseCorridor/map.bin"

	.align 2
Route110_TrickHouseCorridor_Layout:: @ 82EE52C
	.4byte 0xf
	.4byte 0x18
	.4byte Route110_TrickHouseCorridor_MapBorder
	.4byte Route110_TrickHouseCorridor_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
