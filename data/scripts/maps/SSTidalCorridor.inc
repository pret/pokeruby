SSTidalCorridor_MapScripts:: @ 815FC94
	map_script 2, SSTidalCorridor_MapScript2_15FC9A
	.byte 0

SSTidalCorridor_MapScript2_15FC9A:: @ 815FC9A
	map_script_2 0x40b4, 1, SSTidalCorridor_EventScript_15FCBC
	map_script_2 0x40b4, 5, SSTidalCorridor_EventScript_15FCD2
	map_script_2 0x40b4, 9, SSTidalCorridor_EventScript_15FD24
	map_script_2 0x40b4, 10, SSTidalCorridor_EventScript_15FD3A
	.2byte 0

SSTidalCorridor_EventScript_15FCBC:: @ 815FCBC
	special SetSSTidalFlag
	setvar 0x40b4, 2
	lockall
	playse 73
	msgbox SSTidalCorridor_Text_199007, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FCD2:: @ 815FCD2
	setvar 0x40b4, 6
	lockall
	playse 73
	msgbox SSTidalCorridor_Text_199088, 4
	releaseall
	end

SSTidalRooms_EventScript_15FCE5:: @ 815FCE5
	special SetSSTidalFlag
	setvar 0x40b4, 7
	playse 73
	msgbox SSTidalRooms_Text_199007, 4
	return

SSTidalRooms_EventScript_15FCF9:: @ 815FCF9
	special ResetSSTidalFlag
	setvar 0x40b4, 4
	playse 73
	msgbox SSTidalRooms_Text_1990F8, 4
	return

gUnknown_0815FD0D:: @ 815FD0D
	compare 0x40B4, 2
	goto_if_eq SSTidalCorridor_EventScript_15FD24
	compare 0x40B4, 7
	goto_if_eq SSTidalCorridor_EventScript_15FD3A
	end

SSTidalCorridor_EventScript_15FD24:: @ 815FD24
	special ResetSSTidalFlag
	setvar 0x40b4, 3
	lockall
	playse 73
	msgbox SSTidalCorridor_Text_199088, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FD3A:: @ 815FD3A
	special ResetSSTidalFlag
	setvar 0x40b4, 8
	lockall
	playse 73
	msgbox SSTidalCorridor_Text_1990B4, 4
	releaseall
	end

SSTidalRooms_EventScript_15FD50:: @ 815FD50
	special ResetSSTidalFlag
	setvar 0x40b4, 8
	playse 73
	msgbox SSTidalRooms_Text_1990B4, 4
	return

SSTidalRooms_EventScript_15FD64:: @ 815FD64
	switch 0x40b4
	case 2, SSTidalRooms_EventScript_15FCF9
	case 3, SSTidalRooms_EventScript_15FCF9
	case 6, SSTidalRooms_EventScript_15FCE5
	case 7, SSTidalRooms_EventScript_15FD50
	return

SSTidalCorridor_EventScript_15FD96:: @ 815FD96
	msgbox SSTidalCorridor_Text_199291, 2
	end

SSTidalCorridor_EventScript_15FD9F:: @ 815FD9F
	lock
	faceplayer
	waitse
	pokecry SPECIES_WINGULL, 0
	msgbox SSTidalCorridor_Text_199388, 4
	waitpokecry
	release
	end

SSTidalCorridor_EventScript_15FDB2:: @ 815FDB2
	msgbox SSTidalCorridor_Text_1993A1, 3
	end

SSTidalCorridor_EventScript_15FDBB:: @ 815FDBB
	msgbox SSTidalCorridor_Text_1993A9, 3
	end

SSTidalCorridor_EventScript_15FDC4:: @ 815FDC4
	msgbox SSTidalCorridor_Text_1993B1, 3
	end

SSTidalCorridor_EventScript_15FDCD:: @ 815FDCD
	msgbox SSTidalCorridor_Text_1993B9, 3
	end

SSTidalCorridor_EventScript_15FDD6:: @ 815FDD6
	lock
	faceplayer
	compare 0x40b4, 4
	goto_if_eq SSTidalCorridor_EventScript_15FDF8
	compare 0x40b4, 8
	goto_if_eq SSTidalCorridor_EventScript_15FE17
	msgbox SSTidalCorridor_Text_19913B, 4
	release
	end

SSTidalCorridor_EventScript_15FDF8:: @ 815FDF8
	sethealplace 8
	msgbox SSTidalCorridor_Text_1991F4, 4
	checkflag 260
	call_if 1, SSTidalCorridor_EventScript_15FE36
	warp LilycoveCity_Harbor, 255, 8, 11
	waitstate
	release
	end

SSTidalCorridor_EventScript_15FE17:: @ 815FE17
	sethealplace 4
	msgbox SSTidalCorridor_Text_1991F4, 4
	checkflag 260
	call_if 1, SSTidalCorridor_EventScript_15FE36
	warp SlateportCity_Harbor, 255, 8, 11
	waitstate
	release
	end

SSTidalCorridor_EventScript_15FE36:: @ 815FE36
	setflag 951
	return

SSTidalCorridor_EventScript_15FE3A:: @ 815FE3A
	lockall
	compare 0x40b4, 2
	goto_if_eq SSTidalCorridor_EventScript_15FE5B
	compare 0x40b4, 7
	goto_if_eq SSTidalCorridor_EventScript_15FE5B
	msgbox SSTidalCorridor_Text_199268, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FE5B:: @ 815FE5B
	special sub_80C7958
	waitstate
	end

SSTidalCorridor_EventScript_15FE60:: @ 815FE60
	lock
	faceplayer
	checkflag 247
	goto_if_eq SSTidalCorridor_EventScript_15FE7A
	call SSTidalCorridor_EventScript_15FE84
	msgbox SSTidalCorridor_Text_199203, 4
	release
	end

SSTidalCorridor_EventScript_15FE7A:: @ 815FE7A
	msgbox SSTidalCorridor_Text_199255, 4
	release
	end

SSTidalCorridor_EventScript_15FE84:: @ 815FE84
	checktrainerflag OPPONENT_PHILLIP
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag OPPONENT_LEONARD
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag OPPONENT_COLTON
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag OPPONENT_TUCKER
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag OPPONENT_THOMAS
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag OPPONENT_LEA_AND_JED
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag OPPONENT_GARRET
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	checktrainerflag OPPONENT_ANETTE
	goto_if 0, SSTidalCorridor_EventScript_15FED5
	setflag 247
	goto SSTidalCorridor_EventScript_15FE7A
	return

SSTidalCorridor_EventScript_15FED5:: @ 815FED5
	return
