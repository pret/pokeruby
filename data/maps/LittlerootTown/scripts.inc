LittlerootTown_MapScripts:: @ 814D509
	map_script 3, LittlerootTown_MapScript1_14D514
	map_script 2, LittlerootTown_MapScript2_14D5D5
	.byte 0

LittlerootTown_MapScript1_14D514:: @ 814D514
	setflag FLAG_VISITED_LITTLEROOT_TOWN
	compare VAR_LITTLEROOT_INTRO_STATE, 2
	call_if_eq LittlerootTown_EventScript_14D57B
	call_if_unset FLAG_RESCUED_BIRCH, LittlerootTown_EventScript_14D583
	compare VAR_LITTLEROOT_STATE, 3
	call_if_eq LittlerootTown_EventScript_14D5A6
	compare VAR_LITTLEROOT_HOUSES_STATE, 4
	call_if_eq LittlerootTown_EventScript_14D570
	compare VAR_LITTLEROOT_HOUSES_STATE_2, 4
	call_if_eq LittlerootTown_EventScript_14D570
	compare VAR_OLDALE_STATE, 1
	call_if_eq LittlerootTown_EventScript_14D567
	compare VAR_LITTLEROOT_RIVAL_STATE, 3
	call_if_eq LittlerootTown_EventScript_14D563
	end

LittlerootTown_EventScript_14D563:: @ 814D563
	setflag FLAG_RIVAL_LEFT_FOR_ROUTE103
	return

LittlerootTown_EventScript_14D567:: @ 814D567
	setvar VAR_OLDALE_STATE, 2
	setflag FLAG_HIDE_RIVAL_OLDALE_TOWN
	return

LittlerootTown_EventScript_14D570:: @ 814D570
	setvar VAR_LITTLEROOT_HOUSES_STATE, 5
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 5
	return

LittlerootTown_EventScript_14D57B:: @ 814D57B
	setobjectxyperm 4, 14, 8
	return

LittlerootTown_EventScript_14D583:: @ 814D583
	compare VAR_LITTLEROOT_STATE, 0
	goto_if_eq LittlerootTown_EventScript_14D59A
	setobjectxyperm 1, 10, 1
	setobjectmovementtype 1, 7
	return

LittlerootTown_EventScript_14D59A:: @ 814D59A
	setobjectxyperm 1, 7, 2
	setobjectmovementtype 1, 8
	return

LittlerootTown_EventScript_14D5A6:: @ 814D5A6
	clearflag FLAG_HIDE_MOM_LITTLEROOT
	setobjectmovementtype 4, 8
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14D5C5
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14D5CD
	return

LittlerootTown_EventScript_14D5C5:: @ 814D5C5
	setobjectxyperm 4, 5, 9
	return

LittlerootTown_EventScript_14D5CD:: @ 814D5CD
	setobjectxyperm 4, 14, 9
	return

LittlerootTown_MapScript2_14D5D5:: @ 814D5D5
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 1, LittlerootTown_EventScript_14D5EF
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 2, LittlerootTown_EventScript_14D60D
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 7, LittlerootTown_EventScript_14D6C5
	.2byte 0

LittlerootTown_EventScript_14D5EF:: @ 814D5EF
	lockall
	setvar VAR_SPECIAL_4, 5
	setvar VAR_SPECIAL_5, 8
	call LittlerootTown_EventScript_14D62B
	setflag FLAG_HIDE_MOVING_TRUCK_BRENDAN
	warpsilent MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F, 255, 8, 8
	waitstate
	releaseall
	end

LittlerootTown_EventScript_14D60D:: @ 814D60D
	lockall
	setvar VAR_SPECIAL_4, 14
	setvar VAR_SPECIAL_5, 8
	call LittlerootTown_EventScript_14D62B
	setflag FLAG_HIDE_MOVING_TRUCK_MAY
	warpsilent MAP_LITTLEROOT_TOWN_MAYS_HOUSE_1F, 255, 2, 8
	waitstate
	releaseall
	end

LittlerootTown_EventScript_14D62B:: @ 814D62B
	delay 15
	playse SE_DANSA
	applymovement 255, LittlerootTown_Movement_14D6C0
	waitmovement 0
	opendoor VAR_SPECIAL_4, VAR_SPECIAL_5
	waitdooranim
	addobject 4
	applymovement 4, LittlerootTown_Movement_14D6AC
	waitmovement 0
	closedoor VAR_SPECIAL_4, VAR_SPECIAL_5
	waitdooranim
	delay 10
	applymovement 4, LittlerootTown_Movement_14D6AE
	waitmovement 0
	msgbox LittlerootTown_Text_16A7C9, 4
	closemessage
	applymovement 4, LittlerootTown_Movement_14D6B1
	applymovement 255, LittlerootTown_Movement_14D6B8
	waitmovement 0
	opendoor VAR_SPECIAL_4, VAR_SPECIAL_5
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14D6B5
	applymovement 255, LittlerootTown_Movement_14D6BD
	waitmovement 0
	setflag FLAG_HIDE_MOM_LITTLEROOT
	setvar VAR_LITTLEROOT_INTRO_STATE, 3
	hideobjectat 255, MAP_PETALBURG_CITY
	closedoor VAR_SPECIAL_4, VAR_SPECIAL_5
	waitdooranim
	clearflag FLAG_HIDE_FAT_MAN_LITTLEROOT
	clearflag FLAG_SPECIAL_FLAG_0
	return

LittlerootTown_Movement_14D6AC:: @ 814D6AC
	walk_down
	end_movement

LittlerootTown_Movement_14D6AE:: @ 814D6AE
	walk_down
	walk_in_place_fastest_left
	end_movement

LittlerootTown_Movement_14D6B1:: @ 814D6B1
	delay_16
	delay_8
	walk_up
	end_movement

LittlerootTown_Movement_14D6B5:: @ 814D6B5
	walk_up
	set_invisible
	end_movement

LittlerootTown_Movement_14D6B8:: @ 814D6B8
	delay_16
	delay_8
	walk_right
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14D6BD:: @ 814D6BD
	walk_up
	walk_up
	end_movement

LittlerootTown_Movement_14D6C0:: @ 814D6C0
	jump_right
	delay_16
	delay_16
	delay_16
	end_movement

LittlerootTown_EventScript_14D6C5:: @ 814D6C5
	lockall
	setvar VAR_LITTLEROOT_INTRO_STATE, 8
	releaseall
	end

LittlerootTown_EventScript_14D6CD:: @ 814D6CD
	msgbox LittlerootTown_Text_16AC00, 2
	end

LittlerootTown_EventScript_14D6D6:: @ 814D6D6
	msgbox LittlerootTown_Text_16AC56, 2
	end

LittlerootTown_EventScript_14D6DF:: @ 814D6DF
	lock
	faceplayer
	goto_if_set FLAG_ADVENTURE_STARTED, LittlerootTown_EventScript_14D72F
	goto_if_set FLAG_RESCUED_BIRCH, LittlerootTown_EventScript_14D722
	compare VAR_LITTLEROOT_STATE, 0
	goto_if_ne LittlerootTown_EventScript_14D708
	msgbox LittlerootTown_Text_16ACEB, 4
	release
	end

LittlerootTown_EventScript_14D708:: @ 814D708
	msgbox LittlerootTown_Text_16AD82, 4
	closemessage
	applymovement 1, LittlerootTown_Movement_1A083D
	waitmovement 0
	setvar VAR_LITTLEROOT_STATE, 2
	release
	end

LittlerootTown_EventScript_14D722:: @ 814D722
	special GetPlayerBigGuyGirlString
	msgbox LittlerootTown_Text_16ADF2, 4
	release
	end

LittlerootTown_EventScript_14D72F:: @ 814D72F
	msgbox LittlerootTown_Text_16AE25, 4
	release
	end

LittlerootTown_EventScript_14D739:: @ 814D739
	lockall
	applymovement 1, LittlerootTown_Movement_14D779
	waitmovement 0
	call LittlerootTown_EventScript_14D755
	applymovement 1, LittlerootTown_Movement_14D789
	waitmovement 0
	releaseall
	end

LittlerootTown_EventScript_14D755:: @ 814D755
	msgbox LittlerootTown_Text_16ACEB, 4
	closemessage
	applymovement 1, LittlerootTown_Movement_14D787
	applymovement 255, LittlerootTown_Movement_14D793
	waitmovement 0
	msgbox LittlerootTown_Text_16AD3C, 4
	closemessage
	return

LittlerootTown_Movement_14D779:: @ 814D779
	face_right
	delay_8
	disable_jump_landing_ground_effect
	jump_in_place_right
	delay_8
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_left
	face_down
	end_movement

LittlerootTown_Movement_14D787:: @ 814D787
	walk_down
	end_movement

LittlerootTown_Movement_14D789:: @ 814D789
	walk_right
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_in_place_fastest_down
	end_movement

