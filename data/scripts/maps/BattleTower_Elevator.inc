BattleTower_Elevator_MapScripts:: @ 81607CF
	map_script 2, BattleTower_Elevator_MapScript2_1607DA
	map_script 4, BattleTower_Elevator_MapScript2_160821
	.byte 0

BattleTower_Elevator_MapScript2_1607DA:: @ 81607DA
	map_script_2 0x4000, 0, BattleTower_Elevator_EventScript_1607E4
	.2byte 0

BattleTower_Elevator_EventScript_1607E4:: @ 81607E4
	setvar 0x4000, 1
	move 1, BattleTower_Elevator_Movement_160835
	move 255, BattleTower_Elevator_Movement_160839
	waitmove 0
	special 273
	waitstate
	pause 64
	move 1, BattleTower_Elevator_Movement_16083D
	move 255, BattleTower_Elevator_Movement_160841
	waitmove 0
	setvar 0x4000, 0
	warp BattleTower_Corridor, 255, 8, 1
	waitstate
	end

BattleTower_Elevator_MapScript2_160821:: @ 8160821
	map_script_2 0x4001, 0, BattleTower_Elevator_EventScript_16082B
	.2byte 0

BattleTower_Elevator_EventScript_16082B:: @ 816082B
	setvar 0x4001, 1
	spriteface 255, 2
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
