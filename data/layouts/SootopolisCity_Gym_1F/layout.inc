SootopolisCity_Gym_1F_MapBorder:: @ 82D3B90
	.incbin "data/layouts/SootopolisCity_Gym_1F/border.bin"

SootopolisCity_Gym_1F_MapBlockdata:: @ 82D3B98
	.incbin "data/layouts/SootopolisCity_Gym_1F/map.bin"

	.align 2
SootopolisCity_Gym_1F_Layout:: @ 82D3F0C
	.4byte 0x11
	.4byte 0x1a
	.4byte SootopolisCity_Gym_1F_MapBorder
	.4byte SootopolisCity_Gym_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_SootopolisGym
