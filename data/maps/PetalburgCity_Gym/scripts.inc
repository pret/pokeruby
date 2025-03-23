PetalburgCity_Gym_MapScripts:: @ 8154477
	map_script MAP_SCRIPT_ON_LOAD, PetalburgCity_Gym_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, PetalburgCity_Gym_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PetalburgCity_Gym_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PetalburgCity_Gym_OnFrame
	.byte 0

PetalburgCity_Gym_OnLoad:: @ 815448C
	compare VAR_PETALBURG_GYM_STATE, 6
	goto_if_eq PetalburgCity_Gym_EventScript_OpenUnlockedDoors
	compare VAR_PETALBURG_GYM_STATE, 7
	call_if_ge PetalburgCity_Gym_EventScript_UnlockAllDoors
	end

PetalburgCity_Gym_EventScript_OpenUnlockedDoors:: @ 81544A3
	setvar VAR_0x8005, 1
	call PetalburgCity_Gym_EventScript_OpenGymEntranceDoors
	call_if_defeated TRAINER_RANDALL, PetalburgCity_Gym_EventScript_OpenSpeedRoomDoors
	call_if_defeated TRAINER_MARY, PetalburgCity_Gym_EventScript_OpenAccuracyRoomDoors
	call_if_defeated TRAINER_PARKER, PetalburgCity_Gym_EventScript_OpenConfusionRoomDoors
	call_if_defeated TRAINER_LORI, PetalburgCity_Gym_EventScript_OpenDefenseRoomDoors
	call_if_defeated TRAINER_GEORGE, PetalburgCity_Gym_EventScript_OpenRecoveryRoomDoors
	call_if_defeated TRAINER_JODY, PetalburgCity_Gym_EventScript_OpenStrengthRoomDoors
	call_if_defeated TRAINER_BERKE, PetalburgCity_Gym_EventScript_OpenOHKORoomDoors
	end

PetalburgCity_Gym_EventScript_UnlockAllDoors:: @ 81544ED
	setvar VAR_0x8005, 1
	call PetalburgCity_Gym_EventScript_OpenGymEntranceDoors
	call PetalburgCity_Gym_EventScript_OpenSpeedRoomDoors
	call PetalburgCity_Gym_EventScript_OpenAccuracyRoomDoors
	call PetalburgCity_Gym_EventScript_OpenConfusionRoomDoors
	call PetalburgCity_Gym_EventScript_OpenDefenseRoomDoors
	call PetalburgCity_Gym_EventScript_OpenRecoveryRoomDoors
	call PetalburgCity_Gym_EventScript_OpenStrengthRoomDoors
	call PetalburgCity_Gym_EventScript_OpenOHKORoomDoors
	return

PetalburgCity_Gym_OnTransition:: @ 815451B
	compare VAR_PETALBURG_GYM_STATE, 1
	call_if_eq PetalburgCity_Gym_EventScript_15453B
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_lt PetalburgCity_Gym_EventScript_154543
	call_if_set FLAG_SYS_GAME_CLEAR, PetalburgCity_Gym_EventScript_15454B
	end

PetalburgCity_Gym_EventScript_15453B:: @ 815453B
	setobjectxyperm 10, 5, 108
	return

PetalburgCity_Gym_EventScript_154543:: @ 8154543
	setobjectxyperm 1, 4, 107
	return

PetalburgCity_Gym_EventScript_15454B:: @ 815454B
	setobjectxyperm 1, 4, 107
	return

PetalburgCity_Gym_OnWarp:: @ 8154553
	map_script_2 VAR_PETALBURG_GYM_STATE, 1, PetalburgCity_Gym_EventScript_TurnPlayerNorth
	.2byte 0

PetalburgCity_Gym_EventScript_TurnPlayerNorth:: @ 815455D
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

PetalburgCity_Gym_OnFrame:: @ 8154562
	map_script_2 VAR_PETALBURG_GYM_STATE, 1, PetalburgCity_Gym_EventScript_ReturnFromWallyTutorial
	.2byte 0

PetalburgCity_Gym_EventScript_ReturnFromWallyTutorial:: @ 815456C
	lockall
	msgbox PetalburgCity_Gym_Text_DadSoDidItWorkOut, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_WallyThankYouBye, MSGBOX_DEFAULT
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_WallyExitGym
	waitmovement 0
	playse SE_EXIT
	removeobject 10
	setflag FLAG_HIDE_WALLY_PETALBURG
	delay 30
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox PetalburgCity_Gym_Text_DadGoCollectBadges, MSGBOX_DEFAULT
	setvar VAR_PETALBURG_GYM_STATE, 2
	releaseall
	end

PetalburgCity_Gym_Movement_WallyExitGym:: @ 81545B4
	walk_down
	walk_down
	walk_down
	delay_16
	step_end

PetalburgCity_Gym_EventScript_Norman:: @ 81545B9
	lock
	faceplayer
	switch VAR_PETALBURG_GYM_STATE
	case 2, PetalburgCity_Gym_EventScript_NormanNoBadges
	case 3, PetalburgCity_Gym_EventScript_NormanOneBadge
	case 4, PetalburgCity_Gym_EventScript_NormanTwoBadges
	case 5, PetalburgCity_Gym_EventScript_NormanThreeBadges
	case 6, PetalburgCity_Gym_EventScript_NormanBattle
	case 7, PetalburgCity_Gym_EventScript_NormanPostBattle
	msgbox PetalburgCity_Gym_Text_DadYoureHereWithYourPokemon, MSGBOX_DEFAULT
	closemessage
	switch VAR_FACING
	case 1, PetalburgCity_Gym_EventScript_BeginWallyTutorialSouth
	case 2, PetalburgCity_Gym_EventScript_BeginWallyTutorialNorth
	case 3, PetalburgCity_Gym_EventScript_BeginWallyTutorialWest
	case 4, PetalburgCity_Gym_EventScript_BeginWallyTutorialEast
	end

PetalburgCity_Gym_EventScript_BeginWallyTutorialSouth:: @ 815463D
	setvar VAR_0x8008, 0
	goto PetalburgCity_Gym_EventScript_BeginWallyTutorial
	end

PetalburgCity_Gym_EventScript_BeginWallyTutorialNorth:: @ 8154648
	setvar VAR_0x8008, 1
	goto PetalburgCity_Gym_EventScript_BeginWallyTutorial
	end

PetalburgCity_Gym_EventScript_BeginWallyTutorialWest:: @ 8154653
	setvar VAR_0x8008, 2
	goto PetalburgCity_Gym_EventScript_BeginWallyTutorial
	end

PetalburgCity_Gym_EventScript_BeginWallyTutorialEast:: @ 815465E
	setvar VAR_0x8008, 3
	goto PetalburgCity_Gym_EventScript_BeginWallyTutorial
	end

PetalburgCity_Gym_EventScript_BeginWallyTutorial:: @ 8154669
	addobject 10
	playse SE_DOOR
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_WallyArriveSouth
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_WallyArriveNorth
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_WallyArriveWestEast
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_WallyArriveWestEast
	msgbox PetalburgCity_Gym_Text_WallyIdLikeAPokemon, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_DadOhYoureWallyRight, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_WallyIveNeverCaughtAPokemon, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_DadHmISee, MSGBOX_DEFAULT
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressPlayerSouth
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressPlayerNorth
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressPlayerWest
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressPlayerEast
	msgbox PetalburgCity_Gym_Text_DadPlayerGoWithWally, MSGBOX_DEFAULT
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressWallySouth
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressWallyNorth
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressWallyWest
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_NormanAddressWallyEast
	msgbox PetalburgCity_Gym_Text_IllLoanYouMyZigzagoon, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_WallyThankYouAndDadGivesPokeBall, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_WallyOhWowThankYou, MSGBOX_DEFAULT
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_NormanFaceDoorSouth
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_NormanFaceDoorNorth
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_NormanFaceDoorWest
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_NormanFaceDoorEast
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_WallyFacePlayer
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_WallyFaceDown
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_WallyFacePlayer
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_WallyFacePlayer
	msgbox PetalburgCity_Gym_Text_WouldYouReallyComeWithMe, MSGBOX_DEFAULT
	closemessage
	setflag FLAG_DONT_TRANSITION_MUSIC
	playbgm MUS_FOLLOW_ME, FALSE
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_ExitGymWithWallySouth
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_ExitGymWithWallyNorth
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_ExitGymWithWallyWest
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_ExitGymWithWallyEast
	removeobject 10
	setflag FLAG_HIDE_WALLY_MOM_PETALBURG_1
	setvar VAR_PETALBURG_GYM_STATE, 1
	setvar VAR_PETALBURG_STATE, 2
	clearflag FLAG_HIDE_WALLY_PETALBURG
	clearflag FLAG_HIDE_WALLY_PETALBURG_GYM
	setflag FLAG_HIDE_RIVAL_BIRCH_LAB
	special InitBirchState
	warp MAP_PETALBURG_CITY, 255, 15, 8
	waitstate
	release
	end

PetalburgCity_Gym_EventScript_WallyArriveSouth:: @ 81547EE
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_WallyArrive
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_WallyArriveNorth:: @ 8154800
	applymovement 10, PetalburgCity_Gym_Movement_WallyArriveNorth
	waitmovement 0
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_WallyArriveWestEast:: @ 815481C
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_WallyArrive
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_ExitGymWithWallySouth:: @ 8154835
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_WallyExitSouthWest
	applymovement OBJ_EVENT_ID_PLAYER, PetalburgCity_Gym_Movement_PlayerExitWithWallySouth
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_ExitGymWithWallyNorth:: @ 815484E
	applymovement 10, PetalburgCity_Gym_Movement_WallyExitNorth
	applymovement OBJ_EVENT_ID_PLAYER, PetalburgCity_Gym_Movement_PlayerExitWithWallyNorth
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_ExitGymWithWallyWest:: @ 8154860
	applymovement 10, PetalburgCity_Gym_Movement_WallyExitSouthWest
	applymovement OBJ_EVENT_ID_PLAYER, PetalburgCity_Gym_Movement_PlayerExitWithWallyWest
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_ExitGymWithWallyEast:: @ 8154872
	applymovement 10, PetalburgCity_Gym_Movement_WallyExitEast
	applymovement OBJ_EVENT_ID_PLAYER, PetalburgCity_Gym_Movement_PlayerExitWithWallyEast
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressPlayerSouth:: @ 8154884
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressPlayerNorth:: @ 815488F
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressPlayerWest:: @ 81548A1
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressPlayerEast:: @ 81548B3
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressWallySouth:: @ 81548C5
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressWallyNorth:: @ 81548D0
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressWallyWest:: @ 81548DB
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanAddressWallyEast:: @ 81548E6
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_WallyFacePlayer:: @ 81548F1
	applymovement 10, Common_Movement_FacePlayer
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_WallyFaceDown:: @ 81548FC
	applymovement 10, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanNoBadges:: @ 8154907
	msgbox PetalburgCity_Gym_Text_NormanGoToRustboro, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_NormanOneBadge:: @ 8154911
	msgbox PetalburgCity_Gym_Text_NormanGoToDewford, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_NormanTwoBadges:: @ 815491B
	msgbox PetalburgCity_Gym_Text_YouHaveGottenStronger, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_NormanThreeBadges:: @ 8154925
	msgbox PetalburgCity_Gym_Text_YouHaveGottenStronger, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_NormanFaceDoorSouth:: @ 815492F
	return

PetalburgCity_Gym_EventScript_NormanFaceDoorNorth:: @ 8154930
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_NormanFaceDoorWest:: @ 815493B
	return

PetalburgCity_Gym_EventScript_NormanFaceDoorEast:: @ 815493C
	return

PetalburgCity_Gym_EventScript_NormanPostBattle:: @ 815493D
	call PetalburgCity_Gym_EventScript_ShouldGiveEnigmaBerry
	compare VAR_RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_GiveEnigmaBerry
	goto_if_unset FLAG_RECEIVED_TM42, PetalburgCity_Gym_EventScript_GiveFacade2
	goto_if_set FLAG_SYS_GAME_CLEAR, PetalburgCity_Gym_EventScript_NoAmountOfTrainingIsEnough
	msgbox PetalburgCity_Gym_Text_DadGoingToKeepTraining, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_ShouldGiveEnigmaBerry:: @ 8154969
	specialvar VAR_RESULT, IsEnigmaBerryValid
	compare VAR_RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_DontGiveEnigmaBerry
	checkitem ITEM_ENIGMA_BERRY, 1
	compare VAR_RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_DontGiveEnigmaBerry
	checkpcitem ITEM_ENIGMA_BERRY, 1
	compare VAR_RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_DontGiveEnigmaBerry
	compare VAR_ENIGMA_BERRY_AVAILABLE, 0
	goto_if_eq PetalburgCity_Gym_EventScript_DontGiveEnigmaBerry
	msgbox PetalburgCity_Gym_Text_GiveEnigmaBerry, MSGBOX_DEFAULT
	setvar VAR_RESULT, 1
	return

PetalburgCity_Gym_EventScript_DontGiveEnigmaBerry:: @ 81549B2
	setvar VAR_RESULT, 0
	return

PetalburgCity_Gym_EventScript_GiveEnigmaBerry:: @ 81549B8
	giveitem ITEM_ENIGMA_BERRY
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setvar VAR_ENIGMA_BERRY_AVAILABLE, 0
	release
	end

PetalburgCity_Gym_EventScript_NormanBattle:: @ 81549D6
	msgbox PetalburgCity_Gym_Text_NormanIntro, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_NORMAN, PetalburgCity_Gym_Text_NormanDefeat
	message PetalburgCity_Gym_Text_ReceivedBalanceBadge
	waitmessage
	call Common_EventScript_PlayGymBadgeFanfare
	msgbox PetalburgCity_Gym_Text_ExplainBalanceBadgeTakeThis, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_PETALBURG_GYM
	setvar VAR_PETALBURG_GYM_STATE, 7
	setflag FLAG_BADGE05_GET
	call EventScript_HideMrBriney
	setflag FLAG_HIDE_WATTSON_MAUVILLE_GYM
	clearflag FLAG_HIDE_WATTSON_MAUVILLE
	setvar VAR_0x8008, 5
	call Common_EventScript_SetGymTrainers
	clearflag FLAG_HIDE_SLUDGE_BOMB_MAN_DEWFORD_HALL
	call PetalburgCity_Gym_EventScript_UnlockAllDoors
	special DrawWholeMapView
	goto PetalburgCity_Gym_EventScript_GiveFacade2
	end

PetalburgCity_Gym_EventScript_GiveFacade2:: @ 8154A2C
	giveitem ITEM_TM42_FACADE
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_TM42
	msgbox PetalburgCity_Gym_Text_ExplainFacade, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_DadHappyAndSad, MSGBOX_DEFAULT
	closemessage
	compare VAR_FACING, 2
	call_if_eq PetalburgCity_Gym_EventScript_154ABC
	compare VAR_FACING, 1
	call_if_eq PetalburgCity_Gym_EventScript_154AC7
	compare VAR_FACING, 3
	call_if_eq PetalburgCity_Gym_EventScript_154AD2
	compare VAR_FACING, 4
	call_if_eq PetalburgCity_Gym_EventScript_154ADD
	delay 70
	compare VAR_FACING, 2
	call_if_eq PetalburgCity_Gym_EventScript_154AE8
	compare VAR_FACING, 1
	call_if_eq PetalburgCity_Gym_EventScript_154AF3
	compare VAR_FACING, 3
	call_if_eq PetalburgCity_Gym_EventScript_154AFE
	compare VAR_FACING, 4
	call_if_eq PetalburgCity_Gym_EventScript_154B09
	msgbox PetalburgCity_Gym_Text_WallysParentsHaveGiftForYou, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_154ABC:: @ 8154ABC
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AC7:: @ 8154AC7
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AD2:: @ 8154AD2
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154ADD:: @ 8154ADD
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AE8:: @ 8154AE8
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AF3:: @ 8154AF3
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AFE:: @ 8154AFE
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154B09:: @ 8154B09
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

@ 8154B14
	walk_in_place_fastest_up
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_8
	walk_in_place_fastest_down
	step_end

PetalburgCity_Gym_Movement_WallyArriveNorth:: @ 8154B1D
	delay_16
	walk_up
	delay_16
	delay_8
	walk_up
	walk_right
	walk_up
	walk_up
	walk_in_place_fastest_left
	step_end

PetalburgCity_Gym_Movement_WallyArrive:: @ 8154B27
	delay_16
	walk_up
	delay_16
	delay_8
	walk_up
	walk_up
	step_end

PetalburgCity_Gym_Movement_WallyExitNorth:: @ 8154B2E
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_up
	delay_16
	walk_in_place_down
	step_end

PetalburgCity_Gym_Movement_WallyExitEast:: @ 8154B36
	walk_down
	walk_down
	walk_right
	walk_down
	walk_in_place_fastest_up
	delay_16
	walk_in_place_down
	step_end

PetalburgCity_Gym_Movement_WallyExitSouthWest:: @ 8154B3E
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_up
	delay_16
	walk_in_place_down
	step_end

PetalburgCity_Gym_Movement_PlayerExitWithWallyNorth:: @ 8154B45
	delay_16
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_Movement_PlayerExitWithWallySouth:: @ 8154B4D
	delay_16
	delay_16
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_Movement_PlayerExitWithWallyWest:: @ 8154B57
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_Movement_PlayerExitWithWallyEast:: @ 8154B5F
	walk_in_place_fastest_down
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	walk_right
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_EventScript_NoAmountOfTrainingIsEnough:: @ 8154B69
	msgbox PetalburgCity_Gym_Text_DadNoAmountOfTrainingIsEnough, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_SpeedRoomDoor:: @ 8154B73
	lockall
	compare VAR_PETALBURG_GYM_STATE, 6
	goto_if_lt PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 85
	msgbox PetalburgCity_Gym_Text_EnterSpeedRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_EnterRoom:: @ 8154BA8
	closemessage
	delay 30
	warpdoor MAP_PETALBURG_CITY_GYM, 255, 32776, 32777
	waitstate
	releaseall
	end

PetalburgCity_Gym_EventScript_DontEnterRoom:: @ 8154BB7
	releaseall
	end

PetalburgCity_Gym_EventScript_DoorLocked:: @ 8154BB9
	msgbox PetalburgCity_Gym_Text_DoorAppearsLocked, MSGBOX_DEFAULT
	releaseall
	end

PetalburgCity_Gym_EventScript_AccuracyRoomDoor:: @ 8154BC3
	lockall
	compare VAR_PETALBURG_GYM_STATE, 6
	goto_if_lt PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 98
	msgbox PetalburgCity_Gym_Text_EnterAccuracyRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_ZeroReductionRoomDoor:: @ 8154BF8
	lockall
	goto_if_not_defeated TRAINER_RANDALL, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 46
	msgbox PetalburgCity_Gym_Text_EnterZeroReductionRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_LeftDefenseRoomDoor:: @ 8154C2B
	lockall
	goto_if_not_defeated TRAINER_RANDALL, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 59
	msgbox PetalburgCity_Gym_Text_EnterDefenseRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_RightDefenseRoomDoor:: @ 8154C5E
	lockall
	goto_if_not_defeated TRAINER_MARY, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 59
	msgbox PetalburgCity_Gym_Text_EnterDefenseRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_RecoveryRoomDoor:: @ 8154C91
	lockall
	goto_if_not_defeated TRAINER_MARY, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 72
	msgbox PetalburgCity_Gym_Text_EnterRecoveryRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_LeftStrengthRoomDoor:: @ 8154CC4
	lockall
	goto_if_not_defeated TRAINER_PARKER, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 20
	msgbox PetalburgCity_Gym_Text_EnterStrengthRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_RightStrengthRoomDoor:: @ 8154CF7
	lockall
	goto_if_not_defeated TRAINER_LORI, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 20
	msgbox PetalburgCity_Gym_Text_EnterStrengthRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_LeftOHKORoomDoor:: @ 8154D2A
	lockall
	goto_if_not_defeated TRAINER_LORI, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 33
	msgbox PetalburgCity_Gym_Text_EnterOHKORoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_RightOHKORoomDoor:: @ 8154D5D
	lockall
	goto_if_not_defeated TRAINER_GEORGE, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 33
	msgbox PetalburgCity_Gym_Text_EnterOHKORoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_LeftGymLeadersRoomDoor:: @ 8154D90
	lockall
	goto_if_not_defeated TRAINER_JODY, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 7
	msgbox PetalburgCity_Gym_Text_EnterGymLeadersRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_RightGymLeadersRoomDoor:: @ 8154DC3
	lockall
	goto_if_not_defeated TRAINER_BERKE, PetalburgCity_Gym_EventScript_DoorLocked
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 7
	msgbox PetalburgCity_Gym_Text_EnterGymLeadersRoom, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_EnterRoom
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_DontEnterRoom
	end

PetalburgCity_Gym_EventScript_Randall:: @ 8154DF6
	trainerbattle_single TRAINER_RANDALL, PetalburgCity_Gym_Text_RandallIntro, PetalburgCity_Gym_Text_RandallDefeat, PetalburgCity_Gym_EventScript_SlideOpenSpeedRoomDoors
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_RandallPostBadge
	msgbox PetalburgCity_Gym_Text_RandallPostBattle, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_SlideOpenSpeedRoomDoors:: @ 8154E1A
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_OpenSpeedRoomDoors
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_RandallPostBadge:: @ 8154E29
	msgbox PetalburgCity_Gym_Text_RandallPostBadge, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_Parker:: @ 8154E32
	trainerbattle_single TRAINER_PARKER, PetalburgCity_Gym_Text_ParkerIntro, PetalburgCity_Gym_Text_ParkerDefeat, PetalburgCity_Gym_EventScript_SlideOpenConfusionRoomDoors
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_ParkerPostBadge
	msgbox PetalburgCity_Gym_Text_ParkerPostBattle, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_SlideOpenConfusionRoomDoors:: @ 8154E56
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_OpenConfusionRoomDoors
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_ParkerPostBadge:: @ 8154E65
	msgbox PetalburgCity_Gym_Text_ParkerPostBadge, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_George:: @ 8154E6E
	trainerbattle_single TRAINER_GEORGE, PetalburgCity_Gym_Text_GeorgeIntro, PetalburgCity_Gym_Text_GeorgeDefeat, PetalburgCity_Gym_EventScript_SlideOpenRecoveryRoomDoors
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_GeorgePostBadge
	msgbox PetalburgCity_Gym_Text_GeorgePostBattle, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_SlideOpenRecoveryRoomDoors:: @ 8154E92
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_OpenRecoveryRoomDoors
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_GeorgePostBadge:: @ 8154EA1
	msgbox PetalburgCity_Gym_Text_GeorgePostBadge, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_Berke:: @ 8154EAA
	trainerbattle_single TRAINER_BERKE, PetalburgCity_Gym_Text_BerkeIntro, PetalburgCity_Gym_Text_BerkeDefeat, PetalburgCity_Gym_EventScript_SlideOpenOHKORoomDoors
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_BerkePostBadge
	msgbox PetalburgCity_Gym_Text_BerkePostBattle, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_SlideOpenOHKORoomDoors:: @ 8154ECE
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_OpenOHKORoomDoors
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_BerkePostBadge:: @ 8154EDD
	msgbox PetalburgCity_Gym_Text_BerkePostBadge, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_Mary:: @ 8154EE6
	trainerbattle_single TRAINER_MARY, PetalburgCity_Gym_Text_MaryIntro, PetalburgCity_Gym_Text_MaryDefeat, PetalburgCity_Gym_EventScript_SlideOpenAccuracyRoomDoors
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_MaryPostBadge
	msgbox PetalburgCity_Gym_Text_MaryPostBattle, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_SlideOpenAccuracyRoomDoors:: @ 8154F0A
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_OpenAccuracyRoomDoors
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_MaryPostBadge:: @ 8154F19
	msgbox PetalburgCity_Gym_Text_MaryPostBadge, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_Lori:: @ 8154F22
	trainerbattle_single TRAINER_LORI, PetalburgCity_Gym_Text_LoriIntro, PetalburgCity_Gym_Text_LoriDefeat, PetalburgCity_Gym_EventScript_SlideOpenDefenseRoomDoors
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_LoriPostBadge
	msgbox PetalburgCity_Gym_Text_LoriPostBattle, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_SlideOpenDefenseRoomDoors:: @ 8154F46
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_OpenDefenseRoomDoors
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_LoriPostBadge:: @ 8154F55
	msgbox PetalburgCity_Gym_Text_LoriPostBadge, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_Jody:: @ 8154F5E
	trainerbattle_single TRAINER_JODY, PetalburgCity_Gym_Text_JodyIntro, PetalburgCity_Gym_Text_JodyDefeat, PetalburgCity_Gym_EventScript_SlideOpenStrengthRoomDoors
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_JodyPostBadge
	msgbox PetalburgCity_Gym_Text_JodiPostBattle, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_SlideOpenStrengthRoomDoors:: @ 8154F82
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_OpenStrengthRoomDoors
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_JodyPostBadge:: @ 8154F91
	msgbox PetalburgCity_Gym_Text_JodiPostBadge, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_OpenGymEntranceDoors:: @ 8154F9A
	setvar VAR_0x8004, 1
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetEntranceRoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_OpenSpeedRoomDoors:: @ 8154FBB
	setvar VAR_0x8004, 2
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetSpeedRoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_OpenAccuracyRoomDoors:: @ 8154FDC
	setvar VAR_0x8004, 3
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetAccuracyRoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_OpenConfusionRoomDoors:: @ 8154FFD
	setvar VAR_0x8004, 4
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetConfusionRoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_OpenDefenseRoomDoors:: @ 815501E
	setvar VAR_0x8004, 5
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetDefenseRoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_OpenRecoveryRoomDoors:: @ 815503F
	setvar VAR_0x8004, 6
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetRecoveryRoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_OpenStrengthRoomDoors:: @ 8155060
	setvar VAR_0x8004, 7
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetStrengthRoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_OpenOHKORoomDoors:: @ 8155081
	setvar VAR_0x8004, 8
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_SlideOpenRoomDoors
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_UnlockRoomDoors
	call PetalburgCity_Gym_EventScript_SetOHKORoomDoorMetatiles
	return

PetalburgCity_Gym_EventScript_SetEntranceRoomDoorMetatiles:: @ 81550A2
	setmetatile 6, 85, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 85, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 98, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 98, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SetSpeedRoomDoorMetatiles:: @ 81550C7
	setmetatile 6, 46, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 46, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 59, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 59, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SetAccuracyRoomDoorMetatiles:: @ 81550EC
	setmetatile 6, 59, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 59, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 72, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 72, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SetConfusionRoomDoorMetatiles:: @ 8155111
	setmetatile 1, 20, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 20, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SetDefenseRoomDoorMetatiles:: @ 8155124
	setmetatile 6, 20, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 20, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 33, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 33, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SetRecoveryRoomDoorMetatiles:: @ 8155149
	setmetatile 6, 33, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 33, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SetStrengthRoomDoorMetatiles:: @ 815515C
	setmetatile 1, 7, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 7, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SetOHKORoomDoorMetatiles:: @ 815516F
	setmetatile 6, 7, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 7, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_SlideOpenRoomDoors:: @ 8155182
	special PetalburgGymSlideOpenDoors
	waitstate
	return

PetalburgCity_Gym_EventScript_UnlockRoomDoors:: @ 8155187
	special PetalburgGymOpenDoorsInstantly
	return

PetalburgCity_Gym_EventScript_GymGuide:: @ 815518B
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_GymGuidePostVictory
	msgbox PetalburgCity_Gym_Text_GymGuideAdvice, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_GymGuidePostVictory:: @ 81551A0
	msgbox PetalburgCity_Gym_Text_GymGuidePostVictory, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_LeftGymStatue:: @ 81551AA
	lockall
	goto_if_set FLAG_BADGE05_GET, PetalburgCity_Gym_EventScript_GymStatueCertified
	goto PetalburgCity_Gym_EventScript_GymStatue
	end

PetalburgCity_Gym_EventScript_RightGymStatue:: @ 81551BA
	lockall
	goto_if_set FLAG_BADGE05_GET, PetalburgCity_Gym_EventScript_GymStatueCertified
	goto PetalburgCity_Gym_EventScript_GymStatue
	end

PetalburgCity_Gym_EventScript_GymStatueCertified:: @ 81551CA
	msgbox PetalburgCity_Gym_Text_GymStatueCertified, MSGBOX_DEFAULT
	releaseall
	end

PetalburgCity_Gym_EventScript_GymStatue:: @ 81551D4
	msgbox PetalburgCity_Gym_Text_GymStatue, MSGBOX_DEFAULT
	releaseall
	end
