FallarborTown_MapBorder:: @ 82920AC
	.incbin "data/layouts/FallarborTown/border.bin"

FallarborTown_MapBlockdata:: @ 82920B4
	.incbin "data/layouts/FallarborTown/map.bin"

	.align 2
FallarborTown_Layout:: @ 82923D4
	.4byte 0x14
	.4byte 0x14
	.4byte FallarborTown_MapBorder
	.4byte FallarborTown_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Fallarbor
