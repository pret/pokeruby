SecretBase_YellowCave1_MapBorder:: @ 82E7970
	.incbin "data/layouts/SecretBase_YellowCave1/border.bin"

SecretBase_YellowCave1_MapBlockdata:: @ 82E7978
	.incbin "data/layouts/SecretBase_YellowCave1/map.bin"

	.align 2
SecretBase_YellowCave1_Layout:: @ 82E7A40
	.4byte 0xb
	.4byte 0x9
	.4byte SecretBase_YellowCave1_MapBorder
	.4byte SecretBase_YellowCave1_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseYellowCave
