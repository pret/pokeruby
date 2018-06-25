SingleBattleColosseum_MapBorder:: @ 82E924C
	.incbin "data/layouts/SingleBattleColosseum/border.bin"

SingleBattleColosseum_MapBlockdata:: @ 82E9254
	.incbin "data/layouts/SingleBattleColosseum/map.bin"

	.align 2
SingleBattleColosseum_Layout:: @ 82E9350
	.4byte 0xe
	.4byte 0x9
	.4byte SingleBattleColosseum_MapBorder
	.4byte SingleBattleColosseum_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_CableClub
