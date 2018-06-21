Underwater1_MapBorder:: @ 82F2F18
	.incbin "data/layouts/Underwater1/border.bin"

Underwater1_MapBlockdata:: @ 82F2F20
	.incbin "data/layouts/Underwater1/map.bin"

	.align 2
Underwater1_Layout:: @ 82F6120
	.4byte 0x50
	.4byte 0x50
	.4byte Underwater1_MapBorder
	.4byte Underwater1_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Underwater
