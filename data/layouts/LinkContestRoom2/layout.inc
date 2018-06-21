LinkContestRoom2_MapBorder:: @ 82E9970
	.incbin "data/layouts/LinkContestRoom2/border.bin"

LinkContestRoom2_MapBlockdata:: @ 82E9978
	.incbin "data/layouts/LinkContestRoom2/map.bin"

	.align 2
LinkContestRoom2_Layout:: @ 82E9AC4
	.4byte 0xf
	.4byte 0xb
	.4byte LinkContestRoom2_MapBorder
	.4byte LinkContestRoom2_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Contest
