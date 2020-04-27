BattleTower_BattleRoom_MapScripts:: @ 81608DB
	map_script MAP_SCRIPT_ON_FRAME_TABLE, BattleTower_BattleRoom_MapScript2_1608E1
	.byte 0

BattleTower_BattleRoom_MapScript2_1608E1:: @ 81608E1
	map_script_2 VAR_TEMP_0, 0, BattleTower_BattleRoom_EventScript_1608EB
	.2byte 0

BattleTower_BattleRoom_EventScript_1608EB:: @ 81608EB
	setvar VAR_TEMP_0, 1
	applymovement 255, BattleTower_BattleRoom_Movement_160AB7
	waitmovement 0

BattleTower_BattleRoom_EventScript_1608FA:: @ 81608FA
	special ChooseNextBattleTowerTrainer
	addobject 1
	applymovement 1, BattleTower_BattleRoom_Movement_160AC0
	waitmovement 0
	special PrintBattleTowerTrainerGreeting
	msgbox gStringVar4, MSGBOX_DEFAULT
	waitmessage
	closemessage
	special ScrSpecial_HealPlayerParty
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 0
	special StartSpecialBattle
	waitstate
	switch VAR_RESULT
	case 1, BattleTower_BattleRoom_EventScript_160961
	special LoadPlayerParty
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 5
	special SetBattleTowerProperty
	setvar VAR_0x8004, 14
	special SetBattleTowerProperty
	setvar VAR_0x8004, 3
	special sub_810FF60
	warp MAP_BATTLE_TOWER_LOBBY, 255, 6, 6
	waitstate

BattleTower_BattleRoom_EventScript_160961:: @ 8160961
	setvar VAR_0x8004, 6
	special SetBattleTowerProperty
	switch VAR_RESULT
	case 8, BattleTower_BattleRoom_EventScript_160A56
	applymovement 1, BattleTower_BattleRoom_Movement_160AC6
	waitmovement 0
	removeobject 1
	applymovement 2, BattleTower_BattleRoom_Movement_160ACB
	waitmovement 0
	applymovement 255, BattleTower_BattleRoom_Movement_160ABC
	waitmovement 0
	msgbox BattleTower_BattleRoom_Text_19ACDC, MSGBOX_DEFAULT
	special LoadPlayerParty
	special SavePlayerParty
	special SetBattleTowerParty
	playfanfare MUS_ME_ASA
	waitfanfare
	special ScrSpecial_HealPlayerParty

BattleTower_BattleRoom_EventScript_1609B2:: @ 81609B2
	msgbox BattleTower_BattleRoom_Text_19AD09, MSGBOX_YESNO
	switch VAR_RESULT
	case NO, BattleTower_BattleRoom_EventScript_1609E0
	case YES, BattleTower_BattleRoom_EventScript_160A3C
	case 127, BattleTower_BattleRoom_EventScript_1609E0

BattleTower_BattleRoom_EventScript_1609E0:: @ 81609E0
	msgbox BattleTower_BattleRoom_Text_19AD3C, MSGBOX_YESNO
	switch VAR_RESULT
	case NO, BattleTower_BattleRoom_EventScript_160A0E
	case YES, BattleTower_BattleRoom_EventScript_160A94
	case 127, BattleTower_BattleRoom_EventScript_160A0E

BattleTower_BattleRoom_EventScript_160A0E:: @ 8160A0E
	msgbox BattleTower_BattleRoom_Text_19AD66, MSGBOX_YESNO
	switch VAR_RESULT
	case NO, BattleTower_BattleRoom_EventScript_1609B2
	case YES, BattleTower_BattleRoom_EventScript_160AB1
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
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 4
	special SetBattleTowerProperty
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 1
	special SetBattleTowerProperty
	setvar VAR_0x8004, 7
	special SetBattleTowerProperty
	setvar VAR_0x8004, 14
	special SetBattleTowerProperty
	setvar VAR_0x8004, 3
	special sub_810FF60
	warp MAP_BATTLE_TOWER_LOBBY, 255, 6, 6
	waitstate

BattleTower_BattleRoom_EventScript_160A94:: @ 8160A94
	setvar VAR_0x8004, 2
	special SaveBattleTowerProgress
	message BattleTower_BattleRoom_Text_1C6CE1
	delay 60
	waitmessage
	playse SE_SAVE
	waitse
	msgbox BattleTower_BattleRoom_Text_1C6D05, MSGBOX_DEFAULT

BattleTower_BattleRoom_EventScript_160AB1:: @ 8160AB1
	fadescreen 1
	special BattleTower_SoftReset
	end

BattleTower_BattleRoom_Movement_160AB7:: @ 8160AB7
	walk_up
	walk_up
	walk_up
	face_right
	step_end

BattleTower_BattleRoom_Movement_160ABC:: @ 8160ABC
	face_down
	step_end

BattleTower_BattleRoom_Movement_160ABE:: @ 8160ABE
	face_right
	step_end

BattleTower_BattleRoom_Movement_160AC0:: @ 8160AC0
	walk_down
	walk_down
	walk_down
	walk_down
	face_left
	step_end

BattleTower_BattleRoom_Movement_160AC6:: @ 8160AC6
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

BattleTower_BattleRoom_Movement_160ACB:: @ 8160ACB
	walk_right
	walk_right
	walk_right
	walk_up
	step_end

BattleTower_BattleRoom_Movement_160AD0:: @ 8160AD0
	walk_down
	walk_left
	walk_left
	walk_left
	face_right
	step_end
