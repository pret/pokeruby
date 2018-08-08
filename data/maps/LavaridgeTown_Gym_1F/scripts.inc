LavaridgeTown_Gym_1F_MapScripts:: @ 815368E
	map_script 3, LavaridgeTown_Gym_1F_MapScript1_153694
	.byte 0

LavaridgeTown_Gym_1F_MapScript1_153694:: @ 8153694
	call LavaridgeTown_Gym_1F_EventScript_15369F
	call LavaridgeTown_Gym_1F_EventScript_1536FF
	end

LavaridgeTown_Gym_1F_EventScript_15369F:: @ 815369F
	setvar VAR_TEMP_B, 0
	setvar VAR_TEMP_C, 0
	setvar VAR_TEMP_D, 0
	setvar VAR_TEMP_E, 0
	setvar VAR_TEMP_F, 0
	goto_if_trainer_defeated TRAINER_COLE, LavaridgeTown_Gym_1F_EventScript_1536C6
	setvar VAR_TEMP_B, 1

LavaridgeTown_Gym_1F_EventScript_1536C6:: @ 81536C6
	goto_if_trainer_defeated TRAINER_ZANE, LavaridgeTown_Gym_1F_EventScript_1536D4
	setvar VAR_TEMP_C, 1

LavaridgeTown_Gym_1F_EventScript_1536D4:: @ 81536D4
	goto_if_trainer_defeated TRAINER_AXLE, LavaridgeTown_Gym_1F_EventScript_1536E2
	setvar VAR_TEMP_D, 1

LavaridgeTown_Gym_1F_EventScript_1536E2:: @ 81536E2
	goto_if_trainer_defeated TRAINER_SADIE, LavaridgeTown_Gym_1F_EventScript_1536F0
	setvar VAR_TEMP_E, 1

LavaridgeTown_Gym_1F_EventScript_1536F0:: @ 81536F0
	goto_if_trainer_defeated TRAINER_ANDY, LavaridgeTown_Gym_1F_EventScript_1536FE
	setvar VAR_TEMP_F, 1

LavaridgeTown_Gym_1F_EventScript_1536FE:: @ 81536FE
	return

LavaridgeTown_Gym_1F_EventScript_1536FF:: @ 81536FF
	goto_if_trainer_defeated TRAINER_COLE, LavaridgeTown_Gym_1F_EventScript_15370C
	setobjectmovementtype 2, 63

LavaridgeTown_Gym_1F_EventScript_15370C:: @ 815370C
	goto_if_trainer_defeated TRAINER_ZANE, LavaridgeTown_Gym_1F_EventScript_153719
	setobjectmovementtype 3, 63

LavaridgeTown_Gym_1F_EventScript_153719:: @ 8153719
	goto_if_trainer_defeated TRAINER_AXLE, LavaridgeTown_Gym_1F_EventScript_153726
	setobjectmovementtype 4, 63

LavaridgeTown_Gym_1F_EventScript_153726:: @ 8153726
	goto_if_trainer_defeated TRAINER_SADIE, LavaridgeTown_Gym_1F_EventScript_153733
	setobjectmovementtype 5, 63

LavaridgeTown_Gym_1F_EventScript_153733:: @ 8153733
	goto_if_trainer_defeated TRAINER_ANDY, LavaridgeTown_Gym_1F_EventScript_153740
	setobjectmovementtype 7, 63

LavaridgeTown_Gym_1F_EventScript_153740:: @ 8153740
	return

