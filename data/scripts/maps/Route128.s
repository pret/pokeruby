Route128_MapScripts:: @ 815211B
	map_script 3, Route128_MapScript1_152126
	map_script 2, Route128_MapScript2_152135
	.byte 0

Route128_MapScript1_152126:: @ 8152126
	checkflag 2090
	callif 1, Route128_EventScript_1A02C1
	call Route128_EventScript_1A0196
	end

Route128_MapScript2_152135:: @ 8152135
	map_script_2 0x407b, 1, Route128_EventScript_15213F
	.2byte 0

Route128_EventScript_15213F:: @ 815213F
	lockall
	pause 20
	.ifndef SAPPHIRE
	special 317
	waitstate
	.endif
	move 4, Route128_Movement_152271
	waitmove 0
	msgbox Route128_Text_171EE0, 4
	move 4, Route128_Movement_152279
	waitmove 0
	msgbox Route128_Text_171F35, 4
	closebutton
	move 5, Route128_Movement_152293
	waitmove 0
	move 4, Route128_Movement_1A0841
	waitmove 0
	msgbox Route128_Text_171F4B, 4
	closebutton
	move 5, Route128_Movement_1522A1
	waitmove 0
	move 255, Route128_Movement_1A0841
	waitmove 0
	msgbox Route128_Text_172008, 4
	closebutton
	move 4, Route128_Movement_15227E
	move 255, Route128_Movement_1A083F
	move 5, Route128_Movement_152290
	waitmove 0
	msgbox Route128_Text_17210B, 4
	closebutton
	pause 40
	move 5, Route128_Movement_152296
	move 4, Route128_Movement_152283
	waitmove 0
	disappear 5
	disappear 4
	pause 100
	setanimation 0, 1
	doanimation 30
	checkanimation 30
	reappear 3
	move 3, Route128_Movement_15226F
	waitmove 0
	move 255, Route128_Movement_1A0843
	waitmove 0
	msgbox Route128_Text_172181, 4
	closebutton
	move 3, Route128_Movement_15226D
	move 255, Route128_Movement_1A0841
	waitmove 0
	msgbox Route128_Text_1722A1, 4
	move 3, Route128_Movement_1A0845
	waitmove 0
	msgbox Route128_Text_1723BE, 4
	closebutton
	move 3, Route128_Movement_1A0845
	waitmove 0
	pause 50
	setanimation 0, 1
	doanimation 30
	pause 15
	disappear 3
	checkanimation 30
	setvar 0x407b, 2
	releaseall
	end

@ 815225E
	step_17
	step_end

@ 8152260
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

Route128_Movement_15226D:: @ 815226D
	step_up
	step_end

Route128_Movement_15226F:: @ 815226F
	step_17
	step_end

Route128_Movement_152271:: @ 8152271
	step_15
	step_27
	step_14
	step_28
	step_14
	step_14
	step_25
	step_end

Route128_Movement_152279:: @ 8152279
	step_40
	slow_step_up
	step_14
	step_41
	step_end

Route128_Movement_15227E:: @ 815227E
	step_17
	step_17
	step_17
	step_28
	step_end

Route128_Movement_152283:: @ 8152283
	step_14
	step_14
	step_16
	step_17
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_end

Route128_Movement_152290:: @ 8152290
	step_left
	step_left
	step_end

Route128_Movement_152293:: @ 8152293
	step_left
	step_25
	step_end

Route128_Movement_152296:: @ 8152296
	step_17
	step_17
	step_17
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_end

Route128_Movement_1522A1:: @ 81522A1
	step_right
	step_25
	step_end

Route128_EventScript_1522A4:: @ 81522A4
	trainerbattle 0, 376, 0, Route128_Text_1C1C67, Route128_Text_1C1C95
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route128_EventScript_1522CB
	msgbox Route128_Text_1C1CC3, 6
	end

Route128_EventScript_1522CB:: @ 81522CB
	trainerbattle 5, 376, 0, Route128_Text_1C1D02, Route128_Text_1C1D45
	msgbox Route128_Text_1C1D6B, 6
	end

Route128_EventScript_1522E2:: @ 81522E2
	trainerbattle 0, 386, 0, Route128_Text_1C1DB0, Route128_Text_1C1E25
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route128_EventScript_152309
	msgbox Route128_Text_1C1E4A, 6
	end

Route128_EventScript_152309:: @ 8152309
	trainerbattle 5, 386, 0, Route128_Text_1C1E90, Route128_Text_1C1EFA
	msgbox Route128_Text_1C1F2E, 6
	end

Route128_EventScript_152320:: @ 8152320
	trainerbattle 0, 670, 0, Route128_Text_1C1F6D, Route128_Text_1C1FCC
	msgbox Route128_Text_1C1FE8, 6
	end

Route128_EventScript_152337:: @ 8152337
	trainerbattle 0, 671, 0, Route128_Text_1C202C, Route128_Text_1C2051
	msgbox Route128_Text_1C2060, 6
	end

Route128_EventScript_15234E:: @ 815234E
	trainerbattle 0, 673, 0, Route128_Text_1C2090, Route128_Text_1C20FC
	msgbox Route128_Text_1C210D, 6
	end

