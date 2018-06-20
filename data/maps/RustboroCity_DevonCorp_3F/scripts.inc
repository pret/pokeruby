RustboroCity_DevonCorp_3F_MapScripts:: @ 8157711
	map_script 3, RustboroCity_DevonCorp_3F_MapScript1_157721
	map_script 4, RustboroCity_DevonCorp_3F_MapScript2_157739
	map_script 2, RustboroCity_DevonCorp_3F_MapScript2_157748
	.byte 0

RustboroCity_DevonCorp_3F_MapScript1_157721:: @ 8157721
	compare VAR_DEVON_CORP_3F_STATE, 0
	call_if_eq RustboroCity_DevonCorp_3F_EventScript_15772D
	end

RustboroCity_DevonCorp_3F_EventScript_15772D:: @ 815772D
	setobjectxyperm 2, 3, 2
	setobjectmovementtype 2, 9
	return

RustboroCity_DevonCorp_3F_MapScript2_157739:: @ 8157739
	map_script_2 VAR_DEVON_CORP_3F_STATE, 0, RustboroCity_DevonCorp_3F_EventScript_157743
	.2byte 0

RustboroCity_DevonCorp_3F_EventScript_157743:: @ 8157743
	turnobject 255, 4
	end

RustboroCity_DevonCorp_3F_MapScript2_157748:: @ 8157748
	map_script_2 VAR_DEVON_CORP_3F_STATE, 0, RustboroCity_DevonCorp_3F_EventScript_157752
	.2byte 0

RustboroCity_DevonCorp_3F_EventScript_157752:: @ 8157752
	lockall
	msgbox RustboroCity_DevonCorp_3F_Text_18374C, 4
	closemessage
	applymovement 2, RustboroCity_DevonCorp_3F_Movement_157815
	waitmovement 0
	delay 80
	applymovement 2, RustboroCity_DevonCorp_3F_Movement_15781E
	waitmovement 0
	msgbox RustboroCity_DevonCorp_3F_Text_183903, 4
	closemessage
	playbgm MUS_TSURETEK, FALSE
	applymovement 2, RustboroCity_DevonCorp_3F_Movement_157803
	applymovement 255, RustboroCity_DevonCorp_3F_Movement_157827
	waitmovement 0
	msgbox RustboroCity_DevonCorp_3F_Text_18394A, 4
	closemessage
	fadedefaultbgm
	applymovement 2, RustboroCity_DevonCorp_3F_Movement_157812
	applymovement 255, RustboroCity_DevonCorp_3F_Movement_157835
	waitmovement 0
	msgbox RustboroCity_DevonCorp_3F_Text_18320B, 4
	giveitem_std ITEM_LETTER
	msgbox RustboroCity_DevonCorp_3F_Text_18337E, 4
	playfanfare MUS_FANFA4
	message RustboroCity_DevonCorp_3F_Text_183422
	waitfanfare
	waitmessage
	setflag FLAG_SYS_POKENAV_GET
	setflag FLAG_RECEIVED_POKENAV
	msgbox RustboroCity_DevonCorp_3F_Text_183439, 4
	setflag FLAG_HIDE_TUNNER_DIGGER_ROUTE116
	clearflag FLAG_HIDE_BOYFRIEND_RUSTURF_TUNNEL
	clearflag FLAG_HIDE_GIRLFRIEND_RUSTURF_TUNNEL
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	clearflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	setvar VAR_BRINEY_LOCATION, 1
	clearflag FLAG_HIDE_RIVAL_RUSTBORO
	setvar VAR_DEVON_CORP_3F_STATE, 1
	releaseall
	end

@ 81577FE
	walk_up
	walk_up
	walk_up
	walk_in_place_fastest_left
	end_movement

RustboroCity_DevonCorp_3F_Movement_157803:: @ 8157803
	walk_right
	walk_right
	walk_right
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
	walk_in_place_fastest_left
	end_movement

RustboroCity_DevonCorp_3F_Movement_157812:: @ 8157812
	delay_16
	walk_in_place_fastest_down
	end_movement

RustboroCity_DevonCorp_3F_Movement_157815:: @ 8157815
	walk_right
	walk_right
	walk_right
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

RustboroCity_DevonCorp_3F_Movement_15781E:: @ 815781E
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_left
	walk_left
	walk_left
	end_movement

RustboroCity_DevonCorp_3F_Movement_157827:: @ 8157827
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

RustboroCity_DevonCorp_3F_Movement_157835:: @ 8157835
	delay_16
	delay_16
	walk_down
	walk_down
	walk_in_place_fastest_right
	end_movement

RustboroCity_DevonCorp_3F_EventScript_15783B:: @ 815783B
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_EXP_SHARE, RustboroCity_DevonCorp_3F_EventScript_15789B
	goto_if_set FLAG_DELIVERED_STEVEN_LETTER, RustboroCity_DevonCorp_3F_EventScript_157864
	msgbox RustboroCity_DevonCorp_3F_Text_18351E, 4
	closemessage
	applymovement LAST_TALKED, RustboroCity_DevonCorp_3F_Movement_1A083D
	waitmovement 0
	release
	end

RustboroCity_DevonCorp_3F_EventScript_157864:: @ 8157864
	msgbox RustboroCity_DevonCorp_3F_Text_18353E, 4
	giveitem_std ITEM_EXP_SHARE
	compare RESULT, 0
	goto_if_eq RustboroCity_DevonCorp_3F_EventScript_1A029B
	setflag FLAG_RECEIVED_EXP_SHARE
	msgbox RustboroCity_DevonCorp_3F_Text_1835B3, 4
	closemessage
	applymovement LAST_TALKED, RustboroCity_DevonCorp_3F_Movement_1A083D
	waitmovement 0
	release
	end

RustboroCity_DevonCorp_3F_EventScript_15789B:: @ 815789B
	msgbox RustboroCity_DevonCorp_3F_Text_18368D, 4
	closemessage
	applymovement LAST_TALKED, RustboroCity_DevonCorp_3F_Movement_1A083D
	waitmovement 0
	release
	end

RustboroCity_DevonCorp_3F_EventScript_1578B0:: @ 81578B0
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_REPEAT_BALL, RustboroCity_DevonCorp_3F_EventScript_1578C5
	msgbox RustboroCity_DevonCorp_3F_Text_18395C, 4
	release
	end

RustboroCity_DevonCorp_3F_EventScript_1578C5:: @ 81578C5
	msgbox RustboroCity_DevonCorp_3F_Text_1839A3, 4
	release
	end

RustboroCity_DevonCorp_3F_EventScript_1578CF:: @ 81578CF
	msgbox RustboroCity_DevonCorp_3F_Text_183A04, 3
	end
