MeteorFalls_1F_1R_MapBorder:: @ 82D565C
	.incbin "data/layouts/MeteorFalls_1F_1R/border.bin"

MeteorFalls_1F_1R_MapBlockdata:: @ 82D5664
	.incbin "data/layouts/MeteorFalls_1F_1R/map.bin"

	.align 2
MeteorFalls_1F_1R_Layout:: @ 82D603C
	.4byte 0x1e
	.4byte 0x2a
	.4byte MeteorFalls_1F_1R_MapBorder
	.4byte MeteorFalls_1F_1R_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_MeteorFalls
