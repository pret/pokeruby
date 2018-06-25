Underwater3_MapBorder:: @ 82C825C
	.incbin "data/layouts/Underwater3/border.bin"

Underwater3_MapBlockdata:: @ 82C8264
	.incbin "data/layouts/Underwater3/map.bin"

	.align 2
Underwater3_Layout:: @ 82CB464
	.4byte 0x50
	.4byte 0x50
	.4byte Underwater3_MapBorder
	.4byte Underwater3_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Underwater
