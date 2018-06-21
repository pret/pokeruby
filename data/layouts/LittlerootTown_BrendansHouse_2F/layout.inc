LittlerootTown_BrendansHouse_2F_MapBorder:: @ 82CDB04
	.incbin "data/layouts/LittlerootTown_BrendansHouse_2F/border.bin"

LittlerootTown_BrendansHouse_2F_MapBlockdata:: @ 82CDB0C
	.incbin "data/layouts/LittlerootTown_BrendansHouse_2F/map.bin"

	.align 2
LittlerootTown_BrendansHouse_2F_Layout:: @ 82CDB9C
	.4byte 0x9
	.4byte 0x8
	.4byte LittlerootTown_BrendansHouse_2F_MapBorder
	.4byte LittlerootTown_BrendansHouse_2F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_BrendansMaysHouse
