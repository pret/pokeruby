MauvilleCity_MapScripts:: @ 814C032
	map_script MAP_SCRIPT_ON_TRANSITION, MauvilleCity_OnTransition
	.byte 0

MauvilleCity_OnTransition:: @ 814C038
	setflag FLAG_VISITED_MAUVILLE_CITY
	clearflag FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	setflag FLAG_SYS_TV_START
	clearflag FLAG_MAUVILLE_GYM_BARRIERS_STATE
	setvar VAR_MAUVILLE_GYM_STATE, 0
	call_if_set FLAG_GOT_TM_THUNDERBOLT_FROM_WATTSON, MauvilleCity_EventScript_MoveWattsonBackToGym
	end

MauvilleCity_EventScript_MoveWattsonBackToGym:: @ 814C053
	clearflag FLAG_HIDE_WATTSON_MAUVILLE_GYM
	setflag FLAG_HIDE_WATTSON_MAUVILLE
	return

MauvilleCity_EventScript_Boy:: @ 814C05A
	msgbox MauvilleCity_Text_NurseHurtMonBackToHealth, MSGBOX_NPC
	end

MauvilleCity_EventScript_Maniac:: @ 814C063
	msgbox MauvilleCity_Text_AllSortsOfPeopleComeThrough, MSGBOX_NPC
	end

MauvilleCity_EventScript_Woman:: @ 814C06C
	msgbox MauvilleCity_Text_RydelVeryGenerous, MSGBOX_NPC
	end

MauvilleCity_EventScript_RichBoy:: @ 814C075
	msgbox MauvilleCity_Text_PokemonCanJumpYouOnBike, MSGBOX_NPC
	end

MauvilleCity_EventScript_CitySign:: @ 814C07E
	msgbox MauvilleCity_Text_CitySign, MSGBOX_SIGN
	end

MauvilleCity_EventScript_GymSign:: @ 814C087
	msgbox MauvilleCity_Text_GymSign, MSGBOX_SIGN
	end

MauvilleCity_EventScript_BikeShopSign:: @ 814C090
	msgbox MauvilleCity_Text_BikeShopSign, MSGBOX_SIGN
	end

MauvilleCity_EventScript_GameCornerSign:: @ 814C099
	msgbox MauvilleCity_Text_GameCornerSign, MSGBOX_SIGN
	end

MauvilleCity_EventScript_SchoolKidM:: @ 814C0A2
	lock
	faceplayer
	goto_if_set FLAG_TV_EXPLAINED, MauvilleCity_EventScript_TVExplained
	msgbox MauvilleCity_Text_ExplainTV, MSGBOX_DEFAULT
	setflag FLAG_TV_EXPLAINED
	release
	end

MauvilleCity_EventScript_TVExplained:: @ 814C0BA
	msgbox MauvilleCity_Text_BeenCheckingOutTV, MSGBOX_DEFAULT
	release
	end

MauvilleCity_EventScript_WallysUncle:: @ 814C0C4
	lock
	faceplayer
	goto_if_set FLAG_DECLINED_WALLY_BATTLE_MAUVILLE, MauvilleCity_EventScript_UncleAskPlayerToBattleWally
	msgbox MauvilleCity_Text_UncleHesTooPeppy, MSGBOX_DEFAULT
	closemessage
	applymovement 7, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

MauvilleCity_EventScript_UncleAskPlayerToBattleWally:: @ 814C0E4
	msgbox MauvilleCity_Text_UncleCanYouBattleWally, MSGBOX_DEFAULT
	closemessage
	applymovement 7, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

MauvilleCity_EventScript_Wally:: @ 814C0F9
	lockall
	goto_if_set FLAG_DECLINED_WALLY_BATTLE_MAUVILLE, MauvilleCity_EventScript_WallyRequestBattleAgain
	applymovement 6, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox MauvilleCity_Text_WallyWantToChallengeGym, MSGBOX_DEFAULT
	msgbox MauvilleCity_Text_UncleYourePushingIt, MSGBOX_DEFAULT
	msgbox MauvilleCity_Text_WallyWeCanBeatAnyone, MSGBOX_DEFAULT
	applymovement 6, Common_Movement_FacePlayer
	waitmovement 0
	playse SE_PIN
	applymovement 6, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 6, Common_Movement_Delay48
	waitmovement 0
	msgbox MauvilleCity_Text_WallyWillYouBattleMe, MSGBOX_YESNO
	goto MauvilleCity_EventScript_BattleWallyPrompt
	end

MauvilleCity_EventScript_BattleWallyPrompt:: @ 814C154
	compare VAR_RESULT, YES
	call_if_eq MauvilleCity_EventScript_BattleWally
	compare VAR_RESULT, NO
	goto_if_eq MauvilleCity_EventScript_DeclineWallyBattle
	closemessage
	switch VAR_FACING
	case 2, MauvilleCity_EventScript_WallyAndUncleExitNorth
	case 4, MauvilleCity_EventScript_WallyAndUncleExitEast
	end

MauvilleCity_EventScript_WallyAndUncleExitNorth:: @ 814C187
	applymovement 6, MauvilleCity_Movement_WallyExitNorth1
	applymovement 7, MauvilleCity_Movement_WallysUncleExitNorth1
	waitmovement 0
	applymovement 6, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 30
	applymovement 7, MauvilleCity_Movement_WallysUncleApproachPlayerNorth
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox MauvilleCity_Text_UncleVisitUsSometime, MSGBOX_DEFAULT
	closemessage
	applymovement 6, MauvilleCity_Movement_WallyExitNorth2
	applymovement 7, MauvilleCity_Movement_WallysUncleExitNorth2
	waitmovement 0
	goto MauvilleCity_EventScript_DefeatedWally
	end

MauvilleCity_EventScript_WallyAndUncleExitEast:: @ 814C1D9
	applymovement 6, MauvilleCity_Movement_WallyExitEast1
	applymovement 7, MauvilleCity_Movement_WallysUncleExitEast1
	waitmovement 0
	applymovement 6, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 30
	applymovement 7, MauvilleCity_Movement_WallysUncleApproachPlayerEast
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox MauvilleCity_Text_UncleVisitUsSometime, MSGBOX_DEFAULT
	closemessage
	applymovement 6, MauvilleCity_Movement_WallyExitEast2
	applymovement 7, MauvilleCity_Movement_WallysUncleExitEast2
	waitmovement 0
	goto MauvilleCity_EventScript_DefeatedWally
	end

MauvilleCity_EventScript_DefeatedWally:: @ 814C22B
	removeobject 6
	removeobject 7
	clearflag FLAG_HIDE_WALLY_WANDAS_HOUSE
	clearflag FLAG_HIDE_WALLY_FATHER_WANDAS_HOUSE
	setflag FLAG_DEFEATED_WALLY_MAUVILLE
	releaseall
	end

MauvilleCity_EventScript_BattleWally:: @ 814C23C
	msgbox MauvilleCity_Text_WallyHereICome, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_WALLY_2, MauvilleCity_Text_WallyDefeat
	applymovement 6, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox MauvilleCity_Text_WallyIllGoBackToVerdanturf, MSGBOX_DEFAULT
	applymovement 6, Common_Movement_FacePlayer
	waitmovement 0
	msgbox MauvilleCity_Text_ThankYouNotEnoughToBattle, MSGBOX_DEFAULT
	applymovement 6, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox MauvilleCity_Text_UncleNoNeedToBeDown, MSGBOX_DEFAULT
	return

MauvilleCity_EventScript_DeclineWallyBattle:: @ 814C285
	setflag FLAG_DECLINED_WALLY_BATTLE_MAUVILLE
	msgbox MauvilleCity_Text_WallyMyUncleWontKnowImStrong, MSGBOX_DEFAULT
	release
	end

MauvilleCity_EventScript_WallyRequestBattleAgain:: @ 814C292
	applymovement 6, Common_Movement_FacePlayer
	waitmovement 0
	msgbox MauvilleCity_Text_WallyPleaseBattleMe, MSGBOX_YESNO
	goto MauvilleCity_EventScript_BattleWallyPrompt
	end

MauvilleCity_Movement_WallyExitNorth1:: @ 814C2AA
	walk_left
	walk_left
	walk_down
	walk_down
	walk_left
	step_end

MauvilleCity_Movement_WallyExitEast1:: @ 814C2B0
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	step_end

MauvilleCity_Movement_WallyExitNorth2:: @ 814C2B6
	delay_16
	delay_16
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

MauvilleCity_Movement_WallyExitEast2:: @ 814C2C1
	delay_16
	delay_16
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

MauvilleCity_Movement_WallysUncleExitNorth1:: @ 814C2CC
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	step_end

MauvilleCity_Movement_WallysUncleExitEast1:: @ 814C2D2
	walk_left
	walk_down
	walk_down
	walk_left
	walk_left
	step_end

MauvilleCity_Movement_WallysUncleApproachPlayerNorth:: @ 814C2D8
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

MauvilleCity_Movement_WallysUncleApproachPlayerEast:: @ 814C2DC
	walk_right
	walk_up
	step_end

MauvilleCity_Movement_WallysUncleExitNorth2:: @ 814C2DF
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

MauvilleCity_Movement_WallysUncleExitEast2:: @ 814C2E8
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

MauvilleCity_EventScript_Wattson:: @ 814C2F2
	lock
	faceplayer
	goto_if_set FLAG_GOT_TM_THUNDERBOLT_FROM_WATTSON, MauvilleCity_EventScript_ReceivedThunderbolt
	compare VAR_NEW_MAUVILLE_STATE, 2
	goto_if_eq MauvilleCity_EventScript_CompletedNewMauville
	goto_if_set FLAG_RECEIVED_BASEMENT_KEY, MauvilleCity_EventScript_BegunNewMauville
	msgbox MauvilleCity_Text_WattsonNeedFavorTakeKey, MSGBOX_DEFAULT
	giveitem ITEM_BASEMENT_KEY
	setflag FLAG_RECEIVED_BASEMENT_KEY
	msgbox MauvilleCity_Text_WattsonWontBeChallenge, MSGBOX_DEFAULT
	release
	end

MauvilleCity_EventScript_BegunNewMauville:: @ 814C332
	msgbox MauvilleCity_Text_WattsonWontBeChallenge, MSGBOX_DEFAULT
	release
	end

MauvilleCity_EventScript_CompletedNewMauville:: @ 814C33C
	msgbox MauvilleCity_Text_WattsonThanksTakeTM, MSGBOX_DEFAULT
	giveitem ITEM_TM24_THUNDERBOLT
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_GOT_TM_THUNDERBOLT_FROM_WATTSON
	msgbox MauvilleCity_Text_WattsonYoungTakeCharge, MSGBOX_DEFAULT
	release
	end

MauvilleCity_EventScript_ReceivedThunderbolt:: @ 814C368
	msgbox MauvilleCity_Text_WattsonYoungTakeCharge, MSGBOX_DEFAULT
	release
	end
