SecretBase_Tree3_MapBorder:: @ 82E8760
	.incbin "data/layouts/SecretBase_Tree3/border.bin"

SecretBase_Tree3_MapBlockdata:: @ 82E8768
	.incbin "data/layouts/SecretBase_Tree3/map.bin"

	.align 2
SecretBase_Tree3_Layout:: @ 82E8878
	.4byte 0x11
	.4byte 0x8
	.4byte SecretBase_Tree3_MapBorder
	.4byte SecretBase_Tree3_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseTree
