Route102_MapBorder:: @ 82930CC
	.incbin "data/layouts/Route102/border.bin"

Route102_MapBlockdata:: @ 82930D4
	.incbin "data/layouts/Route102/map.bin"

	.align 2
Route102_Layout:: @ 82938A4
	.4byte 0x32
	.4byte 0x14
	.4byte Route102_MapBorder
	.4byte Route102_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Petalburg
