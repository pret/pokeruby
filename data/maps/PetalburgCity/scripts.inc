PetalburgCity_MapScripts:: @ 814B70C
	map_script 3, PetalburgCity_MapScript1_14B717
	map_script 2, PetalburgCity_MapScript2_14B73D
	.byte 0

PetalburgCity_MapScript1_14B717:: @ 814B717
	setflag FLAG_VISITED_PETALBURG_CITY
	compare VAR_PETALBURG_STATE, 0
	call_if_eq PetalburgCity_EventScript_14B731
	compare VAR_PETALBURG_STATE, 2
	call_if_eq PetalburgCity_EventScript_14B739
	end

PetalburgCity_EventScript_14B731:: @ 814B731
	setobjectxyperm 9, 5, 11
	return

PetalburgCity_EventScript_14B739:: @ 814B739
	savebgm MUS_TSURETEK
	return

PetalburgCity_MapScript2_14B73D:: @ 814B73D
	map_script_2 VAR_PETALBURG_STATE, 2, PetalburgCity_EventScript_14B747
	.2byte 0

PetalburgCity_EventScript_14B747:: @ 814B747
	lockall
	setflag FLAG_SPECIAL_FLAG_0
	special SavePlayerParty
	special PutZigzagoonInPlayerParty
	applymovement 2, PetalburgCity_Movement_14B7ED
	applymovement 255, PetalburgCity_Movement_14B7CC
	waitmovement 0
	msgbox PetalburgCity_Text_16D361, 4
	special ScrSpecial_StartWallyTutorialBattle
	waitstate
	msgbox PetalburgCity_Text_16D3DE, 4
	applymovement 2, PetalburgCity_Movement_1A083F, 0, 0
	waitmovement 0, 0, 2
	msgbox PetalburgCity_Text_16D408, 4
	closemessage
	clearflag FLAG_SPECIAL_FLAG_0
	setvar VAR_PETALBURG_STATE, 3
	fadedefaultbgm
	clearflag FLAG_SPECIAL_FLAG_1
	special LoadPlayerParty
	setvar VAR_PETALBURG_GYM_STATE, 1
	warp MAP_PETALBURG_CITY_GYM, 255, 4, 108
	waitstate
	releaseall
	end

PetalburgCity_EventScript_14B7AC:: @ 814B7AC
	lock
	faceplayer
	msgbox PetalburgCity_Text_164490, 4
	closemessage
	applymovement 3, PetalburgCity_Movement_1A083D
	waitmovement 0
	release
	end

PetalburgCity_EventScript_14B7C3:: @ 814B7C3
	msgbox PetalburgCity_Text_16433E, 2
	end

PetalburgCity_Movement_14B7CC:: @ 814B7CC
	delay_8
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_in_place_fastest_right
	end_movement

PetalburgCity_Movement_14B7ED:: @ 814B7ED
	delay_8
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_right
	delay_16
	walk_in_place_fastest_up
	delay_16
	delay_16
	walk_in_place_fastest_right
	end_movement

PetalburgCity_EventScript_14B812:: @ 814B812
	msgbox PetalburgCity_Text_1645BB, 3
	end

PetalburgCity_EventScript_14B81B:: @ 814B81B
	msgbox PetalburgCity_Text_164602, 3
	end

PetalburgCity_EventScript_14B824:: @ 814B824
	msgbox PetalburgCity_Text_16453F, 2
	end

PetalburgCity_EventScript_14B82D:: @ 814B82D
	msgbox PetalburgCity_Text_164634, 3
	end

