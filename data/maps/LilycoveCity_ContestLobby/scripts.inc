LilycoveCity_ContestLobby_MapScripts:: @ 8158866
	map_script MAP_SCRIPT_ON_TRANSITION, LilycoveCity_ContestLobby_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LilycoveCity_ContestLobby_OnFrame
	.byte 0

LilycoveCity_ContestLobby_OnTransition:: @ 8158871
	call LilycoveCity_ContestLobby_EventScript_TryShowContestReporter
	end

LilycoveCity_ContestLobby_OnFrame:: @ 8158877
	map_script_2 VAR_LILYCOVE_CONTEST_LOBBY_STATE, 1, LilycoveCity_ContestLobby_EventScript_TryDoContestArtist
	map_script_2 VAR_LILYCOVE_CONTEST_LOBBY_STATE, 2, LilycoveCity_ContestLobby_EventScript_TryDoLinkContestArtist
	.2byte 0

LilycoveCity_ContestLobby_EventScript_TryDoContestArtist:: @ 8158889
	goto_if_set FLAG_HIDE_LILYCOVE_MUSEUM_CURATOR, LilycoveCity_ContestLobby_EventScript_ContestArtist
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	end

LilycoveCity_ContestLobby_EventScript_ContestArtist:: @ 8158898
	lockall
	addobject 4
	applymovement 4, LilycoveCity_ContestLobby_Movement_ArtistApproachPlayer
	waitmovement 4
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_PlayerFaceArtist
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_YourPokemonSpurredMeToPaint, MSGBOX_DEFAULT
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 0
	lockall
	msgbox LilycoveCity_ContestLobby_Text_ShouldITakePaintingToMuseum, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_TakePaintingToMuseum
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_ContestLobby_EventScript_ConfirmDontTakePainting
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_TakePaintingToMuseum:: @ 81588DE
	msgbox LilycoveCity_ContestLobby_Text_IllTakePaintingToMuseum, MSGBOX_DEFAULT
	closemessage
	special SaveMuseumContestPainting
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	specialvar VAR_RESULT, GiveMonArtistRibbon
	compare VAR_RESULT, 1
	call_if_eq LilycoveCity_ContestLobby_EventScript_ReceivedArtistRibbon
	applymovement 4, LilycoveCity_ContestLobby_Movement_ArtistExit
	waitmovement 0
	removeobject 4
	call LilycoveCity_ContestLobby_EventScript_UpdateMuseumPatrons
	call LilycoveCity_ContestLobby_EventScript_SetPaintingFlag
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_ConfirmDontTakePainting:: @ 8158918
	msgbox LilycoveCity_ContestLobby_Text_TakeHomeButIdLikeToTakeToMuseum, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_TakePaintingToMuseum
	msgbox LilycoveCity_ContestLobby_Text_FineThatsTheWayItIs, MSGBOX_DEFAULT
	closemessage
	applymovement 4, LilycoveCity_ContestLobby_Movement_ArtistExit
	waitmovement 0
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	removeobject 4
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_ReceivedArtistRibbon:: @ 8158948
	incrementgamestat GAME_STAT_RECEIVED_RIBBONS
	special ScrSpecial_GetContestWinnerNick
	applymovement 4, LilycoveCity_ContestLobby_Movement_ArtistBeginToExit
	waitmovement 0
	playse SE_PIN
	applymovement 4, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 4, LilycoveCity_ContestLobby_Movement_ArtistReturnToPlayer
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_TakeMementoOfPainting, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	msgbox LilycoveCity_ContestLobby_Text_ReceivedARibbon, MSGBOX_DEFAULT
	waitfanfare
	msgbox LilycoveCity_ContestLobby_Text_PutTheRibbonOnMon, MSGBOX_DEFAULT
	msgbox LilycoveCity_ContestLobby_Text_OkaySeeYou, MSGBOX_DEFAULT
	closemessage
	return

LilycoveCity_ContestLobby_EventScript_UpdateMuseumPatrons:: @ 8158994
	specialvar VAR_0x8004, CountPlayerMuseumPaintings
	switch VAR_0x8004
	case 1, LilycoveCity_ContestLobby_EventScript_ShowPatron1
	case 2, LilycoveCity_ContestLobby_EventScript_ShowPatron2
	case 3, LilycoveCity_ContestLobby_EventScript_ShowPatron3
	case 4, LilycoveCity_ContestLobby_EventScript_ShowPatron4
	case 5, LilycoveCity_ContestLobby_EventScript_ShowTourists
	return

LilycoveCity_ContestLobby_EventScript_ShowPatron1:: @ 81589D6
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_1
	return

LilycoveCity_ContestLobby_EventScript_ShowPatron2:: @ 81589DA
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_2
	return

LilycoveCity_ContestLobby_EventScript_ShowPatron3:: @ 81589DE
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_3
	return

LilycoveCity_ContestLobby_EventScript_ShowPatron4:: @ 81589E2
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_4
	return

LilycoveCity_ContestLobby_EventScript_ShowTourists:: @ 81589E6
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_TOURISTS
	return

LilycoveCity_ContestLobby_EventScript_SetPaintingFlag:: @ 81589EA
	switch VAR_CONTEST_CATEGORY
	case 0, LilycoveCity_ContestLobby_EventScript_MadeCoolPainting
	case 1, LilycoveCity_ContestLobby_EventScript_MadeBeautyPainting
	case 2, LilycoveCity_ContestLobby_EventScript_MadeCutePainting
	case 3, LilycoveCity_ContestLobby_EventScript_MadeSmartPainting
	case 4, LilycoveCity_ContestLobby_EventScript_MadeToughPainting
	return

LilycoveCity_ContestLobby_EventScript_MadeCoolPainting:: @ 8158A27
	setflag FLAG_COOL_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_MadeBeautyPainting:: @ 8158A2B
	setflag FLAG_BEAUTY_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_MadeCutePainting:: @ 8158A2F
	setflag FLAG_CUTE_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_MadeSmartPainting:: @ 8158A33
	setflag FLAG_SMART_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_MadeToughPainting:: @ 8158A37
	setflag FLAG_TOUGH_PAINTING_MADE
	return

LilycoveCity_ContestLobby_Movement_ArtistApproachPlayer:: @ 8158A3B
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

LilycoveCity_ContestLobby_Movement_ArtistExit:: @ 8158A43
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_PlayerFaceArtist:: @ 8158A4C
	walk_in_place_fastest_left
	step_end

LilycoveCity_ContestLobby_Movement_ArtistBeginToExit:: @ 8158A4E
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_ArtistReturnToPlayer:: @ 8158A52
	delay_16
	delay_16
	delay_16
	delay_16
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_in_place_fastest_right
	step_end

LilycoveCity_ContestLobby_EventScript_TryDoLinkContestArtist:: @ 8158A5B
	goto_if_set FLAG_HIDE_LILYCOVE_MUSEUM_CURATOR, LilycoveCity_ContestLobby_EventScript_LinkContestArtist
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	end

LilycoveCity_ContestLobby_EventScript_LinkContestArtist:: @ 8158A6A
	lockall
	addobject 11
	applymovement 11, LilycoveCity_ContestLobby_Movement_LinkArtistApproachPlayer
	waitmovement 11
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_PlayerFaceLinkArtist
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_YourPokemonSpurredMeToPaint, MSGBOX_DEFAULT
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 0
	msgbox LilycoveCity_ContestLobby_Text_ShouldITakePaintingToMuseum, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_TakePaintingToMuseumLink
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_ContestLobby_EventScript_ConfirmDontTakePaintingLink
	end

LilycoveCity_ContestLobby_EventScript_TakePaintingToMuseumLink:: @ 8158AAE
	msgbox LilycoveCity_ContestLobby_Text_IllTakePaintingToMuseum, MSGBOX_DEFAULT
	closemessage
	special SaveMuseumContestPainting
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	specialvar VAR_RESULT, GiveMonArtistRibbon
	compare VAR_RESULT, 1
	call_if_eq LilycoveCity_ContestLobby_EventScript_ReceivedLinkArtistRibbon
	applymovement 11, LilycoveCity_ContestLobby_Movement_LinkArtistExit
	waitmovement 0
	removeobject 11
	call LilycoveCity_ContestLobby_EventScript_UpdateMuseumPatrons
	call LilycoveCity_ContestLobby_EventScript_SetPaintingFlag
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_ConfirmDontTakePaintingLink:: @ 8158AE8
	msgbox LilycoveCity_ContestLobby_Text_TakeHomeButIdLikeToTakeToMuseum, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_TakePaintingToMuseumLink
	msgbox LilycoveCity_ContestLobby_Text_FineThatsTheWayItIs, MSGBOX_DEFAULT
	closemessage
	applymovement 11, LilycoveCity_ContestLobby_Movement_LinkArtistExit
	waitmovement 0
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	removeobject 11
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_ReceivedLinkArtistRibbon:: @ 8158B18
	incrementgamestat GAME_STAT_RECEIVED_RIBBONS
	special ScrSpecial_GetContestWinnerNick
	applymovement 11, LilycoveCity_ContestLobby_Movement_LinkArtistBeginExit
	waitmovement 0
	playse SE_PIN
	applymovement 11, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 11, LilycoveCity_ContestLobby_Movement_LinkArtistReturnToPlayer
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_TakeMementoOfPainting, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	msgbox LilycoveCity_ContestLobby_Text_ReceivedARibbon, MSGBOX_DEFAULT
	waitfanfare
	msgbox LilycoveCity_ContestLobby_Text_PutTheRibbonOnMon, MSGBOX_DEFAULT
	msgbox LilycoveCity_ContestLobby_Text_OkaySeeYou, MSGBOX_DEFAULT
	closemessage
	return

LilycoveCity_ContestLobby_Movement_LinkArtistApproachPlayer:: @ 8158B64
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

LilycoveCity_ContestLobby_Movement_LinkArtistExit:: @ 8158B6D
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_PlayerFaceLinkArtist:: @ 8158B76
	walk_in_place_fastest_right
	step_end

LilycoveCity_ContestLobby_Movement_LinkArtistBeginExit:: @ 8158B78
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_LinkArtistReturnToPlayer:: @ 8158B7C
	delay_16
	delay_16
	delay_16
	delay_16
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_in_place_fastest_left
	step_end

LilycoveCity_ContestLobby_EventScript_LinkContestReceptionist:: @ 8158B85
	lockall
	checkitem ITEM_CONTEST_PASS, 1
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_ContestLobby_EventScript_RegistrationsFromFourNeedContestPass
	goto_if_set FLAG_TEMP_2, LilycoveCity_ContestLobby_EventScript_158BAE
	message ContestHall_Text_OnlyRegister4Players
	waitmessage
	setflag FLAG_TEMP_2
	goto LilycoveCity_ContestLobby_EventScript_158BF0
	end

LilycoveCity_ContestLobby_EventScript_158BAE:: @ 8158BAE
	message LilycoveCity_ContestLobby_Text_EnterContest
	waitmessage
	goto LilycoveCity_ContestLobby_EventScript_158BF0
	end

LilycoveCity_ContestLobby_EventScript_RegistrationsFromFourNeedContestPass:: @ 8158BBA
	msgbox LilycoveCity_ContestLobby_Text_RegistrationsFromFourNeedContestPass, MSGBOX_DEFAULT
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158BC4:: @ 8158BC4
	msgbox LilycoveCity_ContestLobby_Text_ProgressWillBeSaved, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_ContestLobby_EventScript_CancelEnterContest
	call Common_EventScript_SaveGame
	erasebox 0, 0, 15, 9
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_ContestLobby_EventScript_CancelEnterContest
	setflag FLAG_TEMP_3
	return

LilycoveCity_ContestLobby_EventScript_158BF0:: @ 8158BF0
	multichoice 0, 0, 2, 0
	switch VAR_RESULT
	case 0, LilycoveCity_ContestLobby_EventScript_158CEA
	case 1, LilycoveCity_ContestLobby_EventScript_158C27
	case 2, LilycoveCity_ContestLobby_EventScript_CancelEnterContest
	case 127, LilycoveCity_ContestLobby_EventScript_CancelEnterContest
	end

LilycoveCity_ContestLobby_EventScript_158C27:: @ 8158C27
	msgbox LilycoveCity_ContestLobby_Text_Explain4PlayerContest, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_LinkContestReceptionist
	end

LilycoveCity_ContestLobby_EventScript_CancelEnterContest:: @ 8158C35
	msgbox LilycoveCity_ContestLobby_Text_ParticipateAnotherTime, MSGBOX_DEFAULT
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_ChooseLinkContestMon:: @ 8158C42
	msgbox LilycoveCity_ContestLobby_Text_EnterWhichPokemon1, MSGBOX_DEFAULT
	setvar VAR_CONTEST_RANK, 0
	choosecontestmon
	compare VAR_0x8004, 255
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158CEA
	special ScrSpecial_CheckSelectedMonAndInitContest
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_ContestLobby_EventScript_LinkCantEnterLowRank
	compare VAR_RESULT, 1
	goto_if_eq LilycoveCity_ContestLobby_EventScript_EnterMonForLinkContest
	compare VAR_RESULT, 2
	goto_if_eq LilycoveCity_ContestLobby_EventScript_EnterMonForLinkContest
	compare VAR_RESULT, 3
	goto_if_eq LilycoveCity_ContestLobby_EventScript_LinkCantEnterEgg
	compare VAR_RESULT, 4
	goto_if_eq LilycoveCity_ContestLobby_EventScript_LinkCantEnterFainted
	end

LilycoveCity_ContestLobby_EventScript_LinkCantEnterLowRank:: @ 8158C96
	msgbox LilycoveCity_ContestLobby_Text_MonNotQualifiedForRank, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_ChooseLinkContestMon
	end

LilycoveCity_ContestLobby_EventScript_LinkCantEnterEgg:: @ 8158CA4
	msgbox LilycoveCity_ContestLobby_Text_EggCannotTakePart, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_ChooseLinkContestMon
	end

LilycoveCity_ContestLobby_EventScript_LinkCantEnterFainted:: @ 8158CB2
	msgbox LilycoveCity_ContestLobby_Text_MonInNoConditionForContest, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_ChooseLinkContestMon
	end

LilycoveCity_ContestLobby_EventScript_EnterMonForLinkContest:: @ 8158CC0
	copyvar VAR_0x8008, VAR_0x8004
	message LilycoveCity_ContestLobby_Text_ConfirmContestMon
	waitmessage
	yesnobox 20, 8
	switch VAR_RESULT
	case 0, LilycoveCity_ContestLobby_EventScript_ChooseLinkContestMon
	case 1, LilycoveCity_ContestLobby_EventScript_TrySetUpLinkContest
	end

LilycoveCity_ContestLobby_EventScript_158CEA:: @ 8158CEA
	call_if_unset FLAG_TEMP_3, LilycoveCity_ContestLobby_EventScript_158BC4
	message LilycoveCity_ContestLobby_Text_EnterWhichContest
	waitmessage
	multichoice 0, 0, 4, 0
	switch VAR_RESULT
	case 5, LilycoveCity_ContestLobby_EventScript_CancelEnterContest
	case 127, LilycoveCity_ContestLobby_EventScript_CancelEnterContest
	copyvar VAR_CONTEST_CATEGORY, VAR_RESULT
	goto LilycoveCity_ContestLobby_EventScript_ChooseLinkContestMon
	end

LilycoveCity_ContestLobby_EventScript_TrySetUpLinkContest:: @ 8158D24
	message LilycoveCity_ContestLobby_Text_PleaseWaitBButtonCancel
	waitmessage
	copyvar VAR_0x8004, VAR_RESULT
	special sub_808363C
	waitstate
	compare VAR_RESULT, 3
	goto_if_eq LilycoveCity_ContestLobby_EventScript_CancelLinkDifferentChoices
	compare VAR_RESULT, 5
	goto_if_eq LilycoveCity_ContestLobby_EventScript_CancelLinkContest
	compare VAR_RESULT, 6
	goto_if_eq LilycoveCity_ContestLobby_EventScript_CancelLinkError
	messageautoscroll LilycoveCity_ContestLobby_Text_Transmitting
	waitmessage
	contestlinktransfer
	switch VAR_0x8004
	case 0, LilycoveCity_ContestLobby_EventScript_StartLinkContest
	case 1, LilycoveCity_ContestLobby_EventScript_CancelLinkDifferentContest
	case 2, LilycoveCity_ContestLobby_EventScript_CancelLinkTransmissionError
	end

LilycoveCity_ContestLobby_EventScript_CancelLinkDifferentContest:: @ 8158D82
	msgbox LilycoveCity_ContestLobby_Text_PlayersChoseDifferentContest, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158CEA
	end

LilycoveCity_ContestLobby_EventScript_CancelLinkDifferentChoices:: @ 8158D90
	special CloseLink
	msgbox LilycoveCity_ContestLobby_Text_PlayersMadeDifferentChoice, MSGBOX_DEFAULT
	closemessage
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_CancelLinkContest:: @ 8158DA1
	special CloseLink
	msgbox LilycoveCity_ContestLobby_Text_ParticipateAnotherTime2, MSGBOX_DEFAULT
	closemessage
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_CancelLinkError:: @ 8158DB2
	special CloseLink
	msgbox LilycoveCity_ContestLobby_Text_TransmissionErrorTryAgain, MSGBOX_DEFAULT
	closemessage
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_CancelLinkTransmissionError:: @ 8158DC3
	msgbox LilycoveCity_ContestLobby_Text_TransmissionError, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158CEA
	end

LilycoveCity_ContestLobby_EventScript_StartLinkContest:: @ 8158DD1
	special ScrSpecial_GetContestPlayerMonIdx
	addvar VAR_0x8004, 1
	buffernumberstring 1, 32772
	messageautoscroll LilycoveCity_ContestLobby_Text_YourMonIsEntryNumX
	waitmessage
	addvar VAR_0x8004, -1
	goto LilycoveCity_ContestLobby_EventScript_158DEE
	end

LilycoveCity_ContestLobby_EventScript_158DEE:: @ 8158DEE
	call LilycoveCity_ContestLobby_EventScript_158E0B
	setvar VAR_LINK_CONTEST_ROOM_STATE, 1
	special ScrSpecial_SetLinkContestTrainerGfxIdx
	setvar VAR_CONTEST_LOCATION, 5
	setvar VAR_CONTEST_RANK, 3
	call LilycoveCity_ContestLobby_EventScript_WarpToContestHall
	end

