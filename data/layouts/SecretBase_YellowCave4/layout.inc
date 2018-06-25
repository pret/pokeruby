SecretBase_YellowCave4_MapBorder:: @ 82E8DC4
	.incbin "data/layouts/SecretBase_YellowCave4/border.bin"

SecretBase_YellowCave4_MapBlockdata:: @ 82E8DCC
	.incbin "data/layouts/SecretBase_YellowCave4/map.bin"

	.align 2
SecretBase_YellowCave4_Layout:: @ 82E8F38
	.4byte 0xd
	.4byte 0xe
	.4byte SecretBase_YellowCave4_MapBorder
	.4byte SecretBase_YellowCave4_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseYellowCave
