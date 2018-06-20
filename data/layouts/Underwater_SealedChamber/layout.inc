Underwater_SealedChamber_MapBorder:: @ 82F7788
	.incbin "data/layouts/Underwater_SealedChamber/border.bin"

Underwater_SealedChamber_MapBlockdata:: @ 82F7790
	.incbin "data/layouts/Underwater_SealedChamber/map.bin"

	.align 2
Underwater_SealedChamber_Layout:: @ 82F7FD0
	.4byte 0x16
	.4byte 0x30
	.4byte Underwater_SealedChamber_MapBorder
	.4byte Underwater_SealedChamber_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Underwater
