BattleTower_Outside_MapBorder:: @ 82F1E84
	.incbin "data/layouts/BattleTower_Outside/border.bin"

BattleTower_Outside_MapBlockdata:: @ 82F1E8C
	.incbin "data/layouts/BattleTower_Outside/map.bin"

	.align 2
BattleTower_Outside_Layout:: @ 82F2558
	.4byte 0x1d
	.4byte 0x1e
	.4byte BattleTower_Outside_MapBorder
	.4byte BattleTower_Outside_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Dewford
