LilycoveCity_EmptyMap_MapBorder:: @ 82D369C
	.incbin "data/layouts/LilycoveCity_EmptyMap/border.bin"

LilycoveCity_EmptyMap_MapBlockdata:: @ 82D36A4
	.incbin "data/layouts/LilycoveCity_EmptyMap/map.bin"

	.align 2
LilycoveCity_EmptyMap_Layout:: @ 82D36A8
	.4byte 0x1
	.4byte 0x1
	.4byte LilycoveCity_EmptyMap_MapBorder
	.4byte LilycoveCity_EmptyMap_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
