LittlerootTown_MapScripts:: @ 814D509
	map_script MAP_SCRIPT_ON_TRANSITION, LittlerootTown_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LittlerootTown_OnFrame
	.byte 0

LittlerootTown_OnTransition:: @ 814D514
	setflag FLAG_VISITED_LITTLEROOT_TOWN
	compare VAR_LITTLEROOT_INTRO_STATE, 2
	call_if_eq LittlerootTown_EventScript_MoveMomToMaysDoor
	call_if_unset FLAG_RESCUED_BIRCH, LittlerootTown_EventScript_SetTwinPos
	compare VAR_LITTLEROOT_STATE, 3
	call_if_eq LittlerootTown_EventScript_SetMomStandingInFrontOfDoorPos
	compare VAR_LITTLEROOT_HOUSES_STATE, 4
	call_if_eq LittlerootTown_EventScript_SetExitedHouseAfterLatiSSTicketEvent
	compare VAR_LITTLEROOT_HOUSES_STATE_2, 4
	call_if_eq LittlerootTown_EventScript_SetExitedHouseAfterLatiSSTicketEvent
	compare VAR_OLDALE_STATE, 1
	call_if_eq LittlerootTown_EventScript_HideMapNamePopup
	compare VAR_LITTLEROOT_RIVAL_STATE, 3
	call_if_eq LittlerootTown_EventScript_SetRivalLeftForRoute103
	end

LittlerootTown_EventScript_SetRivalLeftForRoute103:: @ 814D563
	setflag FLAG_RIVAL_LEFT_FOR_ROUTE103
	return

LittlerootTown_EventScript_HideMapNamePopup:: @ 814D567
	setvar VAR_OLDALE_STATE, 2
	setflag FLAG_HIDE_RIVAL_OLDALE_TOWN
	return

LittlerootTown_EventScript_SetExitedHouseAfterLatiSSTicketEvent:: @ 814D570
	setvar VAR_LITTLEROOT_HOUSES_STATE, 5
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 5
	return

LittlerootTown_EventScript_MoveMomToMaysDoor:: @ 814D57B
	setobjectxyperm 4, 14, 8
	return

LittlerootTown_EventScript_SetTwinPos:: @ 814D583
	compare VAR_LITTLEROOT_STATE, 0
	goto_if_eq LittlerootTown_EventScript_SetTwinGuardingRoutePos
	setobjectxyperm 1, 10, 1
	setobjectmovementtype 1, 7
	return

LittlerootTown_EventScript_SetTwinGuardingRoutePos:: @ 814D59A
	setobjectxyperm 1, 7, 2
	setobjectmovementtype 1, 8
	return

LittlerootTown_EventScript_SetMomStandingInFrontOfDoorPos:: @ 814D5A6
	clearflag FLAG_HIDE_MOM_LITTLEROOT
	setobjectmovementtype 4, 8
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_SetMomInFrontOfDoorMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_SetMomInFrontOfDoorFemale
	return

LittlerootTown_EventScript_SetMomInFrontOfDoorMale:: @ 814D5C5
	setobjectxyperm 4, 5, 9
	return

LittlerootTown_EventScript_SetMomInFrontOfDoorFemale:: @ 814D5CD
	setobjectxyperm 4, 14, 9
	return

LittlerootTown_OnFrame:: @ 814D5D5
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 1, LittlerootTown_EventScript_StepOffTruckMale
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 2, LittlerootTown_EventScript_StepOffTruckFemale
	map_script_2 VAR_LITTLEROOT_INTRO_STATE, 7, LittlerootTown_EventScript_BeginDexUpgradeScene
	.2byte 0

LittlerootTown_EventScript_StepOffTruckMale:: @ 814D5EF
	lockall
	setvar VAR_0x8004, 5
	setvar VAR_0x8005, 8
	call LittlerootTown_EventScript_GoInsideWithMom
	setflag FLAG_HIDE_MOVING_TRUCK_BRENDAN
	warpsilent MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F, 255, 8, 8
	waitstate
	releaseall
	end

LittlerootTown_EventScript_StepOffTruckFemale:: @ 814D60D
	lockall
	setvar VAR_0x8004, 14
	setvar VAR_0x8005, 8
	call LittlerootTown_EventScript_GoInsideWithMom
	setflag FLAG_HIDE_MOVING_TRUCK_MAY
	warpsilent MAP_LITTLEROOT_TOWN_MAYS_HOUSE_1F, 255, 2, 8
	waitstate
	releaseall
	end

LittlerootTown_EventScript_GoInsideWithMom:: @ 814D62B
	delay 15
	playse SE_LEDGE
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_Movement_PlayerStepOffTruck
	waitmovement 0
	opendoor VAR_0x8004, VAR_0x8005
	waitdooranim
	addobject 4
	applymovement 4, LittlerootTown_Movement_MomExitHouse
	waitmovement 0
	closedoor VAR_0x8004, VAR_0x8005
	waitdooranim
	delay 10
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerAtTruck
	waitmovement 0
	msgbox LittlerootTown_Text_OurNewHomeLetsGoInside, MSGBOX_DEFAULT
	closemessage
	applymovement 4, LittlerootTown_Movement_MomApproachDoor
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_Movement_PlayerApproachDoor
	waitmovement 0
	opendoor VAR_0x8004, VAR_0x8005
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomEnterHouse
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_Movement_PlayerEnterHouse
	waitmovement 0
	setflag FLAG_HIDE_MOM_LITTLEROOT
	setvar VAR_LITTLEROOT_INTRO_STATE, 3
	hideobjectat OBJ_EVENT_ID_PLAYER, MAP_PETALBURG_CITY
	closedoor VAR_0x8004, VAR_0x8005
	waitdooranim
	clearflag FLAG_HIDE_FAT_MAN_LITTLEROOT
	clearflag FLAG_HIDE_MAP_NAME_POPUP
	return

LittlerootTown_Movement_MomExitHouse:: @ 814D6AC
	walk_down
	step_end

LittlerootTown_Movement_MomApproachPlayerAtTruck:: @ 814D6AE
	walk_down
	walk_in_place_fastest_left
	step_end

LittlerootTown_Movement_MomApproachDoor:: @ 814D6B1
	delay_16
	delay_8
	walk_up
	step_end

LittlerootTown_Movement_MomEnterHouse:: @ 814D6B5
	walk_up
	set_invisible
	step_end

LittlerootTown_Movement_PlayerApproachDoor:: @ 814D6B8
	delay_16
	delay_8
	walk_right
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_PlayerEnterHouse:: @ 814D6BD
	walk_up
	walk_up
	step_end

LittlerootTown_Movement_PlayerStepOffTruck:: @ 814D6C0
	jump_right
	delay_16
	delay_16
	delay_16
	step_end

LittlerootTown_EventScript_BeginDexUpgradeScene:: @ 814D6C5
	lockall
	setvar VAR_LITTLEROOT_INTRO_STATE, 8
	releaseall
	end

LittlerootTown_EventScript_FatMan:: @ 814D6CD
	msgbox LittlerootTown_Text_CanUsePCToStoreItems, MSGBOX_NPC
	end

LittlerootTown_EventScript_Boy:: @ 814D6D6
	msgbox LittlerootTown_Text_BirchSpendsDaysInLab, MSGBOX_NPC
	end

LittlerootTown_EventScript_Twin:: @ 814D6DF
	lock
	faceplayer
	goto_if_set FLAG_ADVENTURE_STARTED, LittlerootTown_EventScript_GoodLuck
	goto_if_set FLAG_RESCUED_BIRCH, LittlerootTown_EventScript_YouSavedBirch
	compare VAR_LITTLEROOT_STATE, 0
	goto_if_ne LittlerootTown_EventScript_GoSaveBirch
	msgbox LittlerootTown_Text_IfYouGoInGrassPokemonWillJumpOut, MSGBOX_DEFAULT
	release
	end

LittlerootTown_EventScript_GoSaveBirch:: @ 814D708
	msgbox LittlerootTown_Text_CanYouGoSeeWhatsHappening, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	setvar VAR_LITTLEROOT_STATE, 2
	release
	end

LittlerootTown_EventScript_YouSavedBirch:: @ 814D722
	special GetPlayerBigGuyGirlString
	msgbox LittlerootTown_Text_YouSavedBirch, MSGBOX_DEFAULT
	release
	end

LittlerootTown_EventScript_GoodLuck:: @ 814D72F
	msgbox LittlerootTown_Text_GoodLuckCatchingPokemon, MSGBOX_DEFAULT
	release
	end

LittlerootTown_EventScript_NeedPokemonTriggerLeft:: @ 814D739
	lockall
	applymovement 1, LittlerootTown_Movement_TwinApproachPlayerLeft
	waitmovement 0
	call LittlerootTown_EventScript_DangerousWithoutPokemon
	applymovement 1, LittlerootTown_Movement_TwinReturnLeft
	waitmovement 0
	releaseall
	end

LittlerootTown_EventScript_DangerousWithoutPokemon:: @ 814D755
	msgbox LittlerootTown_Text_IfYouGoInGrassPokemonWillJumpOut, MSGBOX_DEFAULT
	closemessage
	applymovement 1, LittlerootTown_Movement_TwinPushPlayerFromRoute
	applymovement OBJ_EVENT_ID_PLAYER, LittlerootTown_Movement_PushPlayerBackFromRoute
	waitmovement 0
	msgbox LittlerootTown_Text_DangerousIfYouDontHavePokemon, MSGBOX_DEFAULT
	closemessage
	return

LittlerootTown_Movement_TwinApproachPlayerLeft:: @ 814D779
	face_right
	delay_8
	disable_jump_landing_ground_effect
	jump_in_place_right
	delay_8
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_left
	face_down
	step_end

LittlerootTown_Movement_TwinPushPlayerFromRoute:: @ 814D787
	walk_down
	step_end

LittlerootTown_Movement_TwinReturnLeft:: @ 814D789
	walk_right
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_in_place_fastest_down
	step_end

LittlerootTown_Movement_PushPlayerBackFromRoute:: @ 814D793
	lock_facing_direction
	walk_down
	unlock_facing_direction
	step_end

LittlerootTown_EventScript_NeedPokemonTriggerRight:: @ 814D797
	lockall
	applymovement 1, LittlerootTown_Movement_TwinApproachPlayerRight
	waitmovement 0
	call LittlerootTown_EventScript_DangerousWithoutPokemon
	applymovement 1, LittlerootTown_Movement_TwinReturnRight
	waitmovement 0
	releaseall
	end

LittlerootTown_Movement_TwinApproachPlayerRight:: @ 814D7B3
	face_right
	delay_8
	disable_jump_landing_ground_effect
	jump_in_place_right
	delay_8
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_right
	face_down
	step_end

LittlerootTown_Movement_TwinReturnRight:: @ 814D7C0
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_down
	step_end

LittlerootTown_EventScript_GoSaveBirchTrigger:: @ 814D7C7
	lockall
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox LittlerootTown_Text_CanYouGoSeeWhatsHappening, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	setvar VAR_LITTLEROOT_STATE, 2
	releaseall
	end

LittlerootTown_EventScript_TownSign:: @ 814D7F6
	msgbox LittlerootTown_Text_TownSign, MSGBOX_SIGN
	end

LittlerootTown_EventScript_BirchsLabSign:: @ 814D7FF
	msgbox LittlerootTown_Text_ProfBirchsLab, MSGBOX_SIGN
	end

LittlerootTown_EventScript_BrendansHouseSign:: @ 814D808
	lockall
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_PlayersHouseSignMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_BirchsHouseSignFemale
	releaseall
	end

LittlerootTown_EventScript_PlayersHouseSignMale:: @ 814D822
	msgbox LittlerootTown_Text_PlayersHouse, MSGBOX_DEFAULT
	return

LittlerootTown_EventScript_BirchsHouseSignFemale:: @ 814D82B
	msgbox LittlerootTown_Text_ProfBirchsHouse, MSGBOX_DEFAULT
	return

LittlerootTown_EventScript_MaysHouseSign:: @ 814D834
	lockall
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_BirchsHouseSignMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_PlayersHouseSignFemale
	releaseall
	end

LittlerootTown_EventScript_BirchsHouseSignMale:: @ 814D84E
	msgbox LittlerootTown_Text_ProfBirchsHouse, MSGBOX_DEFAULT
	return

LittlerootTown_EventScript_PlayersHouseSignFemale:: @ 814D857
	msgbox LittlerootTown_Text_PlayersHouse, MSGBOX_DEFAULT
	return

LittlerootTown_EventScript_GiveRunningShoesTrigger0:: @ 814D860
	lockall
	setvar VAR_0x8008, 0
	setobjectxy 4, 10, 9
	goto LittlerootTown_EventScript_GiveRunningShoesTrigger
	end

LittlerootTown_EventScript_GiveRunningShoesTrigger1:: @ 814D873
	lockall
	setvar VAR_0x8008, 1
	setobjectxy 4, 11, 9
	goto LittlerootTown_EventScript_GiveRunningShoesTrigger
	end

LittlerootTown_EventScript_GiveRunningShoesTrigger2:: @ 814D886
	lockall
	setvar VAR_0x8008, 2
	goto LittlerootTown_EventScript_GiveRunningShoesTrigger
	end

LittlerootTown_EventScript_GiveRunningShoesTrigger3:: @ 814D892
	lockall
	setvar VAR_0x8008, 3
	goto LittlerootTown_EventScript_GiveRunningShoesTrigger
	end

LittlerootTown_EventScript_GiveRunningShoesTrigger4:: @ 814D89E
	lockall
	setvar VAR_0x8008, 4
	goto LittlerootTown_EventScript_GiveRunningShoesTrigger
	end

LittlerootTown_EventScript_GiveRunningShoesTrigger5:: @ 814D8AA
	lockall
	setvar VAR_0x8008, 5
	goto LittlerootTown_EventScript_GiveRunningShoesTrigger
	end

LittlerootTown_EventScript_GiveRunningShoesTrigger:: @ 814D8B6
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_MomNoticePlayerMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_MomNoticePlayerFemale
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_SetHomeDoorCoordsMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_SetHomeDoorCoordsFemale
	msgbox LittlerootTown_Text_WaitPlayer, MSGBOX_DEFAULT
	closemessage
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerFemale
	call LittlerootTown_EventScript_GiveRunningShoes
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_MomReturnHomeMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_MomReturnHomeFemale
	goto LittlerootTown_EventScript_SetReceivedRunningShoes
	end

LittlerootTown_EventScript_SetHomeDoorCoordsMale:: @ 814D926
	setvar VAR_0x8009, 5
	setvar VAR_0x800A, 8
	return

LittlerootTown_EventScript_SetHomeDoorCoordsFemale:: @ 814D931
	setvar VAR_0x8009, 14
	setvar VAR_0x800A, 8
	return

LittlerootTown_EventScript_MomNoticePlayerMale:: @ 814D93C
	applymovement 4, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

LittlerootTown_EventScript_MomNoticePlayerFemale:: @ 814D947
	applymovement 4, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerMale:: @ 814D952
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_EventScript_MomApproachPlayer0
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_EventScript_MomApproachPlayer1
	compare VAR_0x8008, 2
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerMale2
	compare VAR_0x8008, 3
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerMale3
	compare VAR_0x8008, 4
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerMale4
	compare VAR_0x8008, 5
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerMale5
	return

