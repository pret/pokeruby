BattleTower_BattleRoom_MapScripts:: @ 81608DB
	map_script 2, BattleTower_BattleRoom_MapScript2_1608E1
	.byte 0

BattleTower_BattleRoom_MapScript2_1608E1:: @ 81608E1
	map_script_2 0x4000, 0, BattleTower_BattleRoom_EventScript_1608EB
	.2byte 0

BattleTower_BattleRoom_EventScript_1608EB:: @ 81608EB
	setvar 0x4000, 1
	applymovement 255, BattleTower_BattleRoom_Movement_160AB7
	waitmovement 0

BattleTower_BattleRoom_EventScript_1608FA:: @ 81608FA
	special sub_81347F8
	reappear 1
	applymovement 1, BattleTower_BattleRoom_Movement_160AC0
	waitmovement 0
	special sub_8135474
	msgbox 0x20234cc, 4
	waittext
	closebutton
	special ScrSpecial_HealPlayerParty
	setvar 0x8004, 0
	setvar 0x8005, 0
	special sub_813556C
	waitstate
	switch RESULT
	case 1, BattleTower_BattleRoom_EventScript_160961
	special LoadPlayerParty
	setvar 0x8004, 0
	setvar 0x8005, 5
	special sub_8135668
	setvar 0x8004, 14
	special sub_8135668
	setvar 0x8004, 3
	special sub_810FF60
	warp BattleTower_Lobby, 255, 6, 6
	waitstate

BattleTower_BattleRoom_EventScript_160961:: @ 8160961
	setvar 0x8004, 6
	special sub_8135668
	switch RESULT
	case 8, BattleTower_BattleRoom_EventScript_160A56
	applymovement 1, BattleTower_BattleRoom_Movement_160AC6
	waitmovement 0
	disappear 1
	applymovement 2, BattleTower_BattleRoom_Movement_160ACB
	waitmovement 0
	applymovement 255, BattleTower_BattleRoom_Movement_160ABC
	waitmovement 0
	msgbox BattleTower_BattleRoom_Text_19ACDC, 4
	special LoadPlayerParty
	special SavePlayerParty
	special sub_8135A14
	playfanfare 368
	waitfanfare
	special ScrSpecial_HealPlayerParty

BattleTower_BattleRoom_EventScript_1609B2:: @ 81609B2
	msgbox BattleTower_BattleRoom_Text_19AD09, 5
	switch RESULT
	case 0, BattleTower_BattleRoom_EventScript_1609E0
	case 1, BattleTower_BattleRoom_EventScript_160A3C
	case 127, BattleTower_BattleRoom_EventScript_1609E0

BattleTower_BattleRoom_EventScript_1609E0:: @ 81609E0
	msgbox BattleTower_BattleRoom_Text_19AD3C, 5
	switch RESULT
	case 0, BattleTower_BattleRoom_EventScript_160A0E
	case 1, BattleTower_BattleRoom_EventScript_160A94
	case 127, BattleTower_BattleRoom_EventScript_160A0E

BattleTower_BattleRoom_EventScript_160A0E:: @ 8160A0E
	msgbox BattleTower_BattleRoom_Text_19AD66, 5
	switch RESULT
	case 0, BattleTower_BattleRoom_EventScript_1609B2
	case 1, BattleTower_BattleRoom_EventScript_160AB1
	case 127, BattleTower_BattleRoom_EventScript_1609B2

BattleTower_BattleRoom_EventScript_160A3C:: @ 8160A3C
	closebutton
	applymovement 255, BattleTower_BattleRoom_Movement_160ABE
	waitmovement 0
	applymovement 2, BattleTower_BattleRoom_Movement_160AD0
	waitmovement 0
	goto BattleTower_BattleRoom_EventScript_1608FA

BattleTower_BattleRoom_EventScript_160A56:: @ 8160A56
	special LoadPlayerParty
	setvar 0x8004, 0
	setvar 0x8005, 4
	special sub_8135668
	setvar 0x8004, 2
	setvar 0x8005, 1
	special sub_8135668
	setvar 0x8004, 7
	special sub_8135668
	setvar 0x8004, 14
	special sub_8135668
	setvar 0x8004, 3
	special sub_810FF60
	warp BattleTower_Lobby, 255, 6, 6
	waitstate

BattleTower_BattleRoom_EventScript_160A94:: @ 8160A94
	setvar 0x8004, 2
	special sub_8135BA0
	message BattleTower_BattleRoom_Text_1C6CE1
	delay 60
	waittext
	playse 55
	waitse
	msgbox BattleTower_BattleRoom_Text_1C6D05, 4

BattleTower_BattleRoom_EventScript_160AB1:: @ 8160AB1
	fadescreen 1
	special sub_8135C38
	end

BattleTower_BattleRoom_Movement_160AB7:: @ 8160AB7
	step_up
	step_up
	step_up
	step_03
	step_end

BattleTower_BattleRoom_Movement_160ABC:: @ 8160ABC
	step_00
	step_end

BattleTower_BattleRoom_Movement_160ABE:: @ 8160ABE
	step_03
	step_end

BattleTower_BattleRoom_Movement_160AC0:: @ 8160AC0
	step_down
	step_down
	step_down
	step_down
	step_02
	step_end

BattleTower_BattleRoom_Movement_160AC6:: @ 8160AC6
	step_up
	step_up
	step_up
	step_up
	step_end

BattleTower_BattleRoom_Movement_160ACB:: @ 8160ACB
	step_right
	step_right
	step_right
	step_up
	step_end

BattleTower_BattleRoom_Movement_160AD0:: @ 8160AD0
	step_down
	step_left
	step_left
	step_left
	step_03
	step_end
