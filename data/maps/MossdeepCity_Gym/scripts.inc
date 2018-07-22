MossdeepCity_Gym_MapScripts:: @ 815A4D3
	map_script 1, MossdeepCity_Gym_MapScript1_15A4D9
	.byte 0

MossdeepCity_Gym_MapScript1_15A4D9:: @ 815A4D9
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_1, MossdeepCity_Gym_EventScript_15A510
	goto MossdeepCity_Gym_EventScript_15A4E8
	end

MossdeepCity_Gym_EventScript_15A4E8:: @ 815A4E8
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_2, MossdeepCity_Gym_EventScript_15A528
	goto MossdeepCity_Gym_EventScript_15A4F7
	end

MossdeepCity_Gym_EventScript_15A4F7:: @ 815A4F7
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_3, MossdeepCity_Gym_EventScript_15A540
	goto MossdeepCity_Gym_EventScript_15A506
	end

MossdeepCity_Gym_EventScript_15A506:: @ 815A506
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_4, MossdeepCity_Gym_EventScript_15A558
	end

MossdeepCity_Gym_EventScript_15A510:: @ 815A510
	setmetatile 5, 5, 516, 0
	setmetatile 2, 7, 569, 1
	goto MossdeepCity_Gym_EventScript_15A4E8
	end

MossdeepCity_Gym_EventScript_15A528:: @ 815A528
	setmetatile 8, 14, 516, 0
	setmetatile 8, 10, 569, 1
	goto MossdeepCity_Gym_EventScript_15A4F7
	end

MossdeepCity_Gym_EventScript_15A540:: @ 815A540
	setmetatile 15, 17, 524, 0
	setmetatile 17, 15, 569, 1
	goto MossdeepCity_Gym_EventScript_15A506
	end

MossdeepCity_Gym_EventScript_15A558:: @ 815A558
	setmetatile 1, 23, 525, 0
	setmetatile 5, 24, 569, 1
	end

MossdeepCity_Gym_EventScript_15A56B:: @ 815A56B
	trainerbattle 8, TRAINER_TATE_AND_LIZA, 0, MossdeepCity_Gym_Text_18CF02, MossdeepCity_Gym_Text_18D077, MossdeepCity_Gym_Text_18D324, MossdeepCity_Gym_EventScript_15A594
	goto_if_unset FLAG_RECEIVED_TM04, MossdeepCity_Gym_EventScript_15A5C6
	msgbox MossdeepCity_Gym_Text_18D273, 4
	release
	end

MossdeepCity_Gym_EventScript_15A594:: @ 815A594
	message MossdeepCity_Gym_Text_18D0F9
	waitmessage
	call MossdeepCity_Gym_EventScript_1A02C5
	msgbox MossdeepCity_Gym_Text_18D128, 4
	setflag FLAG_DEFEATED_MOSSDEEP_GYM
	setflag FLAG_BADGE07_GET
	clearflag FLAG_HIDE_BRINEY_SLATEPORT_SHIPYARD
	clearflag FLAG_UNKNOWN_393
	setvar VAR_SPECIAL_8, 7
	call MossdeepCity_Gym_EventScript_1A01C0
	clearflag FLAG_HIDE_WORKERS_SLATEPORT_HARBOR
	goto MossdeepCity_Gym_EventScript_15A5C6
	end

MossdeepCity_Gym_EventScript_15A5C6:: @ 815A5C6
	giveitem_std ITEM_TM04_CALM_MIND
	compare RESULT, 0
	goto_if_eq MossdeepCity_Gym_EventScript_1A029B
	msgbox MossdeepCity_Gym_Text_18D1CF, 4
	setflag FLAG_RECEIVED_TM04
	release
	end

MossdeepCity_Gym_EventScript_15A5EA:: @ 815A5EA
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_1, MossdeepCity_Gym_EventScript_15A621
	setflag FLAG_MOSSDEEP_GYM_SWITCH_1
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 5, 5, 516, 0
	setmetatile 2, 7, 569, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A619:: @ 815A619
	special DrawWholeMapView
	playse SE_TK_KASYA
	releaseall
	end

