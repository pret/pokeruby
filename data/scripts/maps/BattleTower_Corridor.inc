BattleTower_Corridor_MapScripts:: @ 8160845
	map_script 1, BattleTower_Corridor_MapScript1_160850
	map_script 2, BattleTower_Corridor_MapScript2_160881
	.byte 0

BattleTower_Corridor_MapScript1_160850:: @ 8160850
	compare_var_to_imm 0x8006, 1
	goto_if_eq BattleTower_Corridor_EventScript_16086E
	setmaptile 12, 0, 519, 0
	setmaptile 12, 1, 527, 0
	end

BattleTower_Corridor_EventScript_16086E:: @ 816086E
	setmaptile 15, 0, 519, 0
	setmaptile 15, 1, 527, 0
	end

BattleTower_Corridor_MapScript2_160881:: @ 8160881
	map_script_2 0x4000, 0, BattleTower_Corridor_EventScript_16088B
	.2byte 0

BattleTower_Corridor_EventScript_16088B:: @ 816088B
	setvar 0x4000, 1
	compare_var_to_imm 0x8006, 1
	goto_if_eq BattleTower_Corridor_EventScript_1608B1
	applymovement 1, BattleTower_Corridor_Movement_1608D5
	applymovement 255, BattleTower_Corridor_Movement_1608D4
	waitmovement 0
	goto BattleTower_Corridor_EventScript_1608C2

BattleTower_Corridor_EventScript_1608B1:: @ 81608B1
	applymovement 1, BattleTower_Corridor_Movement_1608D2
	applymovement 255, BattleTower_Corridor_Movement_1608D1
	waitmovement 0

BattleTower_Corridor_EventScript_1608C2:: @ 81608C2
	setvar 0x4000, 0
	warp BattleTower_BattleRoom, 255, 4, 8
	waitstate
	end

BattleTower_Corridor_Movement_1608D1:: @ 81608D1
	step_right

BattleTower_Corridor_Movement_1608D2:: @ 81608D2
	step_right
	step_right

BattleTower_Corridor_Movement_1608D4:: @ 81608D4
	step_right

BattleTower_Corridor_Movement_1608D5:: @ 81608D5
	step_right
	step_right
	step_right
	step_up
	step_54
	step_end
