LittlerootTown_MaysHouse_1F_MapScripts:: @ 8152879
	map_script 1, LittlerootTown_MaysHouse_1F_MapScript1_152889
	map_script 3, LittlerootTown_MaysHouse_1F_MapScript1_1528C8
	map_script 2, LittlerootTown_MaysHouse_1F_MapScript2_15290E
	.byte 0

LittlerootTown_MaysHouse_1F_MapScript1_152889:: @ 8152889
	compare VAR_LITTLEROOT_INTRO_STATE, 6
	call_if_lt LittlerootTown_MaysHouse_1F_EventScript_15289E
	call_if_set FLAG_RECEIVED_RUNNING_SHOES, LittlerootTown_MaysHouse_1F_EventScript_1528B1
	end

LittlerootTown_MaysHouse_1F_EventScript_15289E:: @ 815289E
	setmetatile 5, 4, 624, 1
	setmetatile 5, 2, 616, 1
	return

LittlerootTown_MaysHouse_1F_EventScript_1528B1:: @ 81528B1
	checkplayergender
	compare RESULT, 1
	goto_if_eq LittlerootTown_MaysHouse_1F_EventScript_1528BE
	return

LittlerootTown_MaysHouse_1F_EventScript_1528BE:: @ 81528BE
	setmetatile 6, 7, 659, 1
	return

LittlerootTown_MaysHouse_1F_MapScript1_1528C8:: @ 81528C8
	compare VAR_LITTLEROOT_INTRO_STATE, 3
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_152902
	compare VAR_LITTLEROOT_INTRO_STATE, 5
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_1528EA
	compare VAR_LITTLEROOT_INTRO_STATE, 6
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_1528F6
	end

LittlerootTown_MaysHouse_1F_EventScript_1528EA:: @ 81528EA
	setobjectxyperm 1, 2, 4
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_1F_EventScript_1528F6:: @ 81528F6
	setobjectxyperm 1, 6, 5
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_1F_EventScript_152902:: @ 8152902
	setobjectxyperm 1, 1, 8
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_1F_MapScript2_15290E:: @ 815290E
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 3, LittlerootTown_MaysHouse_1F_EventScript_152960
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 5, LittlerootTown_MaysHouse_1F_EventScript_152938
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 6, LittlerootTown_MaysHouse_1F_EventScript_152971
	map_script_2 VAR_LITTLEROOT_HOUSES_STATE_2, 1, LittlerootTown_MaysHouse_1F_EventScript_152982
	map_script_2 VAR_LITTLEROOT_HOUSES_STATE, 3, LittlerootTown_MaysHouse_1F_EventScript_1B6CDE
	.2byte 0

LittlerootTown_MaysHouse_1F_EventScript_152938:: @ 8152938
	lockall
	msgbox LittlerootTown_MaysHouse_1F_Text_172574, 4
	closemessage
	applymovement 255, LittlerootTown_MaysHouse_1F_Movement_15295E
	applymovement 1, LittlerootTown_MaysHouse_1F_Movement_15295E
	waitmovement 0
	warp MAP_LITTLEROOT_TOWN_MAYS_HOUSE_2F, 255, 1, 1
	waitstate
	releaseall
	end

LittlerootTown_MaysHouse_1F_Movement_15295E:: @ 815295E
	walk_up
	end_movement

LittlerootTown_MaysHouse_1F_EventScript_152960:: @ 8152960
	lockall
	setvar VAR_SPECIAL_4, 1
	setvar VAR_SPECIAL_5, 1
	goto LittlerootTown_MaysHouse_1F_EventScript_1B6956
	end

LittlerootTown_MaysHouse_1F_EventScript_152971:: @ 8152971
	lockall
	setvar VAR_SPECIAL_4, 1
	setvar VAR_SPECIAL_5, 1
	goto LittlerootTown_MaysHouse_1F_EventScript_1B6B2E
	end

LittlerootTown_MaysHouse_1F_EventScript_152982:: @ 8152982
	lockall
	playse SE_PIN
	applymovement 4, LittlerootTown_MaysHouse_1F_Movement_1A0833
	waitmovement 0
	applymovement 4, LittlerootTown_MaysHouse_1F_Movement_1A0835
	waitmovement 0
	applymovement 255, LittlerootTown_MaysHouse_1F_Movement_1A0843
	applymovement 4, LittlerootTown_MaysHouse_1F_Movement_1529C0
	waitmovement 0
	special GetRivalSonDaughterString
	msgbox LittlerootTown_MaysHouse_1F_Text_1730C2, 4
	setflag FLAG_MET_RIVAL_MOM
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 2
	releaseall
	end

LittlerootTown_MaysHouse_1F_Movement_1529C0:: @ 81529C0
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

@ 81529C7
	lockall
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_1529E1
	compare RESULT, 1
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_1529E2
	releaseall
	end

LittlerootTown_MaysHouse_1F_EventScript_1529E1:: @ 81529E1
	return

LittlerootTown_MaysHouse_1F_EventScript_1529E2:: @ 81529E2
	msgbox LittlerootTown_BrendansHouse_1F_Text_172841, 4
	return

LittlerootTown_BrendansHouse_1F_EventScript_1529EB:: @ 81529EB
LittlerootTown_MaysHouse_1F_EventScript_1529EB:: @ 81529EB
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_RIVAL_ROUTE103, LittlerootTown_BrendansHouse_1F_EventScript_152A21
	goto_if_set FLAG_RIVAL_LEFT_FOR_ROUTE103, LittlerootTown_BrendansHouse_1F_EventScript_152A17
	compare VAR_LITTLEROOT_RIVAL_STATE, 3
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_152A2B
	special GetRivalSonDaughterString
	msgbox LittlerootTown_BrendansHouse_1F_Text_1731C6, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_152A17:: @ 8152A17
	msgbox LittlerootTown_BrendansHouse_1F_Text_173262, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_152A21:: @ 8152A21
	msgbox LittlerootTown_BrendansHouse_1F_Text_1732B9, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_152A2B:: @ 8152A2B
	msgbox LittlerootTown_BrendansHouse_1F_Text_1731E3, 4
	release
	end

LittlerootTown_MaysHouse_1F_EventScript_152A35:: @ 8152A35
	lockall
	setvar VAR_SPECIAL_4, 1
	setvar VAR_SPECIAL_5, 1
	applymovement VAR_SPECIAL_4, LittlerootTown_MaysHouse_1F_Movement_1A0843
	waitmovement 0
	goto LittlerootTown_MaysHouse_1F_EventScript_1B69B7
	end
