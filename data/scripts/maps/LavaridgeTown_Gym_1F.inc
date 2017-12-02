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
	checktrainerflag OPPONENT_COLE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_1536C6
	setvar 0x400b, 1

LavaridgeTown_Gym_1F_EventScript_1536C6:: @ 81536C6
	checktrainerflag OPPONENT_ZANE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_1536D4
	setvar 0x400c, 1

LavaridgeTown_Gym_1F_EventScript_1536D4:: @ 81536D4
	checktrainerflag OPPONENT_AXLE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_1536E2
	setvar 0x400d, 1

LavaridgeTown_Gym_1F_EventScript_1536E2:: @ 81536E2
	checktrainerflag OPPONENT_SADIE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_1536F0
	setvar 0x400e, 1

LavaridgeTown_Gym_1F_EventScript_1536F0:: @ 81536F0
	checktrainerflag OPPONENT_ANDY
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_1536FE
	setvar 0x400f, 1

LavaridgeTown_Gym_1F_EventScript_1536FE:: @ 81536FE
	return

LavaridgeTown_Gym_1F_EventScript_1536FF:: @ 81536FF
	checktrainerflag OPPONENT_COLE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_15370C
	setobjectmovementtype 2, 63

LavaridgeTown_Gym_1F_EventScript_15370C:: @ 815370C
	checktrainerflag OPPONENT_ZANE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_153719
	setobjectmovementtype 3, 63

LavaridgeTown_Gym_1F_EventScript_153719:: @ 8153719
	checktrainerflag OPPONENT_AXLE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_153726
	setobjectmovementtype 4, 63

LavaridgeTown_Gym_1F_EventScript_153726:: @ 8153726
	checktrainerflag OPPONENT_SADIE
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_153733
	setobjectmovementtype 5, 63

LavaridgeTown_Gym_1F_EventScript_153733:: @ 8153733
	checktrainerflag OPPONENT_ANDY
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_153740
	setobjectmovementtype 7, 63

LavaridgeTown_Gym_1F_EventScript_153740:: @ 8153740
	return

LavaridgeTown_Gym_1F_EventScript_153741:: @ 8153741
	trainerbattle 1, OPPONENT_FLANNERY, 0, LavaridgeTown_Gym_1F_Text_176801, LavaridgeTown_Gym_1F_Text_176960, LavaridgeTown_Gym_1F_EventScript_153766
	checkflag 168
	goto_if 0, LavaridgeTown_Gym_1F_EventScript_1537A7
	msgbox LavaridgeTown_Gym_1F_Text_176C4A, 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_153766:: @ 8153766
	message LavaridgeTown_Gym_1F_Text_176A62
	waitmessage
	call LavaridgeTown_Gym_1F_EventScript_1A02C5
	msgbox LavaridgeTown_Gym_1F_Text_176A8C, 4
	setflag 1213
	setflag BADGE04_GET
	addvar 0x4085, 1
	compare 0x4085, 6
	call_if 1, LavaridgeTown_Gym_1F_EventScript_1A00FB
	setvar 0x8008, 4
	call LavaridgeTown_Gym_1F_EventScript_1A01C0
	setflag 806
	setvar 0x4053, 1
	goto LavaridgeTown_Gym_1F_EventScript_1537A7
	end

LavaridgeTown_Gym_1F_EventScript_1537A7:: @ 81537A7
	giveitem ITEM_TM50
	compare RESULT, 0
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_1A029B
	msgbox LavaridgeTown_Gym_1F_Text_176B8F, 4
	setflag 168
	release
	end

LavaridgeTown_Gym_1F_EventScript_1537CB:: @ 81537CB
	trainerbattle 2, OPPONENT_COLE, 2, LavaridgeTown_Gym_1F_Text_176432, LavaridgeTown_Gym_1F_Text_17644F, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_176472, 6
	end

LavaridgeTown_Gym_1F_EventScript_1537E6:: @ 81537E6
	call LavaridgeTown_Gym_1F_EventScript_15369F
	release
	end

LavaridgeTown_Gym_1F_EventScript_1537ED:: @ 81537ED
	trainerbattle 2, OPPONENT_AXLE, 4, LavaridgeTown_Gym_1F_Text_1764D1, LavaridgeTown_Gym_1F_Text_176516, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_176537, 6
	end

LavaridgeTown_Gym_1F_EventScript_153808:: @ 8153808
	trainerbattle 2, OPPONENT_ANDY, 7, LavaridgeTown_Gym_1F_Text_17658D, LavaridgeTown_Gym_1F_Text_17663F, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_176660, 6
	end

LavaridgeTown_Gym_1F_EventScript_153823:: @ 8153823
	trainerbattle 2, OPPONENT_SADIE, 5, LavaridgeTown_Gym_1F_Text_176784, LavaridgeTown_Gym_1F_Text_1767A6, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_1767C1, 6
	end

LavaridgeTown_Gym_1F_EventScript_15383E:: @ 815383E
	trainerbattle 2, OPPONENT_ZANE, 3, LavaridgeTown_Gym_1F_Text_1766D2, LavaridgeTown_Gym_1F_Text_1766FE, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_17671D, 6
	end

LavaridgeTown_Gym_1F_EventScript_153859:: @ 8153859
	lock
	faceplayer
	checkflag 1213
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_15386E
	msgbox LavaridgeTown_Gym_1F_Text_176312, 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_15386E:: @ 815386E
	msgbox LavaridgeTown_Gym_1F_Text_17640C, 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_153878:: @ 8153878
	lockall
	checkflag BADGE04_GET
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_153898
	goto LavaridgeTown_Gym_1F_EventScript_1538A2
	end

LavaridgeTown_Gym_1F_EventScript_153888:: @ 8153888
	lockall
	checkflag BADGE04_GET
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_153898
	goto LavaridgeTown_Gym_1F_EventScript_1538A2
	end

LavaridgeTown_Gym_1F_EventScript_153898:: @ 8153898
	msgbox LavaridgeTown_Gym_1F_Text_176CCA, 4
	releaseall
	end

LavaridgeTown_Gym_1F_EventScript_1538A2:: @ 81538A2
	msgbox LavaridgeTown_Gym_1F_Text_176CAF, 4
	releaseall
	end
