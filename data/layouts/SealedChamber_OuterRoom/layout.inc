SealedChamber_OuterRoom_MapBorder:: @ 82F7FE8
	.incbin "data/layouts/SealedChamber_OuterRoom/border.bin"

SealedChamber_OuterRoom_MapBlockdata:: @ 82F7FF0
	.incbin "data/layouts/SealedChamber_OuterRoom/map.bin"

	.align 2
SealedChamber_OuterRoom_Layout:: @ 82F83B8
	.4byte 0x15
	.4byte 0x17
	.4byte SealedChamber_OuterRoom_MapBorder
	.4byte SealedChamber_OuterRoom_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
