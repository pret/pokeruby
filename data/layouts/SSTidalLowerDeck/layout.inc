SSTidalLowerDeck_MapBorder:: @ 82F65EC
	.incbin "data/layouts/SSTidalLowerDeck/border.bin"

SSTidalLowerDeck_MapBlockdata:: @ 82F65F4
	.incbin "data/layouts/SSTidalLowerDeck/map.bin"

	.align 2
SSTidalLowerDeck_Layout:: @ 82F67B0
	.4byte 0x11
	.4byte 0xd
	.4byte SSTidalLowerDeck_MapBorder
	.4byte SSTidalLowerDeck_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
