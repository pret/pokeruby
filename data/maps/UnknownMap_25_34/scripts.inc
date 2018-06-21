UnknownMap_25_34_MapScripts:: @ 815F580
	map_script 4, LinkContestRoom1_MapScript2_15F610
	map_script 2, LinkContestRoom1_MapScript2_15F606
	map_script 3, LinkContestRoom1_MapScript1_15F595
	map_script 5, LinkContestRoom1_MapScript1_15F5F4
	.byte 0

LinkContestRoom1_MapScript1_15F595:: @ 815F595
	call LinkContestRoom1_EventScript_15F5A5
	setvar VAR_TEMP_0, 1
	call LinkContestRoom1_EventScript_15F630
	end

LinkContestRoom1_EventScript_15F5A5:: @ 815F5A5
	special ScriptGetMultiplayerId
	compare RESULT, 0
	call_if_eq LinkContestRoom1_EventScript_15F5E0
	compare RESULT, 1
	call_if_eq LinkContestRoom1_EventScript_15F5E4
	compare RESULT, 2
	call_if_eq LinkContestRoom1_EventScript_15F5E8
	compare RESULT, 3
	call_if_eq LinkContestRoom1_EventScript_15F5EC
	compare RESULT, 4
	call_if_eq LinkContestRoom1_EventScript_15F5F0
	return

LinkContestRoom1_EventScript_15F5E0:: @ 815F5E0
	savebgm MUS_TEST1
	return

LinkContestRoom1_EventScript_15F5E4:: @ 815F5E4
	savebgm MUS_TEST2
	return

LinkContestRoom1_EventScript_15F5E8:: @ 815F5E8
	savebgm MUS_TEST3
	return

LinkContestRoom1_EventScript_15F5EC:: @ 815F5EC
	savebgm MUS_TEST4
	return

LinkContestRoom1_EventScript_15F5F0:: @ 815F5F0
	savebgm MUS_CONTEST0
	return

LinkContestRoom1_MapScript1_15F5F4:: @ 815F5F4
	compare VAR_TEMP_9, 1
	call_if_eq LinkContestRoom1_EventScript_15F600
	end

LinkContestRoom1_EventScript_15F600:: @ 815F600
	call LinkContestRoom1_EventScript_15F919
	return

LinkContestRoom1_MapScript2_15F606:: @ 815F606
	map_script_2 VAR_LINK_CONTEST_ROOM_STATE, 1, LinkContestRoom1_EventScript_15F61A
	.2byte 0

LinkContestRoom1_MapScript2_15F610:: @ 815F610
	map_script_2 VAR_LINK_CONTEST_ROOM_STATE, 1, LinkContestRoom1_EventScript_15F625
	.2byte 0

LinkContestRoom1_EventScript_15F61A:: @ 815F61A
	call LinkContestRoom1_EventScript_1A514D
	call LinkContestRoom1_EventScript_15FB64
	end

LinkContestRoom1_EventScript_15F625:: @ 815F625
	hideobjectat 255, MAP_LITTLEROOT_TOWN
	call LinkContestRoom1_EventScript_15F919
	end

LinkContestRoom1_EventScript_15F630:: @ 815F630
	call LinkContestRoom1_EventScript_15F6E6
	call LinkContestRoom1_EventScript_15F646
	compare VAR_TEMP_0, 8
	goto_if_lt LinkContestRoom1_EventScript_15F630
	return

LinkContestRoom1_EventScript_15F646:: @ 815F646
	switch VAR_TEMP_0
	case 1, LinkContestRoom1_EventScript_15F699
	case 2, LinkContestRoom1_EventScript_15F6A4
	case 3, LinkContestRoom1_EventScript_15F6AF
	case 4, LinkContestRoom1_EventScript_15F6BA
	case 5, LinkContestRoom1_EventScript_15F6C5
	case 6, LinkContestRoom1_EventScript_15F6D0
	case 7, LinkContestRoom1_EventScript_15F6DB
	end

LinkContestRoom1_EventScript_15F699:: @ 815F699
	copyvar VAR_OBJ_GFX_ID_4, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_15F6A4:: @ 815F6A4
	copyvar VAR_OBJ_GFX_ID_5, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_15F6AF:: @ 815F6AF
	copyvar VAR_OBJ_GFX_ID_6, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_15F6BA:: @ 815F6BA
	copyvar VAR_OBJ_GFX_ID_7, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_15F6C5:: @ 815F6C5
	copyvar VAR_OBJ_GFX_ID_8, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_15F6D0:: @ 815F6D0
	copyvar VAR_OBJ_GFX_ID_9, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_15F6DB:: @ 815F6DB
	copyvar VAR_OBJ_GFX_ID_A, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_15F6E6:: @ 815F6E6
	setvar RESULT, 32
	special ScriptRandom
	addvar RESULT, 1
	switch RESULT
	case 1, LinkContestRoom1_EventScript_15F859
	case 2, LinkContestRoom1_EventScript_15F85F
	case 3, LinkContestRoom1_EventScript_15F865
	case 4, LinkContestRoom1_EventScript_15F86B
	case 5, LinkContestRoom1_EventScript_15F871
	case 6, LinkContestRoom1_EventScript_15F877
	case 7, LinkContestRoom1_EventScript_15F87D
	case 8, LinkContestRoom1_EventScript_15F883
	case 9, LinkContestRoom1_EventScript_15F889
	case 10, LinkContestRoom1_EventScript_15F88F
	case 11, LinkContestRoom1_EventScript_15F895
	case 12, LinkContestRoom1_EventScript_15F89B
	case 13, LinkContestRoom1_EventScript_15F8A1
	case 14, LinkContestRoom1_EventScript_15F8A7
	case 15, LinkContestRoom1_EventScript_15F8AD
	case 16, LinkContestRoom1_EventScript_15F8B3
	case 17, LinkContestRoom1_EventScript_15F8B9
	case 18, LinkContestRoom1_EventScript_15F8BF
	case 19, LinkContestRoom1_EventScript_15F8C5
	case 20, LinkContestRoom1_EventScript_15F8CB
	case 21, LinkContestRoom1_EventScript_15F8D1
	case 22, LinkContestRoom1_EventScript_15F8D7
	case 23, LinkContestRoom1_EventScript_15F8DD
	case 24, LinkContestRoom1_EventScript_15F8E3
	case 25, LinkContestRoom1_EventScript_15F8E9
	case 26, LinkContestRoom1_EventScript_15F8EF
	case 27, LinkContestRoom1_EventScript_15F8F5
	case 28, LinkContestRoom1_EventScript_15F8FB
	case 29, LinkContestRoom1_EventScript_15F901
	case 30, LinkContestRoom1_EventScript_15F907
	case 31, LinkContestRoom1_EventScript_15F90D
	case 32, LinkContestRoom1_EventScript_15F913
	end

LinkContestRoom1_EventScript_15F859:: @ 815F859
	setvar VAR_TEMP_1, 5
	return

LinkContestRoom1_EventScript_15F85F:: @ 815F85F
	setvar VAR_TEMP_1, 6
	return

LinkContestRoom1_EventScript_15F865:: @ 815F865
	setvar VAR_TEMP_1, 7
	return

LinkContestRoom1_EventScript_15F86B:: @ 815F86B
	setvar VAR_TEMP_1, 8
	return

LinkContestRoom1_EventScript_15F871:: @ 815F871
	setvar VAR_TEMP_1, 10
	return

LinkContestRoom1_EventScript_15F877:: @ 815F877
	setvar VAR_TEMP_1, 11
	return

LinkContestRoom1_EventScript_15F87D:: @ 815F87D
	setvar VAR_TEMP_1, 12
	return

LinkContestRoom1_EventScript_15F883:: @ 815F883
	setvar VAR_TEMP_1, 13
	return

LinkContestRoom1_EventScript_15F889:: @ 815F889
	setvar VAR_TEMP_1, 14
	return

LinkContestRoom1_EventScript_15F88F:: @ 815F88F
	setvar VAR_TEMP_1, 15
	return

LinkContestRoom1_EventScript_15F895:: @ 815F895
	setvar VAR_TEMP_1, 17
	return

LinkContestRoom1_EventScript_15F89B:: @ 815F89B
	setvar VAR_TEMP_1, 18
	return

LinkContestRoom1_EventScript_15F8A1:: @ 815F8A1
	setvar VAR_TEMP_1, 19
	return

LinkContestRoom1_EventScript_15F8A7:: @ 815F8A7
	setvar VAR_TEMP_1, 20
	return

LinkContestRoom1_EventScript_15F8AD:: @ 815F8AD
	setvar VAR_TEMP_1, 21
	return

LinkContestRoom1_EventScript_15F8B3:: @ 815F8B3
	setvar VAR_TEMP_1, 22
	return

LinkContestRoom1_EventScript_15F8B9:: @ 815F8B9
	setvar VAR_TEMP_1, 25
	return

LinkContestRoom1_EventScript_15F8BF:: @ 815F8BF
	setvar VAR_TEMP_1, 26
	return

LinkContestRoom1_EventScript_15F8C5:: @ 815F8C5
	setvar VAR_TEMP_1, 27
	return

LinkContestRoom1_EventScript_15F8CB:: @ 815F8CB
	setvar VAR_TEMP_1, 47
	return

LinkContestRoom1_EventScript_15F8D1:: @ 815F8D1
	setvar VAR_TEMP_1, 30
	return

LinkContestRoom1_EventScript_15F8D7:: @ 815F8D7
	setvar VAR_TEMP_1, 31
	return

LinkContestRoom1_EventScript_15F8DD:: @ 815F8DD
	setvar VAR_TEMP_1, 32
	return

LinkContestRoom1_EventScript_15F8E3:: @ 815F8E3
	setvar VAR_TEMP_1, 33
	return

LinkContestRoom1_EventScript_15F8E9:: @ 815F8E9
	setvar VAR_TEMP_1, 34
	return

LinkContestRoom1_EventScript_15F8EF:: @ 815F8EF
	setvar VAR_TEMP_1, 35
	return

LinkContestRoom1_EventScript_15F8F5:: @ 815F8F5
	setvar VAR_TEMP_1, 36
	return

LinkContestRoom1_EventScript_15F8FB:: @ 815F8FB
	setvar VAR_TEMP_1, 37
	return

LinkContestRoom1_EventScript_15F901:: @ 815F901
	setvar VAR_TEMP_1, 38
	return

LinkContestRoom1_EventScript_15F907:: @ 815F907
	setvar VAR_TEMP_1, 44
	return

LinkContestRoom1_EventScript_15F90D:: @ 815F90D
	setvar VAR_TEMP_1, 45
	return

LinkContestRoom1_EventScript_15F913:: @ 815F913
	setvar VAR_TEMP_1, 46
	return

LinkContestRoom1_EventScript_15F919:: @ 815F919
	switch VAR_CONTEST_LOCATION
	case 1, LinkContestRoom1_EventScript_15F956
	case 2, LinkContestRoom1_EventScript_15F969
	case 3, LinkContestRoom1_EventScript_15F9C4
	case 4, LinkContestRoom1_EventScript_15FA70
	case 5, LinkContestRoom1_EventScript_15FA70
	return

LinkContestRoom1_EventScript_15F956:: @ 815F956
	createvobject 5, 20, 3, 2, 3, 1
	createvobject 46, 24, 11, 2, 3, 1
	return

LinkContestRoom1_EventScript_15F969:: @ 815F969
	createvobject 45, 0, 2, 3, 3, 4
	createvobject 66, 1, 2, 4, 3, 4
	createvobject 55, 2, 2, 7, 3, 4
	createvobject 46, 3, 2, 8, 3, 4
	createvobject 5, 10, 12, 3, 3, 3
	createvobject 20, 11, 12, 4, 3, 3
	createvobject 24, 12, 12, 7, 3, 3
	createvobject 12, 13, 12, 8, 3, 3
	createvobject 47, 20, 3, 2, 3, 1
	createvobject 46, 24, 11, 2, 3, 1
	return

LinkContestRoom1_EventScript_15F9C4:: @ 815F9C4
	createvobject 45, 0, 2, 3, 3, 4
	createvobject 66, 1, 2, 4, 3, 4
	createvobject 55, 2, 2, 7, 3, 4
	createvobject 48, 3, 2, 8, 3, 4
	createvobject 5, 10, 12, 3, 3, 3
	createvobject 20, 11, 12, 4, 3, 3
	createvobject 24, 12, 12, 7, 3, 3
	createvobject 45, 13, 12, 8, 3, 3
	createvobject 22, 20, 3, 2, 3, 1
	createvobject 23, 20, 6, 2, 3, 1
	createvobject 34, 20, 7, 2, 3, 1
	createvobject 46, 24, 8, 2, 3, 1
	createvobject 48, 24, 11, 2, 3, 1
	createvobject 11, 25, 3, 9, 3, 2
	createvobject 35, 26, 4, 9, 3, 2
	createvobject 17, 27, 5, 9, 3, 2
	createvobject 41, 28, 9, 9, 3, 2
	createvobject 38, 29, 10, 9, 3, 2
	createvobject 83, 30, 11, 9, 3, 2
	return

LinkContestRoom1_EventScript_15FA70:: @ 815FA70
	createvobject 45, 0, 2, 3, 3, 4
	createvobject 66, 1, 2, 4, 3, 4
	createvobject 55, 2, 2, 7, 3, 4
	createvobject 12, 3, 2, 8, 3, 4
	createvobject 39, 4, 1, 3, 3, 4
	createvobject 34, 6, 1, 5, 3, 4
	createvobject 26, 7, 1, 6, 3, 4
	createvobject 48, 9, 1, 8, 3, 4
	createvobject 5, 10, 12, 3, 3, 3
	createvobject 20, 11, 12, 4, 3, 3
	createvobject 24, 12, 12, 7, 3, 3
	createvobject 45, 13, 12, 8, 3, 3
	createvobject 50, 14, 13, 3, 3, 3
	createvobject 52, 15, 13, 4, 3, 3
	createvobject 65, 17, 13, 6, 3, 3
	createvobject 83, 18, 13, 7, 3, 3
	createvobject 116, 19, 13, 8, 3, 3
	createvobject 25, 20, 3, 2, 3, 1
	createvobject 31, 21, 6, 2, 3, 1
	createvobject 33, 22, 7, 2, 3, 1
	createvobject 46, 24, 11, 2, 3, 1
	createvobject 49, 25, 3, 9, 3, 2
	createvobject 35, 26, 4, 9, 3, 2
	createvobject 48, 27, 5, 9, 3, 2
	createvobject 41, 28, 9, 9, 3, 2
	createvobject 38, 29, 10, 9, 3, 2
	createvobject 83, 30, 11, 9, 3, 2
	return

LinkContestRoom1_EventScript_15FB64:: @ 815FB64
	switch VAR_CONTEST_LOCATION
	case 1, LinkContestRoom1_EventScript_15FBA1
	case 2, LinkContestRoom1_EventScript_15FBAD
	case 3, LinkContestRoom1_EventScript_15FBB9
	case 4, LinkContestRoom1_EventScript_15FBC5
	case 5, LinkContestRoom1_EventScript_15FBD1
	return

LinkContestRoom1_EventScript_15FBA1:: @ 815FBA1
	incrementgamestat GAME_STAT_ENTERED_CONTEST
	warp MAP_VERDANTURF_TOWN_CONTEST_LOBBY, 255, 5, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBAD:: @ 815FBAD
	incrementgamestat GAME_STAT_ENTERED_CONTEST
	warp MAP_FALLARBOR_TOWN_CONTEST_LOBBY, 255, 5, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBB9:: @ 815FBB9
	incrementgamestat GAME_STAT_ENTERED_CONTEST
	warp MAP_SLATEPORT_CITY_CONTEST_LOBBY, 255, 5, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBC5:: @ 815FBC5
	incrementgamestat GAME_STAT_ENTERED_CONTEST
	warp MAP_LILYCOVE_CITY_CONTEST_LOBBY, 255, 6, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBD1:: @ 815FBD1
	warp MAP_LILYCOVE_CITY_CONTEST_LOBBY, 255, 7, 4
	waitstate
	end

FallarborTown_ContestLobby_EventScript_15FBDB:: @ 815FBDB
LilycoveCity_ContestLobby_EventScript_15FBDB:: @ 815FBDB
SlateportCity_ContestLobby_EventScript_15FBDB:: @ 815FBDB
VerdanturfTown_ContestLobby_EventScript_15FBDB:: @ 815FBDB
	checkplayergender
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_15FBF3
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_15FBF9
	return

FallarborTown_ContestLobby_EventScript_15FBF3:: @ 815FBF3
	setvar VAR_OBJ_GFX_ID_3, EVENT_OBJ_GFX_RIVAL_BRENDAN_NORMAL
	return

FallarborTown_ContestLobby_EventScript_15FBF9:: @ 815FBF9
	setvar VAR_OBJ_GFX_ID_3, EVENT_OBJ_GFX_RIVAL_MAY_NORMAL
	return
