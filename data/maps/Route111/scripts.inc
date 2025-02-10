Route111_MapScripts:: @ 814FF91
	map_script MAP_SCRIPT_ON_LOAD, Route111_MapScript1_14FF9C
	map_script MAP_SCRIPT_ON_TRANSITION, Route111_MapScript1_14FFB9
	.byte 0

Route111_MapScript1_14FF9C:: @ 814FF9C
	call_if_unset FLAG_REGI_DOORS_OPENED, Route111_EventScript_14FFA6
	end

Route111_EventScript_14FFA6:: @ 814FFA6
	setmetatile 29, 86, METATILE_General_RockWall_RockBase, 1
	setmetatile 29, 87, METATILE_General_RockWall_SandBase, 1
	return

Route111_MapScript1_14FFB9:: @ 814FFB9
	call Route111_EventScript_14FFCD
	call Route111_EventScript_1AE313
	goto_if_not_defeated TRAINER_VICKY, Route111_EventScript_15000D
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
	compare VAR_RESULT, NO
	goto_if_eq Route111_EventScript_15005F
	giveitem ITEM_ROOT_FOSSIL
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
	msgbox Route111_Text_16FACE, MSGBOX_DEFAULT
	releaseall
	end

Route111_EventScript_150069:: @ 8150069
	lockall
	msgbox Route111_Text_16FAED, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq Route111_EventScript_1500A5
	giveitem ITEM_CLAW_FOSSIL
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
	msgbox Route111_Text_16FB67, MSGBOX_DEFAULT
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
	step_end

Route111_EventScript_1500C5:: @ 81500C5
	lock
	faceplayer
	dotimebasedevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_ROUTE111, Route111_EventScript_150100
	msgbox Route111_Text_1C56F0, MSGBOX_DEFAULT
	giveitem ITEM_RAZZ_BERRY
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_DAILY_RECEIVED_BERRY_ROUTE111
	special GetPlayerBigGuyGirlString
	msgbox Route111_Text_1C5781, MSGBOX_DEFAULT
	release
	end

Route111_EventScript_150100:: @ 8150100
	msgbox Route111_Text_1C57D2, MSGBOX_DEFAULT
	release
	end

@ 815010A
	lockall
	setvar VAR_0x8004, 0
	goto Route111_EventScript_15013A
	end

Route111_EventScript_150116:: @ 8150116
	lockall
	setvar VAR_0x8004, 1
	goto Route111_EventScript_15013A
	end

Route111_EventScript_150122:: @ 8150122
	lockall
	setvar VAR_0x8004, 2
	goto Route111_EventScript_15013A
	end

@ 815012E
	lockall
	setvar VAR_0x8004, 3
	goto Route111_EventScript_15013A
	end

Route111_EventScript_15013A:: @ 815013A
	checkitem ITEM_GO_GOGGLES, 1
	compare VAR_RESULT, 0
	goto_if_eq Route111_EventScript_150151
	setvar VAR_TEMP_3, 1
	releaseall
	end

Route111_EventScript_150151:: @ 8150151
	msgbox Route111_Text_1A0F93, MSGBOX_DEFAULT
	closemessage
	compare VAR_0x8004, 0
	call_if_eq Route111_EventScript_150188
	compare VAR_0x8004, 1
	call_if_eq Route111_EventScript_150193
	compare VAR_0x8004, 2
	call_if_eq Route111_EventScript_15019E
	compare VAR_0x8004, 3
	call_if_eq Route111_EventScript_1501A9
	releaseall
	end

Route111_EventScript_150188:: @ 8150188
	applymovement LOCALID_PLAYER, Route111_Movement_1501B4
	waitmovement 0
	return

Route111_EventScript_150193:: @ 8150193
	applymovement LOCALID_PLAYER, Route111_Movement_1501B6
	waitmovement 0
	return

Route111_EventScript_15019E:: @ 815019E
	applymovement LOCALID_PLAYER, Route111_Movement_1501B8
	waitmovement 0
	return

Route111_EventScript_1501A9:: @ 81501A9
	applymovement LOCALID_PLAYER, Route111_Movement_1501BA
	waitmovement 0
	return

Route111_Movement_1501B4:: @ 81501B4
	walk_up
	step_end

Route111_Movement_1501B6:: @ 81501B6
	walk_down
	step_end

Route111_Movement_1501B8:: @ 81501B8
	walk_left
	step_end

Route111_Movement_1501BA:: @ 81501BA
	walk_right
	step_end

Route111_EventScript_1501BC:: @ 81501BC
	setweather WEATHER_SUNNY
	fadenewbgm MUS_ROUTE110
	doweather
	setvar VAR_TEMP_3, 0
	end

Route111_EventScript_1501C9:: @ 81501C9
	setweather WEATHER_SANDSTORM
	fadenewbgm MUS_ROUTE111
	doweather
	end

Route111_EventScript_1501D1:: @ 81501D1
	lock
	faceplayer
	setflag FLAG_LANDMARK_WINSTRATE_FAMILY
	msgbox Route111_Text_16F705, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq Route111_EventScript_1501F3
	msgbox Route111_Text_16F785, MSGBOX_DEFAULT
	release
	end

