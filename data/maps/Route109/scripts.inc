Route109_MapScripts:: @ 814F4D2
	.byte 0

Route109_EventScript_14F4D3:: @ 814F4D3
	call Route109_EventScript_1A010C
	setobjectpriority 2, MAP_ROUTE109, 0
	setobjectpriority 255, MAP_ROUTE109, 0
	applymovement 2, Route109_Movement_14F67B
	waitmovement 0
	removeobject 2
	switch FACING
	case 1, Route109_EventScript_14F518
	case 3, Route109_EventScript_14F538
	case 4, Route109_EventScript_14F528
	end

Route109_EventScript_14F518:: @ 814F518
	applymovement 255, Route109_Movement_14F66D
	waitmovement 0
	goto Route109_EventScript_14F548
	end

Route109_EventScript_14F528:: @ 814F528
	applymovement 255, Route109_Movement_14F675
	waitmovement 0
	goto Route109_EventScript_14F548
	end

Route109_EventScript_14F538:: @ 814F538
	applymovement 255, Route109_Movement_14F678
	waitmovement 0
	goto Route109_EventScript_14F548
	end

Route109_EventScript_14F548:: @ 814F548
	hideobjectat 255, MAP_ROUTE109
	call Route109_EventScript_1A02E7
	applymovement 1, Route109_Movement_14F5BF
	applymovement 255, Route109_Movement_14F5BF
	waitmovement 0
	call Route109_EventScript_1A02EF
	showobjectat 255, MAP_DEWFORD_TOWN
	applymovement 255, Route109_Movement_14F670
	waitmovement 0
	addobject 4
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	setobjectxyperm 2, 12, 8
	addobject 2
	setobjectpriority 2, MAP_DEWFORD_TOWN, 0
	applymovement 2, Route109_Movement_14F67D
	waitmovement 0
	clearflag FLAG_HIDE_MR_BRINEY_DEWFORD_TOWN
	setflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	hideobjectat 1, MAP_ROUTE109
	msgbox Route109_Text_16B4B5, 4
	closemessage
	copyvar VAR_BRINEY_LOCATION, VAR_SPECIAL_8
	resetobjectpriority 255, MAP_ROUTE109
	resetobjectpriority 2, MAP_DEWFORD_TOWN
	moveobjectoffscreen 2
	release
	end

Route109_Movement_14F5BF:: @ 814F5BF
	walk_in_place_fastest_down
	walk_down
	walk_down
	walk_fast_down
	walk_fast_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fastest_down
	walk_fast_down
	walk_fast_down
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
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_left
	walk_left
	walk_in_place_fastest_down
	end_movement

Route109_Movement_14F66D:: @ 814F66D
	walk_down
	walk_down
	end_movement

Route109_Movement_14F670:: @ 814F670
	walk_down
	walk_down
	walk_left
	walk_in_place_fastest_right
	end_movement

Route109_Movement_14F675:: @ 814F675
	walk_right
	walk_down
	end_movement

Route109_Movement_14F678:: @ 814F678
	walk_left
	walk_down
	end_movement

Route109_Movement_14F67B:: @ 814F67B
	walk_down
	end_movement

Route109_Movement_14F67D:: @ 814F67D
	walk_down
	walk_in_place_fastest_left
	end_movement

Route109_EventScript_14F680:: @ 814F680
	lock
	faceplayer
	goto_if_unset FLAG_DELIVERED_DEVON_GOODS, Route109_EventScript_14F691
	goto Route109_EventScript_14F6AF
	end

Route109_EventScript_14F691:: @ 814F691
	message Route109_Text_16E0F9
	msgbox Route109_Text_16E0F9, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route109_EventScript_14F6F1
	goto Route109_EventScript_14F6E2
	end

Route109_EventScript_14F6AF:: @ 814F6AF
	message Route109_Text_16E26A
	waitmessage
	multichoicedefault 21, 8, 14, 1, 0
	switch RESULT
	case 0, Route109_EventScript_14F6E2
	case 1, Route109_EventScript_14F6FB
	case 127, Route109_EventScript_14F6FB
	end

Route109_EventScript_14F6E2:: @ 814F6E2
	msgbox Route109_Text_16E159, 4
	closemessage
	goto Route109_EventScript_14F4D3
	end

Route109_EventScript_14F6F1:: @ 814F6F1
	msgbox Route109_Text_16E1B1, 4
	release
	end

Route109_EventScript_14F6FB:: @ 814F6FB
	msgbox Route109_Text_16E2C5, 4
	release
	end

Route109_EventScript_14F705:: @ 814F705
	msgbox Route109_Text_16E307, 2
	end

Route109_EventScript_14F70E:: @ 814F70E
	lock
	faceplayer
	msgbox Route109_Text_16E405, 4
	closemessage
	applymovement LAST_TALKED, Route109_Movement_1A083D
	waitmovement 0
	release
	end

