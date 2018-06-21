LilycoveCity_ContestLobby_MapBorder:: @ 82D259C
	.incbin "data/layouts/LilycoveCity_ContestLobby/border.bin"

LilycoveCity_ContestLobby_MapBlockdata:: @ 82D25A4
	.incbin "data/layouts/LilycoveCity_ContestLobby/map.bin"

	.align 2
LilycoveCity_ContestLobby_Layout:: @ 82D27CC
	.4byte 0x17
	.4byte 0xc
	.4byte LilycoveCity_ContestLobby_MapBorder
	.4byte LilycoveCity_ContestLobby_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
