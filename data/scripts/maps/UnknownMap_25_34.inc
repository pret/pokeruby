UnknownMap_25_34_MapScripts:: @ 815F580
	map_script 4, LinkContestRoom1_MapScript2_15F610
	map_script 2, LinkContestRoom1_MapScript2_15F606
	map_script 3, LinkContestRoom1_MapScript1_15F595
	map_script 5, LinkContestRoom1_MapScript1_15F5F4
	.byte 0

LinkContestRoom1_MapScript1_15F595:: @ 815F595
	call LinkContestRoom1_EventScript_15F5A5
	setvar 0x4000, 1
	call LinkContestRoom1_EventScript_15F630
	end

LinkContestRoom1_EventScript_15F5A5:: @ 815F5A5
	special ScriptGetMultiplayerId
	compare RESULT, 0
	call_if 1, LinkContestRoom1_EventScript_15F5E0
	compare RESULT, 1
	call_if 1, LinkContestRoom1_EventScript_15F5E4
	compare RESULT, 2
	call_if 1, LinkContestRoom1_EventScript_15F5E8
	compare RESULT, 3
	call_if 1, LinkContestRoom1_EventScript_15F5EC
	compare RESULT, 4
	call_if 1, LinkContestRoom1_EventScript_15F5F0
	return

LinkContestRoom1_EventScript_15F5E0:: @ 815F5E0
	savebgm 393
	return

LinkContestRoom1_EventScript_15F5E4:: @ 815F5E4
	savebgm 394
	return

LinkContestRoom1_EventScript_15F5E8:: @ 815F5E8
	savebgm 395
	return

LinkContestRoom1_EventScript_15F5EC:: @ 815F5EC
	savebgm 396
	return

LinkContestRoom1_EventScript_15F5F0:: @ 815F5F0
	savebgm 440
	return

LinkContestRoom1_MapScript1_15F5F4:: @ 815F5F4
	compare 0x4009, 1
	call_if 1, LinkContestRoom1_EventScript_15F600
	end

LinkContestRoom1_EventScript_15F600:: @ 815F600
	call LinkContestRoom1_EventScript_15F919
	return

LinkContestRoom1_MapScript2_15F606:: @ 815F606
	map_script_2 0x4086, 1, LinkContestRoom1_EventScript_15F61A
	.2byte 0

LinkContestRoom1_MapScript2_15F610:: @ 815F610
	map_script_2 0x4086, 1, LinkContestRoom1_EventScript_15F625
	.2byte 0

LinkContestRoom1_EventScript_15F61A:: @ 815F61A
	call LinkContestRoom1_EventScript_1A514D
	call LinkContestRoom1_EventScript_15FB64
	end

LinkContestRoom1_EventScript_15F625:: @ 815F625
	hideobject 255, 0, 9
	call LinkContestRoom1_EventScript_15F919
	end

LinkContestRoom1_EventScript_15F630:: @ 815F630
	call LinkContestRoom1_EventScript_15F6E6
	call LinkContestRoom1_EventScript_15F646
	compare 0x4000, 8
	goto_if 0, LinkContestRoom1_EventScript_15F630
	return

LinkContestRoom1_EventScript_15F646:: @ 815F646
	switch 0x4000
	case 1, LinkContestRoom1_EventScript_15F699
	case 2, LinkContestRoom1_EventScript_15F6A4
	case 3, LinkContestRoom1_EventScript_15F6AF
	case 4, LinkContestRoom1_EventScript_15F6BA
	case 5, LinkContestRoom1_EventScript_15F6C5
	case 6, LinkContestRoom1_EventScript_15F6D0
	case 7, LinkContestRoom1_EventScript_15F6DB
	end

LinkContestRoom1_EventScript_15F699:: @ 815F699
	copyvar 0x4014, 0x4001
	addvar 0x4000, 1
	return

LinkContestRoom1_EventScript_15F6A4:: @ 815F6A4
	copyvar 0x4015, 0x4001
	addvar 0x4000, 1
	return

LinkContestRoom1_EventScript_15F6AF:: @ 815F6AF
	copyvar 0x4016, 0x4001
	addvar 0x4000, 1
	return

LinkContestRoom1_EventScript_15F6BA:: @ 815F6BA
	copyvar 0x4017, 0x4001
	addvar 0x4000, 1
	return

LinkContestRoom1_EventScript_15F6C5:: @ 815F6C5
	copyvar 0x4018, 0x4001
	addvar 0x4000, 1
	return

LinkContestRoom1_EventScript_15F6D0:: @ 815F6D0
	copyvar 0x4019, 0x4001
	addvar 0x4000, 1
	return

LinkContestRoom1_EventScript_15F6DB:: @ 815F6DB
	copyvar 0x401a, 0x4001
	addvar 0x4000, 1
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
	setvar 0x4001, 5
	return

LinkContestRoom1_EventScript_15F85F:: @ 815F85F
	setvar 0x4001, 6
	return

LinkContestRoom1_EventScript_15F865:: @ 815F865
	setvar 0x4001, 7
	return

LinkContestRoom1_EventScript_15F86B:: @ 815F86B
	setvar 0x4001, 8
	return

LinkContestRoom1_EventScript_15F871:: @ 815F871
	setvar 0x4001, 10
	return

LinkContestRoom1_EventScript_15F877:: @ 815F877
	setvar 0x4001, 11
	return

LinkContestRoom1_EventScript_15F87D:: @ 815F87D
	setvar 0x4001, 12
	return

LinkContestRoom1_EventScript_15F883:: @ 815F883
	setvar 0x4001, 13
	return

LinkContestRoom1_EventScript_15F889:: @ 815F889
	setvar 0x4001, 14
	return

LinkContestRoom1_EventScript_15F88F:: @ 815F88F
	setvar 0x4001, 15
	return

LinkContestRoom1_EventScript_15F895:: @ 815F895
	setvar 0x4001, 17
	return

LinkContestRoom1_EventScript_15F89B:: @ 815F89B
	setvar 0x4001, 18
	return

LinkContestRoom1_EventScript_15F8A1:: @ 815F8A1
	setvar 0x4001, 19
	return

LinkContestRoom1_EventScript_15F8A7:: @ 815F8A7
	setvar 0x4001, 20
	return

LinkContestRoom1_EventScript_15F8AD:: @ 815F8AD
	setvar 0x4001, 21
	return

LinkContestRoom1_EventScript_15F8B3:: @ 815F8B3
	setvar 0x4001, 22
	return

LinkContestRoom1_EventScript_15F8B9:: @ 815F8B9
	setvar 0x4001, 25
	return

LinkContestRoom1_EventScript_15F8BF:: @ 815F8BF
	setvar 0x4001, 26
	return

LinkContestRoom1_EventScript_15F8C5:: @ 815F8C5
	setvar 0x4001, 27
	return

LinkContestRoom1_EventScript_15F8CB:: @ 815F8CB
	setvar 0x4001, 47
	return

LinkContestRoom1_EventScript_15F8D1:: @ 815F8D1
	setvar 0x4001, 30
	return

LinkContestRoom1_EventScript_15F8D7:: @ 815F8D7
	setvar 0x4001, 31
	return

LinkContestRoom1_EventScript_15F8DD:: @ 815F8DD
	setvar 0x4001, 32
	return

LinkContestRoom1_EventScript_15F8E3:: @ 815F8E3
	setvar 0x4001, 33
	return

LinkContestRoom1_EventScript_15F8E9:: @ 815F8E9
	setvar 0x4001, 34
	return

LinkContestRoom1_EventScript_15F8EF:: @ 815F8EF
	setvar 0x4001, 35
	return

LinkContestRoom1_EventScript_15F8F5:: @ 815F8F5
	setvar 0x4001, 36
	return

LinkContestRoom1_EventScript_15F8FB:: @ 815F8FB
	setvar 0x4001, 37
	return

LinkContestRoom1_EventScript_15F901:: @ 815F901
	setvar 0x4001, 38
	return

LinkContestRoom1_EventScript_15F907:: @ 815F907
	setvar 0x4001, 44
	return

LinkContestRoom1_EventScript_15F90D:: @ 815F90D
	setvar 0x4001, 45
	return

LinkContestRoom1_EventScript_15F913:: @ 815F913
	setvar 0x4001, 46
	return

LinkContestRoom1_EventScript_15F919:: @ 815F919
	switch 0x4088
	case 1, LinkContestRoom1_EventScript_15F956
	case 2, LinkContestRoom1_EventScript_15F969
	case 3, LinkContestRoom1_EventScript_15F9C4
	case 4, LinkContestRoom1_EventScript_15FA70
	case 5, LinkContestRoom1_EventScript_15FA70
	return

LinkContestRoom1_EventScript_15F956:: @ 815F956
	createvsprite 5, 20, 3, 2, 3, 1
	createvsprite 46, 24, 11, 2, 3, 1
	return

LinkContestRoom1_EventScript_15F969:: @ 815F969
	createvsprite 45, 0, 2, 3, 3, 4
	createvsprite 66, 1, 2, 4, 3, 4
	createvsprite 55, 2, 2, 7, 3, 4
	createvsprite 46, 3, 2, 8, 3, 4
	createvsprite 5, 10, 12, 3, 3, 3
	createvsprite 20, 11, 12, 4, 3, 3
	createvsprite 24, 12, 12, 7, 3, 3
	createvsprite 12, 13, 12, 8, 3, 3
	createvsprite 47, 20, 3, 2, 3, 1
	createvsprite 46, 24, 11, 2, 3, 1
	return

LinkContestRoom1_EventScript_15F9C4:: @ 815F9C4
	createvsprite 45, 0, 2, 3, 3, 4
	createvsprite 66, 1, 2, 4, 3, 4
	createvsprite 55, 2, 2, 7, 3, 4
	createvsprite 48, 3, 2, 8, 3, 4
	createvsprite 5, 10, 12, 3, 3, 3
	createvsprite 20, 11, 12, 4, 3, 3
	createvsprite 24, 12, 12, 7, 3, 3
	createvsprite 45, 13, 12, 8, 3, 3
	createvsprite 22, 20, 3, 2, 3, 1
	createvsprite 23, 20, 6, 2, 3, 1
	createvsprite 34, 20, 7, 2, 3, 1
	createvsprite 46, 24, 8, 2, 3, 1
	createvsprite 48, 24, 11, 2, 3, 1
	createvsprite 11, 25, 3, 9, 3, 2
	createvsprite 35, 26, 4, 9, 3, 2
	createvsprite 17, 27, 5, 9, 3, 2
	createvsprite 41, 28, 9, 9, 3, 2
	createvsprite 38, 29, 10, 9, 3, 2
	createvsprite 83, 30, 11, 9, 3, 2
	return

LinkContestRoom1_EventScript_15FA70:: @ 815FA70
	createvsprite 45, 0, 2, 3, 3, 4
	createvsprite 66, 1, 2, 4, 3, 4
	createvsprite 55, 2, 2, 7, 3, 4
	createvsprite 12, 3, 2, 8, 3, 4
	createvsprite 39, 4, 1, 3, 3, 4
	createvsprite 34, 6, 1, 5, 3, 4
	createvsprite 26, 7, 1, 6, 3, 4
	createvsprite 48, 9, 1, 8, 3, 4
	createvsprite 5, 10, 12, 3, 3, 3
	createvsprite 20, 11, 12, 4, 3, 3
	createvsprite 24, 12, 12, 7, 3, 3
	createvsprite 45, 13, 12, 8, 3, 3
	createvsprite 50, 14, 13, 3, 3, 3
	createvsprite 52, 15, 13, 4, 3, 3
	createvsprite 65, 17, 13, 6, 3, 3
	createvsprite 83, 18, 13, 7, 3, 3
	createvsprite 116, 19, 13, 8, 3, 3
	createvsprite 25, 20, 3, 2, 3, 1
	createvsprite 31, 21, 6, 2, 3, 1
	createvsprite 33, 22, 7, 2, 3, 1
	createvsprite 46, 24, 11, 2, 3, 1
	createvsprite 49, 25, 3, 9, 3, 2
	createvsprite 35, 26, 4, 9, 3, 2
	createvsprite 48, 27, 5, 9, 3, 2
	createvsprite 41, 28, 9, 9, 3, 2
	createvsprite 38, 29, 10, 9, 3, 2
	createvsprite 83, 30, 11, 9, 3, 2
	return

LinkContestRoom1_EventScript_15FB64:: @ 815FB64
	switch 0x4088
	case 1, LinkContestRoom1_EventScript_15FBA1
	case 2, LinkContestRoom1_EventScript_15FBAD
	case 3, LinkContestRoom1_EventScript_15FBB9
	case 4, LinkContestRoom1_EventScript_15FBC5
	case 5, LinkContestRoom1_EventScript_15FBD1
	return

LinkContestRoom1_EventScript_15FBA1:: @ 815FBA1
	inccounter GAME_STAT_ENTERED_CONTEST
	warp VerdanturfTown_ContestLobby, 255, 5, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBAD:: @ 815FBAD
	inccounter GAME_STAT_ENTERED_CONTEST
	warp FallarborTown_ContestLobby, 255, 5, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBB9:: @ 815FBB9
	inccounter GAME_STAT_ENTERED_CONTEST
	warp SlateportCity_ContestLobby, 255, 5, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBC5:: @ 815FBC5
	inccounter GAME_STAT_ENTERED_CONTEST
	warp LilycoveCity_ContestLobby, 255, 6, 4
	waitstate
	end

LinkContestRoom1_EventScript_15FBD1:: @ 815FBD1
	warp LilycoveCity_ContestLobby, 255, 7, 4
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
	setvar 0x4013, 100
	return

FallarborTown_ContestLobby_EventScript_15FBF9:: @ 815FBF9
	setvar 0x4013, 105
	return
