SecretBase_Shrub4_MapBorder:: @ 82E90F8
	.incbin "data/layouts/SecretBase_Shrub4/border.bin"

SecretBase_Shrub4_MapBlockdata:: @ 82E9100
	.incbin "data/layouts/SecretBase_Shrub4/map.bin"

	.align 2
SecretBase_Shrub4_Layout:: @ 82E9234
	.4byte 0xe
	.4byte 0xb
	.4byte SecretBase_Shrub4_MapBorder
	.4byte SecretBase_Shrub4_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseShrub
