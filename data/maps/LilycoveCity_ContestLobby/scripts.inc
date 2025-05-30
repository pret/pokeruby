LilycoveCity_ContestLobby_MapScripts:: @ 8158866
	map_script MAP_SCRIPT_ON_TRANSITION, LilycoveCity_ContestLobby_MapScript1_158871
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LilycoveCity_ContestLobby_MapScript2_158877
	.byte 0

LilycoveCity_ContestLobby_MapScript1_158871:: @ 8158871
	call LilycoveCity_ContestLobby_EventScript_1AE188
	end

LilycoveCity_ContestLobby_MapScript2_158877:: @ 8158877
	map_script_2 VAR_LILYCOVE_CONTEST_LOBBY_STATE, 1, LilycoveCity_ContestLobby_EventScript_158889
	map_script_2 VAR_LILYCOVE_CONTEST_LOBBY_STATE, 2, LilycoveCity_ContestLobby_EventScript_158A5B
	.2byte 0

LilycoveCity_ContestLobby_EventScript_158889:: @ 8158889
	goto_if_set FLAG_HIDE_LILYCOVE_MUSEUM_CURATOR, LilycoveCity_ContestLobby_EventScript_158898
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	end

LilycoveCity_ContestLobby_EventScript_158898:: @ 8158898
	lockall
	addobject 4
	applymovement 4, LilycoveCity_ContestLobby_Movement_158A3B
	waitmovement 4
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_158A4C
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_18890F, MSGBOX_DEFAULT
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 0
	lockall
	msgbox LilycoveCity_ContestLobby_Text_1889FD, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_1588DE
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158918
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_1588DE:: @ 81588DE
	msgbox LilycoveCity_ContestLobby_Text_188AE8, MSGBOX_DEFAULT
	closemessage
	special SaveMuseumContestPainting
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	specialvar VAR_RESULT, GiveMonArtistRibbon
	compare VAR_RESULT, 1
	call_if_eq LilycoveCity_ContestLobby_EventScript_158948
	applymovement 4, LilycoveCity_ContestLobby_Movement_158A43
	waitmovement 0
	removeobject 4
	call LilycoveCity_ContestLobby_EventScript_158994
	call LilycoveCity_ContestLobby_EventScript_1589EA
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158918:: @ 8158918
	msgbox LilycoveCity_ContestLobby_Text_188C41, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_1588DE
	msgbox LilycoveCity_ContestLobby_Text_188CBD, MSGBOX_DEFAULT
	closemessage
	applymovement 4, LilycoveCity_ContestLobby_Movement_158A43
	waitmovement 0
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	removeobject 4
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158948:: @ 8158948
	incrementgamestat GAME_STAT_RECEIVED_RIBBONS
	special ScrSpecial_GetContestWinnerNick
	applymovement 4, LilycoveCity_ContestLobby_Movement_158A4E
	waitmovement 0
	playse SE_PIN
	applymovement 4, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 4, LilycoveCity_ContestLobby_Movement_158A52
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_188BB5, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	msgbox LilycoveCity_ContestLobby_Text_188C03, MSGBOX_DEFAULT
	waitfanfare
	msgbox LilycoveCity_ContestLobby_Text_188C19, MSGBOX_DEFAULT
	msgbox LilycoveCity_ContestLobby_Text_188C32, MSGBOX_DEFAULT
	closemessage
	return

LilycoveCity_ContestLobby_EventScript_158994:: @ 8158994
	specialvar VAR_0x8004, CountPlayerMuseumPaintings
	switch VAR_0x8004
	case 1, LilycoveCity_ContestLobby_EventScript_1589D6
	case 2, LilycoveCity_ContestLobby_EventScript_1589DA
	case 3, LilycoveCity_ContestLobby_EventScript_1589DE
	case 4, LilycoveCity_ContestLobby_EventScript_1589E2
	case 5, LilycoveCity_ContestLobby_EventScript_1589E6
	return

LilycoveCity_ContestLobby_EventScript_1589D6:: @ 81589D6
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_1
	return

LilycoveCity_ContestLobby_EventScript_1589DA:: @ 81589DA
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_2
	return

LilycoveCity_ContestLobby_EventScript_1589DE:: @ 81589DE
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_3
	return

LilycoveCity_ContestLobby_EventScript_1589E2:: @ 81589E2
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_PATRON_4
	return

LilycoveCity_ContestLobby_EventScript_1589E6:: @ 81589E6
	clearflag FLAG_HIDE_LILYCOVE_MUSEUM_TOURISTS
	return

LilycoveCity_ContestLobby_EventScript_1589EA:: @ 81589EA
	switch VAR_CONTEST_CATEGORY
	case 0, LilycoveCity_ContestLobby_EventScript_158A27
	case 1, LilycoveCity_ContestLobby_EventScript_158A2B
	case 2, LilycoveCity_ContestLobby_EventScript_158A2F
	case 3, LilycoveCity_ContestLobby_EventScript_158A33
	case 4, LilycoveCity_ContestLobby_EventScript_158A37
	return

LilycoveCity_ContestLobby_EventScript_158A27:: @ 8158A27
	setflag FLAG_COOL_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_158A2B:: @ 8158A2B
	setflag FLAG_BEAUTY_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_158A2F:: @ 8158A2F
	setflag FLAG_CUTE_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_158A33:: @ 8158A33
	setflag FLAG_SMART_PAINTING_MADE
	return

LilycoveCity_ContestLobby_EventScript_158A37:: @ 8158A37
	setflag FLAG_TOUGH_PAINTING_MADE
	return

LilycoveCity_ContestLobby_Movement_158A3B:: @ 8158A3B
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

LilycoveCity_ContestLobby_Movement_158A43:: @ 8158A43
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_158A4C:: @ 8158A4C
	walk_in_place_fastest_left
	step_end

LilycoveCity_ContestLobby_Movement_158A4E:: @ 8158A4E
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_158A52:: @ 8158A52
	delay_16
	delay_16
	delay_16
	delay_16
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_in_place_fastest_right
	step_end

LilycoveCity_ContestLobby_EventScript_158A5B:: @ 8158A5B
	goto_if_set FLAG_HIDE_LILYCOVE_MUSEUM_CURATOR, LilycoveCity_ContestLobby_EventScript_158A6A
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	end

LilycoveCity_ContestLobby_EventScript_158A6A:: @ 8158A6A
	lockall
	addobject 11
	applymovement 11, LilycoveCity_ContestLobby_Movement_158B64
	waitmovement 11
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_158B76
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_18890F, MSGBOX_DEFAULT
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 0
	msgbox LilycoveCity_ContestLobby_Text_1889FD, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158AAE
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158AE8
	end

LilycoveCity_ContestLobby_EventScript_158AAE:: @ 8158AAE
	msgbox LilycoveCity_ContestLobby_Text_188AE8, MSGBOX_DEFAULT
	closemessage
	special SaveMuseumContestPainting
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	specialvar VAR_RESULT, GiveMonArtistRibbon
	compare VAR_RESULT, 1
	call_if_eq LilycoveCity_ContestLobby_EventScript_158B18
	applymovement 11, LilycoveCity_ContestLobby_Movement_158B6D
	waitmovement 0
	removeobject 11
	call LilycoveCity_ContestLobby_EventScript_158994
	call LilycoveCity_ContestLobby_EventScript_1589EA
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158AE8:: @ 8158AE8
	msgbox LilycoveCity_ContestLobby_Text_188C41, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158AAE
	msgbox LilycoveCity_ContestLobby_Text_188CBD, MSGBOX_DEFAULT
	closemessage
	applymovement 11, LilycoveCity_ContestLobby_Movement_158B6D
	waitmovement 0
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 0
	removeobject 11
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158B18:: @ 8158B18
	incrementgamestat GAME_STAT_RECEIVED_RIBBONS
	special ScrSpecial_GetContestWinnerNick
	applymovement 11, LilycoveCity_ContestLobby_Movement_158B78
	waitmovement 0
	playse SE_PIN
	applymovement 11, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 11, LilycoveCity_ContestLobby_Movement_158B7C
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_188BB5, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	msgbox LilycoveCity_ContestLobby_Text_188C03, MSGBOX_DEFAULT
	waitfanfare
	msgbox LilycoveCity_ContestLobby_Text_188C19, MSGBOX_DEFAULT
	msgbox LilycoveCity_ContestLobby_Text_188C32, MSGBOX_DEFAULT
	closemessage
	return

