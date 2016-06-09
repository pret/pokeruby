FortreeCity_Gym_MapScripts:: @ 8157ED3
	map_script 3, FortreeCity_Gym_MapScript1_157EDE
	map_script 4, FortreeCity_Gym_MapScript2_157EE2
	.byte 0

FortreeCity_Gym_MapScript1_157EDE:: @ 8157EDE
	special 201
	end

FortreeCity_Gym_MapScript2_157EE2:: @ 8157EE2
	map_script_2 0x4000, 16384, FortreeCity_Gym_EventScript_157EEC
	.2byte 0

FortreeCity_Gym_EventScript_157EEC:: @ 8157EEC
	special 202
	end

FortreeCity_Gym_EventScript_157EF0:: @ 8157EF0
	trainerbattle 1, 270, 0, FortreeCity_Gym_Text_185CCB, FortreeCity_Gym_Text_185DBA, FortreeCity_Gym_EventScript_157F15
	checkflag 170
	jumpif 0, FortreeCity_Gym_EventScript_157F3E
	loadptr 0, FortreeCity_Gym_Text_185F98
	callstd 4
	release
	end

FortreeCity_Gym_EventScript_157F15:: @ 8157F15
	message FortreeCity_Gym_Text_185E48
	waittext
	call FortreeCity_Gym_EventScript_1A02C5
	loadptr 0, FortreeCity_Gym_Text_185E73
	callstd 4
	setflag 1225
	setflag 2060
	setvar 0x8008, 6
	call FortreeCity_Gym_EventScript_1A01C0
	jump FortreeCity_Gym_EventScript_157F3E
	end

FortreeCity_Gym_EventScript_157F3E:: @ 8157F3E
	setorcopyvar 0x8000, 0x148
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq FortreeCity_Gym_EventScript_1A029B
	loadptr 0, FortreeCity_Gym_Text_185F4A
	callstd 4
	setflag 170
	release
	end

FortreeCity_Gym_EventScript_157F62:: @ 8157F62
	trainerbattle 0, 401, 0, FortreeCity_Gym_Text_1859B9, FortreeCity_Gym_Text_1859EA
	loadptr 0, FortreeCity_Gym_Text_185A02
	callstd 6
	end

FortreeCity_Gym_EventScript_157F79:: @ 8157F79
	trainerbattle 0, 404, 0, FortreeCity_Gym_Text_185A7F, FortreeCity_Gym_Text_185AEC
	loadptr 0, FortreeCity_Gym_Text_185B18
	callstd 6
	end

FortreeCity_Gym_EventScript_157F90:: @ 8157F90
	trainerbattle 0, 654, 0, FortreeCity_Gym_Text_185B8D, FortreeCity_Gym_Text_185BEB
	loadptr 0, FortreeCity_Gym_Text_185C00
	callstd 6
	end

FortreeCity_Gym_EventScript_157FA7:: @ 8157FA7
	trainerbattle 0, 655, 0, FortreeCity_Gym_Text_185C45, FortreeCity_Gym_Text_185C7C
	loadptr 0, FortreeCity_Gym_Text_185C8C
	callstd 6
	end

FortreeCity_Gym_EventScript_157FBE:: @ 8157FBE
	lock
	faceplayer
	checkflag 1225
	jumpeq FortreeCity_Gym_EventScript_157FD3
	loadptr 0, FortreeCity_Gym_Text_18589C
	callstd 4
	release
	end

FortreeCity_Gym_EventScript_157FD3:: @ 8157FD3
	loadptr 0, FortreeCity_Gym_Text_185994
	callstd 4
	release
	end

FortreeCity_Gym_EventScript_157FDD:: @ 8157FDD
	lockall
	checkflag 2060
	jumpeq FortreeCity_Gym_EventScript_157FFD
	jump FortreeCity_Gym_EventScript_158007
	end

FortreeCity_Gym_EventScript_157FED:: @ 8157FED
	lockall
	checkflag 2060
	jumpeq FortreeCity_Gym_EventScript_157FFD
	jump FortreeCity_Gym_EventScript_158007
	end

FortreeCity_Gym_EventScript_157FFD:: @ 8157FFD
	loadptr 0, FortreeCity_Gym_Text_185FEE
	callstd 4
	releaseall
	end

FortreeCity_Gym_EventScript_158007:: @ 8158007
	loadptr 0, FortreeCity_Gym_Text_185FD5
	callstd 4
	releaseall
	end

