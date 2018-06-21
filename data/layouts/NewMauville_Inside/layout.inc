NewMauville_Inside_MapBorder:: @ 82E5878
	.incbin "data/layouts/NewMauville_Inside/border.bin"

NewMauville_Inside_MapBlockdata:: @ 82E5880
	.incbin "data/layouts/NewMauville_Inside/map.bin"

	.align 2
NewMauville_Inside_Layout:: @ 82E65A4
	.4byte 0x29
	.4byte 0x29
	.4byte NewMauville_Inside_MapBorder
	.4byte NewMauville_Inside_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_BikeShop
