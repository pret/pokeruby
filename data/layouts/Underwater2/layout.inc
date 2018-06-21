Underwater2_MapBorder:: @ 82C503C
	.incbin "data/layouts/Underwater2/border.bin"

Underwater2_MapBlockdata:: @ 82C5044
	.incbin "data/layouts/Underwater2/map.bin"

	.align 2
Underwater2_Layout:: @ 82C8244
	.4byte 0x50
	.4byte 0x50
	.4byte Underwater2_MapBorder
	.4byte Underwater2_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Underwater
