DewfordTown_MapScripts:: @ 814DFF8
	map_script 3, DewfordTown_MapScript1_14DFFE
	.byte 0

DewfordTown_MapScript1_14DFFE:: @ 814DFFE
	setflag FLAG_VISITED_DEWFORD_TOWN
	end

DewfordTown_EventScript_14E002:: @ 814E002
	lock
	faceplayer
	goto_if_unset FLAG_DELIVERED_STEVEN_LETTER, DewfordTown_EventScript_14E076
	message DewfordTown_Text_16B522
	waitmessage
	multichoicedefault 21, 6, 0, 2, 0
	switch RESULT
	case 0, DewfordTown_EventScript_14E04B
	case 1, DewfordTown_EventScript_14E05B
	case 2, DewfordTown_EventScript_14E06B
	case 127, DewfordTown_EventScript_14E06B
	end

DewfordTown_EventScript_14E04B:: @ 814E04B
	msgbox DewfordTown_Text_16B57D, 4
	closemessage
	goto DewfordTown_EventScript_14E151
	release
	end

DewfordTown_EventScript_14E05B:: @ 814E05B
	msgbox DewfordTown_Text_16B5D2, 4
	closemessage
	goto DewfordTown_EventScript_14E1D8
	release
	end

DewfordTown_EventScript_14E06B:: @ 814E06B
	msgbox DewfordTown_Text_16B627, 4
	closemessage
	release
	end

DewfordTown_EventScript_14E076:: @ 814E076
	msgbox DewfordTown_Text_16B3BC, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq DewfordTown_EventScript_14E093
	msgbox DewfordTown_Text_16B471, 4
	release
	end

DewfordTown_EventScript_14E093:: @ 814E093
	msgbox DewfordTown_Text_16B417, 4
	closemessage
	goto DewfordTown_EventScript_14E151
	end

DewfordTown_EventScript_14E0A2:: @ 814E0A2
	msgbox DewfordTown_Text_16B23B, 2
	end

DewfordTown_EventScript_14E0AB:: @ 814E0AB
	msgbox DewfordTown_Text_16B2A7, 3
	end

DewfordTown_EventScript_14E0B4:: @ 814E0B4
	msgbox DewfordTown_Text_16B2D5, 3
	end

DewfordTown_EventScript_14E0BD:: @ 814E0BD
	msgbox DewfordTown_Text_16B317, 3
	end

DewfordTown_EventScript_14E0C6:: @ 814E0C6
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_OLD_ROD, DewfordTown_EventScript_14E11B
	msgbox DewfordTown_Text_16B665, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq DewfordTown_EventScript_14E0F0
	compare RESULT, NO
	goto_if_eq DewfordTown_EventScript_14E111
	end

DewfordTown_EventScript_14E0F0:: @ 814E0F0
	msgbox DewfordTown_Text_16B6A8, 4
	giveitem_std ITEM_OLD_ROD
	setflag FLAG_RECEIVED_OLD_ROD
	msgbox DewfordTown_Text_16B6F9, 4
	release
	end

DewfordTown_EventScript_14E111:: @ 814E111
	msgbox DewfordTown_Text_16B828, 4
	release
	end

DewfordTown_EventScript_14E11B:: @ 814E11B
	message DewfordTown_Text_16B84E
	waitmessage
	multichoice 20, 8, 50, 1
	compare RESULT, 0
	goto_if_eq DewfordTown_EventScript_14E13D
	compare RESULT, 1
	goto_if_eq DewfordTown_EventScript_14E147
	end

DewfordTown_EventScript_14E13D:: @ 814E13D
	msgbox DewfordTown_Text_16B866, 4
	release
	end

DewfordTown_EventScript_14E147:: @ 814E147
	msgbox DewfordTown_Text_16B89A, 4
	release
	end

DewfordTown_EventScript_14E151:: @ 814E151
	call DewfordTown_EventScript_1A010C
	setobjectpriority 2, MAP_DEWFORD_TOWN, 0
	setobjectpriority 255, MAP_DEWFORD_TOWN, 0
	applymovement 2, DewfordTown_Movement_14E40E
	waitmovement 0
	removeobject 2
	applymovement 255, DewfordTown_Movement_14E402
	waitmovement 0
	hideobjectat 255, MAP_DEWFORD_TOWN
	call DewfordTown_EventScript_1A02E7
	applymovement 4, DewfordTown_Movement_14E293
	applymovement 255, DewfordTown_Movement_14E293
	waitmovement 0
	showobjectat 255, MAP_ROUTE104
	call DewfordTown_EventScript_1A02EF
	applymovement 255, DewfordTown_Movement_14E405
	waitmovement 0
	showobjectat 255, MAP_ROUTE104
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	clearflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	hideobjectat 4, MAP_DEWFORD_TOWN
	setvar VAR_BOARD_BRINEY_BOAT_ROUTE104_STATE, 2
	resetobjectpriority 255, MAP_DEWFORD_TOWN
	warp MAP_ROUTE104_MR_BRINEYS_HOUSE, 255, 5, 4
	copyvar VAR_BRINEY_LOCATION, VAR_SPECIAL_8
	waitstate
	release
	end

