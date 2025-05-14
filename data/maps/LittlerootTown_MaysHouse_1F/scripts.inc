LittlerootTown_MaysHouse_1F_MapScripts:: @ 8152879
	map_script MAP_SCRIPT_ON_LOAD, LittlerootTown_MaysHouse_1F_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, LittlerootTown_MaysHouse_1F_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LittlerootTown_MaysHouse_1F_OnFrame
	.byte 0

LittlerootTown_MaysHouse_1F_OnLoad:: @ 8152889
	compare VAR_LITTLEROOT_INTRO_STATE, 6
	call_if_lt LittlerootTown_MaysHouse_1F_EventScript_SetMovingBoxes
	call_if_set FLAG_RECEIVED_RUNNING_SHOES, LittlerootTown_MaysHouse_1F_EventScript_CheckShowShoesManual
	end

LittlerootTown_MaysHouse_1F_EventScript_SetMovingBoxes:: @ 815289E
	setmetatile 5, 4, METATILE_BrendansMaysHouse_MovingBox_Open, 1
	setmetatile 5, 2, METATILE_BrendansMaysHouse_MovingBox_Closed, 1
	return

LittlerootTown_MaysHouse_1F_EventScript_CheckShowShoesManual:: @ 81528B1
	checkplayergender
	compare VAR_RESULT, 1
	goto_if_eq LittlerootTown_MaysHouse_1F_EventScript_ShowRunningShoesManual
	return

LittlerootTown_MaysHouse_1F_EventScript_ShowRunningShoesManual:: @ 81528BE
	setmetatile 6, 7, METATILE_BrendansMaysHouse_BookOnTable, 1
	return

LittlerootTown_MaysHouse_1F_OnTransition:: @ 81528C8
	compare VAR_LITTLEROOT_INTRO_STATE, 3
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_MoveMomToDoor
	compare VAR_LITTLEROOT_INTRO_STATE, 5
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_MoveMomToStairs
	compare VAR_LITTLEROOT_INTRO_STATE, 6
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_MoveMomToTV
	end

LittlerootTown_MaysHouse_1F_EventScript_MoveMomToStairs:: @ 81528EA
	setobjectxyperm 1, 2, 4
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_1F_EventScript_MoveMomToTV:: @ 81528F6
	setobjectxyperm 1, 6, 5
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_1F_EventScript_MoveMomToDoor:: @ 8152902
	setobjectxyperm 1, 1, 8
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_1F_OnFrame:: @ 815290E
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 3, LittlerootTown_MaysHouse_1F_EventScript_EnterHouseMovingIn
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 5, LittlerootTown_MaysHouse_1F_EventScript_GoUpstairsToSetClock
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 6, LittlerootTown_MaysHouse_1F_EventScript_PetalburgGymReport
	map_script_2 VAR_LITTLEROOT_HOUSES_STATE_2, 1, LittlerootTown_MaysHouse_1F_EventScript_YoureNewNeighbor
	map_script_2 VAR_LITTLEROOT_HOUSES_STATE, 3, PlayersHouse_1F_EventScript_GetSSTicketAndSeeLatiTV
	.2byte 0

LittlerootTown_MaysHouse_1F_EventScript_GoUpstairsToSetClock:: @ 8152938
	lockall
	msgbox PlayersHouse_1F_Text_GoSetTheClock, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_PLAYER, LittlerootTown_MaysHouse_1F_Movement_PushTowardStairs
	applymovement 1, LittlerootTown_MaysHouse_1F_Movement_PushTowardStairs
	waitmovement 0
	warp MAP_LITTLEROOT_TOWN_MAYS_HOUSE_2F, 255, 1, 1
	waitstate
	releaseall
	end

LittlerootTown_MaysHouse_1F_Movement_PushTowardStairs:: @ 815295E
	walk_up
	step_end

LittlerootTown_MaysHouse_1F_EventScript_EnterHouseMovingIn:: @ 8152960
	lockall
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	goto PlayersHouse_1F_EventScript_EnterHouseMovingIn
	end

LittlerootTown_MaysHouse_1F_EventScript_PetalburgGymReport:: @ 8152971
	lockall
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	goto LittlerootTown_MaysHouse_1F_EventScript_1B6B2E
	end

LittlerootTown_MaysHouse_1F_EventScript_YoureNewNeighbor:: @ 8152982
	lockall
	playse SE_PIN
	applymovement 4, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 4, Common_Movement_Delay48
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	applymovement 4, LittlerootTown_MaysHouse_1F_Movement_RivalMomApproach
	waitmovement 0
	special GetRivalSonDaughterString
	msgbox RivalsHouse_1F_Text_OhYoureTheNewNeighbor, MSGBOX_DEFAULT
	setflag FLAG_MET_RIVAL_MOM
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 2
	releaseall
	end

LittlerootTown_MaysHouse_1F_Movement_RivalMomApproach:: @ 81529C0
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

@ 81529C7
	lockall
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_1529E1
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_MaysHouse_1F_EventScript_1529E2
	releaseall
	end

LittlerootTown_MaysHouse_1F_EventScript_1529E1:: @ 81529E1
	return

LittlerootTown_MaysHouse_1F_EventScript_1529E2:: @ 81529E2
	msgbox PlayersHouse_1F_Text_ReportFromPetalburgGym, MSGBOX_DEFAULT
	return

RivalsHouse_1F_EventScript_RivalMom:: @ 81529EB
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_RIVAL_ROUTE103, RivalsHouse_1F_EventScript_GoHomeEverySoOften
	goto_if_set FLAG_RIVAL_LEFT_FOR_ROUTE103, RivalsHouse_1F_EventScript_RivalIsOutSomewhere
	compare VAR_LITTLEROOT_RIVAL_STATE, 3
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_WhereHasHusbandGone
	special GetRivalSonDaughterString
	msgbox RivalsHouse_1F_Text_RivalIsUpstairsIThink, MSGBOX_DEFAULT
	release
	end

RivalsHouse_1F_EventScript_RivalIsOutSomewhere:: @ 8152A17
	msgbox RivalsHouse_1F_Text_WentOutSomewhere, MSGBOX_DEFAULT
	release
	end

RivalsHouse_1F_EventScript_GoHomeEverySoOften:: @ 8152A21
	msgbox RivalsHouse_1F_Text_ShouldGoHomeEverySoOften, MSGBOX_DEFAULT
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_WhereHasHusbandGone:: @ 8152A2B
	msgbox RivalsHouse_1F_Text_WhereHasHusbandGone, MSGBOX_DEFAULT
	release
	end

LittlerootTown_MaysHouse_1F_EventScript_GoSeeRoom:: @ 8152A35
	lockall
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	goto PlayersHouse_1F_EventScript_MomGoSeeRoom
	end
