SecretBase_RedCave1_MapBorder:: @ 82E76B8
	.incbin "data/layouts/SecretBase_RedCave1/border.bin"

SecretBase_RedCave1_MapBlockdata:: @ 82E76C0
	.incbin "data/layouts/SecretBase_RedCave1/map.bin"

	.align 2
SecretBase_RedCave1_Layout:: @ 82E7788
	.4byte 0xb
	.4byte 0x9
	.4byte SecretBase_RedCave1_MapBorder
	.4byte SecretBase_RedCave1_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseRedCave
