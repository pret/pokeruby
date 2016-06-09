Route118_MapScripts:: @ 8150F28
	map_script 3, Route118_MapScript1_150F2E
	.byte 0

Route118_MapScript1_150F2E:: @ 8150F2E
	call Route118_EventScript_1AE313
	end

Route118_EventScript_150F34:: @ 8150F34
	lock
	faceplayer
	checkflag 227
	jumpeq Route118_EventScript_150F89
	loadptr 0, Route118_Text_170F12
	callstd 5
	compare RESULT, 1
	jumpeq Route118_EventScript_150F5E
	compare RESULT, 0
	jumpeq Route118_EventScript_150F7F
	end

Route118_EventScript_150F5E:: @ 8150F5E
	loadptr 0, Route118_Text_170F46
	callstd 4
	setorcopyvar 0x8000, 0x107
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 227
	loadptr 0, Route118_Text_170F7E
	callstd 4
	release
	end

Route118_EventScript_150F7F:: @ 8150F7F
	loadptr 0, Route118_Text_170FB0
	callstd 4
	release
	end

Route118_EventScript_150F89:: @ 8150F89
	loadptr 0, Route118_Text_170FC8
	callstd 4
	release
	end

Route118_EventScript_150F93:: @ 8150F93
	loadptr 0, Route118_Text_170FFE
	callstd 2
	end

Route118_EventScript_150F9C:: @ 8150F9C
	loadptr 0, Route118_Text_17108B
	callstd 3
	end

Route118_EventScript_150FA5:: @ 8150FA5
	loadptr 0, Route118_Text_1710A5
	callstd 3
	end

Route118_EventScript_150FAE:: @ 8150FAE
	lockall
	setvar 0x8008, 0
	move 255, Route118_Movement_1A0841
	waitmove 0
	move 19, Route118_Movement_151069
	waitmove 0
	jump Route118_EventScript_151004
	end

Route118_EventScript_150FCE:: @ 8150FCE
	lockall
	setvar 0x8008, 1
	move 255, Route118_Movement_1A0841
	waitmove 0
	jump Route118_EventScript_151004
	end

Route118_EventScript_150FE4:: @ 8150FE4
	lockall
	setvar 0x8008, 2
	move 255, Route118_Movement_1A0841
	waitmove 0
	move 19, Route118_Movement_15106B
	waitmove 0
	jump Route118_EventScript_151004
	end

Route118_EventScript_151004:: @ 8151004
	playsfx 10
	move 19, Route118_Movement_15106D
	waitmove 0
	pause 30
	loadptr 0, Route118_Text_170D66
	callstd 4
	closebutton
	compare 0x8008, 0
	callif 1, Route118_EventScript_151048
	compare 0x8008, 1
	callif 1, Route118_EventScript_151053
	compare 0x8008, 2
	callif 1, Route118_EventScript_15105E
	setvar 0x4071, 1
	disappear 19
	releaseall
	end

Route118_EventScript_151048:: @ 8151048
	move 19, Route118_Movement_151071
	waitmove 0
	return

Route118_EventScript_151053:: @ 8151053
	move 19, Route118_Movement_15107C
	waitmove 0
	return

Route118_EventScript_15105E:: @ 815105E
	move 19, Route118_Movement_151086
	waitmove 0
	return

Route118_Movement_151069:: @ 8151069
	step_left
	step_end

Route118_Movement_15106B:: @ 815106B
	step_right
	step_end

Route118_Movement_15106D:: @ 815106D
	fast_step_down
	step_14
	step_down
	step_end

Route118_Movement_151071:: @ 8151071
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

Route118_Movement_15107C:: @ 815107C
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

Route118_Movement_151086:: @ 8151086
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

Route118_EventScript_15108F:: @ 815108F
	trainerbattle 0, 37, 0, Route118_Text_1BDFF4, Route118_Text_1BE03C
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route118_EventScript_1510B6
	loadptr 0, Route118_Text_1BE05E
	callstd 6
	end

Route118_EventScript_1510B6:: @ 81510B6
	trainerbattle 5, 37, 0, Route118_Text_1BE0AB, Route118_Text_1BE0D3
	loadptr 0, Route118_Text_1BE104
	callstd 6
	end

Route118_EventScript_1510CD:: @ 81510CD
	trainerbattle 0, 343, 0, Route118_Text_1BE24A, Route118_Text_1BE291
	loadptr 0, Route118_Text_1BE2BE
	callstd 6
	end

Route118_EventScript_1510E4:: @ 81510E4
	trainerbattle 0, 344, 0, Route118_Text_1BE318, Route118_Text_1BE385
	loadptr 0, Route118_Text_1BE39C
	callstd 6
	end

Route118_EventScript_1510FB:: @ 81510FB
	trainerbattle 0, 196, 0, Route118_Text_1BE3E8, Route118_Text_1BE406
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route118_EventScript_151122
	loadptr 0, Route118_Text_1BE413
	callstd 6
	end

Route118_EventScript_151122:: @ 8151122
	trainerbattle 5, 196, 0, Route118_Text_1BE489, Route118_Text_1BE4CC
	loadptr 0, Route118_Text_1BE4D9
	callstd 6
	end

Route118_EventScript_151139:: @ 8151139
	trainerbattle 0, 398, 0, Route118_Text_1BE148, Route118_Text_1BE188
	loadptr 0, Route118_Text_1BE19D
	callstd 6
	end

Route118_EventScript_151150:: @ 8151150
	trainerbattle 0, 408, 0, Route118_Text_1BE1D7, Route118_Text_1BE1F5
	loadptr 0, Route118_Text_1BE20D
	callstd 6
	end

