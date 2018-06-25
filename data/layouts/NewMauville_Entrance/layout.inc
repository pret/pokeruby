NewMauville_Entrance_MapBorder:: @ 82E57B4
	.incbin "data/layouts/NewMauville_Entrance/border.bin"

NewMauville_Entrance_MapBlockdata:: @ 82E57BC
	.incbin "data/layouts/NewMauville_Entrance/map.bin"

	.align 2
NewMauville_Entrance_Layout:: @ 82E5860
	.4byte 0x9
	.4byte 0x9
	.4byte NewMauville_Entrance_MapBorder
	.4byte NewMauville_Entrance_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
