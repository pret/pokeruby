FortreeCity_Gym_MapScripts:: @ 8157ED3
	map_script MAP_SCRIPT_ON_TRANSITION, FortreeCity_Gym_MapScript1_157EDE
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, FortreeCity_Gym_MapScript2_157EE2
	.byte 0

FortreeCity_Gym_MapScript1_157EDE:: @ 8157EDE
	special RotatingGate_InitPuzzle
	end

FortreeCity_Gym_MapScript2_157EE2:: @ 8157EE2
	map_script_2 VAR_TEMP_0, 16384, FortreeCity_Gym_EventScript_157EEC
	.2byte 0

FortreeCity_Gym_EventScript_157EEC:: @ 8157EEC
	special RotatingGate_InitPuzzleAndGraphics
	end

FortreeCity_Gym_EventScript_157EF0:: @ 8157EF0
	trainerbattle_single TRAINER_WINONA, FortreeCity_Gym_Text_185CCB, FortreeCity_Gym_Text_185DBA, FortreeCity_Gym_EventScript_157F15, NO_MUSIC
	goto_if_unset FLAG_RECEIVED_TM40, FortreeCity_Gym_EventScript_157F3E
	msgbox FortreeCity_Gym_Text_185F98, MSGBOX_DEFAULT
	release
	end

FortreeCity_Gym_EventScript_157F15:: @ 8157F15
	message FortreeCity_Gym_Text_185E48
	waitmessage
	call FortreeCity_Gym_EventScript_1A02C5
	msgbox FortreeCity_Gym_Text_185E73, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_FORTREE_GYM
	setflag FLAG_BADGE06_GET
	setvar VAR_0x8008, 6
	call Common_EventScript_SetGymTrainers
	goto FortreeCity_Gym_EventScript_157F3E
	end

FortreeCity_Gym_EventScript_157F3E:: @ 8157F3E
	giveitem ITEM_TM40_AERIAL_ACE
	compare VAR_RESULT, 0
	goto_if_eq FortreeCity_Gym_EventScript_1A029B
	msgbox FortreeCity_Gym_Text_185F4A, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_TM40
	release
	end

FortreeCity_Gym_EventScript_157F62:: @ 8157F62
	trainerbattle_single TRAINER_JARED, FortreeCity_Gym_Text_1859B9, FortreeCity_Gym_Text_1859EA
	msgbox FortreeCity_Gym_Text_185A02, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_157F79:: @ 8157F79
	trainerbattle_single TRAINER_WILL, FortreeCity_Gym_Text_185A7F, FortreeCity_Gym_Text_185AEC
	msgbox FortreeCity_Gym_Text_185B18, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_157F90:: @ 8157F90
	trainerbattle_single TRAINER_TERRELL, FortreeCity_Gym_Text_185B8D, FortreeCity_Gym_Text_185BEB
	msgbox FortreeCity_Gym_Text_185C00, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_157FA7:: @ 8157FA7
	trainerbattle_single TRAINER_KYLEE, FortreeCity_Gym_Text_185C45, FortreeCity_Gym_Text_185C7C
	msgbox FortreeCity_Gym_Text_185C8C, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_157FBE:: @ 8157FBE
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_FORTREE_GYM, FortreeCity_Gym_EventScript_157FD3
	msgbox FortreeCity_Gym_Text_18589C, MSGBOX_DEFAULT
	release
	end

FortreeCity_Gym_EventScript_157FD3:: @ 8157FD3
	msgbox FortreeCity_Gym_Text_185994, MSGBOX_DEFAULT
	release
	end

FortreeCity_Gym_EventScript_157FDD:: @ 8157FDD
	lockall
	goto_if_set FLAG_BADGE06_GET, FortreeCity_Gym_EventScript_157FFD
	goto FortreeCity_Gym_EventScript_158007
	end

FortreeCity_Gym_EventScript_157FED:: @ 8157FED
	lockall
	goto_if_set FLAG_BADGE06_GET, FortreeCity_Gym_EventScript_157FFD
	goto FortreeCity_Gym_EventScript_158007
	end

FortreeCity_Gym_EventScript_157FFD:: @ 8157FFD
	msgbox FortreeCity_Gym_Text_185FEE, MSGBOX_DEFAULT
	releaseall
	end

FortreeCity_Gym_EventScript_158007:: @ 8158007
	msgbox FortreeCity_Gym_Text_185FD5, MSGBOX_DEFAULT
	releaseall
	end
