DoubleBattleColosseum_MapBorder:: @ 82E9610
	.incbin "data/layouts/DoubleBattleColosseum/border.bin"

DoubleBattleColosseum_MapBlockdata:: @ 82E9618
	.incbin "data/layouts/DoubleBattleColosseum/map.bin"

	.align 2
DoubleBattleColosseum_Layout:: @ 82E9714
	.4byte 0xe
	.4byte 0x9
	.4byte DoubleBattleColosseum_MapBorder
	.4byte DoubleBattleColosseum_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_CableClub
