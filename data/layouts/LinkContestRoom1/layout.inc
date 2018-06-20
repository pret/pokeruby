LinkContestRoom1_MapBorder:: @ 82E972C
	.incbin "data/layouts/LinkContestRoom1/border.bin"

LinkContestRoom1_MapBlockdata:: @ 82E9734
	.incbin "data/layouts/LinkContestRoom1/map.bin"

	.align 2
LinkContestRoom1_Layout:: @ 82E9880
	.4byte 0xf
	.4byte 0xb
	.4byte LinkContestRoom1_MapBorder
	.4byte LinkContestRoom1_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Contest