LilycoveCity_ContestLobby_EventScript_158E0B:: @ 8158E0B
	lockall
	messageautoscroll LilycoveCity_ContestLobby_Text_ContestBeginShortly
	waitmessage
	delay 20
	closemessage
	applymovement 2, LilycoveCity_ContestLobby_Movement_158E9C
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 9, 2, METATILE_Contest_WallShadow, 1
	setmetatile 9, 3, METATILE_Contest_FloorShadow, 1
	special DrawWholeMapView
	applymovement 2, LilycoveCity_ContestLobby_Movement_158EA0
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 9, 2, METATILE_Contest_CounterFlap_Top, 1
	setmetatile 9, 3, METATILE_Contest_CounterFlap_Bottom, 1
	special DrawWholeMapView
	delay 20
	applymovement 2, LilycoveCity_ContestLobby_Movement_158EAE
	waitmovement 0
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_158E99
	waitmovement 0
	messageautoscroll LilycoveCity_ContestLobby_Text_ComeThroughHere
	waitmessage
	delay 20
	closemessage
	applymovement 2, LilycoveCity_ContestLobby_Movement_158EA4
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_158E8E
	waitmovement 0
	releaseall
	return

LilycoveCity_ContestLobby_Movement_158E8E:: @ 8158E8E
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

LilycoveCity_ContestLobby_Movement_158E99:: @ 8158E99
	walk_in_place_fastest_right
	walk_right
	step_end

LilycoveCity_ContestLobby_Movement_158E9C:: @ 8158E9C
	walk_right
	walk_right
	walk_in_place_fastest_down
	step_end

LilycoveCity_ContestLobby_Movement_158EA0:: @ 8158EA0
	walk_down
	walk_down
	walk_in_place_fastest_up
	step_end

LilycoveCity_ContestLobby_Movement_158EA4:: @ 8158EA4
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

LilycoveCity_ContestLobby_Movement_158EAE:: @ 8158EAE
	walk_in_place_fastest_left
	step_end

LilycoveCity_ContestLobby_EventScript_ContestReceptionist:: @ 8158EB0
	specialvar VAR_RESULT, sub_80C5044
	compare VAR_RESULT, 1
	goto_if_eq LilycoveCity_ContestLobby_EventScript_SetDebug
	setvar VAR_0x800B, 8
	setvar VAR_CONTEST_RANK, 3
	call LilycoveCity_ContestLobby_EventScript_1A4E92
	call LilycoveCity_ContestLobby_EventScript_LeadToLinkContestHall
	special SetContestTrainerGfxIds
	call LilycoveCity_ContestLobby_EventScript_SetupRivalGfxId
	setvar VAR_CONTEST_LOCATION, 4
	call LilycoveCity_ContestLobby_EventScript_WarpToContestHall
	waitstate
	end

LilycoveCity_ContestLobby_EventScript_SetDebug:: @ 8158EE8
	setflag FLAG_HIDE_LILYCOVE_MUSEUM_CURATOR
	copyvar VAR_LILYCOVE_MUSEUM_2F_STATE, 0x1
	additem ITEM_CONTEST_PASS
	setvar VAR_0x800B, 8
	setvar VAR_CONTEST_RANK, 3
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 1
	setflag FLAG_SYS_RIBBON_GET
	end

LilycoveCity_ContestLobby_EventScript_WarpToContestHall:: @ 8158F08
	switch VAR_CONTEST_CATEGORY
	case 0, LilycoveCity_ContestLobby_EventScript_WarpToContestHall4
	case 1, LilycoveCity_ContestLobby_EventScript_WarpToContestHall2
	case 2, LilycoveCity_ContestLobby_EventScript_WarpToContestHall6
	case 3, LilycoveCity_ContestLobby_EventScript_WarpToContestHall5
	case 4, LilycoveCity_ContestLobby_EventScript_WarpToContestHall3
	return

