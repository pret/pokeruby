SecretBase_BlueCave1_MapBorder:: @ 82E7888
	.incbin "data/layouts/SecretBase_BlueCave1/border.bin"

SecretBase_BlueCave1_MapBlockdata:: @ 82E7890
	.incbin "data/layouts/SecretBase_BlueCave1/map.bin"

	.align 2
SecretBase_BlueCave1_Layout:: @ 82E7958
	.4byte 0xb
	.4byte 0x9
	.4byte SecretBase_BlueCave1_MapBorder
	.4byte SecretBase_BlueCave1_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseBlueCave
