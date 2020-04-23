Route103_MapScripts:: @ 814EB81
	map_script 3, Route103_MapScript1_14EB87
	.byte 0

Route103_MapScript1_14EB87:: @ 814EB87
	call Route103_EventScript_1A014E
	call Route103_EventScript_1A02F4
	end

Route103_EventScript_14EB92:: @ 814EB92
	lockall
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq Route103_EventScript_14EBAB
	compare VAR_RESULT, 1
	goto_if_eq Route103_EventScript_14EC04
	end

Route103_EventScript_14EBAB:: @ 814EBAB
	msgbox Route103_Text_16D57A, MSGBOX_DEFAULT
	playbgm MUS_GIRL_SUP, TRUE
	applymovement 2, Route103_Movement_1A0839
	waitmovement 0
	applymovement 2, Route103_Movement_1A0833
	waitmovement 0
	applymovement 2, Route103_Movement_1A0835
	waitmovement 0
	msgbox Route103_Text_16D5B6, MSGBOX_DEFAULT
	switch VAR_STARTER_MON
	case 0, Route103_EventScript_14EC5D
	case 1, Route103_EventScript_14EC6D
	case 2, Route103_EventScript_14EC7D
	end

Route103_EventScript_14EC04:: @ 814EC04
	msgbox Route103_Text_16D762, MSGBOX_DEFAULT
	playbgm MUS_BOY_SUP, TRUE
	applymovement 2, Route103_Movement_1A0839
	waitmovement 0
	applymovement 2, Route103_Movement_1A0833
	waitmovement 0
	applymovement 2, Route103_Movement_1A0835
	waitmovement 0
	msgbox Route103_Text_16D7A9, MSGBOX_DEFAULT
	switch VAR_STARTER_MON
	case 0, Route103_EventScript_14EC8D
	case 1, Route103_EventScript_14EC9D
	case 2, Route103_EventScript_14ECAD
	end

Route103_EventScript_14EC5D:: @ 814EC5D
	trainerbattle_no_intro TRAINER_MAY_4, Route103_Text_16D65B
	goto Route103_EventScript_14ECBD
	end

Route103_EventScript_14EC6D:: @ 814EC6D
	trainerbattle_no_intro TRAINER_MAY_7, Route103_Text_16D65B
	goto Route103_EventScript_14ECBD
	end

Route103_EventScript_14EC7D:: @ 814EC7D
	trainerbattle_no_intro TRAINER_MAY_1, Route103_Text_16D65B
	goto Route103_EventScript_14ECBD
	end

Route103_EventScript_14EC8D:: @ 814EC8D
	trainerbattle_no_intro TRAINER_BRENDAN_4, Route103_Text_16D836
	goto Route103_EventScript_14ECCB
	end

Route103_EventScript_14EC9D:: @ 814EC9D
	trainerbattle_no_intro TRAINER_BRENDAN_7, Route103_Text_16D836
	goto Route103_EventScript_14ECCB
	end

Route103_EventScript_14ECAD:: @ 814ECAD
	trainerbattle_no_intro TRAINER_BRENDAN_1, Route103_Text_16D836
	goto Route103_EventScript_14ECCB
	end

Route103_EventScript_14ECBD:: @ 814ECBD
	msgbox Route103_Text_16D688, MSGBOX_DEFAULT
	goto Route103_EventScript_14ECD9
	end

Route103_EventScript_14ECCB:: @ 814ECCB
	msgbox Route103_Text_16D856, MSGBOX_DEFAULT
	goto Route103_EventScript_14ECD9
	end

Route103_EventScript_14ECD9:: @ 814ECD9
	closemessage
	switch VAR_FACING
	case 1, Route103_EventScript_14ED29
	case 2, Route103_EventScript_14ED0C
	case 3, Route103_EventScript_14ED29
	case 4, Route103_EventScript_14ED29
	end

Route103_EventScript_14ED0C:: @ 814ED0C
	applymovement 2, Route103_Movement_14ED67
	waitmovement 0
	playse SE_DANSA
	applymovement 2, Route103_Movement_14ED6B
	waitmovement 0
	goto Route103_EventScript_14ED46
	end

