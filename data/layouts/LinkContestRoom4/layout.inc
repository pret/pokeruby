LinkContestRoom4_MapBorder:: @ 82E9C48
	.incbin "data/layouts/LinkContestRoom4/border.bin"

LinkContestRoom4_MapBlockdata:: @ 82E9C50
	.incbin "data/layouts/LinkContestRoom4/map.bin"

	.align 2
LinkContestRoom4_Layout:: @ 82E9D9C
	.4byte 0xf
	.4byte 0xb
	.4byte LinkContestRoom4_MapBorder
	.4byte LinkContestRoom4_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Contest
