SecretBase_RedCave4_MapBorder:: @ 82E89D0
	.incbin "data/layouts/SecretBase_RedCave4/border.bin"

SecretBase_RedCave4_MapBlockdata:: @ 82E89D8
	.incbin "data/layouts/SecretBase_RedCave4/map.bin"

	.align 2
SecretBase_RedCave4_Layout:: @ 82E8AE8
	.4byte 0x9
	.4byte 0xf
	.4byte SecretBase_RedCave4_MapBorder
	.4byte SecretBase_RedCave4_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseRedCave
