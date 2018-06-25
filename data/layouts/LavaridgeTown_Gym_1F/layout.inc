LavaridgeTown_Gym_1F_MapBorder:: @ 82CEB34
	.incbin "data/layouts/LavaridgeTown_Gym_1F/border.bin"

LavaridgeTown_Gym_1F_MapBlockdata:: @ 82CEB3C
	.incbin "data/layouts/LavaridgeTown_Gym_1F/map.bin"

	.align 2
LavaridgeTown_Gym_1F_Layout:: @ 82CED4C
	.4byte 0xb
	.4byte 0x18
	.4byte LavaridgeTown_Gym_1F_MapBorder
	.4byte LavaridgeTown_Gym_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_LavaridgeGym