LittlerootTown_Movement_14D793:: @ 814D793
	lock_facing_direction
	walk_down
	unlock_facing_direction
	end_movement

LittlerootTown_EventScript_14D797:: @ 814D797
	lockall
	applymovement 1, LittlerootTown_Movement_14D7B3
	waitmovement 0
	call LittlerootTown_EventScript_14D755
	applymovement 1, LittlerootTown_Movement_14D7C0
	waitmovement 0
	releaseall
	end

LittlerootTown_Movement_14D7B3:: @ 814D7B3
	face_right
	delay_8
	disable_jump_landing_ground_effect
	jump_in_place_right
	delay_8
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_right
	face_down
	end_movement

LittlerootTown_Movement_14D7C0:: @ 814D7C0
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_down
	end_movement

LittlerootTown_EventScript_14D7C7:: @ 814D7C7
	lockall
	applymovement 1, LittlerootTown_Movement_1A0843
	waitmovement 0
	applymovement 255, LittlerootTown_Movement_1A083F
	waitmovement 0
	msgbox LittlerootTown_Text_16AD82, 4
	closemessage
	applymovement 1, LittlerootTown_Movement_1A083D
	waitmovement 0
	setvar VAR_LITTLEROOT_STATE, 2
	releaseall
	end

LittlerootTown_EventScript_14D7F6:: @ 814D7F6
	msgbox LittlerootTown_Text_16AE50, 3
	end

LittlerootTown_EventScript_14D7FF:: @ 814D7FF
	msgbox LittlerootTown_Text_16AE87, 3
	end

LittlerootTown_EventScript_14D808:: @ 814D808
	lockall
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14D822
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14D82B
	releaseall
	end

LittlerootTown_EventScript_14D822:: @ 814D822
	msgbox LittlerootTown_Text_16AEA1, 4
	return

LittlerootTown_EventScript_14D82B:: @ 814D82B
	msgbox LittlerootTown_Text_16AEAC, 4
	return

LittlerootTown_EventScript_14D834:: @ 814D834
	lockall
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14D84E
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14D857
	releaseall
	end

LittlerootTown_EventScript_14D84E:: @ 814D84E
	msgbox LittlerootTown_Text_16AEAC, 4
	return

LittlerootTown_EventScript_14D857:: @ 814D857
	msgbox LittlerootTown_Text_16AEA1, 4
	return

LittlerootTown_EventScript_14D860:: @ 814D860
	lockall
	setvar VAR_SPECIAL_8, 0
	setobjectxy 4, 10, 9
	goto LittlerootTown_EventScript_14D8B6
	end

LittlerootTown_EventScript_14D873:: @ 814D873
	lockall
	setvar VAR_SPECIAL_8, 1
	setobjectxy 4, 11, 9
	goto LittlerootTown_EventScript_14D8B6
	end

LittlerootTown_EventScript_14D886:: @ 814D886
	lockall
	setvar VAR_SPECIAL_8, 2
	goto LittlerootTown_EventScript_14D8B6
	end

LittlerootTown_EventScript_14D892:: @ 814D892
	lockall
	setvar VAR_SPECIAL_8, 3
	goto LittlerootTown_EventScript_14D8B6
	end

LittlerootTown_EventScript_14D89E:: @ 814D89E
	lockall
	setvar VAR_SPECIAL_8, 4
	goto LittlerootTown_EventScript_14D8B6
	end

LittlerootTown_EventScript_14D8AA:: @ 814D8AA
	lockall
	setvar VAR_SPECIAL_8, 5
	goto LittlerootTown_EventScript_14D8B6
	end

LittlerootTown_EventScript_14D8B6:: @ 814D8B6
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14D93C
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14D947
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14D926
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14D931
	msgbox LittlerootTown_Text_16A8EE, 4
	closemessage
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14D952
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14D995
	call LittlerootTown_EventScript_14DD38
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14DAAA
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14DAED
	goto LittlerootTown_EventScript_14DD2B
	end

LittlerootTown_EventScript_14D926:: @ 814D926
	setvar VAR_SPECIAL_9, 5
	setvar VAR_SPECIAL_A, 8
	return

LittlerootTown_EventScript_14D931:: @ 814D931
	setvar VAR_SPECIAL_9, 14
	setvar VAR_SPECIAL_A, 8
	return

LittlerootTown_EventScript_14D93C:: @ 814D93C
	applymovement 4, LittlerootTown_Movement_1A0843
	waitmovement 0
	return

