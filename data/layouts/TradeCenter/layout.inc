TradeCenter_MapBorder:: @ 82E9368
	.incbin "data/layouts/TradeCenter/border.bin"

TradeCenter_MapBlockdata:: @ 82E9370
	.incbin "data/layouts/TradeCenter/map.bin"

	.align 2
TradeCenter_Layout:: @ 82E9448
	.4byte 0xc
	.4byte 0x9
	.4byte TradeCenter_MapBorder
	.4byte TradeCenter_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_CableClub
