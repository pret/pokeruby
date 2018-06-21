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
	special ShakeScreenInElevator
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
	walk_up
	walk_right
	face_down
	end_movement

BattleTower_Elevator_Movement_160839:: @ 8160839
	walk_up
	walk_up
	face_down
	end_movement

BattleTower_Elevator_Movement_16083D:: @ 816083D
	walk_down
	walk_down
	set_invisible
	end_movement

BattleTower_Elevator_Movement_160841:: @ 8160841
	walk_right
	walk_down
	walk_down
	end_movement
