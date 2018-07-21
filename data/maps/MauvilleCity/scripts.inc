MauvilleCity_MapScripts:: @ 814C032
	map_script 3, MauvilleCity_MapScript1_14C038
	.byte 0

MauvilleCity_MapScript1_14C038:: @ 814C038
	setflag FLAG_VISITED_MAUVILLE_CITY
	clearflag FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	setflag FLAG_SYS_TV_START
	clearflag FLAG_MAUVILLE_GYM_BARRIERS_STATE
	setvar VAR_MAUVILLE_GYM_STATE, 0
	call_if_set FLAG_RECEIVED_TM24, MauvilleCity_EventScript_14C053
	end

MauvilleCity_EventScript_14C053:: @ 814C053
	clearflag FLAG_HIDE_WATTSON_MAUVILLE_GYM
	setflag FLAG_HIDE_WATTSON_MAUVILLE
	return

MauvilleCity_EventScript_14C05A:: @ 814C05A
	msgbox MauvilleCity_Text_1664DF, 2
	end

MauvilleCity_EventScript_14C063:: @ 814C063
	msgbox MauvilleCity_Text_16655C, 2
	end

MauvilleCity_EventScript_14C06C:: @ 814C06C
	msgbox MauvilleCity_Text_1665DB, 2
	end

MauvilleCity_EventScript_14C075:: @ 814C075
	msgbox MauvilleCity_Text_16662A, 2
	end

MauvilleCity_EventScript_14C07E:: @ 814C07E
	msgbox MauvilleCity_Text_166665, 3
	end

MauvilleCity_EventScript_14C087:: @ 814C087
	msgbox MauvilleCity_Text_166697, 3
	end

MauvilleCity_EventScript_14C090:: @ 814C090
	msgbox MauvilleCity_Text_1666E4, 3
	end

MauvilleCity_EventScript_14C099:: @ 814C099
	msgbox MauvilleCity_Text_16671C, 3
	end

MauvilleCity_EventScript_14C0A2:: @ 814C0A2
	lock
	faceplayer
	goto_if_set FLAG_TV_EXPLAINED, MauvilleCity_EventScript_14C0BA
	msgbox MauvilleCity_Text_16674A, 4
	setflag FLAG_TV_EXPLAINED
	release
	end

MauvilleCity_EventScript_14C0BA:: @ 814C0BA
	msgbox MauvilleCity_Text_166879, 4
	release
	end

MauvilleCity_EventScript_14C0C4:: @ 814C0C4
	lock
	faceplayer
	goto_if_set FLAG_DECLINED_WALLY_BATTLE_MAUVILLE, MauvilleCity_EventScript_14C0E4
	msgbox MauvilleCity_Text_165B76, 4
	closemessage
	applymovement 7, MauvilleCity_Movement_1A083D
	waitmovement 0
	release
	end

MauvilleCity_EventScript_14C0E4:: @ 814C0E4
	msgbox MauvilleCity_Text_165E45, 4
	closemessage
	applymovement 7, MauvilleCity_Movement_1A083D
	waitmovement 0
	release
	end

MauvilleCity_EventScript_14C0F9:: @ 814C0F9
	lockall
	goto_if_set FLAG_DECLINED_WALLY_BATTLE_MAUVILLE, MauvilleCity_EventScript_14C292
	applymovement 6, MauvilleCity_Movement_1A0843
	waitmovement 0
	msgbox MauvilleCity_Text_165BE3, 4
	msgbox MauvilleCity_Text_165C57, 4
	msgbox MauvilleCity_Text_165D01, 4
	applymovement 6, MauvilleCity_Movement_1A0839
	waitmovement 0
	playse SE_PIN
	applymovement 6, MauvilleCity_Movement_1A0833
	waitmovement 0
	applymovement 6, MauvilleCity_Movement_1A0835
	waitmovement 0
	msgbox MauvilleCity_Text_165D50, MSGBOX_YESNO
	goto MauvilleCity_EventScript_14C154
	end

MauvilleCity_EventScript_14C154:: @ 814C154
	compare RESULT, YES
	call_if_eq MauvilleCity_EventScript_14C23C
	compare RESULT, NO
	goto_if_eq MauvilleCity_EventScript_14C285
	closemessage
	switch FACING
	case 2, MauvilleCity_EventScript_14C187
	case 4, MauvilleCity_EventScript_14C1D9
	end

MauvilleCity_EventScript_14C187:: @ 814C187
	applymovement 6, MauvilleCity_Movement_14C2AA
	applymovement 7, MauvilleCity_Movement_14C2CC
	waitmovement 0
	applymovement 6, MauvilleCity_Movement_1A0843
	waitmovement 0
	delay 30
	applymovement 7, MauvilleCity_Movement_14C2D8
	waitmovement 0
	applymovement 255, MauvilleCity_Movement_1A0845
	waitmovement 0
	msgbox MauvilleCity_Text_1660FA, 4
	closemessage
	applymovement 6, MauvilleCity_Movement_14C2B6
	applymovement 7, MauvilleCity_Movement_14C2DF
	waitmovement 0
	goto MauvilleCity_EventScript_14C22B
	end

MauvilleCity_EventScript_14C1D9:: @ 814C1D9
	applymovement 6, MauvilleCity_Movement_14C2B0
	applymovement 7, MauvilleCity_Movement_14C2D2
	waitmovement 0
	applymovement 6, MauvilleCity_Movement_1A0843
	waitmovement 0
	delay 30
	applymovement 7, MauvilleCity_Movement_14C2DC
	waitmovement 0
	applymovement 255, MauvilleCity_Movement_1A0845
	waitmovement 0
	msgbox MauvilleCity_Text_1660FA, 4
	closemessage
	applymovement 6, MauvilleCity_Movement_14C2C1
	applymovement 7, MauvilleCity_Movement_14C2E8
	waitmovement 0
	goto MauvilleCity_EventScript_14C22B
	end

MauvilleCity_EventScript_14C22B:: @ 814C22B
	removeobject 6
	removeobject 7
	clearflag FLAG_HIDE_WALLY_WANDAS_HOUSE
	clearflag FLAG_HIDE_WALLY_FATHER_WANDAS_HOUSE
	setflag FLAG_DEFEATED_WALLY_MAUVILLE
	releaseall
	end

MauvilleCity_EventScript_14C23C:: @ 814C23C
	msgbox MauvilleCity_Text_165F0D, 4
	trainerbattle 3, TRAINER_WALLY_2, 0, MauvilleCity_Text_165F38
	applymovement 6, MauvilleCity_Movement_1A0843
	waitmovement 0
	msgbox MauvilleCity_Text_165F85, 4
	applymovement 6, MauvilleCity_Movement_1A0839
	waitmovement 0
	msgbox MauvilleCity_Text_165FB3, 4
	applymovement 6, MauvilleCity_Movement_1A0843
	waitmovement 0
	msgbox MauvilleCity_Text_166050, 4
	return

MauvilleCity_EventScript_14C285:: @ 814C285
	setflag FLAG_DECLINED_WALLY_BATTLE_MAUVILLE
	msgbox MauvilleCity_Text_165DE8, 4
	release
	end

MauvilleCity_EventScript_14C292:: @ 814C292
	applymovement 6, MauvilleCity_Movement_1A0839
	waitmovement 0
	msgbox MauvilleCity_Text_165EE2, MSGBOX_YESNO
	goto MauvilleCity_EventScript_14C154
	end

MauvilleCity_Movement_14C2AA:: @ 814C2AA
	walk_left
	walk_left
	walk_down
	walk_down
	walk_left
	end_movement

MauvilleCity_Movement_14C2B0:: @ 814C2B0
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	end_movement

MauvilleCity_Movement_14C2B6:: @ 814C2B6
	delay_16
	delay_16
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

MauvilleCity_Movement_14C2C1:: @ 814C2C1
	delay_16
	delay_16
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

MauvilleCity_Movement_14C2CC:: @ 814C2CC
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	end_movement

MauvilleCity_Movement_14C2D2:: @ 814C2D2
	walk_left
	walk_down
	walk_down
	walk_left
	walk_left
	end_movement

MauvilleCity_Movement_14C2D8:: @ 814C2D8
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

MauvilleCity_Movement_14C2DC:: @ 814C2DC
	walk_right
	walk_up
	end_movement

MauvilleCity_Movement_14C2DF:: @ 814C2DF
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

MauvilleCity_Movement_14C2E8:: @ 814C2E8
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

MauvilleCity_EventScript_14C2F2:: @ 814C2F2
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM24, MauvilleCity_EventScript_14C368
	compare VAR_NEW_MAUVILLE_STATE, 2
	goto_if_eq MauvilleCity_EventScript_14C33C
	goto_if_set FLAG_RECEIVED_BASEMENT_KEY, MauvilleCity_EventScript_14C332
	msgbox MauvilleCity_Text_1661C1, 4
	giveitem_std ITEM_BASEMENT_KEY
	setflag FLAG_RECEIVED_BASEMENT_KEY
	msgbox MauvilleCity_Text_166331, 4
	release
	end

MauvilleCity_EventScript_14C332:: @ 814C332
	msgbox MauvilleCity_Text_166331, 4
	release
	end

MauvilleCity_EventScript_14C33C:: @ 814C33C
	msgbox MauvilleCity_Text_1663EB, 4
	giveitem_std ITEM_TM24_THUNDERBOLT
	compare RESULT, 0
	goto_if_eq MauvilleCity_EventScript_1A029B
	setflag FLAG_RECEIVED_TM24
	msgbox MauvilleCity_Text_166488, 4
	release
	end

MauvilleCity_EventScript_14C368:: @ 814C368
	msgbox MauvilleCity_Text_166488, 4
	release
	end