LittlerootTown_EventScript_MomApproachPlayerFemale:: @ 814D995
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_EventScript_MomApproachPlayer0
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_EventScript_MomApproachPlayer1
	compare VAR_0x8008, 2
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerFemale2
	compare VAR_0x8008, 3
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerFemale3
	compare VAR_0x8008, 4
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerFemale4
	compare VAR_0x8008, 5
	call_if_eq LittlerootTown_EventScript_MomApproachPlayerFemale5
	return

LittlerootTown_EventScript_MomApproachPlayer0:: @ 814D9D8
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayer0
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayer1:: @ 814D9ED
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayer1
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerMale2:: @ 814DA02
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerMale2
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerMale3:: @ 814DA17
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerMale3
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerMale4:: @ 814DA2C
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerMale4
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerMale5:: @ 814DA41
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerMale5
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerFemale2:: @ 814DA56
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerFemale2
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerFemale3:: @ 814DA6B
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerFemale3
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerFemale4:: @ 814DA80
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerFemale4
	waitmovement 0
	return

LittlerootTown_EventScript_MomApproachPlayerFemale5:: @ 814DA95
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	applymovement 4, LittlerootTown_Movement_MomApproachPlayerFemale5
	waitmovement 0
	return

LittlerootTown_EventScript_MomReturnHomeMale:: @ 814DAAA
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_EventScript_MomReturnHome0
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_EventScript_MomReturnHome1
	compare VAR_0x8008, 2
	call_if_eq LittlerootTown_EventScript_MomReturnHomeMale2
	compare VAR_0x8008, 3
	call_if_eq LittlerootTown_EventScript_MomReturnHomeMale3
	compare VAR_0x8008, 4
	call_if_eq LittlerootTown_EventScript_MomReturnHomeMale4
	compare VAR_0x8008, 5
	call_if_eq LittlerootTown_EventScript_MomReturnHomeMale5
	return

LittlerootTown_EventScript_MomReturnHomeFemale:: @ 814DAED
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_EventScript_MomReturnHome0
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_EventScript_MomReturnHome1
	compare VAR_0x8008, 2
	call_if_eq LittlerootTown_EventScript_MomReturnHomeFemale2
	compare VAR_0x8008, 3
	call_if_eq LittlerootTown_EventScript_MomReturnHomeFemale3
	compare VAR_0x8008, 4
	call_if_eq LittlerootTown_EventScript_MomReturnHomeFemale4
	compare VAR_0x8008, 5
	call_if_eq LittlerootTown_EventScript_MomReturnHomeFemale5
	return

LittlerootTown_EventScript_MomReturnHome0:: @ 814DB30
	applymovement 4, LittlerootTown_Movement_MomReturnHome0
	waitmovement 0
	return

LittlerootTown_EventScript_MomReturnHome1:: @ 814DB3B
	applymovement 4, LittlerootTown_Movement_MomReturnHome1
	waitmovement 0
	return

LittlerootTown_EventScript_MomReturnHomeMale2:: @ 814DB46
	applymovement 4, LittlerootTown_Movement_MomReturnHomeMale2
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_EventScript_MomReturnHomeMale3:: @ 814DB6C
	applymovement 4, LittlerootTown_Movement_MomReturnHomeMale3
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_EventScript_MomReturnHomeMale4:: @ 814DB92
	applymovement 4, LittlerootTown_Movement_MomReturnHomeMale4
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_EventScript_MomReturnHomeMale5:: @ 814DBB8
	applymovement 4, LittlerootTown_Movement_MomReturnHomeMale5
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_EventScript_MomReturnHomeFemale2:: @ 814DBDE
	applymovement 4, LittlerootTown_Movement_MomReturnHomeFemale2
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_EventScript_MomReturnHomeFemale3:: @ 814DC04
	applymovement 4, LittlerootTown_Movement_MomReturnHomeFemale3
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_EventScript_MomReturnHomeFemale4:: @ 814DC2A
	applymovement 4, LittlerootTown_Movement_MomReturnHomeFemale4
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_EventScript_MomReturnHomeFemale5:: @ 814DC50
	applymovement 4, LittlerootTown_Movement_MomReturnHomeFemale5
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	return

