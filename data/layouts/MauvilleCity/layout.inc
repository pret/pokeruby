MauvilleCity_MapBorder:: @ 8288C6C
	.incbin "data/layouts/MauvilleCity/border.bin"

MauvilleCity_MapBlockdata:: @ 8288C74
	.incbin "data/layouts/MauvilleCity/map.bin"

	.align 2
MauvilleCity_Layout:: @ 82892B4
	.4byte 0x28
	.4byte 0x14
	.4byte MauvilleCity_MapBorder
	.4byte MauvilleCity_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Mauville