Route111_EventScript_1501F3:: @ 81501F3
	msgbox Route111_Text_16F7B3, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_VICTOR, Route111_Text_16F7D2
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F7FF, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Route111_Movement_150356
	waitmovement 0
	removeobject 1
	call Route111_EventScript_15034F
	applymovement LOCALID_PLAYER, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	addobject 2
	applymovement 2, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F82D, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_VICTORIA, Route111_Text_16F8A6
	applymovement 2, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F8D5, MSGBOX_DEFAULT
	closemessage
	applymovement 2, Route111_Movement_150356
	waitmovement 0
	removeobject 2
	call Route111_EventScript_15034F
	applymovement LOCALID_PLAYER, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	addobject 3
	applymovement 3, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F90E, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_VIVI, Route111_Text_16F956
	applymovement 3, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	call Route111_EventScript_150348
	msgbox Route111_Text_16F96C, MSGBOX_DEFAULT
	closemessage
	applymovement 3, Route111_Movement_150356
	waitmovement 0
	removeobject 3
	call Route111_EventScript_15034F
	applymovement LOCALID_PLAYER, Route111_Movement_15035B
	waitmovement 0
	call Route111_EventScript_150348
	addobject 4
	applymovement 4, Route111_Movement_150359
	waitmovement 0
	call Route111_EventScript_15034F
	msgbox Route111_Text_16F991, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_VICKY, Route111_Text_16F9EC
	msgbox Route111_Text_16FA22, MSGBOX_DEFAULT
	closemessage
	applymovement 4, Common_Movement_WalkInPlaceFastestUp
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
	step_end

Route111_Movement_150359:: @ 8150359
	walk_down
	step_end

Route111_Movement_15035B:: @ 815035B
	delay_16
	delay_16
	delay_16
	step_end

Route111_EventScript_15035F:: @ 815035F
	msgbox Route111_Text_16FC9C, MSGBOX_SIGN
	end

Route111_EventScript_150368:: @ 8150368
	msgbox Route111_Text_16FCB6, MSGBOX_SIGN
	end

Route111_EventScript_150371:: @ 8150371
	msgbox Route111_Text_16FCEF, MSGBOX_SIGN
	end

Route111_EventScript_15037A:: @ 815037A
	msgbox Route111_Text_16FD05, MSGBOX_SIGN
	end

Route111_EventScript_150383:: @ 8150383
	msgbox Route111_Text_16FD1B, MSGBOX_SIGN
	end

Route111_EventScript_15038C:: @ 815038C
	msgbox Route111_Text_16FD55, MSGBOX_SIGN
	end

Route111_EventScript_150395:: @ 8150395
	msgbox Route111_Text_16FB86, MSGBOX_NPC
	end

Route111_EventScript_15039E:: @ 815039E
	msgbox Route111_Text_16FC3A, MSGBOX_NPC
	end

Route111_EventScript_1503A7:: @ 81503A7
	trainerbattle_single TRAINER_DREW, Route111_Text_1BAB4B, Route111_Text_1BABC7
	msgbox Route111_Text_1BAC10, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_1503BE:: @ 81503BE
	trainerbattle_single TRAINER_HEIDI, Route111_Text_1BAC60, Route111_Text_1BACC5
	msgbox Route111_Text_1BACD8, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_1503D5:: @ 81503D5
	trainerbattle_single TRAINER_CLIFF, Route111_Text_1BAD4B, Route111_Text_1BADA3
	msgbox Route111_Text_1BADC2, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_1503EC:: @ 81503EC
	trainerbattle_single TRAINER_BECKY, Route111_Text_1BAE24, Route111_Text_1BAE6E
	msgbox Route111_Text_1BAE81, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_150403:: @ 8150403
	trainerbattle_single TRAINER_DUSTY_1, Route111_Text_1BAEC9, Route111_Text_1BAF14
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route111_EventScript_15042A
	msgbox Route111_Text_1BAF5B, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_15042A:: @ 815042A
	trainerbattle_rematch TRAINER_DUSTY_1, Route111_Text_1BAFC1, Route111_Text_1BB034
	msgbox Route111_Text_1BB070, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_150441:: @ 8150441
	trainerbattle_single TRAINER_TRAVIS, Route111_Text_1BB111, Route111_Text_1BB140
	msgbox Route111_Text_1BB15B, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_150458:: @ 8150458
	trainerbattle_single TRAINER_IRENE, Route111_Text_1BB199, Route111_Text_1BB1D8
	msgbox Route111_Text_1BB1F6, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_15046F:: @ 815046F
	trainerbattle_single TRAINER_DAISUKE, Route111_Text_1BB250, Route111_Text_1BB27E
	msgbox Route111_Text_1BB290, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_150486:: @ 8150486
	trainerbattle_single TRAINER_WILTON_1, Route111_Text_1BB2E3, Route111_Text_1BB313
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route111_EventScript_1504AD
	msgbox Route111_Text_1BB33E, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_1504AD:: @ 81504AD
	trainerbattle_rematch TRAINER_WILTON_1, Route111_Text_1BB3A7, Route111_Text_1BB3FA
	msgbox Route111_Text_1BB40E, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_1504C4:: @ 81504C4
	trainerbattle_single TRAINER_BROOKE_1, Route111_Text_1BB44F, Route111_Text_1BB49F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route111_EventScript_1504EB
	msgbox Route111_Text_1BB4CE, MSGBOX_AUTOCLOSE
	end

Route111_EventScript_1504EB:: @ 81504EB
	trainerbattle_rematch TRAINER_BROOKE_1, Route111_Text_1BB529, Route111_Text_1BB5A2
	msgbox Route111_Text_1BB5C1, MSGBOX_AUTOCLOSE
	end
