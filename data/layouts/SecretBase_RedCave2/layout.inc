SecretBase_RedCave2_MapBorder:: @ 82E7C28
	.incbin "data/layouts/SecretBase_RedCave2/border.bin"

SecretBase_RedCave2_MapBlockdata:: @ 82E7C30
	.incbin "data/layouts/SecretBase_RedCave2/map.bin"

	.align 2
SecretBase_RedCave2_Layout:: @ 82E7D10
	.4byte 0x7
	.4byte 0x10
	.4byte SecretBase_RedCave2_MapBorder
	.4byte SecretBase_RedCave2_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseRedCave
