SecretBase_Shrub2_MapBorder:: @ 82E8154
	.incbin "data/layouts/SecretBase_Shrub2/border.bin"

SecretBase_Shrub2_MapBlockdata:: @ 82E815C
	.incbin "data/layouts/SecretBase_Shrub2/map.bin"

	.align 2
SecretBase_Shrub2_Layout:: @ 82E8230
	.4byte 0xf
	.4byte 0x7
	.4byte SecretBase_Shrub2_MapBorder
	.4byte SecretBase_Shrub2_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseShrub
