SSTidalCorridor_MapScripts:: @ 815FC94
	map_script 2, SSTidalCorridor_MapScript2_15FC9A
	.byte 0

SSTidalCorridor_MapScript2_15FC9A:: @ 815FC9A
	map_script_2 VAR_PORTHOLE_STATE, 1, SSTidalCorridor_EventScript_15FCBC
	map_script_2 VAR_PORTHOLE_STATE, 5, SSTidalCorridor_EventScript_15FCD2
	map_script_2 VAR_PORTHOLE_STATE, 9, SSTidalCorridor_EventScript_15FD24
	map_script_2 VAR_PORTHOLE_STATE, 10, SSTidalCorridor_EventScript_15FD3A
	.2byte 0

SSTidalCorridor_EventScript_15FCBC:: @ 815FCBC
	special SetSSTidalFlag
	setvar VAR_PORTHOLE_STATE, 2
	lockall
	playse SE_PINPON
	msgbox SSTidalCorridor_Text_199007, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FCD2:: @ 815FCD2
	setvar VAR_PORTHOLE_STATE, 6
	lockall
	playse SE_PINPON
	msgbox SSTidalCorridor_Text_199088, 4
	releaseall
	end

SSTidalRooms_EventScript_15FCE5:: @ 815FCE5
	special SetSSTidalFlag
	setvar VAR_PORTHOLE_STATE, 7
	playse SE_PINPON
	msgbox SSTidalRooms_Text_199007, 4
	return

SSTidalRooms_EventScript_15FCF9:: @ 815FCF9
	special ResetSSTidalFlag
	setvar VAR_PORTHOLE_STATE, 4
	playse SE_PINPON
	msgbox SSTidalRooms_Text_1990F8, 4
	return

gUnknown_0815FD0D:: @ 815FD0D
	compare VAR_PORTHOLE_STATE, 2
	goto_if_eq SSTidalCorridor_EventScript_15FD24
	compare VAR_PORTHOLE_STATE, 7
	goto_if_eq SSTidalCorridor_EventScript_15FD3A
	end

SSTidalCorridor_EventScript_15FD24:: @ 815FD24
	special ResetSSTidalFlag
	setvar VAR_PORTHOLE_STATE, 3
	lockall
	playse SE_PINPON
	msgbox SSTidalCorridor_Text_199088, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FD3A:: @ 815FD3A
	special ResetSSTidalFlag
	setvar VAR_PORTHOLE_STATE, 8
	lockall
	playse SE_PINPON
	msgbox SSTidalCorridor_Text_1990B4, 4
	releaseall
	end

SSTidalRooms_EventScript_15FD50:: @ 815FD50
	special ResetSSTidalFlag
	setvar VAR_PORTHOLE_STATE, 8
	playse SE_PINPON
	msgbox SSTidalRooms_Text_1990B4, 4
	return

SSTidalRooms_EventScript_15FD64:: @ 815FD64
	switch VAR_PORTHOLE_STATE
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
	playmoncry SPECIES_WINGULL, 0
	msgbox SSTidalCorridor_Text_199388, 4
	waitmoncry
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
	compare VAR_PORTHOLE_STATE, 4
	goto_if_eq SSTidalCorridor_EventScript_15FDF8
	compare VAR_PORTHOLE_STATE, 8
	goto_if_eq SSTidalCorridor_EventScript_15FE17
	msgbox SSTidalCorridor_Text_19913B, 4
	release
	end

SSTidalCorridor_EventScript_15FDF8:: @ 815FDF8
	setrespawn HEAL_LOCATION_LILYCOVE_CITY
	msgbox SSTidalCorridor_Text_1991F4, 4
	call_if_set FLAG_RECEIVED_TM49, SSTidalCorridor_EventScript_15FE36
	warp MAP_LILYCOVE_CITY_HARBOR, 255, 8, 11
	waitstate
	release
	end

SSTidalCorridor_EventScript_15FE17:: @ 815FE17
	setrespawn HEAL_LOCATION_SLATEPORT_CITY
	msgbox SSTidalCorridor_Text_1991F4, 4
	call_if_set FLAG_RECEIVED_TM49, SSTidalCorridor_EventScript_15FE36
	warp MAP_SLATEPORT_CITY_HARBOR, 255, 8, 11
	waitstate
	release
	end

SSTidalCorridor_EventScript_15FE36:: @ 815FE36
	setflag FLAG_HIDE_TM_49_GIVER_SS_TIDAL
	return

SSTidalCorridor_EventScript_15FE3A:: @ 815FE3A
	lockall
	compare VAR_PORTHOLE_STATE, 2
	goto_if_eq SSTidalCorridor_EventScript_15FE5B
	compare VAR_PORTHOLE_STATE, 7
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
	goto_if_set FLAG_DEFEATED_SS_TIDAL_TRAINERS, SSTidalCorridor_EventScript_15FE7A
	call SSTidalCorridor_EventScript_15FE84
	msgbox SSTidalCorridor_Text_199203, 4
	release
	end

SSTidalCorridor_EventScript_15FE7A:: @ 815FE7A
	msgbox SSTidalCorridor_Text_199255, 4
	release
	end

SSTidalCorridor_EventScript_15FE84:: @ 815FE84
	goto_if_trainer_not_defeated TRAINER_PHILLIP, SSTidalCorridor_EventScript_15FED5
	goto_if_trainer_not_defeated TRAINER_LEONARD, SSTidalCorridor_EventScript_15FED5
	goto_if_trainer_not_defeated TRAINER_COLTON, SSTidalCorridor_EventScript_15FED5
	goto_if_trainer_not_defeated TRAINER_TUCKER, SSTidalCorridor_EventScript_15FED5
	goto_if_trainer_not_defeated TRAINER_THOMAS, SSTidalCorridor_EventScript_15FED5
	goto_if_trainer_not_defeated TRAINER_LEA_AND_JED, SSTidalCorridor_EventScript_15FED5
	goto_if_trainer_not_defeated TRAINER_GARRET, SSTidalCorridor_EventScript_15FED5
	goto_if_trainer_not_defeated TRAINER_ANETTE, SSTidalCorridor_EventScript_15FED5
	setflag FLAG_DEFEATED_SS_TIDAL_TRAINERS
	goto SSTidalCorridor_EventScript_15FE7A
	return

SSTidalCorridor_EventScript_15FED5:: @ 815FED5
	return
