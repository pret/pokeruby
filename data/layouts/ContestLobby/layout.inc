ContestLobby_MapBorder:: @ 82CF0B0
	.incbin "data/layouts/ContestLobby/border.bin"

ContestLobby_MapBlockdata:: @ 82CF0B8
	.incbin "data/layouts/ContestLobby/map.bin"

	.align 2
ContestLobby_Layout:: @ 82CF18C
	.4byte 0xf
	.4byte 0x7
	.4byte ContestLobby_MapBorder
	.4byte ContestLobby_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
