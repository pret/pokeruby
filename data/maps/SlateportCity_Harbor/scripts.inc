SlateportCity_Harbor_MapScripts:: @ 8155F5D
	map_script MAP_SCRIPT_ON_TRANSITION, SlateportCity_Harbor_OnTransition
	.byte 0

SlateportCity_Harbor_OnTransition:: @ 8155F63
	setescapewarp MAP_SLATEPORT_CITY, 255, 28, 13
	setvar VAR_TEMP_1, 0
	compare VAR_SLATEPORT_HARBOR_STATE, 1
	call_if_eq SlateportCity_Harbor_EventScript_ReadyEvilTeamEscapeScene
	call_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_Harbor_EventScript_ShowSSTidal
	end

SlateportCity_Harbor_EventScript_ShowSSTidal:: @ 8155F85
	clearflag FLAG_HIDE_SS_TIDAL_SLATEPORT_HARBOR
	return

SlateportCity_Harbor_EventScript_ReadyEvilTeamEscapeScene:: @ 8155F89
	savebgm MUS_EVIL_TEAM
	setobjectxyperm 4, 12, 13
	setobjectmovementtype 4, 9
	setflag FLAG_HIDE_WORKERS_SLATEPORT_HARBOR
	return

SlateportCity_Harbor_EventScript_EvilTeamEscapeTrigger0:: @ 8155F9B
	lockall
	setvar VAR_0x8008, 0
	goto SlateportCity_Harbor_EventScript_EvilTeamEscapeScene
	end

SlateportCity_Harbor_EventScript_EvilTeamEscapeTrigger1:: @ 8155FA7
	lockall
	setvar VAR_0x8008, 1
	goto SlateportCity_Harbor_EventScript_EvilTeamEscapeScene
	end

SlateportCity_Harbor_EventScript_EvilTeamEscapeTrigger2:: @ 8155FB3
	lockall
	setvar VAR_0x8008, 2
	goto SlateportCity_Harbor_EventScript_EvilTeamEscapeScene
	end

SlateportCity_Harbor_EventScript_EvilTeamEscapeTrigger3:: @ 8155FBF
	lockall
	setvar VAR_0x8008, 3
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Harbor_Movement_PlayerWalkUp
	waitmovement 0
	goto SlateportCity_Harbor_EventScript_EvilTeamEscapeScene
	end

SlateportCity_Harbor_EventScript_EvilTeamEscapeScene:: @ 8155FD5
	applymovement 7, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox SlateportCity_Harbor_Text_YouAgainHideoutInLilycove, MSGBOX_DEFAULT
	closemessage
	applymovement 6, SlateportCity_Harbor_Movement_EvilTeamBoardSub
	applymovement 7, SlateportCity_Harbor_Movement_EvilTeamBoardSub
	applymovement 8, SlateportCity_Harbor_Movement_SubmarineExit
	waitmovement 0
	removeobject 6
	removeobject 7
	removeobject 8
	setvar VAR_SLATEPORT_HARBOR_STATE, 2
	compare VAR_0x8008, 0
	call_if_eq SlateportCity_Harbor_EventScript_SternApproachPlayer0
	compare VAR_0x8008, 1
	call_if_eq SlateportCity_Harbor_EventScript_SternApproachPlayer1
	compare VAR_0x8008, 2
	call_if_eq SlateportCity_Harbor_EventScript_SternApproachPlayer
	compare VAR_0x8008, 3
	call_if_eq SlateportCity_Harbor_EventScript_SternApproachPlayer
	msgbox SlateportCity_Harbor_Text_CaptSternWhyStealMySubmarine, MSGBOX_DEFAULT
	closemessage
	setflag FLAG_HIDE_GRUNT_1_BLOCKING_HIDEOUT
	setflag FLAG_HIDE_GRUNT_2_BLOCKING_HIDEOUT
	moveobjectoffscreen 4
	setobjectmovementtype 4, 10
	releaseall
	end

SlateportCity_Harbor_EventScript_SternApproachPlayer0:: @ 815605C
	applymovement 4, SlateportCity_Harbor_Movement_SternApproachPlayer0
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_SternApproachPlayer1:: @ 8156071
	applymovement 4, SlateportCity_Harbor_Movement_SternApproachPlayer1
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_SternApproachPlayer:: @ 8156086
	applymovement 4, SlateportCity_Harbor_Movement_SternApproachPlayer
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

SlateportCity_Harbor_Movement_EvilTeamBoardSub:: @ 815609B
	delay_16
	delay_16
	jump_up
	set_invisible
	step_end

@ 81560A0
	delay_16
	delay_16
	jump_up
	set_invisible
	step_end

SlateportCity_Harbor_Movement_SubmarineExit:: @ 81560A5
	delay_16
	delay_16
	delay_16
	delay_16
	walk_right
	walk_right
	walk_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	step_end

SlateportCity_Harbor_Movement_SternApproachPlayer0:: @ 81560B3
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	step_end

SlateportCity_Harbor_Movement_SternApproachPlayer1:: @ 81560B9
	walk_left
	walk_left
	walk_up
	walk_left
	step_end

SlateportCity_Harbor_Movement_SternApproachPlayer:: @ 81560BE
	walk_left
	walk_left
	walk_left
	step_end

SlateportCity_Harbor_Movement_PlayerWalkUp:: @ 81560C2
	walk_up
	step_end

SlateportCity_Harbor_EventScript_FerryAttendant:: @ 81560C4
	lock
	faceplayer
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_Harbor_EventScript_AskForTicket
	msgbox SlateportCity_Harbor_Text_FerryServiceUnavailable, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_AskForTicket:: @ 81560D9
	msgbox SlateportCity_Harbor_Text_MayISeeYourTicket, MSGBOX_DEFAULT
	checkitem ITEM_SS_TICKET, 1
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_NoTicket
	message SlateportCity_Harbor_Text_FlashedTicketWhereTo
	waitmessage
	goto SlateportCity_Harbor_EventScript_ChooseDestination
	end

SlateportCity_Harbor_EventScript_ChooseDestination:: @ 81560FD
	multichoicedefault 18, 6, 52, 2, 0
	switch VAR_RESULT
	case 0, SlateportCity_Harbor_EventScript_Lilycove
	case 1, SlateportCity_Harbor_EventScript_BattleTower
	case 2, SlateportCity_Harbor_EventScript_CancelDestinationSelect
	case 127, SlateportCity_Harbor_EventScript_CancelDestinationSelect
	end

SlateportCity_Harbor_EventScript_NoTicket:: @ 8156135
	msgbox SlateportCity_Harbor_Text_YouMustHaveTicket, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_Lilycove:: @ 815613F
	msgbox SlateportCity_Harbor_Text_LilycoveItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_ChooseNewDestination
	setvar VAR_PORTHOLE_STATE, 1
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_SS_TIDAL_CORRIDOR, 255, 1, 10
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_BattleTower:: @ 8156167
	msgbox SlateportCity_Harbor_Text_BattleTowerItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_ChooseNewDestination
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_BATTLE_TOWER_OUTSIDE, 255, 19, 23
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_ChooseNewDestination:: @ 815618A
	message SlateportCity_Harbor_Text_WhereWouldYouLikeToGo
	waitmessage
	goto SlateportCity_Harbor_EventScript_ChooseDestination
	end

SlateportCity_Harbor_EventScript_BoardFerry:: @ 8156196
	msgbox SlateportCity_Harbor_Text_PleaseBoardFerry, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 30
	hideobjectat VAR_LAST_TALKED, MAP_SLATEPORT_CITY_HARBOR
	compare VAR_FACING, 2
	call_if_eq SlateportCity_Harbor_EventScript_BoardFerryNorth
	compare VAR_FACING, 4
	call_if_eq SlateportCity_Harbor_EventScript_BoardFerryEast
	delay 30
	hideobjectat OBJ_EVENT_ID_PLAYER, MAP_PETALBURG_CITY
	setvar VAR_0x8004, 5
	call Common_EventScript_FerryDepart
	return

SlateportCity_Harbor_EventScript_CancelDestinationSelect:: @ 81561DA
	msgbox SlateportCity_Harbor_Text_SailAnotherTime, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_BoardFerryEast:: @ 81561E4
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Harbor_Movement_BoardFerryEast
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_BoardFerryNorth:: @ 81561EF
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Harbor_Movement_BoardFerryNorth
	waitmovement 0
	return

SlateportCity_Harbor_Movement_BoardFerryEast:: @ 81561FA
	walk_right
	walk_in_place_fastest_up
	step_end

SlateportCity_Harbor_Movement_BoardFerryNorth:: @ 81561FD
	walk_up
	step_end

SlateportCity_Harbor_EventScript_Sailor:: @ 81561FF
	msgbox SlateportCity_Harbor_Text_LoveToGoDeepUnderwaterSomeday, MSGBOX_NPC
	end

SlateportCity_Harbor_EventScript_FatMan:: @ 8156208
	msgbox SlateportCity_Harbor_Text_SubTooSmallForMe, MSGBOX_NPC
	end

SlateportCity_Harbor_EventScript_CaptStern:: @ 8156211
	lock
	faceplayer
	goto_if_set FLAG_BADGE07_GET, SlateportCity_Harbor_EventScript_CaptSternFerryOrScannerComment
	goto_if_set FLAG_EVIL_TEAM_ESCAPED_STERN_SPOKE, SlateportCity_Harbor_EventScript_NeedDive
	goto_if_set FLAG_EVIL_TEAM_ESCAPED_IN_SUBMARINE, SlateportCity_Harbor_EventScript_EvilTeamLeftNeedDive
	compare VAR_SLATEPORT_HARBOR_STATE, 2
	goto_if_eq SlateportCity_Harbor_EventScript_WhyStealSubmarine
	msgbox SlateportCity_Harbor_Text_SameThugsTriedToRobAtMuseum, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_Harbor_EventScript_WhyStealSubmarine:: @ 815624E
	msgbox SlateportCity_Harbor_Text_CaptSternWhyStealMySubmarine, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_EvilTeamLeftNeedDive:: @ 8156258
	setflag FLAG_EVIL_TEAM_ESCAPED_STERN_SPOKE
	msgbox SlateportCity_Harbor_Text_EvilTeamLeftNeedDive, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_NeedDive:: @ 8156265
	msgbox SlateportCity_Harbor_Text_NeedDiveToCatchSub, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_CaptSternFerryOrScannerComment:: @ 815626F
	compare VAR_TEMP_1, 1
	goto_if_eq SlateportCity_Harbor_EventScript_TradedScanner
	checkitem ITEM_SCANNER, 1
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_Harbor_EventScript_AskToTradeScanner
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_Harbor_EventScript_FerryFinished
	msgbox SlateportCity_Harbor_Text_WontBeLongBeforeWeFinishFerry, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_FerryFinished:: @ 815629D
	msgbox SlateportCity_Harbor_Text_FinishedMakingFerry, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_AskToTradeScanner:: @ 81562A7
	message SlateportCity_Harbor_Text_WouldYouTradeScanner
	waitmessage
	goto SlateportCity_Harbor_EventScript_ChooseScannerTrade
	end

SlateportCity_Harbor_EventScript_ChooseScannerTrade:: @ 81562B3
	multichoice 0, 0, 46, 0
	switch VAR_RESULT
	case 0, SlateportCity_Harbor_EventScript_DeepSeaTooth
	case 1, SlateportCity_Harbor_EventScript_DeepSeaScale
	case 2, SlateportCity_Harbor_EventScript_DeclineTrade
	case 127, SlateportCity_Harbor_EventScript_DeclineTrade
	end

SlateportCity_Harbor_EventScript_DeepSeaTooth:: @ 81562EA
	msgbox SlateportCity_Harbor_Text_TradeForDeepSeaTooth, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_ChooseDifferentTrade
	giveitem ITEM_DEEP_SEA_TOOTH
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	removeitem ITEM_SCANNER
	msgbox SlateportCity_Harbor_Text_HandedScannerToStern, MSGBOX_DEFAULT
	setflag FLAG_EXCHANGED_SCANNER
	goto SlateportCity_Harbor_EventScript_TradedScanner
	end

SlateportCity_Harbor_EventScript_DeepSeaScale:: @ 815632A
	msgbox SlateportCity_Harbor_Text_TradeForDeepSeaScale, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_ChooseDifferentTrade
	giveitem ITEM_DEEP_SEA_SCALE
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	removeitem ITEM_SCANNER
	msgbox SlateportCity_Harbor_Text_HandedScannerToStern, MSGBOX_DEFAULT
	setflag FLAG_EXCHANGED_SCANNER
	goto SlateportCity_Harbor_EventScript_TradedScanner
	end

SlateportCity_Harbor_EventScript_DeclineTrade:: @ 815636A
	msgbox SlateportCity_Harbor_Text_IfYouWantToTradeLetMeKnow, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_ChooseDifferentTrade:: @ 8156374
	message SlateportCity_Harbor_Text_WhichOneDoYouWant
	waitmessage
	goto SlateportCity_Harbor_EventScript_ChooseScannerTrade
	end

SlateportCity_Harbor_EventScript_TradedScanner:: @ 8156380
	setvar VAR_TEMP_1, 1
	msgbox SlateportCity_Harbor_Text_ThisWillHelpResearch, MSGBOX_DEFAULT
	release
	end
