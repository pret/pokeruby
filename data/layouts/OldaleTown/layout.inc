OldaleTown_MapBorder:: @ 82916EC
	.incbin "data/layouts/OldaleTown/border.bin"

OldaleTown_MapBlockdata:: @ 82916F4
	.incbin "data/layouts/OldaleTown/map.bin"

	.align 2
OldaleTown_Layout:: @ 8291A14
	.4byte 0x14
	.4byte 0x14
	.4byte OldaleTown_MapBorder
	.4byte OldaleTown_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Petalburg
