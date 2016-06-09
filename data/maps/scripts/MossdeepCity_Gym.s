MossdeepCity_Gym_MapScripts:: @ 815A4D3
	map_script 1, MossdeepCity_Gym_MapScript1_15A4D9
	.byte 0

MossdeepCity_Gym_MapScript1_15A4D9:: @ 815A4D9
	checkflag 100
	jumpeq MossdeepCity_Gym_EventScript_15A510
	jump MossdeepCity_Gym_EventScript_15A4E8
	end

MossdeepCity_Gym_EventScript_15A4E8:: @ 815A4E8
	checkflag 101
	jumpeq MossdeepCity_Gym_EventScript_15A528
	jump MossdeepCity_Gym_EventScript_15A4F7
	end

MossdeepCity_Gym_EventScript_15A4F7:: @ 815A4F7
	checkflag 102
	jumpeq MossdeepCity_Gym_EventScript_15A540
	jump MossdeepCity_Gym_EventScript_15A506
	end

MossdeepCity_Gym_EventScript_15A506:: @ 815A506
	checkflag 103
	jumpeq MossdeepCity_Gym_EventScript_15A558
	end

MossdeepCity_Gym_EventScript_15A510:: @ 815A510
	setmaptile 5, 5, 516, 0
	setmaptile 2, 7, 569, 1
	jump MossdeepCity_Gym_EventScript_15A4E8
	end

MossdeepCity_Gym_EventScript_15A528:: @ 815A528
	setmaptile 8, 14, 516, 0
	setmaptile 8, 10, 569, 1
	jump MossdeepCity_Gym_EventScript_15A4F7
	end

MossdeepCity_Gym_EventScript_15A540:: @ 815A540
	setmaptile 15, 17, 524, 0
	setmaptile 17, 15, 569, 1
	jump MossdeepCity_Gym_EventScript_15A506
	end

MossdeepCity_Gym_EventScript_15A558:: @ 815A558
	setmaptile 1, 23, 525, 0
	setmaptile 5, 24, 569, 1
	end

MossdeepCity_Gym_EventScript_15A56B:: @ 815A56B
	trainerbattle 8, 271, 0, MossdeepCity_Gym_Text_18CF02, MossdeepCity_Gym_Text_18D077, MossdeepCity_Gym_Text_18D324, MossdeepCity_Gym_EventScript_15A594
	checkflag 171
	jumpif 0, MossdeepCity_Gym_EventScript_15A5C6
	loadptr 0, MossdeepCity_Gym_Text_18D273
	callstd 4
	release
	end

MossdeepCity_Gym_EventScript_15A594:: @ 815A594
	message MossdeepCity_Gym_Text_18D0F9
	waittext
	call MossdeepCity_Gym_EventScript_1A02C5
	loadptr 0, MossdeepCity_Gym_Text_18D128
	callstd 4
	setflag 1229
	setflag 2061
	clearflag 869
	clearflag 915
	setvar 0x8008, 7
	call MossdeepCity_Gym_EventScript_1A01C0
	clearflag 905
	jump MossdeepCity_Gym_EventScript_15A5C6
	end

MossdeepCity_Gym_EventScript_15A5C6:: @ 815A5C6
	setorcopyvar 0x8000, 0x124
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq MossdeepCity_Gym_EventScript_1A029B
	loadptr 0, MossdeepCity_Gym_Text_18D1CF
	callstd 4
	setflag 171
	release
	end

MossdeepCity_Gym_EventScript_15A5EA:: @ 815A5EA
	lockall
	checkflag 100
	jumpeq MossdeepCity_Gym_EventScript_15A621
	setflag 100
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 5, 5, 516, 0
	setmaptile 2, 7, 569, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A619:: @ 815A619
	special 142
	playsfx 36
	releaseall
	end

MossdeepCity_Gym_EventScript_15A621:: @ 815A621
	clearflag 100
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 5, 5, 524, 0
	setmaptile 2, 7, 568, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A646:: @ 815A646
	lockall
	checkflag 101
	jumpeq MossdeepCity_Gym_EventScript_15A675
	setflag 101
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 8, 14, 516, 0
	setmaptile 8, 10, 569, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A675:: @ 815A675
	clearflag 101
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 8, 14, 517, 0
	setmaptile 8, 10, 568, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A69A:: @ 815A69A
	lockall
	checkflag 102
	jumpeq MossdeepCity_Gym_EventScript_15A6C9
	setflag 102
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 15, 17, 524, 0
	setmaptile 17, 15, 569, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A6C9:: @ 815A6C9
	clearflag 102
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 15, 17, 516, 0
	setmaptile 17, 15, 568, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A6EE:: @ 815A6EE
	lockall
	checkflag 103
	jumpeq MossdeepCity_Gym_EventScript_15A71D
	setflag 103
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 1, 23, 525, 0
	setmaptile 5, 24, 569, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A71D:: @ 815A71D
	clearflag 103
	move 255, MossdeepCity_Gym_Movement_15A7F7
	waitmove 0
	setmaptile 1, 23, 516, 0
	setmaptile 5, 24, 568, 1
	jump MossdeepCity_Gym_EventScript_15A619
	end

MossdeepCity_Gym_EventScript_15A742:: @ 815A742
	lockall
	warpteleport MossdeepCity_Gym, 255, 14, 29
	waitstate
	releaseall
	end

MossdeepCity_Gym_EventScript_15A74E:: @ 815A74E
	trainerbattle 0, 233, 0, MossdeepCity_Gym_Text_18C96A, MossdeepCity_Gym_Text_18C9BA
	loadptr 0, MossdeepCity_Gym_Text_18C9E1
	callstd 6
	end

MossdeepCity_Gym_EventScript_15A765:: @ 815A765
	trainerbattle 0, 234, 0, MossdeepCity_Gym_Text_18CA10, MossdeepCity_Gym_Text_18CA28
	loadptr 0, MossdeepCity_Gym_Text_18CA48
	callstd 6
	end

MossdeepCity_Gym_EventScript_15A77C:: @ 815A77C
	trainerbattle 0, 235, 0, MossdeepCity_Gym_Text_18CAC0, MossdeepCity_Gym_Text_18CB46
	loadptr 0, MossdeepCity_Gym_Text_18CB77
	callstd 6
	end

MossdeepCity_Gym_EventScript_15A793:: @ 815A793
	trainerbattle 0, 244, 0, MossdeepCity_Gym_Text_18CC1E, MossdeepCity_Gym_Text_18CC83
	loadptr 0, MossdeepCity_Gym_Text_18CC9B
	callstd 6
	end

MossdeepCity_Gym_EventScript_15A7AA:: @ 815A7AA
	trainerbattle 0, 245, 0, MossdeepCity_Gym_Text_18CD14, MossdeepCity_Gym_Text_18CD66
	loadptr 0, MossdeepCity_Gym_Text_18CD73
	callstd 6
	end

MossdeepCity_Gym_EventScript_15A7C1:: @ 815A7C1
	trainerbattle 0, 246, 0, MossdeepCity_Gym_Text_18CDE0, MossdeepCity_Gym_Text_18CE47
	loadptr 0, MossdeepCity_Gym_Text_18CE6C
	callstd 6
	end

MossdeepCity_Gym_EventScript_15A7D8:: @ 815A7D8
	lock
	faceplayer
	checkflag 1229
	jumpeq MossdeepCity_Gym_EventScript_15A7ED
	loadptr 0, MossdeepCity_Gym_Text_18C7E3
	callstd 4
	release
	end

MossdeepCity_Gym_EventScript_15A7ED:: @ 815A7ED
	loadptr 0, MossdeepCity_Gym_Text_18C938
	callstd 4
	release
	end

MossdeepCity_Gym_Movement_15A7F7:: @ 815A7F7
	step_14
	step_14
	step_end

MossdeepCity_Gym_EventScript_15A7FA:: @ 815A7FA
	lockall
	checkflag 2061
	jumpeq MossdeepCity_Gym_EventScript_15A81A
	jump MossdeepCity_Gym_EventScript_15A824
	end

MossdeepCity_Gym_EventScript_15A80A:: @ 815A80A
	lockall
	checkflag 2061
	jumpeq MossdeepCity_Gym_EventScript_15A81A
	jump MossdeepCity_Gym_EventScript_15A824
	end

MossdeepCity_Gym_EventScript_15A81A:: @ 815A81A
	loadptr 0, MossdeepCity_Gym_Text_18D424
	callstd 4
	releaseall
	end

MossdeepCity_Gym_EventScript_15A824:: @ 815A824
	loadptr 0, MossdeepCity_Gym_Text_18D40A
	callstd 4
	releaseall
	end