DewfordTown_EventScript_14E1D8:: @ 814E1D8
	call DewfordTown_EventScript_1A010C
	setobjectpriority 2, MAP_DEWFORD_TOWN, 0
	setobjectpriority 255, MAP_DEWFORD_TOWN, 1
	applymovement 2, DewfordTown_Movement_14E40E
	waitmovement 0
	removeobject 2
	applymovement 255, DewfordTown_Movement_14E402
	waitmovement 0
	hideobjectat 255, MAP_DEWFORD_TOWN
	call DewfordTown_EventScript_1A02E7
	applymovement 4, DewfordTown_Movement_14E356
	applymovement 255, DewfordTown_Movement_14E356
	waitmovement 0
	call DewfordTown_EventScript_1A02EF
	showobjectat 255, MAP_ROUTE109
	applymovement 255, DewfordTown_Movement_14E409
	waitmovement 0
	setobjectxyperm 2, 21, 26
	addobject 2
	setobjectpriority 2, MAP_ROUTE109, 0
	applymovement 2, DewfordTown_Movement_14E410
	waitmovement 0
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE109
	addobject 1
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	hideobjectat 4, MAP_DEWFORD_TOWN
	call_if_unset FLAG_DELIVERED_DEVON_GOODS, DewfordTown_EventScript_14E281
	call_if_set FLAG_DELIVERED_DEVON_GOODS, DewfordTown_EventScript_14E28A
	closemessage
	copyvar VAR_BRINEY_LOCATION, VAR_SPECIAL_8
	resetobjectpriority 255, MAP_DEWFORD_TOWN
	resetobjectpriority 2, MAP_ROUTE109
	moveobjectoffscreen 2
	release
	end

DewfordTown_EventScript_14E281:: @ 814E281
	msgbox DewfordTown_Text_16E080, 4
	return

DewfordTown_EventScript_14E28A:: @ 814E28A
	msgbox DewfordTown_Text_16E1FA, 4
	return

DewfordTown_Movement_14E293:: @ 814E293
	walk_up
	walk_up
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
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_left
	walk_fast_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

DewfordTown_Movement_14E356:: @ 814E356
	walk_right
	walk_fast_right
	walk_fast_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
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

DewfordTown_Movement_14E402:: @ 814E402
	walk_right
	walk_up
	end_movement

DewfordTown_Movement_14E405:: @ 814E405
	walk_up
	walk_up
	walk_up
	end_movement

DewfordTown_Movement_14E409:: @ 814E409
	walk_up
	walk_up
	walk_up
	walk_in_place_fastest_down
	end_movement

DewfordTown_Movement_14E40E:: @ 814E40E
	walk_up
	end_movement

DewfordTown_Movement_14E410:: @ 814E410
	walk_up
	walk_up
	end_movement

DewfordTown_EventScript_14E413:: @ 814E413
	lock
	faceplayer
	call DewfordTown_EventScript_1A0102
	msgbox DewfordTown_Text_16B9CE, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq DewfordTown_EventScript_14E439
	compare RESULT, NO
	goto_if_eq DewfordTown_EventScript_14E443
	end

DewfordTown_EventScript_14E439:: @ 814E439
	msgbox DewfordTown_Text_16BD37, 4
	release
	end

DewfordTown_EventScript_14E443:: @ 814E443
	msgbox DewfordTown_Text_16BADC, 4
	setvar VAR_SPECIAL_4, 9
	call DewfordTown_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	goto_if_eq DewfordTown_EventScript_14E46E
	compare RESULT, 0
	goto_if_eq DewfordTown_EventScript_14E485
	end

DewfordTown_EventScript_14E46E:: @ 814E46E
	incrementgamestat GAME_STAT_STARTED_TRENDS
	compare VAR_SPECIAL_4, 0
	goto_if_eq DewfordTown_EventScript_14E48F
	msgbox DewfordTown_Text_16BB44, 4
	release
	end

DewfordTown_EventScript_14E485:: @ 814E485
	msgbox DewfordTown_Text_16BCE9, 4
	release
	end

DewfordTown_EventScript_14E48F:: @ 814E48F
	msgbox DewfordTown_Text_16BCA2, 4
	release
	end

@ 814E499
	msgbox DewfordTown_Text_16BD79, 4
	release
	end
