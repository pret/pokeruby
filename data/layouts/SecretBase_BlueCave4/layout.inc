SecretBase_BlueCave4_MapBorder:: @ 82E8C70
	.incbin "data/layouts/SecretBase_BlueCave4/border.bin"

SecretBase_BlueCave4_MapBlockdata:: @ 82E8C78
	.incbin "data/layouts/SecretBase_BlueCave4/map.bin"

	.align 2
SecretBase_BlueCave4_Layout:: @ 82E8DAC
	.4byte 0x9
	.4byte 0x11
	.4byte SecretBase_BlueCave4_MapBorder
	.4byte SecretBase_BlueCave4_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseBlueCave
