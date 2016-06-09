SouthernIsland_Exterior_MapScripts:: @ 8160AD6
	map_script 3, SouthernIsland_Exterior_MapScript1_160ADC
	.byte 0

SouthernIsland_Exterior_MapScript1_160ADC:: @ 8160ADC
	setflag 2121
	end

SouthernIsland_Exterior_EventScript_160AE0:: @ 8160AE0
	lock
	faceplayer
	loadptr 0, SouthernIsland_Exterior_Text_1C5215
	callstd 5
	compare RESULT, 0
	jumpeq SouthernIsland_Exterior_EventScript_160B25
	loadptr 0, SouthernIsland_Exterior_Text_1C5281
	callstd 4
	closebutton
	move LAST_TALKED, SouthernIsland_Exterior_Movement_1A0845
	waitmove 0
	pause 30
	spriteinvisible 1, 26, 9
	setvar 0x8004, 2
	call SouthernIsland_Exterior_EventScript_1A047C
	warp LilycoveCity_Harbor, 255, 8, 11
	waitstate
	release
	end

SouthernIsland_Exterior_EventScript_160B25:: @ 8160B25
	loadptr 0, SouthernIsland_Exterior_Text_1C52A6
	callstd 4
	release
	end

BattleTower_Outside_EventScript_160B2F:: @ 8160B2F
	move 255, BattleTower_Outside_Movement_160B45
	waitmove 0
	return

BattleTower_Outside_EventScript_160B3A:: @ 8160B3A
	move 255, BattleTower_Outside_Movement_160B47
	waitmove 0
	return

