SouthernIsland_Exterior_MapScripts:: @ 8160AD6
	map_script 3, SouthernIsland_Exterior_MapScript1_160ADC
	.byte 0

SouthernIsland_Exterior_MapScript1_160ADC:: @ 8160ADC
	setflag 2121
	end

SouthernIsland_Exterior_EventScript_160AE0:: @ 8160AE0
	lock
	faceplayer
	msgbox SouthernIsland_Exterior_Text_1C5215, 5
	compare_var_to_imm RESULT, 0
	goto_if_eq SouthernIsland_Exterior_EventScript_160B25
	msgbox SouthernIsland_Exterior_Text_1C5281, 4
	closebutton
	applymovement LAST_TALKED, SouthernIsland_Exterior_Movement_1A0845
	waitmovement 0
	delay 30
	spriteinvisible 1, 26, 9
	setvar 0x8004, 2
	call SouthernIsland_Exterior_EventScript_1A047C
	warp LilycoveCity_Harbor, 255, 8, 11
	waitstate
	release
	end

SouthernIsland_Exterior_EventScript_160B25:: @ 8160B25
	msgbox SouthernIsland_Exterior_Text_1C52A6, 4
	release
	end

BattleTower_Outside_EventScript_160B2F:: @ 8160B2F
	applymovement 255, BattleTower_Outside_Movement_160B45
	waitmovement 0
	return

BattleTower_Outside_EventScript_160B3A:: @ 8160B3A
	applymovement 255, BattleTower_Outside_Movement_160B47
	waitmovement 0
	return

BattleTower_Outside_Movement_160B45:: @ 8160B45
	step_down
	step_end

BattleTower_Outside_Movement_160B47:: @ 8160B47
	step_left
	step_25
	step_end

SouthernIsland_Exterior_EventScript_160B4A:: @ 8160B4A
	msgbox SouthernIsland_Exterior_Text_1C52FB, 3
	end
