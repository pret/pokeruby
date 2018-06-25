SecretBase_BrownCave4_MapBorder:: @ 82E8B00
	.incbin "data/layouts/SecretBase_BrownCave4/border.bin"

SecretBase_BrownCave4_MapBlockdata:: @ 82E8B08
	.incbin "data/layouts/SecretBase_BrownCave4/map.bin"

	.align 2
SecretBase_BrownCave4_Layout:: @ 82E8C58
	.4byte 0xe
	.4byte 0xc
	.4byte SecretBase_BrownCave4_MapBorder
	.4byte SecretBase_BrownCave4_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseBrownCave
