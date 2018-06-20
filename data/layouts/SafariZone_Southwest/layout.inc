SafariZone_Southwest_MapBorder:: @ 82EBA20
	.incbin "data/layouts/SafariZone_Southwest/border.bin"

SafariZone_Southwest_MapBlockdata:: @ 82EBA28
	.incbin "data/layouts/SafariZone_Southwest/map.bin"

	.align 2
SafariZone_Southwest_Layout:: @ 82EC6A8
	.4byte 0x28
	.4byte 0x28
	.4byte SafariZone_Southwest_MapBorder
	.4byte SafariZone_Southwest_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