Route109_EventScript_14F725:: @ 814F725
	lock
	faceplayer
	special GetPlayerBigGuyGirlString
	goto_if_set FLAG_RECEIVED_SOFT_SAND, Route109_EventScript_14F762
	msgbox Route109_Text_16E433, 4
	giveitem_std ITEM_SOFT_SAND
	compare RESULT, 0
	goto_if_eq Route109_EventScript_1A029B
	closemessage
	applymovement LAST_TALKED, Route109_Movement_1A083D
	waitmovement 0
	setflag FLAG_RECEIVED_SOFT_SAND
	release
	end

Route109_EventScript_14F762:: @ 814F762
	msgbox Route109_Text_16E446, 4
	applymovement LAST_TALKED, Route109_Movement_1A083D
	waitmovement 0
	release
	end

Route109_EventScript_14F776:: @ 814F776
	msgbox Route109_Text_16E35B, 2
	end

Route109_EventScript_14F77F:: @ 814F77F
	msgbox Route109_Text_16E4D5, 2
	end

Route109_EventScript_14F788:: @ 814F788
	lock
	faceplayer
	waitse
	playmoncry SPECIES_ZIGZAGOON, 0
	msgbox Route109_Text_16E5CA, 4
	waitmoncry
	release
	end

Route109_EventScript_14F79B:: @ 814F79B
	msgbox Route109_Text_16E5DC, 3
	end

Route109_EventScript_14F7A4:: @ 814F7A4
	msgbox Route109_Text_16E62C, 3
	end

Route109_EventScript_14F7AD:: @ 814F7AD
	trainerbattle 0, TRAINER_DAVID, 0, Route109_Text_1B9A1C, Route109_Text_1B9A59
	msgbox Route109_Text_1B9A6D, 6
	end

Route109_EventScript_14F7C4:: @ 814F7C4
	trainerbattle 0, TRAINER_ALICE, 0, Route109_Text_1B9AAD, Route109_Text_1B9AD9
	msgbox Route109_Text_1B9AEB, 6
	end

Route109_EventScript_14F7DB:: @ 814F7DB
	trainerbattle 0, TRAINER_HUEY, 0, Route109_Text_1B9B11, Route109_Text_1B9B57
	msgbox Route109_Text_1B9B68, 6
	end

Route109_EventScript_14F7F2:: @ 814F7F2
	trainerbattle 0, TRAINER_EDMOND, 0, Route109_Text_1B9B91, Route109_Text_1B9BAE
	msgbox Route109_Text_1B9BD3, 6
	end

Route109_EventScript_14F809:: @ 814F809
	trainerbattle 0, TRAINER_RICKY_1, 0, Route109_Text_1B9C23, Route109_Text_1B9C65
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route109_EventScript_14F830
	msgbox Route109_Text_1B9C6E, 6
	end

Route109_EventScript_14F830:: @ 814F830
	trainerbattle 5, TRAINER_RICKY_1, 0, Route109_Text_1B9CB3, Route109_Text_1B9CEB
	msgbox Route109_Text_1B9D10, 6
	end

Route109_EventScript_14F847:: @ 814F847
	trainerbattle 0, TRAINER_LOLA_1, 0, Route109_Text_1B9D54, Route109_Text_1B9D87
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route109_EventScript_14F86E
	msgbox Route109_Text_1B9D8E, 6
	end

Route109_EventScript_14F86E:: @ 814F86E
	trainerbattle 5, TRAINER_LOLA_1, 0, Route109_Text_1B9DD8, Route109_Text_1B9E16
	msgbox Route109_Text_1B9E1D, 6
	end

Route109_EventScript_14F885:: @ 814F885
	trainerbattle 0, TRAINER_CARMEN, 0, Route109_Text_1B9E60, Route109_Text_1B9EA1
	msgbox Route109_Text_1B9ECA, 6
	end

Route109_EventScript_14F89C:: @ 814F89C
	trainerbattle 0, TRAINER_GWEN, 0, Route109_Text_1B9F07, Route109_Text_1B9F31
	msgbox Route109_Text_1B9F44, 6
	end

Route109_EventScript_14F8B3:: @ 814F8B3
	trainerbattle 0, TRAINER_CARTER, 0, Route109_Text_1B9F65, Route109_Text_1B9F9C
	msgbox Route109_Text_1B9FB7, 6
	end

Route109_EventScript_14F8CA:: @ 814F8CA
	trainerbattle 4, TRAINER_MEL_AND_PAUL, 0, Route109_Text_1B9FF6, Route109_Text_1BA052, Route109_Text_1BA0BF
	msgbox Route109_Text_1BA069, 6
	end

Route109_EventScript_14F8E5:: @ 814F8E5
	trainerbattle 4, TRAINER_MEL_AND_PAUL, 0, Route109_Text_1BA114, Route109_Text_1BA15F, Route109_Text_1BA1D0
	msgbox Route109_Text_1BA193, 6
	end
