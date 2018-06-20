SafariZone_Southeast_MapBorder:: @ 82EC6C0
	.incbin "data/layouts/SafariZone_Southeast/border.bin"

SafariZone_Southeast_MapBlockdata:: @ 82EC6C8
	.incbin "data/layouts/SafariZone_Southeast/map.bin"

	.align 2
SafariZone_Southeast_Layout:: @ 82ED348
	.4byte 0x28
	.4byte 0x28
	.4byte SafariZone_Southeast_MapBorder
	.4byte SafariZone_Southeast_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
