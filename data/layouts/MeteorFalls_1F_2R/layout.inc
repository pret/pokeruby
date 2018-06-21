MeteorFalls_1F_2R_MapBorder:: @ 82D6054
	.incbin "data/layouts/MeteorFalls_1F_2R/border.bin"

MeteorFalls_1F_2R_MapBlockdata:: @ 82D605C
	.incbin "data/layouts/MeteorFalls_1F_2R/map.bin"

	.align 2
MeteorFalls_1F_2R_Layout:: @ 82D67DC
	.4byte 0x1e
	.4byte 0x20
	.4byte MeteorFalls_1F_2R_MapBorder
	.4byte MeteorFalls_1F_2R_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_MeteorFalls
