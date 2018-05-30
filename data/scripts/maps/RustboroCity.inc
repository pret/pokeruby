RustboroCity_MapScripts:: @ 814C372
	map_script 3, RustboroCity_MapScript1_14C378
	.byte 0

RustboroCity_MapScript1_14C378:: @ 814C378
	setflag FLAG_VISITED_RUSTBORO_CITY
	call RustboroCity_EventScript_1A0196
	call RustboroCity_EventScript_1A014E
	end

RustboroCity_EventScript_14C386:: @ 814C386
	lock
	faceplayer
	goto_if_set FLAG_DEVON_GOODS_STOLEN, RustboroCity_EventScript_14C39B
	msgbox RustboroCity_Text_16689D, 4
	release
	end

RustboroCity_EventScript_14C39B:: @ 814C39B
	msgbox RustboroCity_Text_16690C, 4
	release
	end

RustboroCity_EventScript_14C3A5:: @ 814C3A5
	lock
	faceplayer
	msgbox RustboroCity_Text_166A67, 4
	release
	end

RustboroCity_EventScript_14C3B1:: @ 814C3B1
	msgbox RustboroCity_Text_166AE0, 2
	end

RustboroCity_EventScript_14C3BA:: @ 814C3BA
	lock
	faceplayer
	goto_if_set FLAG_BADGE01_GET, RustboroCity_EventScript_14C3CF
	msgbox RustboroCity_Text_16696D, 4
	release
	end

RustboroCity_EventScript_14C3CF:: @ 814C3CF
	msgbox RustboroCity_Text_1669FE, 4
	release
	end

RustboroCity_EventScript_14C3D9:: @ 814C3D9
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_POKENAV, RustboroCity_EventScript_14C3EE
	msgbox RustboroCity_Text_166B86, 4
	release
	end

RustboroCity_EventScript_14C3EE:: @ 814C3EE
	msgbox RustboroCity_Text_166BEF, 4
	release
	end

RustboroCity_EventScript_14C3F8:: @ 814C3F8
	msgbox RustboroCity_Text_166C98, 2
	end

RustboroCity_EventScript_14C401:: @ 814C401
	msgbox RustboroCity_Text_166CFA, 3
	end

RustboroCity_EventScript_14C40A:: @ 814C40A
	msgbox RustboroCity_Text_167374, 3
	end

RustboroCity_EventScript_14C413:: @ 814C413
	msgbox RustboroCity_Text_1673FA, 3
	end

RustboroCity_EventScript_14C41C:: @ 814C41C
	msgbox RustboroCity_Text_167439, 3
	end

@ 814C425
	msgbox RustboroCity_Text_167485, 3
	end

RustboroCity_EventScript_14C42E:: @ 814C42E
	msgbox RustboroCity_Text_1674DD, 3
	end

RustboroCity_EventScript_14C437:: @ 814C437
	msgbox RustboroCity_Text_167525, 3
	end

RustboroCity_EventScript_14C440:: @ 814C440
	msgbox RustboroCity_Text_167568, 3
	end

RustboroCity_EventScript_14C449:: @ 814C449
	lock
	faceplayer
	msgbox RustboroCity_Text_166D59, 4
	applymovement 7, RustboroCity_Movement_1A083D
	waitmovement 0
	release
	end

RustboroCity_EventScript_14C45F:: @ 814C45F
	lock
	faceplayer
	msgbox RustboroCity_Text_166DB0, 4
	applymovement 8, RustboroCity_Movement_1A083D
	waitmovement 0
	release
	end

RustboroCity_EventScript_14C475:: @ 814C475
	lock
	faceplayer
	msgbox RustboroCity_Text_166DEE, 4
	release
	end

RustboroCity_EventScript_14C481:: @ 814C481
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_SPECIAL_4, 0
	goto RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C498:: @ 814C498
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_SPECIAL_4, 1
	goto RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4AF:: @ 814C4AF
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_SPECIAL_4, 2
	goto RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4C6:: @ 814C4C6
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_SPECIAL_4, 3
	goto RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4DD:: @ 814C4DD
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_SPECIAL_4, 4
	goto RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4F4:: @ 814C4F4
	msgbox RustboroCity_Text_166E65, 4
	closemessage
	addobject 10
	addobject 9
	applymovement 10, RustboroCity_Movement_14C5C2
	waitmovement 0
	removeobject 10
	applymovement 9, RustboroCity_Movement_14C5D3
	waitmovement 0
	msgbox RustboroCity_Text_166E7E, 4
	closemessage
	applymovement 9, RustboroCity_Movement_14C5DB
	waitmovement 0
	removeobject 9
	setobjectxyperm 9, 30, 10
	clearflag FLAG_HIDE_DEVON_RUSTBORO
	setflag FLAG_DEVON_GOODS_STOLEN
	setvar VAR_RUSTBORO_STATE, 2
	setvar VAR_RUSTURF_TUNNEL_STATE, 2
	setvar VAR_ROUTE116_STATE, 1
	clearflag FLAG_HIDE_BRINEY_ROUTE116
	clearflag FLAG_HIDE_PEEKO_RUSTURF_TUNNEL
	clearflag FLAG_HIDE_GRUNT_RUSTURF_TUNNEL
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	releaseall
	end

@ 814C55D
	msgbox RustboroCity_Text_166F6B, 4
	return

@ 814C566
	msgbox RustboroCity_Text_166FB4, 4
	return

@ 814C56F
	applymovement 9, RustboroCity_Movement_14C5E3
	waitmovement 0
	return

@ 814C57A
	applymovement 9, RustboroCity_Movement_14C5E7
	waitmovement 0
	return

@ 814C585
	applymovement 9, RustboroCity_Movement_14C5EC
	waitmovement 0
	return

@ 814C590
	applymovement 9, RustboroCity_Movement_14C5F1
	waitmovement 0
	return

@ 814C59B
	applymovement 9, RustboroCity_Movement_14C5F7
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0841
	waitmovement 0
	return

@ 814C5B0
	walk_fastest_right
	walk_fastest_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

RustboroCity_Movement_14C5C2:: @ 814C5C2
	walk_fastest_right
	walk_fastest_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

RustboroCity_Movement_14C5D3:: @ 814C5D3
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

RustboroCity_Movement_14C5DB:: @ 814C5DB
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

RustboroCity_Movement_14C5E3:: @ 814C5E3
	walk_down
	walk_right
	walk_right
	end_movement

RustboroCity_Movement_14C5E7:: @ 814C5E7
	walk_down
	walk_down
	walk_right
	walk_right
	end_movement

RustboroCity_Movement_14C5EC:: @ 814C5EC
	walk_down
	walk_down
	walk_right
	walk_right
	end_movement

RustboroCity_Movement_14C5F1:: @ 814C5F1
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	end_movement

RustboroCity_Movement_14C5F7:: @ 814C5F7
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_down
	end_movement

RustboroCity_EventScript_14C5FF:: @ 814C5FF
	lock
	faceplayer
	goto_if_set FLAG_RECOVERED_DEVON_GOODS, RustboroCity_EventScript_14C614
	msgbox RustboroCity_Text_166F6B, 4
	release
	end

RustboroCity_EventScript_14C614:: @ 814C614
	waitse
	setvar VAR_TEMP_1, 4
	goto RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C620:: @ 814C620
	lockall
	setvar VAR_TEMP_1, 0
	goto RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C62C:: @ 814C62C
	lockall
	setvar VAR_TEMP_1, 1
	goto RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C638:: @ 814C638
	lockall
	setvar VAR_TEMP_1, 2
	goto RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C644:: @ 814C644
	lockall
	setvar VAR_TEMP_1, 3
	goto RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C650:: @ 814C650
	compare VAR_TEMP_1, 0
	call_if_eq RustboroCity_EventScript_14C691
	compare VAR_TEMP_1, 1
	call_if_eq RustboroCity_EventScript_14C6BD
	compare VAR_TEMP_1, 2
	call_if_eq RustboroCity_EventScript_14C6E9
	compare VAR_TEMP_1, 3
	call_if_eq RustboroCity_EventScript_14C715
	setflag FLAG_UNKNOWN_9F
	setvar VAR_RUSTBORO_STATE, 3
	moveobjectoffscreen 9
	msgbox RustboroCity_Text_166EA5, 4
	releaseall
	end

RustboroCity_EventScript_14C691:: @ 814C691
	applymovement 9, RustboroCity_Movement_1A0841
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0845
	waitmovement 0
	return

RustboroCity_EventScript_14C6BD:: @ 814C6BD
	applymovement 9, RustboroCity_Movement_1A083F
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0843
	waitmovement 0
	return

RustboroCity_EventScript_14C6E9:: @ 814C6E9
	applymovement 9, RustboroCity_Movement_1A0845
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0841
	waitmovement 0
	return