LittlerootTown_EventScript_14D947:: @ 814D947
	applymovement 4, LittlerootTown_Movement_1A083F
	waitmovement 0
	return

LittlerootTown_EventScript_14D952:: @ 814D952
	compare VAR_SPECIAL_8, 0
	call_if_eq LittlerootTown_EventScript_14D9D8
	compare VAR_SPECIAL_8, 1
	call_if_eq LittlerootTown_EventScript_14D9ED
	compare VAR_SPECIAL_8, 2
	call_if_eq LittlerootTown_EventScript_14DA02
	compare VAR_SPECIAL_8, 3
	call_if_eq LittlerootTown_EventScript_14DA17
	compare VAR_SPECIAL_8, 4
	call_if_eq LittlerootTown_EventScript_14DA2C
	compare VAR_SPECIAL_8, 5
	call_if_eq LittlerootTown_EventScript_14DA41
	return

LittlerootTown_EventScript_14D995:: @ 814D995
	compare VAR_SPECIAL_8, 0
	call_if_eq LittlerootTown_EventScript_14D9D8
	compare VAR_SPECIAL_8, 1
	call_if_eq LittlerootTown_EventScript_14D9ED
	compare VAR_SPECIAL_8, 2
	call_if_eq LittlerootTown_EventScript_14DA56
	compare VAR_SPECIAL_8, 3
	call_if_eq LittlerootTown_EventScript_14DA6B
	compare VAR_SPECIAL_8, 4
	call_if_eq LittlerootTown_EventScript_14DA80
	compare VAR_SPECIAL_8, 5
	call_if_eq LittlerootTown_EventScript_14DA95
	return

LittlerootTown_EventScript_14D9D8:: @ 814D9D8
	applymovement 255, LittlerootTown_Movement_1A0845
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC76
	waitmovement 0
	return

LittlerootTown_EventScript_14D9ED:: @ 814D9ED
	applymovement 255, LittlerootTown_Movement_1A0845
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC7D
	waitmovement 0
	return

LittlerootTown_EventScript_14DA02:: @ 814DA02
	applymovement 255, LittlerootTown_Movement_1A083F
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC84
	waitmovement 0
	return

LittlerootTown_EventScript_14DA17:: @ 814DA17
	applymovement 255, LittlerootTown_Movement_1A083F
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC89
	waitmovement 0
	return

LittlerootTown_EventScript_14DA2C:: @ 814DA2C
	applymovement 255, LittlerootTown_Movement_1A083F
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC8F
	waitmovement 0
	return

LittlerootTown_EventScript_14DA41:: @ 814DA41
	applymovement 255, LittlerootTown_Movement_1A083F
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC92
	waitmovement 0
	return

LittlerootTown_EventScript_14DA56:: @ 814DA56
	applymovement 255, LittlerootTown_Movement_1A0843
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC96
	waitmovement 0
	return

LittlerootTown_EventScript_14DA6B:: @ 814DA6B
	applymovement 255, LittlerootTown_Movement_1A0843
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC9A
	waitmovement 0
	return

LittlerootTown_EventScript_14DA80:: @ 814DA80
	applymovement 255, LittlerootTown_Movement_1A0843
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DC9D
	waitmovement 0
	return

LittlerootTown_EventScript_14DA95:: @ 814DA95
	applymovement 255, LittlerootTown_Movement_1A0843
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_14DCA3
	waitmovement 0
	return

LittlerootTown_EventScript_14DAAA:: @ 814DAAA
	compare VAR_SPECIAL_8, 0
	call_if_eq LittlerootTown_EventScript_14DB30
	compare VAR_SPECIAL_8, 1
	call_if_eq LittlerootTown_EventScript_14DB3B
	compare VAR_SPECIAL_8, 2
	call_if_eq LittlerootTown_EventScript_14DB46
	compare VAR_SPECIAL_8, 3
	call_if_eq LittlerootTown_EventScript_14DB6C
	compare VAR_SPECIAL_8, 4
	call_if_eq LittlerootTown_EventScript_14DB92
	compare VAR_SPECIAL_8, 5
	call_if_eq LittlerootTown_EventScript_14DBB8
	return

LittlerootTown_EventScript_14DAED:: @ 814DAED
	compare VAR_SPECIAL_8, 0
	call_if_eq LittlerootTown_EventScript_14DB30
	compare VAR_SPECIAL_8, 1
	call_if_eq LittlerootTown_EventScript_14DB3B
	compare VAR_SPECIAL_8, 2
	call_if_eq LittlerootTown_EventScript_14DBDE
	compare VAR_SPECIAL_8, 3
	call_if_eq LittlerootTown_EventScript_14DC04
	compare VAR_SPECIAL_8, 4
	call_if_eq LittlerootTown_EventScript_14DC2A
	compare VAR_SPECIAL_8, 5
	call_if_eq LittlerootTown_EventScript_14DC50
	return

