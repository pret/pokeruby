FortreeCity_Gym_MapScripts:: @ 8157ED3
	map_script 3, FortreeCity_Gym_MapScript1_157EDE
	map_script 4, FortreeCity_Gym_MapScript2_157EE2
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
	trainerbattle 1, TRAINER_WINONA, 0, FortreeCity_Gym_Text_185CCB, FortreeCity_Gym_Text_185DBA, FortreeCity_Gym_EventScript_157F15
	goto_if_unset FLAG_RECEIVED_TM40, FortreeCity_Gym_EventScript_157F3E
	msgbox FortreeCity_Gym_Text_185F98, 4
	release
	end

FortreeCity_Gym_EventScript_157F15:: @ 8157F15
	message FortreeCity_Gym_Text_185E48
	waitmessage
	call FortreeCity_Gym_EventScript_1A02C5
	msgbox FortreeCity_Gym_Text_185E73, 4
	setflag FLAG_DEFEATED_FORTREE_GYM
	setflag FLAG_BADGE06_GET
	setvar VAR_SPECIAL_8, 6
	call FortreeCity_Gym_EventScript_1A01C0
	goto FortreeCity_Gym_EventScript_157F3E
	end

FortreeCity_Gym_EventScript_157F3E:: @ 8157F3E
	giveitem_std ITEM_TM40_AERIAL_ACE
	compare RESULT, 0
	goto_if_eq FortreeCity_Gym_EventScript_1A029B
	msgbox FortreeCity_Gym_Text_185F4A, 4
	setflag FLAG_RECEIVED_TM40
	release
	end

FortreeCity_Gym_EventScript_157F62:: @ 8157F62
	trainerbattle 0, TRAINER_JARED, 0, FortreeCity_Gym_Text_1859B9, FortreeCity_Gym_Text_1859EA
	msgbox FortreeCity_Gym_Text_185A02, 6
	end

FortreeCity_Gym_EventScript_157F79:: @ 8157F79
	trainerbattle 0, TRAINER_WILL, 0, FortreeCity_Gym_Text_185A7F, FortreeCity_Gym_Text_185AEC
	msgbox FortreeCity_Gym_Text_185B18, 6
	end

FortreeCity_Gym_EventScript_157F90:: @ 8157F90
	trainerbattle 0, TRAINER_TERRELL, 0, FortreeCity_Gym_Text_185B8D, FortreeCity_Gym_Text_185BEB
	msgbox FortreeCity_Gym_Text_185C00, 6
	end

FortreeCity_Gym_EventScript_157FA7:: @ 8157FA7
	trainerbattle 0, TRAINER_KYLEE, 0, FortreeCity_Gym_Text_185C45, FortreeCity_Gym_Text_185C7C
	msgbox FortreeCity_Gym_Text_185C8C, 6
	end

FortreeCity_Gym_EventScript_157FBE:: @ 8157FBE
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_FORTREE_GYM, FortreeCity_Gym_EventScript_157FD3
	msgbox FortreeCity_Gym_Text_18589C, 4
	release
	end

FortreeCity_Gym_EventScript_157FD3:: @ 8157FD3
	msgbox FortreeCity_Gym_Text_185994, 4
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
	msgbox FortreeCity_Gym_Text_185FEE, 4
	releaseall
	end

FortreeCity_Gym_EventScript_158007:: @ 8158007
	msgbox FortreeCity_Gym_Text_185FD5, 4
	releaseall
	end