LittlerootTown_Movement_MomApproachPlayer0:: @ 814DC76
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

LittlerootTown_Movement_MomApproachPlayer1:: @ 814DC7D
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

LittlerootTown_Movement_MomApproachPlayerMale2:: @ 814DC84
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

LittlerootTown_Movement_MomApproachPlayerMale3:: @ 814DC89
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

LittlerootTown_Movement_MomApproachPlayerMale4:: @ 814DC8F
	walk_right
	walk_right
	step_end

LittlerootTown_Movement_MomApproachPlayerMale5:: @ 814DC92
	walk_right
	walk_right
	walk_right
	step_end

LittlerootTown_Movement_MomApproachPlayerFemale2:: @ 814DC96
	walk_left
	walk_left
	walk_left
	step_end

LittlerootTown_Movement_MomApproachPlayerFemale3:: @ 814DC9A
	walk_left
	walk_left
	step_end

LittlerootTown_Movement_MomApproachPlayerFemale4:: @ 814DC9D
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

LittlerootTown_Movement_MomApproachPlayerFemale5:: @ 814DCA3
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

LittlerootTown_Movement_MomReturnHome0:: @ 814DCA8
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

LittlerootTown_Movement_MomReturnHome1:: @ 814DCAE
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

LittlerootTown_Movement_MomReturnHomeMale2:: @ 814DCB4
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomReturnHomeMale3:: @ 814DCBA
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomReturnHomeMale4:: @ 814DCC1
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomReturnHomeMale5:: @ 814DCC5
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomReturnHomeFemale2:: @ 814DCCA
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomReturnHomeFemale3:: @ 814DCCF
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomReturnHomeFemale4:: @ 814DCD3
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomReturnHomeFemale5:: @ 814DCDA
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

LittlerootTown_Movement_MomExitThroughDoor:: @ 814DCE0
	walk_up
	step_end

LittlerootTown_EventScript_Mom:: @ 814DCE2
	lock
	faceplayer
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_EventScript_SetHomeDoorCoordsMale
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_EventScript_SetHomeDoorCoordsFemale
	call LittlerootTown_EventScript_GiveRunningShoes
	applymovement 4, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	opendoor VAR_0x8009, VAR_0x800A
	waitdooranim
	applymovement 4, LittlerootTown_Movement_MomExitThroughDoor
	waitmovement 0
	hideobjectat 4, MAP_LITTLEROOT_TOWN
	closedoor VAR_0x8009, VAR_0x800A
	waitdooranim
	goto LittlerootTown_EventScript_SetReceivedRunningShoes
	end

LittlerootTown_EventScript_SetReceivedRunningShoes:: @ 814DD2B
	removeobject 4
	setflag FLAG_SYS_B_DASH
	setvar VAR_LITTLEROOT_STATE, 4
	release
	end

LittlerootTown_EventScript_GiveRunningShoes:: @ 814DD38
	msgbox LittlerootTown_Text_WearTheseRunningShoes, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	message LittlerootTown_Text_SwitchShoesWithRunningShoes
	waitfanfare
	waitmessage
	setflag FLAG_RECEIVED_RUNNING_SHOES
	msgbox LittlerootTown_Text_ExplainRunningShoes, MSGBOX_DEFAULT
	msgbox LittlerootTown_Text_ComeHomeIfAnythingHappens, MSGBOX_DEFAULT
	closemessage
	delay 30
	return
