SecretBase_BrownCave1_MapBorder:: @ 82E77A0
	.incbin "data/layouts/SecretBase_BrownCave1/border.bin"

SecretBase_BrownCave1_MapBlockdata:: @ 82E77A8
	.incbin "data/layouts/SecretBase_BrownCave1/map.bin"

	.align 2
SecretBase_BrownCave1_Layout:: @ 82E7870
	.4byte 0xb
	.4byte 0x9
	.4byte SecretBase_BrownCave1_MapBorder
	.4byte SecretBase_BrownCave1_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseBrownCave
