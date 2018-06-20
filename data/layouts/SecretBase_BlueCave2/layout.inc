SecretBase_BlueCave2_MapBorder:: @ 82E7E44
	.incbin "data/layouts/SecretBase_BlueCave2/border.bin"

SecretBase_BlueCave2_MapBlockdata:: @ 82E7E4C
	.incbin "data/layouts/SecretBase_BlueCave2/map.bin"

	.align 2
SecretBase_BlueCave2_Layout:: @ 82E7F20
	.4byte 0xf
	.4byte 0x7
	.4byte SecretBase_BlueCave2_MapBorder
	.4byte SecretBase_BlueCave2_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseBlueCave
