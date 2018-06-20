ContestHall_MapBorder:: @ 82CF1A4
	.incbin "data/layouts/ContestHall/border.bin"

ContestHall_MapBlockdata:: @ 82CF1AC
	.incbin "data/layouts/ContestHall/map.bin"

	.align 2
ContestHall_Layout:: @ 82CF4A0
	.4byte 0x15
	.4byte 0x12
	.4byte ContestHall_MapBorder
	.4byte ContestHall_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