LavaridgeTown_Gym_1F_EventScript_153741:: @ 8153741
	trainerbattle 1, TRAINER_FLANNERY, 0, LavaridgeTown_Gym_1F_Text_176801, LavaridgeTown_Gym_1F_Text_176960, LavaridgeTown_Gym_1F_EventScript_153766
	goto_if_unset FLAG_RECEIVED_TM50, LavaridgeTown_Gym_1F_EventScript_1537A7
	msgbox LavaridgeTown_Gym_1F_Text_176C4A, 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_153766:: @ 8153766
	message LavaridgeTown_Gym_1F_Text_176A62
	waitmessage
	call LavaridgeTown_Gym_1F_EventScript_1A02C5
	msgbox LavaridgeTown_Gym_1F_Text_176A8C, 4
	setflag FLAG_DEFEATED_LAVARIDGE_GYM
	setflag FLAG_BADGE04_GET
	addvar VAR_PETALBURG_GYM_STATE, 1
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_eq LavaridgeTown_Gym_1F_EventScript_1A00FB
	setvar VAR_SPECIAL_8, 4
	call LavaridgeTown_Gym_1F_EventScript_1A01C0
	setflag FLAG_HIDE_WALLY_WANDAS_HOUSE
	setvar VAR_LAVARIDGE_RIVAL_STATE, 1
	goto LavaridgeTown_Gym_1F_EventScript_1537A7
	end

LavaridgeTown_Gym_1F_EventScript_1537A7:: @ 81537A7
	giveitem_std ITEM_TM50_OVERHEAT
	compare RESULT, 0
	goto_if_eq LavaridgeTown_Gym_1F_EventScript_1A029B
	msgbox LavaridgeTown_Gym_1F_Text_176B8F, 4
	setflag FLAG_RECEIVED_TM50
	release
	end

LavaridgeTown_Gym_1F_EventScript_1537CB:: @ 81537CB
	trainerbattle 2, TRAINER_COLE, 2, LavaridgeTown_Gym_1F_Text_176432, LavaridgeTown_Gym_1F_Text_17644F, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_176472, 6
	end

LavaridgeTown_Gym_1F_EventScript_1537E6:: @ 81537E6
	call LavaridgeTown_Gym_1F_EventScript_15369F
	release
	end

LavaridgeTown_Gym_1F_EventScript_1537ED:: @ 81537ED
	trainerbattle 2, TRAINER_AXLE, 4, LavaridgeTown_Gym_1F_Text_1764D1, LavaridgeTown_Gym_1F_Text_176516, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_176537, 6
	end

LavaridgeTown_Gym_1F_EventScript_153808:: @ 8153808
	trainerbattle 2, TRAINER_ANDY, 7, LavaridgeTown_Gym_1F_Text_17658D, LavaridgeTown_Gym_1F_Text_17663F, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_176660, 6
	end

LavaridgeTown_Gym_1F_EventScript_153823:: @ 8153823
	trainerbattle 2, TRAINER_SADIE, 5, LavaridgeTown_Gym_1F_Text_176784, LavaridgeTown_Gym_1F_Text_1767A6, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_1767C1, 6
	end

LavaridgeTown_Gym_1F_EventScript_15383E:: @ 815383E
	trainerbattle 2, TRAINER_ZANE, 3, LavaridgeTown_Gym_1F_Text_1766D2, LavaridgeTown_Gym_1F_Text_1766FE, LavaridgeTown_Gym_1F_EventScript_1537E6
	msgbox LavaridgeTown_Gym_1F_Text_17671D, 6
	end

LavaridgeTown_Gym_1F_EventScript_153859:: @ 8153859
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_LAVARIDGE_GYM, LavaridgeTown_Gym_1F_EventScript_15386E
	msgbox LavaridgeTown_Gym_1F_Text_176312, 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_15386E:: @ 815386E
	msgbox LavaridgeTown_Gym_1F_Text_17640C, 4
	release
	end

LavaridgeTown_Gym_1F_EventScript_153878:: @ 8153878
	lockall
	goto_if_set FLAG_BADGE04_GET, LavaridgeTown_Gym_1F_EventScript_153898
	goto LavaridgeTown_Gym_1F_EventScript_1538A2
	end

LavaridgeTown_Gym_1F_EventScript_153888:: @ 8153888
	lockall
	goto_if_set FLAG_BADGE04_GET, LavaridgeTown_Gym_1F_EventScript_153898
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
