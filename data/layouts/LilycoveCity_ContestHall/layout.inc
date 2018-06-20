LilycoveCity_ContestHall_MapBorder:: @ 82D27E4
	.incbin "data/layouts/LilycoveCity_ContestHall/border.bin"

LilycoveCity_ContestHall_MapBlockdata:: @ 82D27EC
	.incbin "data/layouts/LilycoveCity_ContestHall/map.bin"

	.align 2
LilycoveCity_ContestHall_Layout:: @ 82D3514
	.4byte 0x33
	.4byte 0x21
	.4byte LilycoveCity_ContestHall_MapBorder
	.4byte LilycoveCity_ContestHall_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Contest
