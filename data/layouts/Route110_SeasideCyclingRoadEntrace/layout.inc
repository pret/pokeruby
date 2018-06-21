Route110_SeasideCyclingRoadEntrace_MapBorder:: @ 82EFB64
	.incbin "data/layouts/Route110_SeasideCyclingRoadEntrace/border.bin"

Route110_SeasideCyclingRoadEntrace_MapBlockdata:: @ 82EFB6C
	.incbin "data/layouts/Route110_SeasideCyclingRoadEntrace/map.bin"

	.align 2
Route110_SeasideCyclingRoadEntrace_Layout:: @ 82EFC20
	.4byte 0xf
	.4byte 0x6
	.4byte Route110_SeasideCyclingRoadEntrace_MapBorder
	.4byte Route110_SeasideCyclingRoadEntrace_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
