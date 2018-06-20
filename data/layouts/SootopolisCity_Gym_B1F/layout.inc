SootopolisCity_Gym_B1F_MapBorder:: @ 82D3F24
	.incbin "data/layouts/SootopolisCity_Gym_B1F/border.bin"

SootopolisCity_Gym_B1F_MapBlockdata:: @ 82D3F2C
	.incbin "data/layouts/SootopolisCity_Gym_B1F/map.bin"

	.align 2
SootopolisCity_Gym_B1F_Layout:: @ 82D42A0
	.4byte 0x11
	.4byte 0x1a
	.4byte SootopolisCity_Gym_B1F_MapBorder
	.4byte SootopolisCity_Gym_B1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_SootopolisGym