LilycoveCity_ContestLobby_EventScript_WarpToContestHall4:: @ 8158F45
	setwarp MAP_LINK_CONTEST_ROOM4, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_WarpToContestHall2:: @ 8158F52
	setwarp MAP_LINK_CONTEST_ROOM2, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_WarpToContestHall6:: @ 8158F5F
	setwarp MAP_LINK_CONTEST_ROOM6, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_WarpToContestHall5:: @ 8158F6C
	setwarp MAP_LINK_CONTEST_ROOM5, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_WarpToContestHall3:: @ 8158F79
	setwarp MAP_LINK_CONTEST_ROOM3, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_LeadToLinkContestHall:: @ 8158F86
	lockall
	applymovement 1, LilycoveCity_ContestLobby_Movement_LinkReceptionistApproachCounter
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 4, 2, METATILE_Contest_WallShadow, 1
	setmetatile 4, 3, METATILE_Contest_FloorShadow, 1
	special DrawWholeMapView
	applymovement 1, LilycoveCity_ContestLobby_Movement_LinkReceptionistExitCounter
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 4, 2, METATILE_Contest_CounterFlap_Top, 1
	setmetatile 4, 3, METATILE_Contest_CounterFlap_Bottom, 1
	special DrawWholeMapView
	delay 20
	applymovement 1, LilycoveCity_ContestLobby_Movement_LinkReceptionistFacePlayer
	waitmovement 0
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_PlayerApproachLinkReceptionist
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_ComeThroughHere, MSGBOX_DEFAULT
	closemessage
	applymovement 1, LilycoveCity_ContestLobby_Movement_LinkReceptionistWalkToContestHall
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_PlayerWalkToLinkContestHall
	waitmovement 0
	releaseall
	return

LilycoveCity_ContestLobby_Movement_PlayerWalkToLinkContestHall:: @ 8158FFE
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

LilycoveCity_ContestLobby_Movement_PlayerApproachLinkReceptionist:: @ 8159008
	walk_in_place_fastest_left
	walk_left
	step_end

LilycoveCity_ContestLobby_Movement_LinkReceptionistApproachCounter:: @ 815900B
	walk_left
	walk_left
	walk_in_place_fastest_down
	step_end

LilycoveCity_ContestLobby_Movement_LinkReceptionistExitCounter:: @ 815900F
	walk_down
	walk_down
	walk_in_place_fastest_up
	step_end

LilycoveCity_ContestLobby_Movement_LinkReceptionistWalkToContestHall:: @ 8159013
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

LilycoveCity_ContestLobby_Movement_LinkReceptionistFacePlayer:: @ 815901C
	walk_in_place_fastest_right
	step_end

LilycoveCity_ContestLobby_EventScript_BlackBelt:: @ 815901E
	msgbox LilycoveCity_ContestLobby_Text_MasterRankHereICome, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_Girl:: @ 8159027
	goto_if_unset FLAG_RECEIVED_CONTEST_PASS, LilycoveCity_ContestLobby_EventScript_GetContestPassVerdanturf
	msgbox LilycoveCity_ContestLobby_Text_WholeVarietyOfPokemonHere, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_GetContestPassVerdanturf:: @ 8159039
	msgbox LilycoveCity_ContestLobby_Text_GetContestPassVerdanturf, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_Artist:: @ 8159042
	msgbox LilycoveCity_ContestLobby_Text_EyesOpenToMon, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_FatMan:: @ 815904B
	msgbox LilycoveCity_ContestLobby_Text_ToughContestIsExtreme, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_Fisherman:: @ 8159054
	msgbox LilycoveCity_ContestLobby_Text_LavishedCareOnMon, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_NinjaBoy:: @ 815905D
	msgbox LilycoveCity_ContestLobby_Text_MadePokeblocksWithFamily, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_ContestWinner1:: @ 8159066
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 6
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_ContestWinner2:: @ 815906D
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 7
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_ContestWinner3:: @ 8159074
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 8
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_Blender2Boy:: @ 815907B
	msgbox SlateportCity_ContestLobby_Text_LetsGetBlendingAlready, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_Blender2Girl:: @ 8159084
	msgbox BerryBlender_Text_WhatKindOfPokeblockWillIGet, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_ContestWinner4:: @ 815908D
SlateportCity_ContestLobby_EventScript_15908D:: @ 815908D
	lockall
	special ShowBerryBlenderRecordWindow
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
