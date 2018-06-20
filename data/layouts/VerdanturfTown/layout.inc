VerdanturfTown_MapBorder:: @ 82923EC
	.incbin "data/layouts/VerdanturfTown/border.bin"

VerdanturfTown_MapBlockdata:: @ 82923F4
	.incbin "data/layouts/VerdanturfTown/map.bin"

	.align 2
VerdanturfTown_Layout:: @ 8292714
	.4byte 0x14
	.4byte 0x14
	.4byte VerdanturfTown_MapBorder
	.4byte VerdanturfTown_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mauville
