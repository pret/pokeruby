LavaridgeTown_Gym_1F_MapScripts:: @ 815368E
	map_script 3, LavaridgeTown_Gym_1F_MapScript1_153694
	.byte 0

LavaridgeTown_Gym_1F_MapScript1_153694:: @ 8153694
	call LavaridgeTown_Gym_1F_EventScript_15369F
	call LavaridgeTown_Gym_1F_EventScript_1536FF
	end

LavaridgeTown_Gym_1F_EventScript_15369F:: @ 815369F
	setvar 0x400b, 0
	setvar 0x400c, 0
	setvar 0x400d, 0
	setvar 0x400e, 0
	setvar 0x400f, 0
	checktrainerflag 201
	jumpeq LavaridgeTown_Gym_1F_EventScript_1536C6
	setvar 0x400b, 1

LavaridgeTown_Gym_1F_EventScript_1536C6:: @ 81536C6
	checktrainerflag 648
	jumpeq LavaridgeTown_Gym_1F_EventScript_1536D4
	setvar 0x400c, 1

LavaridgeTown_Gym_1F_EventScript_1536D4:: @ 81536D4
	checktrainerflag 203
	jumpeq LavaridgeTown_Gym_1F_EventScript_1536E2
	setvar 0x400d, 1

LavaridgeTown_Gym_1F_EventScript_1536E2:: @ 81536E2
	checktrainerflag 650
	jumpeq LavaridgeTown_Gym_1F_EventScript_1536F0
	setvar 0x400e, 1

LavaridgeTown_Gym_1F_EventScript_1536F0:: @ 81536F0
	checktrainerflag 205
	jumpeq LavaridgeTown_Gym_1F_EventScript_1536FE
	setvar 0x400f, 1

LavaridgeTown_Gym_1F_EventScript_1536FE:: @ 81536FE
	return

LavaridgeTown_Gym_1F_EventScript_1536FF:: @ 81536FF
	checktrainerflag 201
	jumpeq LavaridgeTown_Gym_1F_EventScript_15370C
	spritebehave 2, 63

LavaridgeTown_Gym_1F_EventScript_15370C:: @ 815370C
	checktrainerflag 648
	jumpeq LavaridgeTown_Gym_1F_EventScript_153719
	spritebehave 3, 63

LavaridgeTown_Gym_1F_EventScript_153719:: @ 8153719
	checktrainerflag 203
	jumpeq LavaridgeTown_Gym_1F_EventScript_153726
	spritebehave 4, 63

LavaridgeTown_Gym_1F_EventScript_153726:: @ 8153726
	checktrainerflag 650
	jumpeq LavaridgeTown_Gym_1F_EventScript_153733
	spritebehave 5, 63

LavaridgeTown_Gym_1F_EventScript_153733:: @ 8153733
	checktrainerflag 205
	jumpeq LavaridgeTown_Gym_1F_EventScript_153740
	spritebehave 7, 63

LavaridgeTown_Gym_1F_EventScript_153740:: @ 8153740
	return

LavaridgeTown_Gym_1F_EventScript_153741:: @ 8153741
	trainerbattle 1, 268, 0, LavaridgeTown_Gym_1F_Text_176801, LavaridgeTown_Gym_1F_Text_176960, LavaridgeTown_Gym_1F_EventScript_153766
	checkflag 168
	jumpif 0, LavaridgeTown_Gym_1F_EventScript_1537A7
	loadptr 0, LavaridgeTown_Gym_1F_Text_176C4A
	callstd 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_153766:: @ 8153766
	message LavaridgeTown_Gym_1F_Text_176A62
	waittext
	call LavaridgeTown_Gym_1F_EventScript_1A02C5
	loadptr 0, LavaridgeTown_Gym_1F_Text_176A8C
	callstd 4
	setflag 1213
	setflag 2058
	addvar 0x4085, 1
	compare 0x4085, 6
	callif 1, LavaridgeTown_Gym_1F_EventScript_1A00FB
	setvar 0x8008, 4
	call LavaridgeTown_Gym_1F_EventScript_1A01C0
	setflag 806
	setvar 0x4053, 1
	jump LavaridgeTown_Gym_1F_EventScript_1537A7
	end

LavaridgeTown_Gym_1F_EventScript_1537A7:: @ 81537A7
	setorcopyvar 0x8000, 0x152
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq LavaridgeTown_Gym_1F_EventScript_1A029B
	loadptr 0, LavaridgeTown_Gym_1F_Text_176B8F
	callstd 4
	setflag 168
	release
	end

LavaridgeTown_Gym_1F_EventScript_1537CB:: @ 81537CB
	trainerbattle 2, 201, 2, LavaridgeTown_Gym_1F_Text_176432, LavaridgeTown_Gym_1F_Text_17644F, LavaridgeTown_Gym_1F_EventScript_1537E6
	loadptr 0, LavaridgeTown_Gym_1F_Text_176472
	callstd 6
	end

LavaridgeTown_Gym_1F_EventScript_1537E6:: @ 81537E6
	call LavaridgeTown_Gym_1F_EventScript_15369F
	release
	end

LavaridgeTown_Gym_1F_EventScript_1537ED:: @ 81537ED
	trainerbattle 2, 203, 4, LavaridgeTown_Gym_1F_Text_1764D1, LavaridgeTown_Gym_1F_Text_176516, LavaridgeTown_Gym_1F_EventScript_1537E6
	loadptr 0, LavaridgeTown_Gym_1F_Text_176537
	callstd 6
	end

LavaridgeTown_Gym_1F_EventScript_153808:: @ 8153808
	trainerbattle 2, 205, 7, LavaridgeTown_Gym_1F_Text_17658D, LavaridgeTown_Gym_1F_Text_17663F, LavaridgeTown_Gym_1F_EventScript_1537E6
	loadptr 0, LavaridgeTown_Gym_1F_Text_176660
	callstd 6
	end

LavaridgeTown_Gym_1F_EventScript_153823:: @ 8153823
	trainerbattle 2, 650, 5, LavaridgeTown_Gym_1F_Text_176784, LavaridgeTown_Gym_1F_Text_1767A6, LavaridgeTown_Gym_1F_EventScript_1537E6
	loadptr 0, LavaridgeTown_Gym_1F_Text_1767C1
	callstd 6
	end

LavaridgeTown_Gym_1F_EventScript_15383E:: @ 815383E
	trainerbattle 2, 648, 3, LavaridgeTown_Gym_1F_Text_1766D2, LavaridgeTown_Gym_1F_Text_1766FE, LavaridgeTown_Gym_1F_EventScript_1537E6
	loadptr 0, LavaridgeTown_Gym_1F_Text_17671D
	callstd 6
	end

LavaridgeTown_Gym_1F_EventScript_153859:: @ 8153859
	lock
	faceplayer
	checkflag 1213
	jumpeq LavaridgeTown_Gym_1F_EventScript_15386E
	loadptr 0, LavaridgeTown_Gym_1F_Text_176312
	callstd 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_15386E:: @ 815386E
	loadptr 0, LavaridgeTown_Gym_1F_Text_17640C
	callstd 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_153878:: @ 8153878
	lockall
	checkflag 2058
	jumpeq LavaridgeTown_Gym_1F_EventScript_153898
	jump LavaridgeTown_Gym_1F_EventScript_1538A2
	end

LavaridgeTown_Gym_1F_EventScript_153888:: @ 8153888
	lockall
	checkflag 2058
	jumpeq LavaridgeTown_Gym_1F_EventScript_153898
	jump LavaridgeTown_Gym_1F_EventScript_1538A2
	end

LavaridgeTown_Gym_1F_EventScript_153898:: @ 8153898
	loadptr 0, LavaridgeTown_Gym_1F_Text_176CCA
	callstd 4
	releaseall
	end

LavaridgeTown_Gym_1F_EventScript_1538A2:: @ 81538A2
	loadptr 0, LavaridgeTown_Gym_1F_Text_176CAF
	callstd 4
	releaseall
	end

