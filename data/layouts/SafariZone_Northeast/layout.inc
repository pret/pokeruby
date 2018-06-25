SafariZone_Northeast_MapBorder:: @ 82EAD80
	.incbin "data/layouts/SafariZone_Northeast/border.bin"

SafariZone_Northeast_MapBlockdata:: @ 82EAD88
	.incbin "data/layouts/SafariZone_Northeast/map.bin"

	.align 2
SafariZone_Northeast_Layout:: @ 82EBA08
	.4byte 0x28
	.4byte 0x28
	.4byte SafariZone_Northeast_MapBorder
	.4byte SafariZone_Northeast_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
