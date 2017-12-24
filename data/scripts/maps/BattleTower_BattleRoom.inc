BattleTower_BattleRoom_MapScripts:: @ 81608DB
	map_script 2, BattleTower_BattleRoom_MapScript2_1608E1
	.byte 0

BattleTower_BattleRoom_MapScript2_1608E1:: @ 81608E1
	map_script_2 VAR_TEMP_0, 0, BattleTower_BattleRoom_EventScript_1608EB
	.2byte 0

BattleTower_BattleRoom_EventScript_1608EB:: @ 81608EB
	setvar VAR_TEMP_0, 1
	applymovement 255, BattleTower_BattleRoom_Movement_160AB7
	waitmovement 0

BattleTower_BattleRoom_EventScript_1608FA:: @ 81608FA
	special sub_81347F8
	addobject 1
	applymovement 1, BattleTower_BattleRoom_Movement_160AC0
	waitmovement 0
	special PrintBattleTowerTrainerGreeting
	msgbox gStringVar4, 4
	waitmessage
	closemessage
	special ScrSpecial_HealPlayerParty
	setvar SPECIALVAR_4, 0
	setvar SPECIALVAR_5, 0
	special sub_813556C
	waitstate
	switch RESULT
	case 1, BattleTower_BattleRoom_EventScript_160961
	special LoadPlayerParty
	setvar SPECIALVAR_4, 0
	setvar SPECIALVAR_5, 5
	special sub_8135668
	setvar SPECIALVAR_4, 14
	special sub_8135668
	setvar SPECIALVAR_4, 3
	special sub_810FF60
	warp MAP_BATTLE_TOWER_LOBBY, 255, 6, 6
	waitstate

BattleTower_BattleRoom_EventScript_160961:: @ 8160961
	setvar SPECIALVAR_4, 6
	special sub_8135668
	switch RESULT
	case 8, BattleTower_BattleRoom_EventScript_160A56
	applymovement 1, BattleTower_BattleRoom_Movement_160AC6
	waitmovement 0
	removeobject 1
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
	closemessage
	applymovement 255, BattleTower_BattleRoom_Movement_160ABE
	waitmovement 0
	applymovement 2, BattleTower_BattleRoom_Movement_160AD0
	waitmovement 0
	goto BattleTower_BattleRoom_EventScript_1608FA

BattleTower_BattleRoom_EventScript_160A56:: @ 8160A56
	special LoadPlayerParty
	setvar SPECIALVAR_4, 0
	setvar SPECIALVAR_5, 4
	special sub_8135668
	setvar SPECIALVAR_4, 2
	setvar SPECIALVAR_5, 1
	special sub_8135668
	setvar SPECIALVAR_4, 7
	special sub_8135668
	setvar SPECIALVAR_4, 14
	special sub_8135668
	setvar SPECIALVAR_4, 3
	special sub_810FF60
	warp MAP_BATTLE_TOWER_LOBBY, 255, 6, 6
	waitstate

BattleTower_BattleRoom_EventScript_160A94:: @ 8160A94
	setvar SPECIALVAR_4, 2
	special sub_8135BA0
	message BattleTower_BattleRoom_Text_1C6CE1
	delay 60
	waitmessage
	playse 55
	waitse
	msgbox BattleTower_BattleRoom_Text_1C6D05, 4

BattleTower_BattleRoom_EventScript_160AB1:: @ 8160AB1
	fadescreen 1
	special BattleTower_SoftReset
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
