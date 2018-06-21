SecretBase_RedCave3_MapBorder:: @ 82E8248
	.incbin "data/layouts/SecretBase_RedCave3/border.bin"

SecretBase_RedCave3_MapBlockdata:: @ 82E8250
	.incbin "data/layouts/SecretBase_RedCave3/map.bin"

	.align 2
SecretBase_RedCave3_Layout:: @ 82E8340
	.4byte 0xf
	.4byte 0x8
	.4byte SecretBase_RedCave3_MapBorder
	.4byte SecretBase_RedCave3_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseRedCave
