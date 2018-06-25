DewfordTown_MapBorder:: @ 8291A2C
	.incbin "data/layouts/DewfordTown/border.bin"

DewfordTown_MapBlockdata:: @ 8291A34
	.incbin "data/layouts/DewfordTown/map.bin"

	.align 2
DewfordTown_Layout:: @ 8291D54
	.4byte 0x14
	.4byte 0x14
	.4byte DewfordTown_MapBorder
	.4byte DewfordTown_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Dewford
