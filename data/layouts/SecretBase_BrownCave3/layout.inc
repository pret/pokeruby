SecretBase_BrownCave3_MapBorder:: @ 82E8358
	.incbin "data/layouts/SecretBase_BrownCave3/border.bin"

SecretBase_BrownCave3_MapBlockdata:: @ 82E8360
	.incbin "data/layouts/SecretBase_BrownCave3/map.bin"

	.align 2
SecretBase_BrownCave3_Layout:: @ 82E84AC
	.4byte 0xf
	.4byte 0xb
	.4byte SecretBase_BrownCave3_MapBorder
	.4byte SecretBase_BrownCave3_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseBrownCave
