MauvilleCity_MapScripts:: @ 814C032
	map_script 3, MauvilleCity_MapScript1_14C038
	.byte 0

MauvilleCity_MapScript1_14C038:: @ 814C038
	setflag 2072
	clearflag 961
	setflag 2098
	clearflag 99
	setvar 0x4093, 0
	checkflag 209
	callif 1, MauvilleCity_EventScript_14C053
	end

MauvilleCity_EventScript_14C053:: @ 814C053
	clearflag 913
	setflag 912
	return

MauvilleCity_EventScript_14C05A:: @ 814C05A
	loadptr 0, MauvilleCity_Text_1664DF
	callstd 2
	end

MauvilleCity_EventScript_14C063:: @ 814C063
	loadptr 0, MauvilleCity_Text_16655C
	callstd 2
	end

MauvilleCity_EventScript_14C06C:: @ 814C06C
	loadptr 0, MauvilleCity_Text_1665DB
	callstd 2
	end

MauvilleCity_EventScript_14C075:: @ 814C075
	loadptr 0, MauvilleCity_Text_16662A
	callstd 2
	end

MauvilleCity_EventScript_14C07E:: @ 814C07E
	loadptr 0, MauvilleCity_Text_166665
	callstd 3
	end

MauvilleCity_EventScript_14C087:: @ 814C087
	loadptr 0, MauvilleCity_Text_166697
	callstd 3
	end

MauvilleCity_EventScript_14C090:: @ 814C090
	loadptr 0, MauvilleCity_Text_1666E4
	callstd 3
	end

MauvilleCity_EventScript_14C099:: @ 814C099
	loadptr 0, MauvilleCity_Text_16671C
	callstd 3
	end

MauvilleCity_EventScript_14C0A2:: @ 814C0A2
	lock
	faceplayer
	checkflag 98
	jumpeq MauvilleCity_EventScript_14C0BA
	loadptr 0, MauvilleCity_Text_16674A
	callstd 4
	setflag 98
	release
	end

MauvilleCity_EventScript_14C0BA:: @ 814C0BA
	loadptr 0, MauvilleCity_Text_166879
	callstd 4
	release
	end

MauvilleCity_EventScript_14C0C4:: @ 814C0C4
	lock
	faceplayer
	checkflag 284
	jumpeq MauvilleCity_EventScript_14C0E4
	loadptr 0, MauvilleCity_Text_165B76
	callstd 4
	closebutton
	move 7, MauvilleCity_Movement_1A083D
	waitmove 0
	release
	end

MauvilleCity_EventScript_14C0E4:: @ 814C0E4
	loadptr 0, MauvilleCity_Text_165E45
	callstd 4
	closebutton
	move 7, MauvilleCity_Movement_1A083D
	waitmove 0
	release
	end

MauvilleCity_EventScript_14C0F9:: @ 814C0F9
	lockall
	checkflag 284
	jumpeq MauvilleCity_EventScript_14C292
	move 6, MauvilleCity_Movement_1A0843
	waitmove 0
	loadptr 0, MauvilleCity_Text_165BE3
	callstd 4
	loadptr 0, MauvilleCity_Text_165C57
	callstd 4
	loadptr 0, MauvilleCity_Text_165D01
	callstd 4
	move 6, MauvilleCity_Movement_1A0839
	waitmove 0
	playsfx 21
	move 6, MauvilleCity_Movement_1A0833
	waitmove 0
	move 6, MauvilleCity_Movement_1A0835
	waitmove 0
	loadptr 0, MauvilleCity_Text_165D50
	callstd 5
	jump MauvilleCity_EventScript_14C154
	end

MauvilleCity_EventScript_14C154:: @ 814C154
	compare RESULT, 1
	callif 1, MauvilleCity_EventScript_14C23C
	compare RESULT, 0
	jumpeq MauvilleCity_EventScript_14C285
	closebutton
	switch FACING
	case 2, MauvilleCity_EventScript_14C187
	case 4, MauvilleCity_EventScript_14C1D9
	end

MauvilleCity_EventScript_14C187:: @ 814C187
	move 6, MauvilleCity_Movement_14C2AA
	move 7, MauvilleCity_Movement_14C2CC
	waitmove 0
	move 6, MauvilleCity_Movement_1A0843
	waitmove 0
	pause 30
	move 7, MauvilleCity_Movement_14C2D8
	waitmove 0
	move 255, MauvilleCity_Movement_1A0845
	waitmove 0
	loadptr 0, MauvilleCity_Text_1660FA
	callstd 4
	closebutton
	move 6, MauvilleCity_Movement_14C2B6
	move 7, MauvilleCity_Movement_14C2DF
	waitmove 0
	jump MauvilleCity_EventScript_14C22B
	end

MauvilleCity_EventScript_14C1D9:: @ 814C1D9
	move 6, MauvilleCity_Movement_14C2B0
	move 7, MauvilleCity_Movement_14C2D2
	waitmove 0
	move 6, MauvilleCity_Movement_1A0843
	waitmove 0
	pause 30
	move 7, MauvilleCity_Movement_14C2DC
	waitmove 0
	move 255, MauvilleCity_Movement_1A0845
	waitmove 0
	loadptr 0, MauvilleCity_Text_1660FA
	callstd 4
	closebutton
	move 6, MauvilleCity_Movement_14C2C1
	move 7, MauvilleCity_Movement_14C2E8
	waitmove 0
	jump MauvilleCity_EventScript_14C22B
	end

MauvilleCity_EventScript_14C22B:: @ 814C22B
	disappear 6
	disappear 7
	clearflag 806
	clearflag 809
	setflag 190
	releaseall
	end

MauvilleCity_EventScript_14C23C:: @ 814C23C
	loadptr 0, MauvilleCity_Text_165F0D
	callstd 4
	trainerbattle 3, 656, 0, MauvilleCity_Text_165F38
	move 6, MauvilleCity_Movement_1A0843
	waitmove 0
	loadptr 0, MauvilleCity_Text_165F85
	callstd 4
	move 6, MauvilleCity_Movement_1A0839
	waitmove 0
	loadptr 0, MauvilleCity_Text_165FB3
	callstd 4
	move 6, MauvilleCity_Movement_1A0843
	waitmove 0
	loadptr 0, MauvilleCity_Text_166050
	callstd 4
	return

MauvilleCity_EventScript_14C285:: @ 814C285
	setflag 284
	loadptr 0, MauvilleCity_Text_165DE8
	callstd 4
	release
	end

MauvilleCity_EventScript_14C292:: @ 814C292
	move 6, MauvilleCity_Movement_1A0839
	waitmove 0
	loadptr 0, MauvilleCity_Text_165EE2
	callstd 5
	jump MauvilleCity_EventScript_14C154
	end

MauvilleCity_Movement_14C2AA:: @ 814C2AA
	step_left
	step_left
	step_down
	step_down
	step_left
	step_end

MauvilleCity_Movement_14C2B0:: @ 814C2B0
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

MauvilleCity_Movement_14C2B6:: @ 814C2B6
	step_14
	step_14
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MauvilleCity_Movement_14C2C1:: @ 814C2C1
	step_14
	step_14
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MauvilleCity_Movement_14C2CC:: @ 814C2CC
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end

MauvilleCity_Movement_14C2D2:: @ 814C2D2
	step_left
	step_down
	step_down
	step_left
	step_left
	step_end

MauvilleCity_Movement_14C2D8:: @ 814C2D8
	step_right
	step_right
	step_26
	step_end

MauvilleCity_Movement_14C2DC:: @ 814C2DC
	step_right
	step_up
	step_end

MauvilleCity_Movement_14C2DF:: @ 814C2DF
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MauvilleCity_Movement_14C2E8:: @ 814C2E8
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MauvilleCity_EventScript_14C2F2:: @ 814C2F2
	lock
	faceplayer
	checkflag 209
	jumpeq MauvilleCity_EventScript_14C368
	compare 0x40ba, 2
	jumpeq MauvilleCity_EventScript_14C33C
	checkflag 208
	jumpeq MauvilleCity_EventScript_14C332
	loadptr 0, MauvilleCity_Text_1661C1
	callstd 4
	setorcopyvar 0x8000, 0x10f
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 208
	loadptr 0, MauvilleCity_Text_166331
	callstd 4
	release
	end

MauvilleCity_EventScript_14C332:: @ 814C332
	loadptr 0, MauvilleCity_Text_166331
	callstd 4
	release
	end

MauvilleCity_EventScript_14C33C:: @ 814C33C
	loadptr 0, MauvilleCity_Text_1663EB
	callstd 4
	setorcopyvar 0x8000, 0x138
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq MauvilleCity_EventScript_1A029B
	setflag 209
	loadptr 0, MauvilleCity_Text_166488
	callstd 4
	release
	end

MauvilleCity_EventScript_14C368:: @ 814C368
	loadptr 0, MauvilleCity_Text_166488
	callstd 4
	release
	end

