DewfordTown_MapScripts:: @ 814DFF8
	map_script MAP_SCRIPT_ON_TRANSITION, DewfordTown_OnTransition
	.byte 0

DewfordTown_OnTransition:: @ 814DFFE
	setflag FLAG_VISITED_DEWFORD_TOWN
	end

DewfordTown_EventScript_Briney:: @ 814E002
	lock
	faceplayer
	goto_if_unset FLAG_DELIVERED_STEVEN_LETTER, DewfordTown_EventScript_ReturnToPetalburgPrompt
	message DewfordTown_Text_WhereAreWeBound
	waitmessage
	multichoicedefault 21, 6, 0, 2, 0
	switch VAR_RESULT
	case 0, DewfordTown_EventScript_ChoosePetalburg
	case 1, DewfordTown_EventScript_ChooseSlateport
	case 2, DewfordTown_EventScript_CancelSailSelect
	case 127, DewfordTown_EventScript_CancelSailSelect
	end

DewfordTown_EventScript_ChoosePetalburg:: @ 814E04B
	msgbox DewfordTown_Text_PetalburgWereSettingSail, MSGBOX_DEFAULT
	closemessage
	goto DewfordTown_EventScript_SailToPetalburg
	release
	end

DewfordTown_EventScript_ChooseSlateport:: @ 814E05B
	msgbox DewfordTown_Text_SlateportWereSettingSail, MSGBOX_DEFAULT
	closemessage
	goto DewfordTown_EventScript_SailToSlateport
	release
	end

DewfordTown_EventScript_CancelSailSelect:: @ 814E06B
	msgbox DewfordTown_Text_JustTellMeWhenYouNeedToSetSail, MSGBOX_DEFAULT
	closemessage
	release
	end

DewfordTown_EventScript_ReturnToPetalburgPrompt:: @ 814E076
	msgbox DewfordTown_Text_SetSailBackToPetalburg, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq DewfordTown_EventScript_SailBackToPetalburg
	msgbox DewfordTown_Text_GoDeliverIllBeWaiting, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_SailBackToPetalburg:: @ 814E093
	msgbox DewfordTown_Text_PetalburgWereSettingSail2, MSGBOX_DEFAULT
	closemessage
	goto DewfordTown_EventScript_SailToPetalburg
	end

DewfordTown_EventScript_Woman:: @ 814E0A2
	msgbox DewfordTown_Text_TinyIslandCommunity, MSGBOX_NPC
	end

DewfordTown_EventScript_TownSign:: @ 814E0AB
	msgbox DewfordTown_Text_TownSign, MSGBOX_SIGN
	end

DewfordTown_EventScript_GymSign:: @ 814E0B4
	msgbox DewfordTown_Text_GymSign, MSGBOX_SIGN
	end

DewfordTown_EventScript_HallSign:: @ 814E0BD
	msgbox DewfordTown_Text_HallSign, MSGBOX_SIGN
	end

DewfordTown_EventScript_OldRodFisherman:: @ 814E0C6
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_OLD_ROD, DewfordTown_EventScript_HowsFishing
	msgbox DewfordTown_Text_GettingItchToFish, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq DewfordTown_EventScript_GiveOldRod
	compare VAR_RESULT, NO
	goto_if_eq DewfordTown_EventScript_NotGettingItchToFish
	end

DewfordTown_EventScript_GiveOldRod:: @ 814E0F0
	msgbox DewfordTown_Text_GiveYouOneOfMyRods, MSGBOX_DEFAULT
	giveitem ITEM_OLD_ROD
	setflag FLAG_RECEIVED_OLD_ROD
	msgbox DewfordTown_Text_ThrowInFishingAdvice, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_NotGettingItchToFish:: @ 814E111
	msgbox DewfordTown_Text_ThatsTooBadThen, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_HowsFishing:: @ 814E11B
	message DewfordTown_Text_HowsYourFishing
	waitmessage
	multichoice 20, 8, 50, 1
	compare VAR_RESULT, 0
	goto_if_eq DewfordTown_EventScript_FishingExcellent
	compare VAR_RESULT, 1
	goto_if_eq DewfordTown_EventScript_FishingNotSoGood
	end

DewfordTown_EventScript_FishingExcellent:: @ 814E13D
	msgbox DewfordTown_Text_GreatHaulInSomeBigOnes, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_FishingNotSoGood:: @ 814E147
	msgbox DewfordTown_Text_FishingAdvice, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_SailToPetalburg:: @ 814E151
	call EventScript_BackupMrBrineyLocation
	setobjectpriority 2, MAP_DEWFORD_TOWN, 0
	setobjectpriority 255, MAP_DEWFORD_TOWN, 0
	applymovement 2, DewfordTown_Movement_BrineyBoardBoat
	waitmovement 0
	removeobject 2
	applymovement OBJ_EVENT_ID_PLAYER, DewfordTown_Movement_PlayerBoardBoat
	waitmovement 0
	hideobjectat OBJ_EVENT_ID_PLAYER, MAP_DEWFORD_TOWN
	call Common_EventScript_PlayBrineysBoatMusic
	applymovement 4, DewfordTown_Movement_SailToPetalburg
	applymovement OBJ_EVENT_ID_PLAYER, DewfordTown_Movement_SailToPetalburg
	waitmovement 0
	showobjectat OBJ_EVENT_ID_PLAYER, MAP_ROUTE104
	call Common_EventScript_StopBrineysBoatMusic
	applymovement OBJ_EVENT_ID_PLAYER, DewfordTown_Movement_ExitBoatPetalburg
	waitmovement 0
	showobjectat OBJ_EVENT_ID_PLAYER, MAP_ROUTE104
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	clearflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	hideobjectat 4, MAP_DEWFORD_TOWN
	setvar VAR_BOARD_BRINEY_BOAT_ROUTE104_STATE, 2
	resetobjectpriority OBJ_EVENT_ID_PLAYER, MAP_DEWFORD_TOWN
	warp MAP_ROUTE104_MR_BRINEYS_HOUSE, 255, 5, 4
	copyvar VAR_BRINEY_LOCATION, VAR_0x8008
	waitstate
	release
	end

DewfordTown_EventScript_SailToSlateport:: @ 814E1D8
	call EventScript_BackupMrBrineyLocation
	setobjectpriority 2, MAP_DEWFORD_TOWN, 0
	setobjectpriority 255, MAP_DEWFORD_TOWN, 1
	applymovement 2, DewfordTown_Movement_BrineyBoardBoat
	waitmovement 0
	removeobject 2
	applymovement OBJ_EVENT_ID_PLAYER, DewfordTown_Movement_PlayerBoardBoat
	waitmovement 0
	hideobjectat OBJ_EVENT_ID_PLAYER, MAP_DEWFORD_TOWN
	call Common_EventScript_PlayBrineysBoatMusic
	applymovement 4, DewfordTown_Movement_SailToSlateport
	applymovement OBJ_EVENT_ID_PLAYER, DewfordTown_Movement_SailToSlateport
	waitmovement 0
	call Common_EventScript_StopBrineysBoatMusic
	showobjectat OBJ_EVENT_ID_PLAYER, MAP_ROUTE109
	applymovement OBJ_EVENT_ID_PLAYER, DewfordTown_Movement_ExitBoatSlateport
	waitmovement 0
	setobjectxyperm 2, 21, 26
	addobject 2
	setobjectpriority 2, MAP_ROUTE109, 0
	applymovement 2, DewfordTown_Movement_BrineyExitBoat
	waitmovement 0
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE109
	addobject 1
	clearflag FLAG_HIDE_MR_BRINEY_BOAT_ROUTE109
	setflag FLAG_HIDE_MR_BRINEY_BOAT_DEWFORD
	hideobjectat 4, MAP_DEWFORD_TOWN
	call_if_unset FLAG_DELIVERED_DEVON_GOODS, DewfordTown_EventScript_LandedSlateportDeliverGoods
	call_if_set FLAG_DELIVERED_DEVON_GOODS, DewfordTown_EventScript_LandedSlateport
	closemessage
	copyvar VAR_BRINEY_LOCATION, VAR_0x8008
	resetobjectpriority OBJ_EVENT_ID_PLAYER, MAP_DEWFORD_TOWN
	resetobjectpriority 2, MAP_ROUTE109
	moveobjectoffscreen 2
	release
	end

DewfordTown_EventScript_LandedSlateportDeliverGoods:: @ 814E281
	msgbox DewfordTown_Text_BrineyLandedInSlateportDeliverGoods, MSGBOX_DEFAULT
	return

DewfordTown_EventScript_LandedSlateport:: @ 814E28A
	msgbox DewfordTown_Text_BrineyLandedInSlateport, MSGBOX_DEFAULT
	return

DewfordTown_Movement_SailToPetalburg:: @ 814E293
	walk_up
	walk_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_up
	walk_up
	walk_left
	walk_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_left
	walk_fast_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fastest_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

DewfordTown_Movement_SailToSlateport:: @ 814E356
	walk_right
	walk_fast_right
	walk_fast_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fastest_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fastest_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	step_end

DewfordTown_Movement_PlayerBoardBoat:: @ 814E402
	walk_right
	walk_up
	step_end

DewfordTown_Movement_ExitBoatPetalburg:: @ 814E405
	walk_up
	walk_up
	walk_up
	step_end

DewfordTown_Movement_ExitBoatSlateport:: @ 814E409
	walk_up
	walk_up
	walk_up
	walk_in_place_fastest_down
	step_end

DewfordTown_Movement_BrineyBoardBoat:: @ 814E40E
	walk_up
	step_end

DewfordTown_Movement_BrineyExitBoat:: @ 814E410
	walk_up
	walk_up
	step_end

DewfordTown_EventScript_TrendyPhraseBoy:: @ 814E413
	lock
	faceplayer
	call Common_EventScript_BufferTrendyPhrase
	msgbox DewfordTown_Text_XIsTheBiggestHappeningThingRight, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq DewfordTown_EventScript_ConfirmTrendyPhrase
	compare VAR_RESULT, NO
	goto_if_eq DewfordTown_EventScript_RejectTrendyPhrase
	end

DewfordTown_EventScript_ConfirmTrendyPhrase:: @ 814E439
	msgbox DewfordTown_Text_YeahDefinitionOfInRightNow, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_RejectTrendyPhrase:: @ 814E443
	msgbox DewfordTown_Text_TellMeWhatsNewAndIn, MSGBOX_DEFAULT
	setvar VAR_0x8004, 9
	call Common_EventScript_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_RESULT, 1
	goto_if_eq DewfordTown_EventScript_GiveNewTrendyPhrase
	compare VAR_RESULT, 0
	goto_if_eq DewfordTown_EventScript_CancelNewTrendyPhrase
	end

DewfordTown_EventScript_GiveNewTrendyPhrase:: @ 814E46E
	incrementgamestat GAME_STAT_STARTED_TRENDS
	compare VAR_0x8004, 0
	goto_if_eq DewfordTown_EventScript_PhraseNotTrendyEnough
	msgbox DewfordTown_Text_OfCourseIKnowAboutThat, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_CancelNewTrendyPhrase:: @ 814E485
	msgbox DewfordTown_Text_HearOfAnyTrendsComeShareWithMe, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_PhraseNotTrendyEnough:: @ 814E48F
	msgbox DewfordTown_Text_XHuhIThinkYIsCool, MSGBOX_DEFAULT
	release
	end

DewfordTown_EventScript_PinnacleOfCool:: @ 814E499
	msgbox DewfordTown_Text_PinnacleOfCool, MSGBOX_DEFAULT
	release
	end
