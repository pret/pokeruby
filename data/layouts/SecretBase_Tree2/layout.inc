SecretBase_Tree2_MapBorder:: @ 82E8054
	.incbin "data/layouts/SecretBase_Tree2/border.bin"

SecretBase_Tree2_MapBlockdata:: @ 82E805C
	.incbin "data/layouts/SecretBase_Tree2/map.bin"

	.align 2
SecretBase_Tree2_Layout:: @ 82E813C
	.4byte 0x7
	.4byte 0x10
	.4byte SecretBase_Tree2_MapBorder
	.4byte SecretBase_Tree2_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseTree
