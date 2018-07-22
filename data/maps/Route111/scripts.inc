Route111_MapScripts:: @ 814FF91
	map_script 1, Route111_MapScript1_14FF9C
	map_script 3, Route111_MapScript1_14FFB9
	.byte 0

Route111_MapScript1_14FF9C:: @ 814FF9C
	call_if_unset FLAG_REGI_DOORS_OPENED, Route111_EventScript_14FFA6
	end

Route111_EventScript_14FFA6:: @ 814FFA6
	setmetatile 29, 86, 124, 1
	setmetatile 29, 87, 145, 1
	return

Route111_MapScript1_14FFB9:: @ 814FFB9
	call Route111_EventScript_14FFCD
	call Route111_EventScript_1AE313
	goto_if_trainer_not_defeated TRAINER_VICKY, Route111_EventScript_15000D
	end

Route111_EventScript_14FFCD:: @ 814FFCD
	getplayerxy VAR_TEMP_0, VAR_TEMP_1
	compare VAR_TEMP_1, 34
	goto_if_lt Route111_EventScript_15000C
	compare VAR_TEMP_1, 107
	goto_if_gt Route111_EventScript_15000C
	compare VAR_TEMP_1, 72
	goto_if_gt Route111_EventScript_150009
	compare VAR_TEMP_0, 2000
	goto_if_gt Route111_EventScript_15000C
	compare VAR_TEMP_0, 8
	goto_if_lt Route111_EventScript_15000C

Route111_EventScript_150009:: @ 8150009
	setweather WEATHER_SANDSTORM

Route111_EventScript_15000C:: @ 815000C
	return

Route111_EventScript_15000D:: @ 815000D
	clearflag FLAG_HIDE_VICTOR_WINSTRATE
	setflag FLAG_HIDE_VICTORIA_WINSTRATE
	setflag FLAG_HIDE_VIVI_WINSTRATE
	setflag FLAG_HIDE_VICKI_WINSTRATE
	cleartrainerflag TRAINER_VICTOR
	cleartrainerflag TRAINER_VICTORIA
	cleartrainerflag TRAINER_VIVI
	end

Route111_EventScript_150023:: @ 8150023
	lockall
	msgbox Route111_Text_16FA54, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route111_EventScript_15005F
	giveitem_std ITEM_ROOT_FOSSIL
	closemessage
	setflag FLAG_HIDE_ROOT_FOSSIL
	setflag FLAG_HIDE_CLAW_FOSSIL
	removeobject 34
	delay 30
	applymovement 35, Route111_Movement_1500AF
	waitmovement 0
	removeobject 35
	releaseall
	end

Route111_EventScript_15005F:: @ 815005F
	msgbox Route111_Text_16FACE, 4
	releaseall
	end

Route111_EventScript_150069:: @ 8150069
	lockall
	msgbox Route111_Text_16FAED, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route111_EventScript_1500A5
	giveitem_std ITEM_CLAW_FOSSIL
	closemessage
	setflag FLAG_HIDE_CLAW_FOSSIL
	setflag FLAG_HIDE_ROOT_FOSSIL
	removeobject 35
	delay 30
	applymovement 34, Route111_Movement_1500AF
	waitmovement 0
	removeobject 34
	releaseall
	end

Route111_EventScript_1500A5:: @ 81500A5
	msgbox Route111_Text_16FB67, 4
	releaseall
	end

Route111_Movement_1500AF:: @ 81500AF
	set_visible
	delay_4
	set_invisible
	delay_4
	set_visible
	delay_4
	set_invisible
	delay_4
	set_visible
	delay_8
	set_invisible
	delay_8
	set_visible
	delay_8
	set_invisible
	delay_8
	set_visible
	delay_16
	set_invisible
	delay_16
	set_visible
	end_movement

Route111_EventScript_1500C5:: @ 81500C5
	lock
	faceplayer
	dodailyevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_ROUTE111, Route111_EventScript_150100
	msgbox Route111_Text_1C56F0, 4
	giveitem_std ITEM_RAZZ_BERRY
	compare RESULT, 0
	goto_if_eq Route111_EventScript_1A029B
	setflag FLAG_DAILY_RECEIVED_BERRY_ROUTE111
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
	setvar VAR_SPECIAL_4, 0
	goto Route111_EventScript_15013A
	end

Route111_EventScript_150116:: @ 8150116
	lockall
	setvar VAR_SPECIAL_4, 1
	goto Route111_EventScript_15013A
	end

Route111_EventScript_150122:: @ 8150122
	lockall
	setvar VAR_SPECIAL_4, 2
	goto Route111_EventScript_15013A
	end

@ 815012E
	lockall
	setvar VAR_SPECIAL_4, 3
	goto Route111_EventScript_15013A
	end

Route111_EventScript_15013A:: @ 815013A
	checkitem ITEM_GO_GOGGLES, 1
	compare RESULT, 0
	goto_if_eq Route111_EventScript_150151
	setvar VAR_TEMP_3, 1
	releaseall
	end

Route111_EventScript_150151:: @ 8150151
	msgbox Route111_Text_1A0F93, 4
	closemessage
	compare VAR_SPECIAL_4, 0
	call_if_eq Route111_EventScript_150188
	compare VAR_SPECIAL_4, 1
	call_if_eq Route111_EventScript_150193
	compare VAR_SPECIAL_4, 2
	call_if_eq Route111_EventScript_15019E
	compare VAR_SPECIAL_4, 3
	call_if_eq Route111_EventScript_1501A9
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
	walk_up
	end_movement

Route111_Movement_1501B6:: @ 81501B6
	walk_down
	end_movement

Route111_Movement_1501B8:: @ 81501B8
	walk_left
	end_movement

Route111_Movement_1501BA:: @ 81501BA
	walk_right
	end_movement

Route111_EventScript_1501BC:: @ 81501BC
	setweather WEATHER_SUNNY
	fadenewbgm MUS_DOORO_X1
	doweather
	setvar VAR_TEMP_3, 0
	end

Route111_EventScript_1501C9:: @ 81501C9
	setweather WEATHER_SANDSTORM
	fadenewbgm MUS_ASHROAD
	doweather
	end

Route111_EventScript_1501D1:: @ 81501D1
	lock
	faceplayer
	setflag FLAG_LANDMARK_WINSTRATE_FAMILY
	msgbox Route111_Text_16F705, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq Route111_EventScript_1501F3
	msgbox Route111_Text_16F785, 4
	release
	end

Route111_EventScript_1501F3:: @ 81501F3
	msgbox Route111_Text_16F7B3, 4
	trainerbattle 3, TRAINER_VICTOR, 0, Route111_Text_16F7D2
	applymovement 1, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F7FF, 4
	closemessage
	applymovement 1, Route111_Movement_150356
	waitmovement 0
	removeobject 1
	call Route111_EventScript_15034F
	applymovement 255, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	addobject 2
	applymovement 2, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F82D, 4
	trainerbattle 3, TRAINER_VICTORIA, 0, Route111_Text_16F8A6
	applymovement 2, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F8D5, 4
	closemessage
	applymovement 2, Route111_Movement_150356
	waitmovement 0
	removeobject 2
	call Route111_EventScript_15034F
	applymovement 255, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	addobject 3
	applymovement 3, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F90E, 4
	trainerbattle 3, TRAINER_VIVI, 0, Route111_Text_16F956
	applymovement 3, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F96C, 4
	closemessage
	applymovement 3, Route111_Movement_150356
	waitmovement 0
	removeobject 3
	call Route111_EventScript_15034F
	applymovement 255, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	addobject 4
	applymovement 4, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F991, 4
	trainerbattle 3, TRAINER_VICKY, 0, Route111_Text_16F9EC
	msgbox Route111_Text_16FA22, 4
	closemessage
	applymovement 4, Route111_Movement_1A0841
	waitmovement 0
	call Route111_EventScript_150348
	applymovement 4, Route111_Movement_150356
	waitmovement 0
	removeobject 4
	call Route111_EventScript_15034F
	release
	end

Route111_EventScript_150348:: @ 8150348
	opendoor 13, 113
	waitdooranim
	return

Route111_EventScript_15034F:: @ 815034F
	closedoor 13, 113
	waitdooranim
	return

Route111_Movement_150356:: @ 8150356
	walk_in_place_fastest_up
	walk_up
	end_movement

Route111_Movement_150359:: @ 8150359
	walk_down
	end_movement

Route111_Movement_15035B:: @ 815035B
	delay_16
	delay_16
	delay_16
	end_movement

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
	trainerbattle 0, TRAINER_DREW, 0, Route111_Text_1BAB4B, Route111_Text_1BABC7
	msgbox Route111_Text_1BAC10, 6
	end

Route111_EventScript_1503BE:: @ 81503BE
	trainerbattle 0, TRAINER_HEIDI, 0, Route111_Text_1BAC60, Route111_Text_1BACC5
	msgbox Route111_Text_1BACD8, 6
	end

Route111_EventScript_1503D5:: @ 81503D5
	trainerbattle 0, TRAINER_CLIFF, 0, Route111_Text_1BAD4B, Route111_Text_1BADA3
	msgbox Route111_Text_1BADC2, 6
	end

Route111_EventScript_1503EC:: @ 81503EC
	trainerbattle 0, TRAINER_BECKY, 0, Route111_Text_1BAE24, Route111_Text_1BAE6E
	msgbox Route111_Text_1BAE81, 6
	end

Route111_EventScript_150403:: @ 8150403
	trainerbattle 0, TRAINER_DUSTY_1, 0, Route111_Text_1BAEC9, Route111_Text_1BAF14
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route111_EventScript_15042A
	msgbox Route111_Text_1BAF5B, 6
	end

Route111_EventScript_15042A:: @ 815042A
	trainerbattle 5, TRAINER_DUSTY_1, 0, Route111_Text_1BAFC1, Route111_Text_1BB034
	msgbox Route111_Text_1BB070, 6
	end

Route111_EventScript_150441:: @ 8150441
	trainerbattle 0, TRAINER_TRAVIS, 0, Route111_Text_1BB111, Route111_Text_1BB140
	msgbox Route111_Text_1BB15B, 6
	end

Route111_EventScript_150458:: @ 8150458
	trainerbattle 0, TRAINER_IRENE, 0, Route111_Text_1BB199, Route111_Text_1BB1D8
	msgbox Route111_Text_1BB1F6, 6
	end

Route111_EventScript_15046F:: @ 815046F
	trainerbattle 0, TRAINER_DAISUKE, 0, Route111_Text_1BB250, Route111_Text_1BB27E
	msgbox Route111_Text_1BB290, 6
	end

Route111_EventScript_150486:: @ 8150486
	trainerbattle 0, TRAINER_WILTON_1, 0, Route111_Text_1BB2E3, Route111_Text_1BB313
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route111_EventScript_1504AD
	msgbox Route111_Text_1BB33E, 6
	end

Route111_EventScript_1504AD:: @ 81504AD
	trainerbattle 5, TRAINER_WILTON_1, 0, Route111_Text_1BB3A7, Route111_Text_1BB3FA
	msgbox Route111_Text_1BB40E, 6
	end

Route111_EventScript_1504C4:: @ 81504C4
	trainerbattle 0, TRAINER_BROOKE_1, 0, Route111_Text_1BB44F, Route111_Text_1BB49F
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route111_EventScript_1504EB
	msgbox Route111_Text_1BB4CE, 6
	end

Route111_EventScript_1504EB:: @ 81504EB
	trainerbattle 5, TRAINER_BROOKE_1, 0, Route111_Text_1BB529, Route111_Text_1BB5A2
	msgbox Route111_Text_1BB5C1, 6
	end