PetalburgCity_EventScript_14B836:: @ 814B836
	lockall
	setvar VAR_SPECIAL_8, 0
	goto PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B842:: @ 814B842
	lockall
	setvar VAR_SPECIAL_8, 1
	goto PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B84E:: @ 814B84E
	lockall
	setvar VAR_SPECIAL_8, 2
	goto PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B85A:: @ 814B85A
	lockall
	setvar VAR_SPECIAL_8, 3
	goto PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B866:: @ 814B866
	applymovement 9, PetalburgCity_Movement_1A0839
	waitmovement 0
	playbgm MUS_TSURETEK, FALSE
	playse SE_PIN
	applymovement 9, PetalburgCity_Movement_1A0833
	waitmovement 0
	applymovement 9, PetalburgCity_Movement_1A0835
	waitmovement 0
	compare VAR_SPECIAL_8, 0
	call_if_eq PetalburgCity_EventScript_14B91B
	compare VAR_SPECIAL_8, 1
	call_if_eq PetalburgCity_EventScript_14B930
	compare VAR_SPECIAL_8, 2
	call_if_eq PetalburgCity_EventScript_14B93B
	compare VAR_SPECIAL_8, 3
	call_if_eq PetalburgCity_EventScript_14B950
	msgbox PetalburgCity_Text_16438A, 4
	closemessage
	compare VAR_SPECIAL_8, 0
	call_if_eq PetalburgCity_EventScript_14B965
	compare VAR_SPECIAL_8, 1
	call_if_eq PetalburgCity_EventScript_14B977
	compare VAR_SPECIAL_8, 2
	call_if_eq PetalburgCity_EventScript_14B989
	compare VAR_SPECIAL_8, 3
	call_if_eq PetalburgCity_EventScript_14B99B
	msgbox PetalburgCity_Text_164426, 4
	applymovement 9, PetalburgCity_Movement_1A0843
	applymovement 255, PetalburgCity_Movement_1A0843
	waitmovement 0
	msgbox PetalburgCity_Text_164449, 4
	closemessage
	applymovement 9, PetalburgCity_Movement_14B9F4
	waitmovement 0
	fadedefaultbgm
	releaseall
	end

PetalburgCity_EventScript_14B91B:: @ 814B91B
	applymovement 9, PetalburgCity_Movement_14B9B1
	waitmovement 0
	applymovement 255, PetalburgCity_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_EventScript_14B930:: @ 814B930
	applymovement 9, PetalburgCity_Movement_14B9B6
	waitmovement 0
	return

PetalburgCity_EventScript_14B93B:: @ 814B93B
	applymovement 9, PetalburgCity_Movement_14B9B9
	waitmovement 0
	applymovement 255, PetalburgCity_Movement_1A0841
	waitmovement 0
	return

PetalburgCity_EventScript_14B950:: @ 814B950
	applymovement 9, PetalburgCity_Movement_14B9BE
	waitmovement 0
	applymovement 255, PetalburgCity_Movement_1A0841
	waitmovement 0
	return

PetalburgCity_EventScript_14B965:: @ 814B965
	applymovement 9, PetalburgCity_Movement_14B9C4
	applymovement 255, PetalburgCity_Movement_14BA01
	waitmovement 0
	return

PetalburgCity_EventScript_14B977:: @ 814B977
	applymovement 9, PetalburgCity_Movement_14B9CF
	applymovement 255, PetalburgCity_Movement_14BA0B
	waitmovement 0
	return

PetalburgCity_EventScript_14B989:: @ 814B989
	applymovement 9, PetalburgCity_Movement_14B9DD
	applymovement 255, PetalburgCity_Movement_14BA18
	waitmovement 0
	return

PetalburgCity_EventScript_14B99B:: @ 814B99B
	applymovement 9, PetalburgCity_Movement_14B9E8
	applymovement 255, PetalburgCity_Movement_14BA22
	waitmovement 0
	return

@ 814B9AD
	delay_16
	delay_16
	delay_16
	end_movement

PetalburgCity_Movement_14B9B1:: @ 814B9B1
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

PetalburgCity_Movement_14B9B6:: @ 814B9B6
	walk_right
	walk_right
	end_movement

PetalburgCity_Movement_14B9B9:: @ 814B9B9
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_down
	end_movement

PetalburgCity_Movement_14B9BE:: @ 814B9BE
	walk_down
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_down
	end_movement

PetalburgCity_Movement_14B9C4:: @ 814B9C4
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_right
	walk_in_place_fastest_up
	end_movement

PetalburgCity_Movement_14B9CF:: @ 814B9CF
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_right
	walk_in_place_fastest_up
	end_movement

PetalburgCity_Movement_14B9DD:: @ 814B9DD
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_right
	walk_in_place_fastest_up
	end_movement

PetalburgCity_Movement_14B9E8:: @ 814B9E8
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_right
	walk_in_place_fastest_up
	end_movement

PetalburgCity_Movement_14B9F4:: @ 814B9F4
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

PetalburgCity_Movement_14BA01:: @ 814BA01
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	end_movement

PetalburgCity_Movement_14BA0B:: @ 814BA0B
	delay_16
	delay_16
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	end_movement

PetalburgCity_Movement_14BA18:: @ 814BA18
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	end_movement

PetalburgCity_Movement_14BA22:: @ 814BA22
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	end_movement

PetalburgCity_EventScript_14BA2D:: @ 814BA2D
	msgbox PetalburgCity_Text_16438A, 2
	end
