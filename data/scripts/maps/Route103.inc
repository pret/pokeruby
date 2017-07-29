Route103_MapScripts:: @ 814EB81
	map_script 3, Route103_MapScript1_14EB87
	.byte 0

Route103_MapScript1_14EB87:: @ 814EB87
	call Route103_EventScript_1A014E
	call Route103_EventScript_1A02F4
	end

Route103_EventScript_14EB92:: @ 814EB92
	lockall
	checkgender
	compare RESULT, 0
	jumpeq Route103_EventScript_14EBAB
	compare RESULT, 1
	jumpeq Route103_EventScript_14EC04
	end

Route103_EventScript_14EBAB:: @ 814EBAB
	msgbox Route103_Text_16D57A, 4
	playmusic 415, 1
	move 2, Route103_Movement_1A0839
	waitmove 0
	move 2, Route103_Movement_1A0833
	waitmove 0
	move 2, Route103_Movement_1A0835
	waitmove 0
	msgbox Route103_Text_16D5B6, 4
	switch 0x4023
	case 0, Route103_EventScript_14EC5D
	case 1, Route103_EventScript_14EC6D
	case 2, Route103_EventScript_14EC7D
	end

Route103_EventScript_14EC04:: @ 814EC04
	msgbox Route103_Text_16D762, 4
	playmusic 421, 1
	move 2, Route103_Movement_1A0839
	waitmove 0
	move 2, Route103_Movement_1A0833
	waitmove 0
	move 2, Route103_Movement_1A0835
	waitmove 0
	msgbox Route103_Text_16D7A9, 4
	switch 0x4023
	case 0, Route103_EventScript_14EC8D
	case 1, Route103_EventScript_14EC9D
	case 2, Route103_EventScript_14ECAD
	end

Route103_EventScript_14EC5D:: @ 814EC5D
	trainerbattle 3, OPPONENT_MAY_4, 0, Route103_Text_16D65B
	jump Route103_EventScript_14ECBD
	end

Route103_EventScript_14EC6D:: @ 814EC6D
	trainerbattle 3, OPPONENT_MAY_7, 0, Route103_Text_16D65B
	jump Route103_EventScript_14ECBD
	end

Route103_EventScript_14EC7D:: @ 814EC7D
	trainerbattle 3, OPPONENT_MAY_1, 0, Route103_Text_16D65B
	jump Route103_EventScript_14ECBD
	end

Route103_EventScript_14EC8D:: @ 814EC8D
	trainerbattle 3, OPPONENT_BRENDAN_4, 0, Route103_Text_16D836
	jump Route103_EventScript_14ECCB
	end

Route103_EventScript_14EC9D:: @ 814EC9D
	trainerbattle 3, OPPONENT_BRENDAN_7, 0, Route103_Text_16D836
	jump Route103_EventScript_14ECCB
	end

Route103_EventScript_14ECAD:: @ 814ECAD
	trainerbattle 3, OPPONENT_BRENDAN_1, 0, Route103_Text_16D836
	jump Route103_EventScript_14ECCB
	end

Route103_EventScript_14ECBD:: @ 814ECBD
	msgbox Route103_Text_16D688, 4
	jump Route103_EventScript_14ECD9
	end

Route103_EventScript_14ECCB:: @ 814ECCB
	msgbox Route103_Text_16D856, 4
	jump Route103_EventScript_14ECD9
	end

Route103_EventScript_14ECD9:: @ 814ECD9
	closebutton
	switch FACING
	case 1, Route103_EventScript_14ED29
	case 2, Route103_EventScript_14ED0C
	case 3, Route103_EventScript_14ED29
	case 4, Route103_EventScript_14ED29
	end

Route103_EventScript_14ED0C:: @ 814ED0C
	move 2, Route103_Movement_14ED67
	waitmove 0
	playsfx 10
	move 2, Route103_Movement_14ED6B
	waitmove 0
	jump Route103_EventScript_14ED46
	end

Route103_EventScript_14ED29:: @ 814ED29
	move 2, Route103_Movement_14ED71
	waitmove 0
	playsfx 10
	move 2, Route103_Movement_14ED74
	waitmove 0
	jump Route103_EventScript_14ED46
	end

Route103_EventScript_14ED46:: @ 814ED46
	disappear 2
	setvar 0x4062, 1
	setvar 0x4084, 4
	clearflag 889
	setflag 130
	setvar 0x40c7, 1
	clearflag 979
	playmusicbattle 0
	fadedefault
	releaseall
	end

Route103_Movement_14ED67:: @ 814ED67
	step_left
	step_down
	step_down
	step_end

Route103_Movement_14ED6B:: @ 814ED6B
	fast_step_down
	step_14
	step_down
	step_down
	step_down
	step_end

Route103_Movement_14ED71:: @ 814ED71
	step_down
	step_down
	step_end

Route103_Movement_14ED74:: @ 814ED74
	fast_step_down
	step_14
	step_down
	step_down
	step_end

Route103_EventScript_14ED79:: @ 814ED79
	msgbox Route103_Text_16D950, 2
	end

Route103_EventScript_14ED82:: @ 814ED82
	msgbox Route103_Text_16D996, 2
	end

Route103_EventScript_14ED8B:: @ 814ED8B
	msgbox Route103_Text_16D9FB, 3
	end

Route103_EventScript_14ED94:: @ 814ED94
	trainerbattle 0, OPPONENT_DAISY, 0, Route103_Text_1B7D55, Route103_Text_1B7D8B
	msgbox Route103_Text_1B7DB2, 6
	end

Route103_EventScript_14EDAB:: @ 814EDAB
	trainerbattle 4, OPPONENT_AMY_AND_LIV_1, 0, Route103_Text_1B7DF7, Route103_Text_1B7E3B, Route103_Text_1B7EAC
	specialval RESULT, sub_8082C68
	compare RESULT, 1
	jumpeq Route103_EventScript_14EDD6
	msgbox Route103_Text_1B7E50, 6
	end

Route103_EventScript_14EDD6:: @ 814EDD6
	trainerbattle 7, OPPONENT_AMY_AND_LIV_1, 0, Route103_Text_1B7FE7, Route103_Text_1B802B, Route103_Text_1B80AF
	msgbox Route103_Text_1B8053, 6
	end

Route103_EventScript_14EDF1:: @ 814EDF1
	trainerbattle 4, OPPONENT_AMY_AND_LIV_1, 0, Route103_Text_1B7EFB, Route103_Text_1B7F20, Route103_Text_1B7F8E
	specialval RESULT, sub_8082C68
	compare RESULT, 1
	jumpeq Route103_EventScript_14EE1C
	msgbox Route103_Text_1B7F40, 6
	end

Route103_EventScript_14EE1C:: @ 814EE1C
	trainerbattle 7, OPPONENT_AMY_AND_LIV_1, 0, Route103_Text_1B80FE, Route103_Text_1B8123, Route103_Text_1B81A1
	msgbox Route103_Text_1B814D, 6
	end

Route103_EventScript_14EE37:: @ 814EE37
	trainerbattle 0, OPPONENT_ANDREW, 0, Route103_Text_1B81FA, Route103_Text_1B8258
	msgbox Route103_Text_1B8281, 6
	end

Route103_EventScript_14EE4E:: @ 814EE4E
	trainerbattle 0, OPPONENT_MIGUEL_1, 0, Route103_Text_1B82A9, Route103_Text_1B82EC
	specialval RESULT, sub_8082C68
	compare RESULT, 1
	jumpeq Route103_EventScript_14EE75
	msgbox Route103_Text_1B830D, 6
	end

Route103_EventScript_14EE75:: @ 814EE75
	trainerbattle 5, OPPONENT_MIGUEL_1, 0, Route103_Text_1B8349, Route103_Text_1B838C
	msgbox Route103_Text_1B83A4, 6
	end
