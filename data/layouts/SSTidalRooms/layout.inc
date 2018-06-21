SSTidalRooms_MapBorder:: @ 82F67C8
	.incbin "data/layouts/SSTidalRooms/border.bin"

SSTidalRooms_MapBlockdata:: @ 82F67D0
	.incbin "data/layouts/SSTidalRooms/map.bin"

	.align 2
SSTidalRooms_Layout:: @ 82F6CE0
	.4byte 0x24
	.4byte 0x12
	.4byte SSTidalRooms_MapBorder
	.4byte SSTidalRooms_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Ship
