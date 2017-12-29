BattleTower_Elevator_MapScripts:: @ 81607CF
	map_script 2, BattleTower_Elevator_MapScript2_1607DA
	map_script 4, BattleTower_Elevator_MapScript2_160821
	.byte 0

BattleTower_Elevator_MapScript2_1607DA:: @ 81607DA
	map_script_2 VAR_TEMP_0, 0, BattleTower_Elevator_EventScript_1607E4
	.2byte 0

BattleTower_Elevator_EventScript_1607E4:: @ 81607E4
	setvar VAR_TEMP_0, 1
	applymovement 1, BattleTower_Elevator_Movement_160835
	applymovement 255, BattleTower_Elevator_Movement_160839
	waitmovement 0
	special sub_810EBEC
	waitstate
	delay 64
	applymovement 1, BattleTower_Elevator_Movement_16083D
	applymovement 255, BattleTower_Elevator_Movement_160841
	waitmovement 0
	setvar VAR_TEMP_0, 0
	warp MAP_BATTLE_TOWER_CORRIDOR, 255, 8, 1
	waitstate
	end

BattleTower_Elevator_MapScript2_160821:: @ 8160821
	map_script_2 VAR_TEMP_1, 0, BattleTower_Elevator_EventScript_16082B
	.2byte 0

BattleTower_Elevator_EventScript_16082B:: @ 816082B
	setvar VAR_TEMP_1, 1
	turnobject 255, 2
	end

BattleTower_Elevator_Movement_160835:: @ 8160835
	step_up
	step_right
	step_00
	step_end

BattleTower_Elevator_Movement_160839:: @ 8160839
	step_up
	step_up
	step_00
	step_end

BattleTower_Elevator_Movement_16083D:: @ 816083D
	step_down
	step_down
	step_54
	step_end

BattleTower_Elevator_Movement_160841:: @ 8160841
	step_right
	step_down
	step_down
	step_end
