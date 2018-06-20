MauvilleCity_Gym_MapBorder:: @ 82D0D68
	.incbin "data/layouts/MauvilleCity_Gym/border.bin"

MauvilleCity_Gym_MapBlockdata:: @ 82D0D70
	.incbin "data/layouts/MauvilleCity_Gym/map.bin"

	.align 2
MauvilleCity_Gym_Layout:: @ 82D0F14
	.4byte 0xa
	.4byte 0x15
	.4byte MauvilleCity_Gym_MapBorder
	.4byte MauvilleCity_Gym_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_MauvilleGym
