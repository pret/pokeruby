MeteorFalls_B1F_1R_MapBorder:: @ 82D67F4
	.incbin "data/layouts/MeteorFalls_B1F_1R/border.bin"

MeteorFalls_B1F_1R_MapBlockdata:: @ 82D67FC
	.incbin "data/layouts/MeteorFalls_B1F_1R/map.bin"

	.align 2
MeteorFalls_B1F_1R_Layout:: @ 82D7098
	.4byte 0x1d
	.4byte 0x26
	.4byte MeteorFalls_B1F_1R_MapBorder
	.4byte MeteorFalls_B1F_1R_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_MeteorFalls
