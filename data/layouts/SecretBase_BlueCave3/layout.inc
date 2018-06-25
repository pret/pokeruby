SecretBase_BlueCave3_MapBorder:: @ 82E84C4
	.incbin "data/layouts/SecretBase_BlueCave3/border.bin"

SecretBase_BlueCave3_MapBlockdata:: @ 82E84CC
	.incbin "data/layouts/SecretBase_BlueCave3/map.bin"

	.align 2
SecretBase_BlueCave3_Layout:: @ 82E8620
	.4byte 0xa
	.4byte 0x11
	.4byte SecretBase_BlueCave3_MapBorder
	.4byte SecretBase_BlueCave3_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseBlueCave
