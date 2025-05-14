LilycoveCity_Harbor_MapScripts:: @ 8159893
	map_script MAP_SCRIPT_ON_TRANSITION, LilycoveCity_Harbor_OnTransition
	.byte 0

LilycoveCity_Harbor_OnTransition:: @ 8159899
	setescapewarp MAP_LILYCOVE_CITY, 255, 12, 33
	end

LilycoveCity_Harbor_EventScript_FerryAttendant:: @ 81598A2
	lock
	faceplayer
	checkitem ITEM_EON_TICKET, 1
	compare VAR_RESULT, 1
	goto_if_eq LilycoveCity_Harbor_EventScript_FerryAttendantLocationAndBoarding
	goto LilycoveCity_Harbor_EventScript_FerryUnavailable
	end

LilycoveCity_Harbor_EventScript_FerryUnavailable:: @ 81598BA
	goto_if_set FLAG_SYS_GAME_CLEAR, LilycoveCity_Harbor_EventScript_NoFirstTimeEventTickets
	msgbox LilycoveCity_Harbor_Text_FerryUnavailable, MSGBOX_DEFAULT
	release
	end

LilycoveCity_Harbor_EventScript_NoFirstTimeEventTickets:: @ 81598CD
	msgbox LilycoveCity_Harbor_Text_MayISeeYourTicket, MSGBOX_DEFAULT
	checkitem ITEM_SS_TICKET, 1
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_Harbor_EventScript_NoTicket
	message LilycoveCity_Harbor_Text_FlashTicketWhereTo
	waitmessage
	goto LilycoveCity_Harbor_EventScript_FerryRegularLocationSelect
	end

LilycoveCity_Harbor_EventScript_FerryRegularLocationSelect:: @ 81598F1
	multichoicedefault 18, 6, 56, 2, 0
	switch VAR_RESULT
	case 0, LilycoveCity_Harbor_EventScript_GoToSlateport
	case 1, LilycoveCity_Harbor_EventScript_GoToBattleTower
	case 2, LilycoveCity_Harbor_EventScript_ExitSailSelect
	case 127, LilycoveCity_Harbor_EventScript_ExitSailSelect
	end

LilycoveCity_Harbor_EventScript_NoTicket:: @ 8159929
	msgbox LilycoveCity_Harbor_Text_NoTicket, MSGBOX_DEFAULT
	release
	end

LilycoveCity_Harbor_EventScript_GoToSlateport:: @ 8159933
	msgbox LilycoveCity_Harbor_Text_SlateportItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_PORTHOLE_STATE, 5
	call LilycoveCity_Harbor_EventScript_BoardFerry
	warp MAP_SS_TIDAL_CORRIDOR, 255, 1, 10
	waitstate
	release
	end

LilycoveCity_Harbor_EventScript_GoToBattleTower:: @ 815995B
	msgbox LilycoveCity_Harbor_Text_BattleTowerItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_Harbor_EventScript_FerryDestinationChangeMind
	call LilycoveCity_Harbor_EventScript_BoardFerry
	warp MAP_BATTLE_TOWER_OUTSIDE, 255, 19, 23
	waitstate
	release
	end

LilycoveCity_Harbor_EventScript_FerryDestinationChangeMind:: @ 815997E
	message LilycoveCity_Harbor_Text_WhereWouldYouLikeToGo
	waitmessage
	goto LilycoveCity_Harbor_EventScript_FerryRegularLocationSelect
	end

LilycoveCity_Harbor_EventScript_BoardFerry:: @ 815998A
	msgbox LilycoveCity_Harbor_Text_PleaseBoard, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 30
	hideobjectat VAR_LAST_TALKED, MAP_LILYCOVE_CITY_HARBOR
	compare VAR_FACING, 2
	call_if_eq LilycoveCity_Harbor_EventScript_PlayerBoardFerryNorth
	compare VAR_FACING, 4
	call_if_eq LilycoveCity_Harbor_EventScript_PlayerBoardFerryEast
	delay 30
	hideobjectat LOCALID_PLAYER, MAP_PETALBURG_CITY
	setvar VAR_0x8004, 2
	call Common_EventScript_FerryDepart
	return

LilycoveCity_Harbor_EventScript_PlayerBoardFerryEast:: @ 81599CE
	applymovement LOCALID_PLAYER, LilycoveCity_Harbor_Movement_PlayerBoardFerryEast
	waitmovement 0
	return

LilycoveCity_Harbor_EventScript_PlayerBoardFerryNorth:: @ 81599D9
	applymovement LOCALID_PLAYER, LilycoveCity_Harbor_Movement_PlayerBoardFerryNorth
	waitmovement 0
	return

LilycoveCity_Harbor_EventScript_ExitSailSelect:: @ 81599E4
	msgbox LilycoveCity_Harbor_Text_SailAnotherTime, MSGBOX_DEFAULT
	release
	end

LilycoveCity_Harbor_EventScript_FerryAttendantLocationAndBoarding:: @ 81599EE
	goto_if_unset FLAG_SYS_GAME_CLEAR, LilycoveCity_Harbor_EventScript_FerryUnavailable
	goto_if_set FLAG_ENCOUNTERED_LATIAS_OR_LATIOS, LilycoveCity_Harbor_EventScript_FerryUnavailable
	goto_if_unset FLAG_SYS_HAS_EON_TICKET, LilycoveCity_Harbor_EventScript_FerryUnavailable
	msgbox EventTicket_Text_ThatPass, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 30
	hideobjectat VAR_LAST_TALKED, MAP_LILYCOVE_CITY_HARBOR
	delay 60
	addobject 4
	delay 30
	applymovement 4, Common_Movement_FacePlayer
	waitmovement 0
	msgbox EventTicket_Text_ShowEonTicket, MSGBOX_DEFAULT
	closemessage
	applymovement 4, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 30
	removeobject 4
	compare VAR_FACING, 2
	call_if_eq LilycoveCity_Harbor_EventScript_PlayerBoardFerryNorth
	compare VAR_FACING, 4
	call_if_eq LilycoveCity_Harbor_EventScript_PlayerBoardFerryEast
	delay 30
	hideobjectat LOCALID_PLAYER, MAP_PETALBURG_CITY
	special ScrSpecial_HealPlayerParty
	setvar VAR_0x8004, 2
	call Common_EventScript_FerryDepart
	warp MAP_SOUTHERN_ISLAND_EXTERIOR, 255, 13, 22
	waitstate
	release
	end

LilycoveCity_Harbor_Movement_PlayerBoardFerryEast:: @ 8159A86
	walk_right
	walk_in_place_fastest_up
	step_end

LilycoveCity_Harbor_Movement_PlayerBoardFerryNorth:: @ 8159A89
	walk_up
	step_end

LilycoveCity_Harbor_Movement_UnusedBoardFerry:: @ 8159A8B
	walk_up
	step_end

LilycoveCity_Harbor_EventScript_Sailor:: @ 8159A8D
	lock
	faceplayer
	goto_if_set FLAG_SYS_GAME_CLEAR, LilycoveCity_Harbor_EventScript_SailorFerryAvailable
	msgbox LilycoveCity_Harbor_Text_SailorFerryUnavailable, MSGBOX_DEFAULT
	release
	end

LilycoveCity_Harbor_EventScript_SailorFerryAvailable:: @ 8159AA2
	msgbox LilycoveCity_Harbor_Text_SailorFerryAvailable, MSGBOX_DEFAULT
	release
	end
