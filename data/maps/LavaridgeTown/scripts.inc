LavaridgeTown_MapScripts:: @ 814E4A3
	map_script MAP_SCRIPT_ON_TRANSITION, LavaridgeTown_MapScript1_14E4AE
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LavaridgeTown_MapScript2_14E4E3
	.byte 0

LavaridgeTown_MapScript1_14E4AE:: @ 814E4AE
	setflag FLAG_VISITED_LAVARIDGE_TOWN
	call_if_set FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY, LavaridgeTown_EventScript_14E4DF
	call Common_EventScript_SetupRivalGfxId
	call Common_EventScript_SetupRivalOnBikeGfxId
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
	setvar VAR_0x8008, 1
	opendoor 12, 15
	waitdooranim
	addobject 8
	applymovement 8, LavaridgeTown_Movement_14E70E
	waitmovement 0
	closedoor 12, 15
	waitdooranim
	applymovement 8, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	applymovement 8, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 8, Common_Movement_Delay48
	waitmovement 0
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LavaridgeTown_EventScript_14E56B
	compare VAR_RESULT, 1
	call_if_eq LavaridgeTown_EventScript_14E570
	compare VAR_0x8008, 1
	call_if_eq LavaridgeTown_EventScript_14E68F
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq LavaridgeTown_EventScript_14E5AB
	compare VAR_RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_14E5D0
	end

LavaridgeTown_EventScript_14E56B:: @ 814E56B
	playbgm MUS_ENCOUNTER_MAY, TRUE
	return

LavaridgeTown_EventScript_14E570:: @ 814E570
	playbgm MUS_ENCOUNTER_BRENDAN, TRUE
	return

LavaridgeTown_EventScript_14E575:: @ 814E575
	lock
	faceplayer
	setvar VAR_0x8008, 0
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LavaridgeTown_EventScript_14E56B
	compare VAR_RESULT, 1
	call_if_eq LavaridgeTown_EventScript_14E570
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq LavaridgeTown_EventScript_14E5AB
	compare VAR_RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_14E5D0
	end

LavaridgeTown_EventScript_14E5AB:: @ 814E5AB
	msgbox LavaridgeTown_Text_16BDA4, MSGBOX_DEFAULT
	giveitem ITEM_GO_GOGGLES
	setflag FLAG_RECEIVED_GO_GOGGLES
	msgbox LavaridgeTown_Text_16BE7D, MSGBOX_DEFAULT
	goto LavaridgeTown_EventScript_14E5F5
	end

LavaridgeTown_EventScript_14E5D0:: @ 814E5D0
	msgbox LavaridgeTown_Text_16BF92, MSGBOX_DEFAULT
	giveitem ITEM_GO_GOGGLES
	setflag FLAG_RECEIVED_GO_GOGGLES
	msgbox LavaridgeTown_Text_16C020, MSGBOX_DEFAULT
	goto LavaridgeTown_EventScript_14E5F5
	end

LavaridgeTown_EventScript_14E5F5:: @ 814E5F5
	closemessage
	compare VAR_0x8008, 1
	call_if_eq LavaridgeTown_EventScript_14E646
	compare VAR_0x8008, 0
	call_if_eq LavaridgeTown_EventScript_14E64E
	removeobject 8
	addobject 7
	delay 30
	compare VAR_0x8008, 1
	call_if_eq LavaridgeTown_EventScript_14E69A
	compare VAR_0x8008, 0
	call_if_eq LavaridgeTown_EventScript_14E6A5
	removeobject 7
	setvar VAR_LAVARIDGE_RIVAL_STATE, 2
	savebgm 0
	fadedefaultbgm
	compare VAR_0x8008, 0
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
	compare VAR_FACING, 2
	call_if_eq LavaridgeTown_EventScript_14E67B
	compare VAR_FACING, 1
	call_if_eq LavaridgeTown_EventScript_14E680
	compare VAR_FACING, 3
	call_if_eq LavaridgeTown_EventScript_14E685
	compare VAR_FACING, 4
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
	compare VAR_FACING, 2
	call_if_eq LavaridgeTown_EventScript_14E6D2
	compare VAR_FACING, 1
	call_if_eq LavaridgeTown_EventScript_14E6D2
	compare VAR_FACING, 3
	call_if_eq LavaridgeTown_EventScript_14E6DD
	compare VAR_FACING, 4
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
	step_end

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
	step_end

LavaridgeTown_Movement_14E6FA:: @ 814E6FA
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	step_end

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
	step_end

LavaridgeTown_Movement_14E70E:: @ 814E70E
	walk_down
	step_end

LavaridgeTown_EventScript_14E710:: @ 814E710
	specialvar VAR_RESULT, GetPlayerFacingDirection
	compare VAR_RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_14E721
	end

LavaridgeTown_EventScript_14E721:: @ 814E721
	incrementgamestat GAME_STAT_ENTERED_HOT_SPRINGS
	end

LavaridgeTown_EventScript_14E724:: @ 814E724
	msgbox LavaridgeTown_Text_16C3FD, MSGBOX_NPC
	end

LavaridgeTown_EventScript_14E72D:: @ 814E72D
	msgbox LavaridgeTown_Text_16C4DB, MSGBOX_SIGN
	end

LavaridgeTown_EventScript_14E736:: @ 814E736
	msgbox LavaridgeTown_Text_16C59B, MSGBOX_NPC
	end

LavaridgeTown_EventScript_14E73F:: @ 814E73F
	msgbox LavaridgeTown_Text_16C603, MSGBOX_NPC
	end

LavaridgeTown_EventScript_14E748:: @ 814E748
	msgbox LavaridgeTown_Text_16C694, MSGBOX_NPC
	end

LavaridgeTown_EventScript_14E751:: @ 814E751
	msgbox LavaridgeTown_Text_16C54E, MSGBOX_NPC
	end

LavaridgeTown_EventScript_14E75A:: @ 814E75A
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_LAVARIDGE_EGG, LavaridgeTown_EventScript_14E79E
	msgbox LavaridgeTown_Text_16C174, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LavaridgeTown_EventScript_14E7B2
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq LavaridgeTown_EventScript_14E7A8
	msgbox LavaridgeTown_Text_16C2B6, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_LAVARIDGE_EGG
	playfanfare MUS_OBTAIN_ITEM
	message LavaridgeTown_Text_16C2EA
	waitfanfare
	waitmessage
	giveegg SPECIES_WYNAUT
	release
	end

LavaridgeTown_EventScript_14E79E:: @ 814E79E
	msgbox LavaridgeTown_Text_16C398, MSGBOX_DEFAULT
	release
	end

LavaridgeTown_EventScript_14E7A8:: @ 814E7A8
	msgbox LavaridgeTown_Text_16C2FF, MSGBOX_DEFAULT
	release
	end

LavaridgeTown_EventScript_14E7B2:: @ 814E7B2
	msgbox LavaridgeTown_Text_16C33C, MSGBOX_DEFAULT
	release
	end

LavaridgeTown_EventScript_14E7BC:: @ 814E7BC
	msgbox LavaridgeTown_Text_16C72F, MSGBOX_SIGN
	end

LavaridgeTown_EventScript_14E7C5:: @ 814E7C5
	msgbox LavaridgeTown_Text_16C77C, MSGBOX_SIGN
	end

@ 814E7CE
	msgbox LavaridgeTown_Text_16C7CF, MSGBOX_SIGN
	end

LavaridgeTown_EventScript_14E7D7:: @ 814E7D7
	msgbox LavaridgeTown_Text_16C7CF, MSGBOX_SIGN
	end