LilycoveCity_ContestLobby_Movement_158B64:: @ 8158B64
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

LilycoveCity_ContestLobby_Movement_158B6D:: @ 8158B6D
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_158B76:: @ 8158B76
	walk_in_place_fastest_right
	step_end

LilycoveCity_ContestLobby_Movement_158B78:: @ 8158B78
	walk_down
	walk_down
	walk_down
	step_end

LilycoveCity_ContestLobby_Movement_158B7C:: @ 8158B7C
	delay_16
	delay_16
	delay_16
	delay_16
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_in_place_fastest_left
	step_end

LilycoveCity_ContestLobby_EventScript_158B85:: @ 8158B85
	lockall
	checkitem ITEM_CONTEST_PASS, 1
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158BBA
	goto_if_set FLAG_TEMP_2, LilycoveCity_ContestLobby_EventScript_158BAE
	message LilycoveCity_ContestLobby_Text_18848C
	waitmessage
	setflag FLAG_TEMP_2
	goto LilycoveCity_ContestLobby_EventScript_158BF0
	end

LilycoveCity_ContestLobby_EventScript_158BAE:: @ 8158BAE
	message LilycoveCity_ContestLobby_Text_188584
	waitmessage
	goto LilycoveCity_ContestLobby_EventScript_158BF0
	end

LilycoveCity_ContestLobby_EventScript_158BBA:: @ 8158BBA
	msgbox LilycoveCity_ContestLobby_Text_1A63F4, MSGBOX_DEFAULT
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158BC4:: @ 8158BC4
	msgbox LilycoveCity_ContestLobby_Text_188521, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158C35
	call Common_EventScript_SaveGame
	erasebox 0, 0, 15, 9
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158C35
	setflag FLAG_TEMP_3
	return

LilycoveCity_ContestLobby_EventScript_158BF0:: @ 8158BF0
	multichoice 0, 0, 2, 0
	switch VAR_RESULT
	case 0, LilycoveCity_ContestLobby_EventScript_158CEA
	case 1, LilycoveCity_ContestLobby_EventScript_158C27
	case 2, LilycoveCity_ContestLobby_EventScript_158C35
	case 127, LilycoveCity_ContestLobby_EventScript_158C35
	end

LilycoveCity_ContestLobby_EventScript_158C27:: @ 8158C27
	msgbox LilycoveCity_ContestLobby_Text_1885A7, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158B85
	end

LilycoveCity_ContestLobby_EventScript_158C35:: @ 8158C35
	msgbox LilycoveCity_ContestLobby_Text_188559, MSGBOX_DEFAULT
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_158C42:: @ 8158C42
	msgbox LilycoveCity_ContestLobby_Text_188703, MSGBOX_DEFAULT
	setvar VAR_CONTEST_RANK, 0
	choosecontestmon
	compare VAR_0x8004, 255
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158CEA
	special ScrSpecial_CheckSelectedMonAndInitContest
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158C96
	compare VAR_RESULT, 1
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158CC0
	compare VAR_RESULT, 2
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158CC0
	compare VAR_RESULT, 3
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158CA4
	compare VAR_RESULT, 4
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158CB2
	end

LilycoveCity_ContestLobby_EventScript_158C96:: @ 8158C96
	msgbox LilycoveCity_ContestLobby_Text_1A664A, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158CA4:: @ 8158CA4
	msgbox LilycoveCity_ContestLobby_Text_1A669F, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158CB2:: @ 8158CB2
	msgbox LilycoveCity_ContestLobby_Text_1A66DC, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158CC0:: @ 8158CC0
	copyvar VAR_0x8008, VAR_0x8004
	message LilycoveCity_ContestLobby_Text_1A67A3
	waitmessage
	yesnobox 20, 8
	switch VAR_RESULT
	case 0, LilycoveCity_ContestLobby_EventScript_158C42
	case 1, LilycoveCity_ContestLobby_EventScript_158D24
	end

LilycoveCity_ContestLobby_EventScript_158CEA:: @ 8158CEA
	call_if_unset FLAG_TEMP_3, LilycoveCity_ContestLobby_EventScript_158BC4
	message LilycoveCity_ContestLobby_Text_1886DC
	waitmessage
	multichoice 0, 0, 4, 0
	switch VAR_RESULT
	case 5, LilycoveCity_ContestLobby_EventScript_158C35
	case 127, LilycoveCity_ContestLobby_EventScript_158C35
	copyvar VAR_CONTEST_CATEGORY, VAR_RESULT
	goto LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158D24:: @ 8158D24
	message LilycoveCity_ContestLobby_Text_1887C7
	waitmessage
	copyvar VAR_0x8004, VAR_RESULT
	special sub_808363C
	waitstate
	compare VAR_RESULT, 3
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158D90
	compare VAR_RESULT, 5
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158DA1
	compare VAR_RESULT, 6
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158DB2
	messageautoscroll LilycoveCity_ContestLobby_Text_18872A
	waitmessage
	contestlinktransfer
	switch VAR_0x8004
	case 0, LilycoveCity_ContestLobby_EventScript_158DD1
	case 1, LilycoveCity_ContestLobby_EventScript_158D82
	case 2, LilycoveCity_ContestLobby_EventScript_158DC3
	end

LilycoveCity_ContestLobby_EventScript_158D82:: @ 8158D82
	msgbox LilycoveCity_ContestLobby_Text_188750, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158CEA
	end

LilycoveCity_ContestLobby_EventScript_158D90:: @ 8158D90
	special CloseLink
	msgbox LilycoveCity_ContestLobby_Text_18878D, MSGBOX_DEFAULT
	closemessage
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_158DA1:: @ 8158DA1
	special CloseLink
	msgbox LilycoveCity_ContestLobby_Text_1887F4, MSGBOX_DEFAULT
	closemessage
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_158DB2:: @ 8158DB2
	special CloseLink
	msgbox LilycoveCity_ContestLobby_Text_18881F, MSGBOX_DEFAULT
	closemessage
	releaseall
	clearflag FLAG_TEMP_3
	end

LilycoveCity_ContestLobby_EventScript_158DC3:: @ 8158DC3
	msgbox LilycoveCity_ContestLobby_Text_18873A, MSGBOX_DEFAULT
	goto LilycoveCity_ContestLobby_EventScript_158CEA
	end

LilycoveCity_ContestLobby_EventScript_158DD1:: @ 8158DD1
	special ScrSpecial_GetContestPlayerMonIdx
	addvar VAR_0x8004, 1
	buffernumberstring 1, 32772
	messageautoscroll LilycoveCity_ContestLobby_Text_188845
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
	call LilycoveCity_ContestLobby_EventScript_158F08
	end

LilycoveCity_ContestLobby_EventScript_158E0B:: @ 8158E0B
	lockall
	messageautoscroll LilycoveCity_ContestLobby_Text_1888C6
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
	messageautoscroll LilycoveCity_ContestLobby_Text_1A6832
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

LilycoveCity_ContestLobby_EventScript_158EB0:: @ 8158EB0
	specialvar VAR_RESULT, sub_80C5044
	compare VAR_RESULT, 1
	goto_if_eq LilycoveCity_ContestLobby_EventScript_158EE8
	setvar VAR_0x800B, 8
	setvar VAR_CONTEST_RANK, 3
	call LilycoveCity_ContestLobby_EventScript_1A4E92
	call LilycoveCity_ContestLobby_EventScript_158F86
	special SetContestTrainerGfxIds
	call LilycoveCity_ContestLobby_EventScript_15FBDB
	setvar VAR_CONTEST_LOCATION, 4
	call LilycoveCity_ContestLobby_EventScript_158F08
	waitstate
	end

LilycoveCity_ContestLobby_EventScript_158EE8:: @ 8158EE8
	setflag FLAG_HIDE_LILYCOVE_MUSEUM_CURATOR
	copyvar VAR_LILYCOVE_MUSEUM_2F_STATE, 0x1
	additem ITEM_CONTEST_PASS
	setvar VAR_0x800B, 8
	setvar VAR_CONTEST_RANK, 3
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 1
	setflag FLAG_SYS_RIBBON_GET
	end

