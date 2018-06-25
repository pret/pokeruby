LavaridgeTown_MapScripts:: @ 814E4A3
	map_script 3, LavaridgeTown_MapScript1_14E4AE
	map_script 2, LavaridgeTown_MapScript2_14E4E3
	.byte 0

LavaridgeTown_MapScript1_14E4AE:: @ 814E4AE
	setflag FLAG_VISITED_LAVARIDGE_TOWN
	call_if_set FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY, LavaridgeTown_EventScript_14E4DF
	call LavaridgeTown_EventScript_1A014E
	call LavaridgeTown_EventScript_1A0172
	compare VAR_LAVARIDGE_RIVAL_STATE, 2
	call_if_eq LavaridgeTown_EventScript_14E4D0
	end

LavaridgeTown_EventScript_14E4D0:: @ 814E4D0
	setobjectxyperm 8, 11, 9
	setobjectxyperm 7, 11, 9
	return

LavaridgeTown_EventScript_14E4DF:: @ 814E4DF
	clearflag FLAG_HIDE_MT_CHIMNEY_PEOPLE
	return

LavaridgeTown_MapScript2_14E4E3:: @ 814E4E3
	map_script_2 VAR_LAVARIDGE_RIVAL_STATE, 1, LavaridgeTown_EventScript_14E4ED
	.2byte 0

LavaridgeTown_EventScript_14E4ED:: @ 814E4ED
	lockall
	setvar VAR_SPECIAL_8, 1
	opendoor 12, 15
	waitdooranim
	addobject 8
	applymovement 8, LavaridgeTown_Movement_14E70E
	waitmovement 0
	closedoor 12, 15
	waitdooranim
	applymovement 8, LavaridgeTown_Movement_1A083F
	waitmovement 0
	applymovement 255, LavaridgeTown_Movement_1A0843
	applymovement 8, LavaridgeTown_Movement_1A0833
	waitmovement 0
	applymovement 8, LavaridgeTown_Movement_1A0835
	waitmovement 0
	checkplayergender
	compare RESULT, 0
	call_if_eq LavaridgeTown_EventScript_14E56B
	compare RESULT, 1
	call_if_eq LavaridgeTown_EventScript_14E570
	compare VAR_SPECIAL_8, 1
	call_if_eq LavaridgeTown_EventScript_14E68F
	checkplayergender
	compare RESULT, 0
	goto_if_eq LavaridgeTown_EventScript_14E5AB
	compare RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_14E5D0
	end

LavaridgeTown_EventScript_14E56B:: @ 814E56B
	playbgm MUS_GIRL_SUP, TRUE
	return

LavaridgeTown_EventScript_14E570:: @ 814E570
	playbgm MUS_BOY_SUP, TRUE
	return

LavaridgeTown_EventScript_14E575:: @ 814E575
	lock
	faceplayer
	setvar VAR_SPECIAL_8, 0
	checkplayergender
	compare RESULT, 0
	call_if_eq LavaridgeTown_EventScript_14E56B
	compare RESULT, 1
	call_if_eq LavaridgeTown_EventScript_14E570
	checkplayergender
	compare RESULT, 0
	goto_if_eq LavaridgeTown_EventScript_14E5AB
	compare RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_14E5D0
	end

LavaridgeTown_EventScript_14E5AB:: @ 814E5AB
	msgbox LavaridgeTown_Text_16BDA4, 4
	giveitem_std ITEM_GO_GOGGLES
	setflag FLAG_RECEIVED_GO_GOGGLES
	msgbox LavaridgeTown_Text_16BE7D, 4
	goto LavaridgeTown_EventScript_14E5F5
	end

LavaridgeTown_EventScript_14E5D0:: @ 814E5D0
	msgbox LavaridgeTown_Text_16BF92, 4
	giveitem_std ITEM_GO_GOGGLES
	setflag FLAG_RECEIVED_GO_GOGGLES
	msgbox LavaridgeTown_Text_16C020, 4
	goto LavaridgeTown_EventScript_14E5F5
	end

LavaridgeTown_EventScript_14E5F5:: @ 814E5F5
	closemessage
	compare VAR_SPECIAL_8, 1
	call_if_eq LavaridgeTown_EventScript_14E646
	compare VAR_SPECIAL_8, 0
	call_if_eq LavaridgeTown_EventScript_14E64E
	removeobject 8
	addobject 7
	delay 30
	compare VAR_SPECIAL_8, 1
	call_if_eq LavaridgeTown_EventScript_14E69A
	compare VAR_SPECIAL_8, 0
	call_if_eq LavaridgeTown_EventScript_14E6A5
	removeobject 7
	setvar VAR_LAVARIDGE_RIVAL_STATE, 2
	savebgm 0
	fadedefaultbgm
	compare VAR_SPECIAL_8, 0
	goto_if_eq LavaridgeTown_EventScript_14E644
	releaseall
	end

LavaridgeTown_EventScript_14E644:: @ 814E644
	release
	end

LavaridgeTown_EventScript_14E646:: @ 814E646
	setobjectxyperm 7, 6, 16
	return

LavaridgeTown_EventScript_14E64E:: @ 814E64E
	compare FACING, 2
	call_if_eq LavaridgeTown_EventScript_14E67B
	compare FACING, 1
	call_if_eq LavaridgeTown_EventScript_14E680
	compare FACING, 3
	call_if_eq LavaridgeTown_EventScript_14E685
	compare FACING, 4
	call_if_eq LavaridgeTown_EventScript_14E68A
	return

LavaridgeTown_EventScript_14E67B:: @ 814E67B
	setobjectmovementtype 7, 8
	return

LavaridgeTown_EventScript_14E680:: @ 814E680
	setobjectmovementtype 7, 7
	return

LavaridgeTown_EventScript_14E685:: @ 814E685
	setobjectmovementtype 7, 10
	return

LavaridgeTown_EventScript_14E68A:: @ 814E68A
	setobjectmovementtype 7, 9
	return

LavaridgeTown_EventScript_14E68F:: @ 814E68F
	applymovement 8, LavaridgeTown_Movement_14E6E8
	waitmovement 0
	return

LavaridgeTown_EventScript_14E69A:: @ 814E69A
	applymovement 7, LavaridgeTown_Movement_14E6EF
	waitmovement 0
	return

LavaridgeTown_EventScript_14E6A5:: @ 814E6A5
	compare FACING, 2
	call_if_eq LavaridgeTown_EventScript_14E6D2
	compare FACING, 1
	call_if_eq LavaridgeTown_EventScript_14E6D2
	compare FACING, 3
	call_if_eq LavaridgeTown_EventScript_14E6DD
	compare FACING, 4
	call_if_eq LavaridgeTown_EventScript_14E6D2
	return

LavaridgeTown_EventScript_14E6D2:: @ 814E6D2
	applymovement 7, LavaridgeTown_Movement_14E6FA
	waitmovement 0
	return

LavaridgeTown_EventScript_14E6DD:: @ 814E6DD
	applymovement 7, LavaridgeTown_Movement_14E703
	waitmovement 0
	return

LavaridgeTown_Movement_14E6E8:: @ 814E6E8
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

LavaridgeTown_Movement_14E6EF:: @ 814E6EF
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
	end_movement

LavaridgeTown_Movement_14E6FA:: @ 814E6FA
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	end_movement

LavaridgeTown_Movement_14E703:: @ 814E703
	walk_fast_down
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	end_movement

LavaridgeTown_Movement_14E70E:: @ 814E70E
	walk_down
	end_movement

LavaridgeTown_EventScript_14E710:: @ 814E710
	specialvar RESULT, GetPlayerFacingDirection
	compare RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_14E721
	end

LavaridgeTown_EventScript_14E721:: @ 814E721
	incrementgamestat GAME_STAT_ENTERED_HOT_SPRINGS
	end

LavaridgeTown_EventScript_14E724:: @ 814E724
	msgbox LavaridgeTown_Text_16C3FD, 2
	end

LavaridgeTown_EventScript_14E72D:: @ 814E72D
	msgbox LavaridgeTown_Text_16C4DB, 3
	end

LavaridgeTown_EventScript_14E736:: @ 814E736
	msgbox LavaridgeTown_Text_16C59B, 2
	end

LavaridgeTown_EventScript_14E73F:: @ 814E73F
	msgbox LavaridgeTown_Text_16C603, 2
	end

LavaridgeTown_EventScript_14E748:: @ 814E748
	msgbox LavaridgeTown_Text_16C694, 2
	end

LavaridgeTown_EventScript_14E751:: @ 814E751
	msgbox LavaridgeTown_Text_16C54E, 2
	end

LavaridgeTown_EventScript_14E75A:: @ 814E75A
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_LAVARIDGE_EGG, LavaridgeTown_EventScript_14E79E
	msgbox LavaridgeTown_Text_16C174, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq LavaridgeTown_EventScript_14E7B2
	getpartysize
	compare RESULT, 6
	goto_if_eq LavaridgeTown_EventScript_14E7A8
	msgbox LavaridgeTown_Text_16C2B6, 4
	setflag FLAG_RECEIVED_LAVARIDGE_EGG
	playfanfare MUS_FANFA4
	message LavaridgeTown_Text_16C2EA
	waitfanfare
	waitmessage
	giveegg SPECIES_WYNAUT
	release
	end

LavaridgeTown_EventScript_14E79E:: @ 814E79E
	msgbox LavaridgeTown_Text_16C398, 4
	release
	end

LavaridgeTown_EventScript_14E7A8:: @ 814E7A8
	msgbox LavaridgeTown_Text_16C2FF, 4
	release
	end

LavaridgeTown_EventScript_14E7B2:: @ 814E7B2
	msgbox LavaridgeTown_Text_16C33C, 4
	release
	end

LavaridgeTown_EventScript_14E7BC:: @ 814E7BC
	msgbox LavaridgeTown_Text_16C72F, 3
	end

LavaridgeTown_EventScript_14E7C5:: @ 814E7C5
	msgbox LavaridgeTown_Text_16C77C, 3
	end

@ 814E7CE
	msgbox LavaridgeTown_Text_16C7CF, 3
	end

LavaridgeTown_EventScript_14E7D7:: @ 814E7D7
	msgbox LavaridgeTown_Text_16C7CF, 3
	end