RustboroCity_EventScript_14C715:: @ 814C715
	applymovement 9, RustboroCity_Movement_1A0845
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 9, RustboroCity_Movement_14C74B
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0841
	waitmovement 0
	return

RustboroCity_Movement_14C74B:: @ 814C74B
	walk_down
	end_movement

RustboroCity_EventScript_14C74D:: @ 814C74D
	lockall
	setvar VAR_TEMP_1, 0
	goto RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C759:: @ 814C759
	lockall
	setvar VAR_TEMP_1, 1
	goto RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C765:: @ 814C765
	lockall
	setvar VAR_TEMP_1, 2
	goto RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C771:: @ 814C771
	lockall
	setvar VAR_TEMP_1, 3
	goto RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C77D:: @ 814C77D
	compare VAR_TEMP_1, 0
	call_if_eq RustboroCity_EventScript_14C7FE
	compare VAR_TEMP_1, 1
	call_if_eq RustboroCity_EventScript_14C82A
	compare VAR_TEMP_1, 2
	call_if_eq RustboroCity_EventScript_14C856
	compare VAR_TEMP_1, 3
	call_if_eq RustboroCity_EventScript_14C882
	compare VAR_TEMP_1, 4
	call_if_eq RustboroCity_EventScript_14C8B8
	msgbox RustboroCity_Text_166FB4, 4
	giveitem_std ITEM_GREAT_BALL
	compare RESULT, 0
	call_if_eq RustboroCity_EventScript_14C7F5
	msgbox RustboroCity_Text_16707F, 4
	closemessage
	setflag FLAG_RETURNED_DEVON_GOODS
	setflag FLAG_HIDE_DEVON_RUSTBORO
	setvar VAR_RUSTBORO_STATE, 5
	delay 30
	warp MAP_RUSTBORO_CITY_DEVON_CORP_3F, 255, 2, 2
	waitstate
	releaseall
	end

RustboroCity_EventScript_14C7F5:: @ 814C7F5
	msgbox RustboroCity_Text_16704C, 4
	return

RustboroCity_EventScript_14C7FE:: @ 814C7FE
	applymovement 9, RustboroCity_Movement_1A0841
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0845
	waitmovement 0
	return

RustboroCity_EventScript_14C82A:: @ 814C82A
	applymovement 9, RustboroCity_Movement_1A0843
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A083F
	waitmovement 0
	return

RustboroCity_EventScript_14C856:: @ 814C856
	applymovement 9, RustboroCity_Movement_1A0845
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0841
	waitmovement 0
	return

RustboroCity_EventScript_14C882:: @ 814C882
	applymovement 9, RustboroCity_Movement_1A0845
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	applymovement 9, RustboroCity_Movement_14C74B
	waitmovement 0
	applymovement 255, RustboroCity_Movement_1A0841
	waitmovement 0
	return

RustboroCity_EventScript_14C8B8:: @ 814C8B8
	applymovement 9, RustboroCity_Movement_1A083F
	waitmovement 0
	playse SE_PIN
	applymovement 9, RustboroCity_Movement_1A0833
	waitmovement 0
	applymovement 9, RustboroCity_Movement_1A0835
	waitmovement 0
	return

RustboroCity_EventScript_14C8DA:: @ 814C8DA
	lock
	faceplayer
	goto_if_set FLAG_MET_RIVAL_RUSTBORO, RustboroCity_EventScript_14C917
	checkplayergender
	compare RESULT, 0
	goto_if_eq RustboroCity_EventScript_14C8FD
	compare RESULT, 1
	goto_if_eq RustboroCity_EventScript_14C90A
	end

RustboroCity_EventScript_14C8FD:: @ 814C8FD
	setflag FLAG_MET_RIVAL_RUSTBORO
	msgbox RustboroCity_Text_1670A7, 4
	release
	end

RustboroCity_EventScript_14C90A:: @ 814C90A
	setflag FLAG_MET_RIVAL_RUSTBORO
	msgbox RustboroCity_Text_167213, 4
	release
	end

RustboroCity_EventScript_14C917:: @ 814C917
	checkplayergender
	compare RESULT, 0
	goto_if_eq RustboroCity_EventScript_14C92F
	compare RESULT, 1
	goto_if_eq RustboroCity_EventScript_14C939
	end

RustboroCity_EventScript_14C92F:: @ 814C92F
	msgbox RustboroCity_Text_16713C, 4
	release
	end

RustboroCity_EventScript_14C939:: @ 814C939
	msgbox RustboroCity_Text_1672B8, 4
	release
	end