LilycoveCity_ContestLobby_EventScript_158F08:: @ 8158F08
	switch VAR_CONTEST_CATEGORY
	case 0, LilycoveCity_ContestLobby_EventScript_158F45
	case 1, LilycoveCity_ContestLobby_EventScript_158F52
	case 2, LilycoveCity_ContestLobby_EventScript_158F5F
	case 3, LilycoveCity_ContestLobby_EventScript_158F6C
	case 4, LilycoveCity_ContestLobby_EventScript_158F79
	return

LilycoveCity_ContestLobby_EventScript_158F45:: @ 8158F45
	setwarp MAP_LINK_CONTEST_ROOM4, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F52:: @ 8158F52
	setwarp MAP_LINK_CONTEST_ROOM2, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F5F:: @ 8158F5F
	setwarp MAP_LINK_CONTEST_ROOM6, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F6C:: @ 8158F6C
	setwarp MAP_LINK_CONTEST_ROOM5, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F79:: @ 8158F79
	setwarp MAP_LINK_CONTEST_ROOM3, 255, 7, 5
	special sub_8081334
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F86:: @ 8158F86
	lockall
	applymovement 1, LilycoveCity_ContestLobby_Movement_15900B
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 4, 2, METATILE_Contest_WallShadow, 1
	setmetatile 4, 3, METATILE_Contest_FloorShadow, 1
	special DrawWholeMapView
	applymovement 1, LilycoveCity_ContestLobby_Movement_15900F
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 4, 2, METATILE_Contest_CounterFlap_Top, 1
	setmetatile 4, 3, METATILE_Contest_CounterFlap_Bottom, 1
	special DrawWholeMapView
	delay 20
	applymovement 1, LilycoveCity_ContestLobby_Movement_15901C
	waitmovement 0
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_159008
	waitmovement 0
	msgbox LilycoveCity_ContestLobby_Text_1A6832, MSGBOX_DEFAULT
	closemessage
	applymovement 1, LilycoveCity_ContestLobby_Movement_159013
	applymovement LOCALID_PLAYER, LilycoveCity_ContestLobby_Movement_158FFE
	waitmovement 0
	releaseall
	return

LilycoveCity_ContestLobby_Movement_158FFE:: @ 8158FFE
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

LilycoveCity_ContestLobby_Movement_159008:: @ 8159008
	walk_in_place_fastest_left
	walk_left
	step_end

LilycoveCity_ContestLobby_Movement_15900B:: @ 815900B
	walk_left
	walk_left
	walk_in_place_fastest_down
	step_end

LilycoveCity_ContestLobby_Movement_15900F:: @ 815900F
	walk_down
	walk_down
	walk_in_place_fastest_up
	step_end

LilycoveCity_ContestLobby_Movement_159013:: @ 8159013
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

LilycoveCity_ContestLobby_Movement_15901C:: @ 815901C
	walk_in_place_fastest_right
	step_end

LilycoveCity_ContestLobby_EventScript_15901E:: @ 815901E
	msgbox LilycoveCity_ContestLobby_Text_188D3C, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_159027:: @ 8159027
	goto_if_unset FLAG_RECEIVED_CONTEST_PASS, LilycoveCity_ContestLobby_EventScript_159039
	msgbox LilycoveCity_ContestLobby_Text_188DDA, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_159039:: @ 8159039
	msgbox LilycoveCity_ContestLobby_Text_188E47, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_159042:: @ 8159042
	msgbox LilycoveCity_ContestLobby_Text_188F07, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_15904B:: @ 815904B
	msgbox LilycoveCity_ContestLobby_Text_188F81, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_159054:: @ 8159054
	msgbox LilycoveCity_ContestLobby_Text_188FE3, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_15905D:: @ 815905D
	msgbox LilycoveCity_ContestLobby_Text_18904D, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_159066:: @ 8159066
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 6
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_15906D:: @ 815906D
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 7
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_159074:: @ 8159074
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 8
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_15907B:: @ 815907B
	msgbox SlateportCity_ContestLobby_Text_LetsGetBlendingAlready, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_159084:: @ 8159084
	msgbox LilycoveCity_ContestLobby_Text_1B7241, MSGBOX_NPC
	end

LilycoveCity_ContestLobby_EventScript_15908D:: @ 815908D
SlateportCity_ContestLobby_EventScript_15908D:: @ 815908D
	lockall
	special ShowBerryBlenderRecordWindow
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
