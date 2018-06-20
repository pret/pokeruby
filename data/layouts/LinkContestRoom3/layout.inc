LinkContestRoom3_MapBorder:: @ 82E9ADC
	.incbin "data/layouts/LinkContestRoom3/border.bin"

LinkContestRoom3_MapBlockdata:: @ 82E9AE4
	.incbin "data/layouts/LinkContestRoom3/map.bin"

	.align 2
LinkContestRoom3_Layout:: @ 82E9C30
	.4byte 0xf
	.4byte 0xb
	.4byte LinkContestRoom3_MapBorder
	.4byte LinkContestRoom3_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Contest
