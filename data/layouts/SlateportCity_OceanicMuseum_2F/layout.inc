SlateportCity_OceanicMuseum_2F_MapBorder:: @ 82D08F0
	.incbin "data/layouts/SlateportCity_OceanicMuseum_2F/border.bin"

SlateportCity_OceanicMuseum_2F_MapBlockdata:: @ 82D08F8
	.incbin "data/layouts/SlateportCity_OceanicMuseum_2F/map.bin"

	.align 2
SlateportCity_OceanicMuseum_2F_Layout:: @ 82D0A60
	.4byte 0x14
	.4byte 0x9
	.4byte SlateportCity_OceanicMuseum_2F_MapBorder
	.4byte SlateportCity_OceanicMuseum_2F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_OceanicMuseum
