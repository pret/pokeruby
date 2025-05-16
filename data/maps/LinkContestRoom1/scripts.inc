LinkContestRoom1_MapScripts:: @ 815F580
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, LinkContestRoom1_MapScript2_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LinkContestRoom1_MapScript2_OnFrame
	map_script MAP_SCRIPT_ON_TRANSITION, LinkContestRoom1_MapScript1_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, LinkContestRoom1_MapScript2_OnResume
	.byte 0

LinkContestRoom1_MapScript1_OnTransition:: @ 815F595
	call LinkContestRoom1_EventScript_ReadyContestMusic
	setvar VAR_TEMP_0, 1
	call LinkContestRoom1_EventScript_AddRandomAudienceMembers
	end

LinkContestRoom1_EventScript_ReadyContestMusic:: @ 815F5A5
	special ScriptGetMultiplayerId
	compare VAR_RESULT, 0
	call_if_eq LinkContestRoom1_EventScript_SaveContestMusicPlayer1
	compare VAR_RESULT, 1
	call_if_eq LinkContestRoom1_EventScript_SaveContestMusicPlayer2
	compare VAR_RESULT, 2
	call_if_eq LinkContestRoom1_EventScript_SaveContestMusicPlayer3
	compare VAR_RESULT, 3
	call_if_eq LinkContestRoom1_EventScript_SaveContestMusicPlayer4
	compare VAR_RESULT, 4
	call_if_eq LinkContestRoom1_EventScript_SaveContestMusic
	return

LinkContestRoom1_EventScript_SaveContestMusicPlayer1:: @ 815F5E0
	savebgm MUS_LINK_CONTEST_P1
	return

LinkContestRoom1_EventScript_SaveContestMusicPlayer2:: @ 815F5E4
	savebgm MUS_LINK_CONTEST_P2
	return

LinkContestRoom1_EventScript_SaveContestMusicPlayer3:: @ 815F5E8
	savebgm MUS_LINK_CONTEST_P3
	return

LinkContestRoom1_EventScript_SaveContestMusicPlayer4:: @ 815F5EC
	savebgm MUS_LINK_CONTEST_P4
	return

LinkContestRoom1_EventScript_SaveContestMusic:: @ 815F5F0
	savebgm MUS_CONTEST
	return

LinkContestRoom1_MapScript2_OnResume:: @ 815F5F4
	compare VAR_TEMP_9, 1
	call_if_eq LinkContestRoom1_EventScript_15F600
	end

LinkContestRoom1_EventScript_15F600:: @ 815F600
	call LinkContestRoom1_EventScript_15F919
	return

LinkContestRoom1_MapScript2_OnFrame:: @ 815F606
	map_script_2 VAR_LINK_CONTEST_ROOM_STATE, 1, LinkContestRoom1_EventScript_15F61A
	.2byte 0

LinkContestRoom1_MapScript2_OnWarp:: @ 815F610
	map_script_2 VAR_LINK_CONTEST_ROOM_STATE, 1, LinkContestRoom1_EventScript_15F625
	.2byte 0

LinkContestRoom1_EventScript_15F61A:: @ 815F61A
	call LinkContestRoom1_EventScript_1A514D
	call LinkContestRoom1_EventScript_15FB64
	end

LinkContestRoom1_EventScript_15F625:: @ 815F625
	hideobjectat OBJ_EVENT_ID_PLAYER, MAP_LITTLEROOT_TOWN
	call LinkContestRoom1_EventScript_15F919
	end

LinkContestRoom1_EventScript_AddRandomAudienceMembers:: @ 815F630
	call LinkContestRoom1_EventScript_GetRandomAudienceGfxId
	call ContestHall_EventScript_SetRandomAudienceGfx
	compare VAR_TEMP_0, 8
	goto_if_lt LinkContestRoom1_EventScript_AddRandomAudienceMembers
	return

ContestHall_EventScript_SetRandomAudienceGfx:: @ 815F646
	switch VAR_TEMP_0
	case 1, LinkContestRoom1_EventScript_SetRandomAudience1
	case 2, LinkContestRoom1_EventScript_SetRandomAudience2
	case 3, LinkContestRoom1_EventScript_SetRandomAudience3
	case 4, LinkContestRoom1_EventScript_SetRandomAudience4
	case 5, LinkContestRoom1_EventScript_SetRandomAudience5
	case 6, LinkContestRoom1_EventScript_SetRandomAudience6
	case 7, LinkContestRoom1_EventScript_SetRandomAudience7
	end

LinkContestRoom1_EventScript_SetRandomAudience1:: @ 815F699
	copyvar VAR_OBJ_GFX_ID_4, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_SetRandomAudience2:: @ 815F6A4
	copyvar VAR_OBJ_GFX_ID_5, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_SetRandomAudience3:: @ 815F6AF
	copyvar VAR_OBJ_GFX_ID_6, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_SetRandomAudience4:: @ 815F6BA
	copyvar VAR_OBJ_GFX_ID_7, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_SetRandomAudience5:: @ 815F6C5
	copyvar VAR_OBJ_GFX_ID_8, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_SetRandomAudience6:: @ 815F6D0
	copyvar VAR_OBJ_GFX_ID_9, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_SetRandomAudience7:: @ 815F6DB
	copyvar VAR_OBJ_GFX_ID_A, VAR_TEMP_1
	addvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_GetRandomAudienceGfxId:: @ 815F6E6
	setvar VAR_RESULT, 32
	special ScriptRandom
	addvar VAR_RESULT, 1
	switch VAR_RESULT
	case 1, LinkContestRoom1_EventScript_RandomAudience5
	case 2, LinkContestRoom1_EventScript_RandomAudience6
	case 3, LinkContestRoom1_EventScript_RandomAudience7
	case 4, LinkContestRoom1_EventScript_RandomAudience8
	case 5, LinkContestRoom1_EventScript_RandomAudience10
	case 6, LinkContestRoom1_EventScript_RandomAudience11
	case 7, LinkContestRoom1_EventScript_RandomAudience12
	case 8, LinkContestRoom1_EventScript_RandomAudience13
	case 9, LinkContestRoom1_EventScript_RandomAudience14
	case 10, LinkContestRoom1_EventScript_RandomAudience15
	case 11, LinkContestRoom1_EventScript_RandomAudience17
	case 12, LinkContestRoom1_EventScript_RandomAudience18
	case 13, LinkContestRoom1_EventScript_RandomAudience19
	case 14, LinkContestRoom1_EventScript_RandomAudience20
	case 15, LinkContestRoom1_EventScript_RandomAudience21
	case 16, LinkContestRoom1_EventScript_RandomAudience22
	case 17, LinkContestRoom1_EventScript_RandomAudience25
	case 18, LinkContestRoom1_EventScript_RandomAudience26
	case 19, LinkContestRoom1_EventScript_RandomAudience27
	case 20, LinkContestRoom1_EventScript_RandomAudience47
	case 21, LinkContestRoom1_EventScript_RandomAudience30
	case 22, LinkContestRoom1_EventScript_RandomAudience31
	case 23, LinkContestRoom1_EventScript_RandomAudience32
	case 24, LinkContestRoom1_EventScript_RandomAudience33
	case 25, LinkContestRoom1_EventScript_RandomAudience34
	case 26, LinkContestRoom1_EventScript_RandomAudience35
	case 27, LinkContestRoom1_EventScript_RandomAudience36
	case 28, LinkContestRoom1_EventScript_RandomAudience37
	case 29, LinkContestRoom1_EventScript_RandomAudience38
	case 30, LinkContestRoom1_EventScript_RandomAudience44
	case 31, LinkContestRoom1_EventScript_RandomAudience45
	case 32, LinkContestRoom1_EventScript_RandomAudience46
	end

LinkContestRoom1_EventScript_RandomAudience5:: @ 815F859
	setvar VAR_TEMP_1, 5
	return

LinkContestRoom1_EventScript_RandomAudience6:: @ 815F85F
	setvar VAR_TEMP_1, 6
	return

LinkContestRoom1_EventScript_RandomAudience7:: @ 815F865
	setvar VAR_TEMP_1, 7
	return

LinkContestRoom1_EventScript_RandomAudience8:: @ 815F86B
	setvar VAR_TEMP_1, 8
	return

LinkContestRoom1_EventScript_RandomAudience10:: @ 815F871
	setvar VAR_TEMP_1, 10
	return

