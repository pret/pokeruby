SecretBase_YellowCave2_MapBorder:: @ 82E7F38
	.incbin "data/layouts/SecretBase_YellowCave2/border.bin"

SecretBase_YellowCave2_MapBlockdata:: @ 82E7F40
	.incbin "data/layouts/SecretBase_YellowCave2/map.bin"

	.align 2
SecretBase_YellowCave2_Layout:: @ 82E803C
	.4byte 0xe
	.4byte 0x9
	.4byte SecretBase_YellowCave2_MapBorder
	.4byte SecretBase_YellowCave2_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseYellowCave
