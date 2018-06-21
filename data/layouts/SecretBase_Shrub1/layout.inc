SecretBase_Shrub1_MapBorder:: @ 82E7B40
	.incbin "data/layouts/SecretBase_Shrub1/border.bin"

SecretBase_Shrub1_MapBlockdata:: @ 82E7B48
	.incbin "data/layouts/SecretBase_Shrub1/map.bin"

	.align 2
SecretBase_Shrub1_Layout:: @ 82E7C10
	.4byte 0xb
	.4byte 0x9
	.4byte SecretBase_Shrub1_MapBorder
	.4byte SecretBase_Shrub1_MapBlockdata
	.4byte gTileset_SecretBase
	.4byte gTileset_SecretBaseShrub