LinkContestRoom1_EventScript_RandomAudience11:: @ 815F877
	setvar VAR_TEMP_1, 11
	return

LinkContestRoom1_EventScript_RandomAudience12:: @ 815F87D
	setvar VAR_TEMP_1, 12
	return

LinkContestRoom1_EventScript_RandomAudience13:: @ 815F883
	setvar VAR_TEMP_1, 13
	return

LinkContestRoom1_EventScript_RandomAudience14:: @ 815F889
	setvar VAR_TEMP_1, 14
	return

LinkContestRoom1_EventScript_RandomAudience15:: @ 815F88F
	setvar VAR_TEMP_1, 15
	return

LinkContestRoom1_EventScript_RandomAudience17:: @ 815F895
	setvar VAR_TEMP_1, 17
	return

LinkContestRoom1_EventScript_RandomAudience18:: @ 815F89B
	setvar VAR_TEMP_1, 18
	return

LinkContestRoom1_EventScript_RandomAudience19:: @ 815F8A1
	setvar VAR_TEMP_1, 19
	return

LinkContestRoom1_EventScript_RandomAudience20:: @ 815F8A7
	setvar VAR_TEMP_1, 20
	return

LinkContestRoom1_EventScript_RandomAudience21:: @ 815F8AD
	setvar VAR_TEMP_1, 21
	return

LinkContestRoom1_EventScript_RandomAudience22:: @ 815F8B3
	setvar VAR_TEMP_1, 22
	return

LinkContestRoom1_EventScript_RandomAudience25:: @ 815F8B9
	setvar VAR_TEMP_1, 25
	return

LinkContestRoom1_EventScript_RandomAudience26:: @ 815F8BF
	setvar VAR_TEMP_1, 26
	return

LinkContestRoom1_EventScript_RandomAudience27:: @ 815F8C5
	setvar VAR_TEMP_1, 27
	return

LinkContestRoom1_EventScript_RandomAudience47:: @ 815F8CB
	setvar VAR_TEMP_1, 47
	return

LinkContestRoom1_EventScript_RandomAudience30:: @ 815F8D1
	setvar VAR_TEMP_1, 30
	return

LinkContestRoom1_EventScript_RandomAudience31:: @ 815F8D7
	setvar VAR_TEMP_1, 31
	return

LinkContestRoom1_EventScript_RandomAudience32:: @ 815F8DD
	setvar VAR_TEMP_1, 32
	return

LinkContestRoom1_EventScript_RandomAudience33:: @ 815F8E3
	setvar VAR_TEMP_1, 33
	return

LinkContestRoom1_EventScript_RandomAudience34:: @ 815F8E9
	setvar VAR_TEMP_1, 34
	return

LinkContestRoom1_EventScript_RandomAudience35:: @ 815F8EF
	setvar VAR_TEMP_1, 35
	return

LinkContestRoom1_EventScript_RandomAudience36:: @ 815F8F5
	setvar VAR_TEMP_1, 36
	return

LinkContestRoom1_EventScript_RandomAudience37:: @ 815F8FB
	setvar VAR_TEMP_1, 37
	return

LinkContestRoom1_EventScript_RandomAudience38:: @ 815F901
	setvar VAR_TEMP_1, 38
	return

LinkContestRoom1_EventScript_RandomAudience44:: @ 815F907
	setvar VAR_TEMP_1, 44
	return

LinkContestRoom1_EventScript_RandomAudience45:: @ 815F90D
	setvar VAR_TEMP_1, 45
	return

LinkContestRoom1_EventScript_RandomAudience46:: @ 815F913
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

LilycoveCity_ContestLobby_EventScript_SetupRivalGfxId:: @ 815FBDB
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_SetupRivalGfxIdMale
	compare VAR_RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_SetupRivalGfxIdFemale
	return

FallarborTown_ContestLobby_EventScript_SetupRivalGfxIdMale:: @ 815FBF3
	setvar VAR_OBJ_GFX_ID_3, OBJ_EVENT_GFX_RIVAL_BRENDAN_NORMAL
	return

FallarborTown_ContestLobby_EventScript_SetupRivalGfxIdFemale:: @ 815FBF9
	setvar VAR_OBJ_GFX_ID_3, OBJ_EVENT_GFX_RIVAL_MAY_NORMAL
	return
