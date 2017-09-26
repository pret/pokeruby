Route111_MapScripts:: @ 814FF91
	map_script 1, Route111_MapScript1_14FF9C
	map_script 3, Route111_MapScript1_14FFB9
	.byte 0

Route111_MapScript1_14FF9C:: @ 814FF9C
	checkflag 228
	call_if 0, Route111_EventScript_14FFA6
	end

Route111_EventScript_14FFA6:: @ 814FFA6
	setmaptile 29, 86, 124, 1
	setmaptile 29, 87, 145, 1
	return

Route111_MapScript1_14FFB9:: @ 814FFB9
	call Route111_EventScript_14FFCD
	call Route111_EventScript_1AE313
	checktrainerflag OPPONENT_VICKY
	goto_if 0, Route111_EventScript_15000D
	end

Route111_EventScript_14FFCD:: @ 814FFCD
	getplayerxy 0x4000, 0x4001
	compare 0x4001, 34
	goto_if 0, Route111_EventScript_15000C
	compare 0x4001, 107
	goto_if 2, Route111_EventScript_15000C
	compare 0x4001, 72
	goto_if 2, Route111_EventScript_150009
	compare 0x4000, 2000
	goto_if 2, Route111_EventScript_15000C
	compare 0x4000, 8
	goto_if 0, Route111_EventScript_15000C

Route111_EventScript_150009:: @ 8150009
	setweather 8

Route111_EventScript_15000C:: @ 815000C
	return

Route111_EventScript_15000D:: @ 815000D
	clearflag 768
	setflag 769
	setflag 770
	setflag 771
	settrainerflag OPPONENT_VICTOR
	settrainerflag OPPONENT_VICTORIA
	settrainerflag OPPONENT_VIVI
	end

Route111_EventScript_150023:: @ 8150023
	lockall
	msgbox Route111_Text_16FA54, 5
	compare RESULT, 0
	goto_if_eq Route111_EventScript_15005F
	giveitem ITEM_ROOT_FOSSIL
	closebutton
	setflag 963
	setflag 964
	disappear 34
	delay 30
	applymovement 35, Route111_Movement_1500AF
	waitmovement 0
	disappear 35
	releaseall
	end

Route111_EventScript_15005F:: @ 815005F
	msgbox Route111_Text_16FACE, 4
	releaseall
	end

Route111_EventScript_150069:: @ 8150069
	lockall
	msgbox Route111_Text_16FAED, 5
	compare RESULT, 0
	goto_if_eq Route111_EventScript_1500A5
	giveitem ITEM_CLAW_FOSSIL
	closebutton
	setflag 964
	setflag 963
	disappear 35
	delay 30
	applymovement 34, Route111_Movement_1500AF
	waitmovement 0
	disappear 34
	releaseall
	end

Route111_EventScript_1500A5:: @ 81500A5
	msgbox Route111_Text_16FB67, 4
	releaseall
	end

Route111_Movement_1500AF:: @ 81500AF
	step_55
	step_12
	step_54
	step_12
	step_55
	step_12
	step_54
	step_12
	step_55
	step_13
	step_54
	step_13
	step_55
	step_13
	step_54
	step_13
	step_55
	step_14
	step_54
	step_14
	step_55
	step_end

Route111_EventScript_1500C5:: @ 81500C5
	lock
	faceplayer
	dodailyevents
	checkflag 2252
	goto_if_eq Route111_EventScript_150100
	msgbox Route111_Text_1C56F0, 4
	giveitem ITEM_RAZZ_BERRY
	compare RESULT, 0
	goto_if_eq Route111_EventScript_1A029B
	setflag 2252
	special GetPlayerBigGuyGirlString
	msgbox Route111_Text_1C5781, 4
	release
	end

Route111_EventScript_150100:: @ 8150100
	msgbox Route111_Text_1C57D2, 4
	release
	end

@ 815010A
	lockall
	setvar 0x8004, 0
	goto Route111_EventScript_15013A
	end

Route111_EventScript_150116:: @ 8150116
	lockall
	setvar 0x8004, 1
	goto Route111_EventScript_15013A
	end

Route111_EventScript_150122:: @ 8150122
	lockall
	setvar 0x8004, 2
	goto Route111_EventScript_15013A
	end

@ 815012E
	lockall
	setvar 0x8004, 3
	goto Route111_EventScript_15013A
	end

Route111_EventScript_15013A:: @ 815013A
	checkitem ITEM_GO_GOGGLES, 1
	compare RESULT, 0
	goto_if_eq Route111_EventScript_150151
	setvar 0x4003, 1
	releaseall
	end

Route111_EventScript_150151:: @ 8150151
	msgbox Route111_Text_1A0F93, 4
	closebutton
	compare 0x8004, 0
	call_if 1, Route111_EventScript_150188
	compare 0x8004, 1
	call_if 1, Route111_EventScript_150193
	compare 0x8004, 2
	call_if 1, Route111_EventScript_15019E
	compare 0x8004, 3
	call_if 1, Route111_EventScript_1501A9
	releaseall
	end

Route111_EventScript_150188:: @ 8150188
	applymovement 255, Route111_Movement_1501B4
	waitmovement 0
	return

Route111_EventScript_150193:: @ 8150193
	applymovement 255, Route111_Movement_1501B6
	waitmovement 0
	return

Route111_EventScript_15019E:: @ 815019E
	applymovement 255, Route111_Movement_1501B8
	waitmovement 0
	return

Route111_EventScript_1501A9:: @ 81501A9
	applymovement 255, Route111_Movement_1501BA
	waitmovement 0
	return

Route111_Movement_1501B4:: @ 81501B4
	step_up
	step_end

Route111_Movement_1501B6:: @ 81501B6
	step_down
	step_end

Route111_Movement_1501B8:: @ 81501B8
	step_left
	step_end

Route111_Movement_1501BA:: @ 81501BA
	step_right
	step_end

Route111_EventScript_1501BC:: @ 81501BC
	setweather 2
	fadenewbgm 360
	doweather
	setvar 0x4003, 0
	end

Route111_EventScript_1501C9:: @ 81501C9
	setweather 8
	fadenewbgm 409
	doweather
	end

Route111_EventScript_1501D1:: @ 81501D1
	lock
	faceplayer
	setflag 2115
	msgbox Route111_Text_16F705, 5
	compare RESULT, 1
	goto_if_eq Route111_EventScript_1501F3
	msgbox Route111_Text_16F785, 4
	release
	end

Route111_EventScript_1501F3:: @ 81501F3
	msgbox Route111_Text_16F7B3, 4
	trainerbattle 3, OPPONENT_VICTOR, 0, Route111_Text_16F7D2
	applymovement 1, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F7FF, 4
	closebutton
	applymovement 1, Route111_Movement_150356
	waitmovement 0
	disappear 1
	call Route111_EventScript_15034F
	applymovement 255, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	reappear 2
	applymovement 2, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F82D, 4
	trainerbattle 3, OPPONENT_VICTORIA, 0, Route111_Text_16F8A6
	applymovement 2, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F8D5, 4
	closebutton
	applymovement 2, Route111_Movement_150356
	waitmovement 0
	disappear 2
	call Route111_EventScript_15034F
	applymovement 255, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	reappear 3
	applymovement 3, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F90E, 4
	trainerbattle 3, OPPONENT_VIVI, 0, Route111_Text_16F956
	applymovement 3, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F96C, 4
	closebutton
	applymovement 3, Route111_Movement_150356
	waitmovement 0
	disappear 3
	call Route111_EventScript_15034F
	applymovement 255, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	reappear 4
	applymovement 4, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F991, 4
	trainerbattle 3, OPPONENT_VICKY, 0, Route111_Text_16F9EC
	msgbox Route111_Text_16FA22, 4
	closebutton
	applymovement 4, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	applymovement 4, Route111_Movement_150356
	waitmovement 0
	disappear 4
	call Route111_EventScript_15034F
	release
	end

Route111_EventScript_150348:: @ 8150348
	setdooropened 13, 113
	doorchange
	return

Route111_EventScript_15034F:: @ 815034F
	setdoorclosed 13, 113
	doorchange
	return

Route111_Movement_150356:: @ 8150356
	step_26
	step_up
	step_end

Route111_Movement_150359:: @ 8150359
	step_down
	step_end

Route111_Movement_15035B:: @ 815035B
	step_14
	step_14
	step_14
	step_end

Route111_EventScript_15035F:: @ 815035F
	msgbox Route111_Text_16FC9C, 3
	end

Route111_EventScript_150368:: @ 8150368
	msgbox Route111_Text_16FCB6, 3
	end

Route111_EventScript_150371:: @ 8150371
	msgbox Route111_Text_16FCEF, 3
	end

Route111_EventScript_15037A:: @ 815037A
	msgbox Route111_Text_16FD05, 3
	end

Route111_EventScript_150383:: @ 8150383
	msgbox Route111_Text_16FD1B, 3
	end

Route111_EventScript_15038C:: @ 815038C
	msgbox Route111_Text_16FD55, 3
	end

Route111_EventScript_150395:: @ 8150395
	msgbox Route111_Text_16FB86, 2
	end

Route111_EventScript_15039E:: @ 815039E
	msgbox Route111_Text_16FC3A, 2
	end

Route111_EventScript_1503A7:: @ 81503A7
	trainerbattle 0, OPPONENT_DREW, 0, Route111_Text_1BAB4B, Route111_Text_1BABC7
	msgbox Route111_Text_1BAC10, 6
	end

Route111_EventScript_1503BE:: @ 81503BE
	trainerbattle 0, OPPONENT_HEIDI, 0, Route111_Text_1BAC60, Route111_Text_1BACC5
	msgbox Route111_Text_1BACD8, 6
	end

Route111_EventScript_1503D5:: @ 81503D5
	trainerbattle 0, OPPONENT_CLIFF, 0, Route111_Text_1BAD4B, Route111_Text_1BADA3
	msgbox Route111_Text_1BADC2, 6
	end

Route111_EventScript_1503EC:: @ 81503EC
	trainerbattle 0, OPPONENT_BECKY, 0, Route111_Text_1BAE24, Route111_Text_1BAE6E
	msgbox Route111_Text_1BAE81, 6
	end

Route111_EventScript_150403:: @ 8150403
	trainerbattle 0, OPPONENT_DUSTY_1, 0, Route111_Text_1BAEC9, Route111_Text_1BAF14
	specialvar RESULT, sub_8082C68
	compare RESULT, 1
	goto_if_eq Route111_EventScript_15042A
	msgbox Route111_Text_1BAF5B, 6
	end

Route111_EventScript_15042A:: @ 815042A
	trainerbattle 5, OPPONENT_DUSTY_1, 0, Route111_Text_1BAFC1, Route111_Text_1BB034
	msgbox Route111_Text_1BB070, 6
	end

Route111_EventScript_150441:: @ 8150441
	trainerbattle 0, OPPONENT_TRAVIS, 0, Route111_Text_1BB111, Route111_Text_1BB140
	msgbox Route111_Text_1BB15B, 6
	end

Route111_EventScript_150458:: @ 8150458
	trainerbattle 0, OPPONENT_IRENE, 0, Route111_Text_1BB199, Route111_Text_1BB1D8
	msgbox Route111_Text_1BB1F6, 6
	end

Route111_EventScript_15046F:: @ 815046F
	trainerbattle 0, OPPONENT_DAISUKE, 0, Route111_Text_1BB250, Route111_Text_1BB27E
	msgbox Route111_Text_1BB290, 6
	end

Route111_EventScript_150486:: @ 8150486
	trainerbattle 0, OPPONENT_WILTON_1, 0, Route111_Text_1BB2E3, Route111_Text_1BB313
	specialvar RESULT, sub_8082C68
	compare RESULT, 1
	goto_if_eq Route111_EventScript_1504AD
	msgbox Route111_Text_1BB33E, 6
	end

Route111_EventScript_1504AD:: @ 81504AD
	trainerbattle 5, OPPONENT_WILTON_1, 0, Route111_Text_1BB3A7, Route111_Text_1BB3FA
	msgbox Route111_Text_1BB40E, 6
	end

Route111_EventScript_1504C4:: @ 81504C4
	trainerbattle 0, OPPONENT_BROOKE_1, 0, Route111_Text_1BB44F, Route111_Text_1BB49F
	specialvar RESULT, sub_8082C68
	compare RESULT, 1
	goto_if_eq Route111_EventScript_1504EB
	msgbox Route111_Text_1BB4CE, 6
	end

Route111_EventScript_1504EB:: @ 81504EB
	trainerbattle 5, OPPONENT_BROOKE_1, 0, Route111_Text_1BB529, Route111_Text_1BB5A2
	msgbox Route111_Text_1BB5C1, 6
	end
