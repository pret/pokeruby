SouthernIsland_Exterior_MapScripts:: @ 8160AD6
	map_script MAP_SCRIPT_ON_TRANSITION, SouthernIsland_Exterior_MapScript1_160ADC
	.byte 0

SouthernIsland_Exterior_MapScript1_160ADC:: @ 8160ADC
	setflag FLAG_LANDMARK_SOUTHERN_ISLAND
	end

SouthernIsland_Exterior_EventScript_160AE0:: @ 8160AE0
	lock
	faceplayer
	msgbox SouthernIsland_Exterior_Text_1C5215, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SouthernIsland_Exterior_EventScript_160B25
	msgbox SouthernIsland_Exterior_Text_1C5281, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 30
	hideobjectat 1, MAP_SOUTHERN_ISLAND_EXTERIOR
	setvar VAR_0x8004, 2
	call SouthernIsland_Exterior_EventScript_1A047C
	warp MAP_LILYCOVE_CITY_HARBOR, 255, 8, 11
	waitstate
	release
	end

SouthernIsland_Exterior_EventScript_160B25:: @ 8160B25
	msgbox SouthernIsland_Exterior_Text_1C52A6, MSGBOX_DEFAULT
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
	walk_down
	step_end

BattleTower_Outside_Movement_160B47:: @ 8160B47
	walk_left
	walk_in_place_fastest_down
	step_end

SouthernIsland_Exterior_EventScript_160B4A:: @ 8160B4A
	msgbox SouthernIsland_Exterior_Text_1C52FB, MSGBOX_SIGN
	end