LittlerootTown_EventScript_14DB30:: @ 814DB30
	applymovement 4, LittlerootTown_Movement_14DCA8
	waitmovement 0
	return

LittlerootTown_EventScript_14DB3B:: @ 814DB3B
	applymovement 4, LittlerootTown_Movement_14DCAE
	waitmovement 0
	return

LittlerootTown_EventScript_14DB46:: @ 814DB46
	applymovement 4, LittlerootTown_Movement_14DCB4
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_EventScript_14DB6C:: @ 814DB6C
	applymovement 4, LittlerootTown_Movement_14DCBA
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_EventScript_14DB92:: @ 814DB92
	applymovement 4, LittlerootTown_Movement_14DCC1
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_EventScript_14DBB8:: @ 814DBB8
	applymovement 4, LittlerootTown_Movement_14DCC5
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_EventScript_14DBDE:: @ 814DBDE
	applymovement 4, LittlerootTown_Movement_14DCCA
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_EventScript_14DC04:: @ 814DC04
	applymovement 4, LittlerootTown_Movement_14DCCF
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_EventScript_14DC2A:: @ 814DC2A
	applymovement 4, LittlerootTown_Movement_14DCD3
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_EventScript_14DC50:: @ 814DC50
	applymovement 4, LittlerootTown_Movement_14DCDA
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	return

LittlerootTown_Movement_14DC76:: @ 814DC76
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

LittlerootTown_Movement_14DC7D:: @ 814DC7D
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

LittlerootTown_Movement_14DC84:: @ 814DC84
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

LittlerootTown_Movement_14DC89:: @ 814DC89
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

LittlerootTown_Movement_14DC8F:: @ 814DC8F
	walk_right
	walk_right
	end_movement

LittlerootTown_Movement_14DC92:: @ 814DC92
	walk_right
	walk_right
	walk_right
	end_movement

LittlerootTown_Movement_14DC96:: @ 814DC96
	walk_left
	walk_left
	walk_left
	end_movement

LittlerootTown_Movement_14DC9A:: @ 814DC9A
	walk_left
	walk_left
	end_movement

LittlerootTown_Movement_14DC9D:: @ 814DC9D
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

LittlerootTown_Movement_14DCA3:: @ 814DCA3
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

LittlerootTown_Movement_14DCA8:: @ 814DCA8
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

LittlerootTown_Movement_14DCAE:: @ 814DCAE
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

LittlerootTown_Movement_14DCB4:: @ 814DCB4
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCBA:: @ 814DCBA
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCC1:: @ 814DCC1
	walk_left
	walk_left
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCC5:: @ 814DCC5
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCCA:: @ 814DCCA
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCCF:: @ 814DCCF
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCD3:: @ 814DCD3
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCDA:: @ 814DCDA
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

LittlerootTown_Movement_14DCE0:: @ 814DCE0
	walk_up
	end_movement

LittlerootTown_EventScript_14DCE2:: @ 814DCE2
	lock
	faceplayer
	checkplayergender
	compare RESULT, 0
	call_if_eq LittlerootTown_EventScript_14D926
	compare RESULT, 1
	call_if_eq LittlerootTown_EventScript_14D931
	call LittlerootTown_EventScript_14DD38
	applymovement 4, LittlerootTown_Movement_1A0841
	waitmovement 0
	opendoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_14DCE0
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_SPECIAL_9, VAR_SPECIAL_A
	waitdooranim
	goto LittlerootTown_EventScript_14DD2B
	end

LittlerootTown_EventScript_14DD2B:: @ 814DD2B
	removeobject 4
	setflag FLAG_SYS_B_DASH
	setvar VAR_LITTLEROOT_STATE, 4
	release
	end

LittlerootTown_EventScript_14DD38:: @ 814DD38
	msgbox LittlerootTown_Text_16A8FD, 4
	playfanfare MUS_FANFA4
	message LittlerootTown_Text_16AA32
	waitfanfare
	waitmessage
	setflag FLAG_RECEIVED_RUNNING_SHOES
	msgbox LittlerootTown_Text_16AA5C, 4
	msgbox LittlerootTown_Text_16AB10, 4
	closemessage
	delay 30
	return