Route103_EventScript_14ED29:: @ 814ED29
	applymovement 2, Route103_Movement_14ED71
	waitmovement 0
	playse SE_DANSA
	applymovement 2, Route103_Movement_14ED74
	waitmovement 0
	goto Route103_EventScript_14ED46
	end

Route103_EventScript_14ED46:: @ 814ED46
	removeobject 2
	setvar VAR_ROUTE103_STATE, 1
	setvar VAR_BIRCH_LAB_STATE, 4
	clearflag FLAG_HIDE_RIVAL_BIRCH_LAB
	setflag FLAG_DEFEATED_RIVAL_ROUTE103
	setvar VAR_OLDALE_STATE, 1
	clearflag FLAG_HIDE_RIVAL_OLDALE_TOWN
	savebgm 0
	fadedefaultbgm
	releaseall
	end

Route103_Movement_14ED67:: @ 814ED67
	walk_left
	walk_down
	walk_down
	end_movement

Route103_Movement_14ED6B:: @ 814ED6B
	jump_2_down
	delay_16
	walk_down
	walk_down
	walk_down
	end_movement

Route103_Movement_14ED71:: @ 814ED71
	walk_down
	walk_down
	end_movement

Route103_Movement_14ED74:: @ 814ED74
	jump_2_down
	delay_16
	walk_down
	walk_down
	end_movement

Route103_EventScript_14ED79:: @ 814ED79
	msgbox Route103_Text_16D950, MSGBOX_NPC
	end

Route103_EventScript_14ED82:: @ 814ED82
	msgbox Route103_Text_16D996, MSGBOX_NPC
	end

Route103_EventScript_14ED8B:: @ 814ED8B
	msgbox Route103_Text_16D9FB, MSGBOX_SIGN
	end

Route103_EventScript_14ED94:: @ 814ED94
	trainerbattle_single TRAINER_DAISY, Route103_Text_1B7D55, Route103_Text_1B7D8B
	msgbox Route103_Text_1B7DB2, MSGBOX_AUTOCLOSE
	end

Route103_EventScript_14EDAB:: @ 814EDAB
	trainerbattle_double TRAINER_AMY_AND_LIV_1, Route103_Text_1B7DF7, Route103_Text_1B7E3B, Route103_Text_1B7EAC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route103_EventScript_14EDD6
	msgbox Route103_Text_1B7E50, MSGBOX_AUTOCLOSE
	end

Route103_EventScript_14EDD6:: @ 814EDD6
	trainerbattle_rematch_double TRAINER_AMY_AND_LIV_1, Route103_Text_1B7FE7, Route103_Text_1B802B, Route103_Text_1B80AF
	msgbox Route103_Text_1B8053, MSGBOX_AUTOCLOSE
	end

Route103_EventScript_14EDF1:: @ 814EDF1
	trainerbattle_double TRAINER_AMY_AND_LIV_1, Route103_Text_1B7EFB, Route103_Text_1B7F20, Route103_Text_1B7F8E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route103_EventScript_14EE1C
	msgbox Route103_Text_1B7F40, MSGBOX_AUTOCLOSE
	end

Route103_EventScript_14EE1C:: @ 814EE1C
	trainerbattle_rematch_double TRAINER_AMY_AND_LIV_1, Route103_Text_1B80FE, Route103_Text_1B8123, Route103_Text_1B81A1
	msgbox Route103_Text_1B814D, MSGBOX_AUTOCLOSE
	end

Route103_EventScript_14EE37:: @ 814EE37
	trainerbattle_single TRAINER_ANDREW, Route103_Text_1B81FA, Route103_Text_1B8258
	msgbox Route103_Text_1B8281, MSGBOX_AUTOCLOSE
	end

Route103_EventScript_14EE4E:: @ 814EE4E
	trainerbattle_single TRAINER_MIGUEL_1, Route103_Text_1B82A9, Route103_Text_1B82EC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route103_EventScript_14EE75
	msgbox Route103_Text_1B830D, MSGBOX_AUTOCLOSE
	end

Route103_EventScript_14EE75:: @ 814EE75
	trainerbattle_rematch TRAINER_MIGUEL_1, Route103_Text_1B8349, Route103_Text_1B838C
	msgbox Route103_Text_1B83A4, MSGBOX_AUTOCLOSE
	end
