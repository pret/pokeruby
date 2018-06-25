LavaridgeTown_Gym_B1F_MapBorder:: @ 82CED64
	.incbin "data/layouts/LavaridgeTown_Gym_B1F/border.bin"

LavaridgeTown_Gym_B1F_MapBlockdata:: @ 82CED6C
	.incbin "data/layouts/LavaridgeTown_Gym_B1F/map.bin"

	.align 2
LavaridgeTown_Gym_B1F_Layout:: @ 82CEF7C
	.4byte 0xb
	.4byte 0x18
	.4byte LavaridgeTown_Gym_B1F_MapBorder
	.4byte LavaridgeTown_Gym_B1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_LavaridgeGym
