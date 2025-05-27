Route110_TrickHouseEntrance_MapScripts:: @ 8160F2B
	map_script MAP_SCRIPT_ON_TRANSITION, Route110_TrickHouseEntrance_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, Route110_TrickHouseEntrance_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, Route110_TrickHouseEntrance_OnWarp
	.byte 0

Route110_TrickHouseEntrance_OnTransition:: @ 8160F3B
	setflag FLAG_LANDMARK_TRICK_HOUSE
	compare VAR_TRICK_HOUSE_STATE, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_EnterFromCorridor
	compare VAR_TRICK_HOUSE_PRIZE_PICKUP, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_SetReadyToGiveReward
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_MoveTrickMasterToDoor
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForNextPuzzle
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForNextPuzzle
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForNextPuzzle
	switch VAR_TRICK_HOUSE_ENTRANCE_STATE_3
	case 0, Route110_TrickHouseEntrance_EventScript_ReadyBeingWatchedTrigger
	case 1, Route110_TrickHouseEntrance_EventScript_SetNotBeingWatched1
	case 3, Route110_TrickHouseEntrance_EventScript_SetNotBeingWatched2
	case 4, Route110_TrickHouseEntrance_EventScript_SetNotBeingWatched3
	end

Route110_TrickHouseEntrance_EventScript_SetReadyToGiveReward:: @ 8160FB2
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 8
	goto_if_eq Route110_TrickHouseEntrance_EventScript_ReadyToGiveTentReward
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 2
	end

Route110_TrickHouseEntrance_EventScript_ReadyToGiveTentReward:: @ 8160FC8
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 6
	end

Route110_TrickHouseEntrance_EventScript_EnterFromCorridor:: @ 8160FCE
	setvar VAR_TRICK_HOUSE_STATE, 0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_CheckReadyForNextPuzzle:: @ 8160FDE
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 0
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle2
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle3
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 3
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle4
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 4
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle5
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 5
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle6
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 6
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle7
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 7
	call_if_eq Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle8
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 8
	call_if_eq Route110_TrickHouseEntrance_EventScript_FinishedPuzzles
	return

Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle2:: @ 816103C
	call_if_unset FLAG_BADGE03_GET, Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle
	return

Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle3:: @ 8161046
	call_if_unset FLAG_BADGE04_GET, Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle
	return

Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle4:: @ 8161050
	call_if_unset FLAG_BADGE05_GET, Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle
	return

Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle5:: @ 816105A
	call_if_unset FLAG_BADGE06_GET, Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle
	return

Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle6:: @ 8161064
	call_if_unset FLAG_BADGE07_GET, Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle
	return

Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle7:: @ 816106E
	call_if_unset FLAG_BADGE08_GET, Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle
	return

Route110_TrickHouseEntrance_EventScript_CheckReadyForPuzzle8:: @ 8161078
	call_if_unset FLAG_SYS_GAME_CLEAR, Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle
	return

Route110_TrickHouseEntrance_EventScript_FinishedPuzzles:: @ 8161082
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 4
	return

Route110_TrickHouseEntrance_EventScript_NotReadyForPuzzle:: @ 8161088
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3
	return

Route110_TrickHouseEntrance_EventScript_MoveTrickMasterToDoor:: @ 816108E
	setobjectxyperm 1, 5, 2
	setobjectmovementtype 1, 4
	end

Route110_TrickHouseEntrance_EventScript_ReadyBeingWatchedTrigger:: @ 816109A
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 0
	end

Route110_TrickHouseEntrance_EventScript_SetNotBeingWatched1:: @ 81610A0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_SetNotBeingWatched2:: @ 81610A6
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_SetNotBeingWatched3:: @ 81610AC
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_OnWarp:: @ 81610B2
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1, Route110_TrickHouseEntrance_EventScript_TrickMasterFound
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 0, Route110_TrickHouseEntrance_EventScript_SetTrickMasterHidingSpot
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 1, Route110_TrickHouseEntrance_EventScript_RemoveTrickMaster
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 2, Route110_TrickHouseEntrance_EventScript_SetTrickMasterFacingDoor
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3, Route110_TrickHouseEntrance_EventScript_SetTrickMasterFacingDoor
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 4, Route110_TrickHouseEntrance_EventScript_RemoveTrickMaster
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5, Route110_TrickHouseEntrance_EventScript_RemoveTrickMaster
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 6, Route110_TrickHouseEntrance_EventScript_SetTrickMasterInFrontOfDoor
	.2byte 0

Route110_TrickHouseEntrance_EventScript_TrickMasterFound:: @ 81610F4
	addobject 1
	showobjectat 1, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	turnobject 1, 4
	turnobject LOCALID_PLAYER, 3
	end

Route110_TrickHouseEntrance_EventScript_SetTrickMasterHidingSpot:: @ 8161105
	addobject 1
	hideobjectat 1, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	switch VAR_TRICK_HOUSE_ROOMS_COMPLETED
	case 0, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle1
	case 1, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle2
	case 2, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle3
	case 3, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle4
	case 4, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle5
	case 5, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle6
	case 6, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle7
	case 7, Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle8
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle1:: @ 816116B
	setobjectxy 1, 6, 3
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle2:: @ 8161173
	setobjectxy 1, 11, 5
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle6:: @ 816117B
	setobjectxy 1, 11, 1
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle4:: @ 8161183
	setobjectxy 1, 3, 1
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle5:: @ 816118B
	setobjectxy 1, 0, 5
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle3:: @ 8161193
	setobjectxy 1, 9, 1
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle7:: @ 816119B
	setobjectxy 1, 8, 1
	end

Route110_TrickHouseEntrance_EventScript_SetHidingSpotPuzzle8:: @ 81611A3
	setobjectxy 1, 4, 4
	end

Route110_TrickHouseEntrance_EventScript_RemoveTrickMaster:: @ 81611AB
	removeobject 1
	end

Route110_TrickHouseEntrance_EventScript_SetTrickMasterFacingDoor:: @ 81611AF
	addobject 1
	setobjectxy 1, 5, 2
	turnobject 1, 2
	end

Route110_TrickHouseEntrance_EventScript_SetTrickMasterInFrontOfDoor:: @ 81611BE
	addobject 1
	setobjectxy 1, 5, 2
	turnobject 1, 1
	end

Route110_TrickHouseEntrance_OnFrame:: @ 81611CD
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1, Route110_TrickHouseEntrance_EventScript_BeginChallenge
	.2byte 0

Route110_TrickHouseEntrance_EventScript_BeginChallenge:: @ 81611D7
	lockall
	delay 20
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_MeetTrickMaster
	msgbox Route110_TrickHouseEntrance_Text_ComeToChallengeTrickHouse, MSGBOX_DEFAULT
	closemessage
	delay 20
	applymovement 1, Route110_TrickHouseEntrance_Movement_TrickMasterSpin
	waitmovement 0
	playse SE_M_EXPLOSION
	applymovement 1, Route110_TrickHouseEntrance_Movement_TrickMasterJumpAway
	waitmovement 0
	removeobject 1
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 1
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 0
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_UnusedRelease:: @ 8161218
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_TrickMaster:: @ 816121A
	lockall
	switch VAR_TRICK_HOUSE_ENTRANCE_STATE_3
	case 0, Route110_TrickHouseEntrance_EventScript_FoundTrickMaster
	case 2, Route110_TrickHouseEntrance_EventScript_GiveReward
	case 3, Route110_TrickHouseEntrance_EventScript_StillMakingPuzzle
	case 6, Route110_TrickHouseEntrance_EventScript_MechadollReward
	end

Route110_TrickHouseEntrance_EventScript_FoundTrickMaster:: @ 816124D
	playse SE_PIN
	applymovement LOCALID_PLAYER, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_Delay48
	waitmovement 0
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundBeneathDesk
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundBehindTree
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundInDresser
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 3
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundBeyondWindow
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 4
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundInPlanter
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 5
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundInCupboard
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 6
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundBehindWindow
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 7
	call_if_eq Route110_TrickHouseEntrance_EventScript_FoundBeneathCushion
	closemessage
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1
	warp MAP_ROUTE110_TRICK_HOUSE_ENTRANCE, 255, 6, 2
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_FoundBeneathDesk:: @ 81612CD
	msgbox Route110_TrickHouseEntrance_Text_ConcealedBeneathDesk, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_FoundBehindTree:: @ 81612D6
	msgbox Route110_TrickHouseEntrance_Text_ConcealedBehindTree, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_FoundInDresser:: @ 81612DF
	msgbox Route110_TrickHouseEntrance_Text_ConcealedInDresser, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_FoundBeyondWindow:: @ 81612E8
	msgbox Route110_TrickHouseEntrance_Text_ConealedBeyondWindow, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_FoundInPlanter:: @ 81612F1
	msgbox Route110_TrickHouseEntrance_Text_ConcealedInPlanter, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_FoundInCupboard:: @ 81612FA
	msgbox Route110_TrickHouseEntrance_Text_ConcealedInCupboard, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_FoundBehindWindow:: @ 8161303
	msgbox Route110_TrickHouseEntrance_Text_ConcealedBehindWindow, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_FoundBeneathCushion:: @ 816130C
	msgbox Route110_TrickHouseEntrance_Text_ConcealedBeneathCushion, MSGBOX_DEFAULT
	return

Route110_TrickHouseEnd_Movement_TrickMasterSpin:: @ 8161315
Route110_TrickHouseEntrance_Movement_TrickMasterSpin:: @ 8161315
	face_up
	delay_4
	face_left
	delay_4
	face_down
	delay_4
	face_right
	delay_4
	step_end

Route110_TrickHouseEnd_Movement_TrickMasterJumpAway:: @ 816131E
Route110_TrickHouseEntrance_Movement_TrickMasterJumpAway:: @ 816131E
	face_up
	disable_anim
	slide_up
	slide_up
	slide_up
	slide_up
	slide_up
	slide_up
	step_end

Route110_TrickHouseEntrance_EventScript_MeetTrickMaster:: @ 8161327
	msgbox Route110_TrickHouseEntrance_Text_TheyCallMeTrickMaster, MSGBOX_DEFAULT
	return

Route110_TrickHouseEntrance_EventScript_StillMakingPuzzle:: @ 8161330
	msgbox Route110_TrickHouseEntrance_Text_NextTimeUseThisTrick, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	playse SE_PIN
	applymovement 1, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 1, Common_Movement_Delay48
	waitmovement 0
	msgbox Route110_TrickHouseEntrance_Text_InMidstOfDevisingNewChallenges, MSGBOX_DEFAULT
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GiveReward:: @ 816136E
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox Route110_TrickHouseEntrance_Text_YoureHereToAcceptReward, MSGBOX_DEFAULT
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GivePuzzle1Reward
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GivePuzzle2Reward
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 3
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GivePuzzle3Reward
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 4
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GivePuzzle4Reward
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 5
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GivePuzzle5Reward
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 6
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GivePuzzle6Reward
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 7
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GivePuzzle7Reward
	end

Route110_TrickHouseEntrance_EventScript_GivePuzzle1Reward:: @ 81613CE
	giveitem ITEM_RARE_CANDY
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GotReward
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEntrance_Text_DidYouNotComeToClaimReward, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GivePuzzle2Reward:: @ 81613FA
	giveitem ITEM_TIMER_BALL
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GotReward
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEntrance_Text_DidYouNotComeToClaimReward, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GivePuzzle3Reward:: @ 8161426
	giveitem ITEM_HARD_STONE
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GotReward
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEntrance_Text_DidYouNotComeToClaimReward, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GivePuzzle4Reward:: @ 8161452
	giveitem ITEM_SMOKE_BALL
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GotReward
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEntrance_Text_DidYouNotComeToClaimReward, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GivePuzzle5Reward:: @ 816147E
	giveitem ITEM_TM12_TAUNT
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GotReward
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEntrance_Text_DidYouNotComeToClaimReward, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GivePuzzle6Reward:: @ 81614AA
	giveitem ITEM_MAGNET
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GotReward
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEntrance_Text_DidYouNotComeToClaimReward, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GivePuzzle7Reward:: @ 81614D6
	giveitem ITEM_PP_MAX
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_GotReward
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_BagIsFull
	msgbox Route110_TrickHouseEntrance_Text_DidYouNotComeToClaimReward, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GotReward:: @ 8161502
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_MechadollReward:: @ 8161518
	applymovement 1, Common_Movement_FacePlayer
	waitmovement 0
	msgbox Route110_TrickHouseEntrance_Text_MechadollWhichTent, MSGBOX_DEFAULT
	.ifdef SAPPHIRE
	givedecoration DECOR_BLUE_TENT
	.else
	givedecoration DECOR_RED_TENT
	.endif
	compare VAR_RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_ReceivedTent
	compare VAR_RESULT, 0
	call_if_eq Common_EventScript_NoRoomForDecor
	msgbox Route110_TrickHouseEntrance_Text_PCFullAgain, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_ReceivedTent:: @ 8161551
	msgbox Route110_TrickHouseEntrance_Text_ThenFarewell, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Route110_TrickHouseEntrance_Movement_16309F
	waitmovement 0
	applymovement 1, Route110_TrickHouseEntrance_Movement_TrickMasterSpin
	waitmovement 0
	playse SE_M_EXPLOSION
	applymovement 1, Route110_TrickHouseEntrance_Movement_TrickMasterJumpAway
	waitmovement 0
	removeobject 1
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_Door:: @ 816158A
	lockall
	switch VAR_TRICK_HOUSE_ENTRANCE_STATE_3
	case 0, Route110_TrickHouseEntrance_EventScript_ItsAScroll
	case 1, Route110_TrickHouseEntrance_EventScript_GoInHolePrompt
	case 4, Route110_TrickHouseEntrance_EventScript_LeftOnJourneyNote
	case 5, Route110_TrickHouseEntrance_EventScript_CheckLevelForMessage
	end

Route110_TrickHouseEntrance_EventScript_ItsAScroll:: @ 81615BD
	msgbox Route110_TrickHouseEntrance_Text_ItsAScroll, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_GoInHolePrompt:: @ 81615C7
	msgbox Route110_TrickHouseEntrance_Text_GoInHoleBehindScroll, MSGBOX_YESNO
	closemessage
	compare VAR_RESULT, YES
	goto_if_eq Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom:: @ 81615DD
	setmetatile 5, 1, METATILE_GenericBuilding_TrickHouse_Stairs_Down, 0
	special DrawWholeMapView
	delay 20
	applymovement LOCALID_PLAYER, Common_Movement_WalkUp
	waitmovement 0
	applymovement LOCALID_PLAYER, Route110_TrickHouseEntrance_Movement_EnterRoom
	waitmovement 0
	switch VAR_TRICK_HOUSE_ROOMS_COMPLETED
	case 0, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom1
	case 1, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom2
	case 2, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom3
	case 3, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom4
	case 4, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom5
	case 5, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom6
	case 6, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom7
	case 7, Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom8
	end

Route110_TrickHouseEntrance_Movement_EnterRoom:: @ 816165E
	set_invisible
	step_end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom1:: @ 8161660
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE1, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom2:: @ 816166B
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE2, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom3:: @ 8161676
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE3, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom4:: @ 8161681
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE4, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom5:: @ 816168C
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE5, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom6:: @ 8161697
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE6, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom7:: @ 81616A2
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE7, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_EnterPuzzleRoom8:: @ 81616AD
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE8, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_LeftOnJourneyNote:: @ 81616B8
	msgbox Route110_TrickHouseEntrance_Text_LeavingOnJourneyNote, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_CheckLevelForMessage:: @ 81616C2
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 8
	goto_if_eq Route110_TrickHouseEntrance_EventScript_LeftOnJourneyNote2
	msgbox Route110_TrickHouseEntrance_Text_ItsAScroll, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_LeftOnJourneyNote2:: @ 81616D7
	msgbox Route110_TrickHouseEntrance_Text_LeavingOnJourneyNote, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHousePuzzle_EventScript_Door:: @ 81616E1
	lockall
	switch VAR_TRICK_HOUSE_ROOMS_COMPLETED
	case 0, Route110_TrickHousePuzzle1_EventScript_Door
	case 1, Route110_TrickHousePuzzle2_EventScript_Door
	case 2, Route110_TrickHousePuzzle3_EventScript_Door
	case 3, Route110_TrickHousePuzzle4_EventScript_Door
	case 4, Route110_TrickHousePuzzle5_EventScript_Door
	case 5, Route110_TrickHousePuzzle6_EventScript_Door
	case 6, Route110_TrickHousePuzzle7_EventScript_Door
	case 7, Route110_TrickHousePuzzle8_EventScript_Door
	end

Route110_TrickHousePuzzle1_EventScript_Door:: @ 8161740
	compare VAR_TRICK_HOUSE_PUZZLE_1_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox UnknownString_819CAD1, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_1_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_Door:: @ 8161769
	compare VAR_TRICK_HOUSE_PUZZLE_2_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox Route110_TrickHousePuzzle1_Text_WroteSecretCodeLockOpened, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_2_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle3_EventScript_Door:: @ 8161792
	compare VAR_TRICK_HOUSE_PUZZLE_3_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox Route110_TrickHousePuzzle2_Text_WroteSecretCodeLockOpened, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_3_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle4_EventScript_Door:: @ 81617BB
	compare VAR_TRICK_HOUSE_PUZZLE_4_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox Route110_TrickHousePuzzle3_Text_WroteSecretCodeLockOpened, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_4_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle5_EventScript_Door:: @ 81617E4
	compare VAR_TRICK_HOUSE_PUZZLE_5_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox Route110_TrickHousePuzzle4_Text_WroteSecretCodeLockOpened, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_5_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle6_EventScript_Door:: @ 816180D
	compare VAR_TRICK_HOUSE_PUZZLE_6_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox Route110_TrickHousePuzzle5_Text_WroteSecretCodeLockOpened, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_6_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_Door:: @ 8161836
	compare VAR_TRICK_HOUSE_PUZZLE_7_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox Route110_TrickHousePuzzle6_Text_WroteSecretCodeLockOpened, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_7_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle8_EventScript_Door:: @ 816185F
	compare VAR_TRICK_HOUSE_PUZZLE_8_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle_EventScript_DoorLocked
	msgbox Route110_TrickHousePuzzle7_Text_WroteSecretCodeLockOpened, MSGBOX_DEFAULT
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_8_STATE, 2
	setmetatile 13, 1, METATILE_TrickHousePuzzle_Stairs_Down, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle_EventScript_DoorLocked:: @ 8161888
	msgbox Route110_TrickHousePuzzle_Text_DoorLockedWriteSecretCodeHere, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHousePuzzle1_EventScript_ReadScrollAgain:: @ 8161892
Route110_TrickHousePuzzle2_EventScript_ReadScrollAgain:: @ 8161892
Route110_TrickHousePuzzle3_EventScript_ReadScrollAgain:: @ 8161892
Route110_TrickHousePuzzle4_EventScript_ReadScrollAgain:: @ 8161892
Route110_TrickHousePuzzle5_EventScript_ReadScrollAgain:: @ 8161892
Route110_TrickHousePuzzle6_EventScript_ReadScrollAgain:: @ 8161892
Route110_TrickHousePuzzle7_EventScript_ReadScrollAgain:: @ 8161892
Route110_TrickHousePuzzle8_EventScript_ReadScrollAgain:: @ 8161892
	msgbox Route110_TrickHousePuzzle1_Text_SecretCodeOnIt, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHousePuzzle1_EventScript_FoundScroll:: @ 816189C
Route110_TrickHousePuzzle2_EventScript_FoundScroll:: @ 816189C
Route110_TrickHousePuzzle3_EventScript_FoundScroll:: @ 816189C
Route110_TrickHousePuzzle4_EventScript_FoundScroll:: @ 816189C
Route110_TrickHousePuzzle5_EventScript_FoundScroll:: @ 816189C
Route110_TrickHousePuzzle6_EventScript_FoundScroll:: @ 816189C
Route110_TrickHousePuzzle7_EventScript_FoundScroll:: @ 816189C
Route110_TrickHousePuzzle8_EventScript_FoundScroll:: @ 816189C
	playfanfare MUS_OBTAIN_ITEM
	message Route110_TrickHousePuzzle1_Text_FoundAScroll
	waitfanfare
	waitmessage
	msgbox Route110_TrickHousePuzzle1_Text_MemorizedTheCode, MSGBOX_DEFAULT
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_TrickMasterHiding:: @ 81618B0
	lockall
	msgbox Route110_TrickHouseEntrance_Text_YoureBeingWatched, MSGBOX_DEFAULT
	releaseall
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle1
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	call_if_eq Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle2
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	call_if_eq Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle3
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle1:: @ 81618E1
	setvar VAR_0x8004, 6
	setvar VAR_0x8005, 3
	setvar VAR_0x8006, 0
	call Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle
	return

Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle2:: @ 81618F6
	setvar VAR_0x8004, 11
	setvar VAR_0x8005, 5
	setvar VAR_0x8006, 0
	call Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle
	return

Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle3:: @ 816190B
	setvar VAR_0x8004, 9
	setvar VAR_0x8005, 2
	setvar VAR_0x8006, 0
	call Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle
	return

Route110_TrickHouseEntrance_EventScript_DoHidingSpotSparkle:: @ 8161920
	setfieldeffectargument 0, 32772
	setfieldeffectargument 1, 32773
	setfieldeffectargument 2, 32774
	dofieldeffect FLDEFF_SPARKLE
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	return
