SafariZone_Northwest_MapBorder:: @ 82EA0E0
	.incbin "data/layouts/SafariZone_Northwest/border.bin"

SafariZone_Northwest_MapBlockdata:: @ 82EA0E8
	.incbin "data/layouts/SafariZone_Northwest/map.bin"

	.align 2
SafariZone_Northwest_Layout:: @ 82EAD68
	.4byte 0x28
	.4byte 0x28
	.4byte SafariZone_Northwest_MapBorder
	.4byte SafariZone_Northwest_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lilycove