MossdeepCity_Gym_EventScript_15A621:: @ 815A621
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_1
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 5, 5, 524, 0
	setmetatile 2, 7, 568, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A646:: @ 815A646
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_2, MossdeepCity_Gym_EventScript_15A675
	setflag FLAG_MOSSDEEP_GYM_SWITCH_2
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 8, 14, 516, 0
	setmetatile 8, 10, 569, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A675:: @ 815A675
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_2
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 8, 14, 517, 0
	setmetatile 8, 10, 568, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A69A:: @ 815A69A
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_3, MossdeepCity_Gym_EventScript_15A6C9
	setflag FLAG_MOSSDEEP_GYM_SWITCH_3
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 15, 17, 524, 0
	setmetatile 17, 15, 569, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A6C9:: @ 815A6C9
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_3
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 15, 17, 516, 0
	setmetatile 17, 15, 568, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A6EE:: @ 815A6EE
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_4, MossdeepCity_Gym_EventScript_15A71D
	setflag FLAG_MOSSDEEP_GYM_SWITCH_4
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 1, 23, 525, 0
	setmetatile 5, 24, 569, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A71D:: @ 815A71D
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_4
	applymovement 255, MossdeepCity_Gym_Movement_15A7F7
	waitmovement 0
	setmetatile 1, 23, 516, 0
	setmetatile 5, 24, 568, 1
	goto MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A742:: @ 815A742
	lockall
	warpteleport MAP_MOSSDEEP_CITY_GYM, 255, 14, 29
	waitstate
	releaseall
	end

MossdeepCity_Gym_EventScript_15A74E:: @ 815A74E
	trainerbattle 0, TRAINER_PRESTON, 0, MossdeepCity_Gym_Text_18C96A, MossdeepCity_Gym_Text_18C9BA
	msgbox MossdeepCity_Gym_Text_18C9E1, 6
	end

MossdeepCity_Gym_EventScript_15A765:: @ 815A765
	trainerbattle 0, TRAINER_VIRGIL, 0, MossdeepCity_Gym_Text_18CA10, MossdeepCity_Gym_Text_18CA28
	msgbox MossdeepCity_Gym_Text_18CA48, 6
	end

MossdeepCity_Gym_EventScript_15A77C:: @ 815A77C
	trainerbattle 0, TRAINER_FRITZ, 0, MossdeepCity_Gym_Text_18CAC0, MossdeepCity_Gym_Text_18CB46
	msgbox MossdeepCity_Gym_Text_18CB77, 6
	end

MossdeepCity_Gym_EventScript_15A793:: @ 815A793
	trainerbattle 0, TRAINER_HANNAH, 0, MossdeepCity_Gym_Text_18CC1E, MossdeepCity_Gym_Text_18CC83
	msgbox MossdeepCity_Gym_Text_18CC9B, 6
	end

MossdeepCity_Gym_EventScript_15A7AA:: @ 815A7AA
	trainerbattle 0, TRAINER_SAMANTHA, 0, MossdeepCity_Gym_Text_18CD14, MossdeepCity_Gym_Text_18CD66
	msgbox MossdeepCity_Gym_Text_18CD73, 6
	end

MossdeepCity_Gym_EventScript_15A7C1:: @ 815A7C1
	trainerbattle 0, TRAINER_MAURA, 0, MossdeepCity_Gym_Text_18CDE0, MossdeepCity_Gym_Text_18CE47
	msgbox MossdeepCity_Gym_Text_18CE6C, 6
	end

MossdeepCity_Gym_EventScript_15A7D8:: @ 815A7D8
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_MOSSDEEP_GYM, MossdeepCity_Gym_EventScript_15A7ED
	msgbox MossdeepCity_Gym_Text_18C7E3, 4
	release
	end

MossdeepCity_Gym_EventScript_15A7ED:: @ 815A7ED
	msgbox MossdeepCity_Gym_Text_18C938, 4
	release
	end

MossdeepCity_Gym_Movement_15A7F7:: @ 815A7F7
	delay_16
	delay_16
	end_movement

MossdeepCity_Gym_EventScript_15A7FA:: @ 815A7FA
	lockall
	goto_if_set FLAG_BADGE07_GET, MossdeepCity_Gym_EventScript_15A81A
	goto MossdeepCity_Gym_EventScript_15A824
	end

MossdeepCity_Gym_EventScript_15A80A:: @ 815A80A
	lockall
	goto_if_set FLAG_BADGE07_GET, MossdeepCity_Gym_EventScript_15A81A
	goto MossdeepCity_Gym_EventScript_15A824
	end

MossdeepCity_Gym_EventScript_15A81A:: @ 815A81A
	msgbox MossdeepCity_Gym_Text_18D424, 4
	releaseall
	end

MossdeepCity_Gym_EventScript_15A824:: @ 815A824
	msgbox MossdeepCity_Gym_Text_18D40A, 4
	releaseall
	end
