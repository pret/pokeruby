CableCarStation_MapBorder:: @ 82D4CCC
	.incbin "data/layouts/CableCarStation/border.bin"

CableCarStation_MapBlockdata:: @ 82D4CD4
	.incbin "data/layouts/CableCarStation/map.bin"

	.align 2
CableCarStation_Layout:: @ 82D4E0C
	.4byte 0xd
	.4byte 0xc
	.4byte CableCarStation_MapBorder
	.4byte CableCarStation_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
