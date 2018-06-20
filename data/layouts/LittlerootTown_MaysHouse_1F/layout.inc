LittlerootTown_MaysHouse_1F_MapBorder:: @ 82CDBB4
	.incbin "data/layouts/LittlerootTown_MaysHouse_1F/border.bin"

LittlerootTown_MaysHouse_1F_MapBlockdata:: @ 82CDBBC
	.incbin "data/layouts/LittlerootTown_MaysHouse_1F/map.bin"

	.align 2
LittlerootTown_MaysHouse_1F_Layout:: @ 82CDC84
	.4byte 0xb
	.4byte 0x9
	.4byte LittlerootTown_MaysHouse_1F_MapBorder
	.4byte LittlerootTown_MaysHouse_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_BrendansMaysHouse
