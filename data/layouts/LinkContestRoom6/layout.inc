LinkContestRoom6_MapBorder:: @ 82E9F20
	.incbin "data/layouts/LinkContestRoom6/border.bin"

LinkContestRoom6_MapBlockdata:: @ 82E9F28
	.incbin "data/layouts/LinkContestRoom6/map.bin"

	.align 2
LinkContestRoom6_Layout:: @ 82EA074
	.4byte 0xf
	.4byte 0xb
	.4byte LinkContestRoom6_MapBorder
	.4byte LinkContestRoom6_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Contest
