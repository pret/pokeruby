Route110_TrickHousePuzzle2_MapScripts:: @ 8161D76
	map_script 5, Route110_TrickHousePuzzle2_MapScript1_161D81
	map_script 3, Route110_TrickHousePuzzle2_MapScript1_161DAE
	.byte 0

Route110_TrickHousePuzzle2_MapScript1_161D81:: @ 8161D81
	compare 0x4001, 1
	callif 1, Route110_TrickHousePuzzle2_EventScript_161E2C
	compare 0x4002, 1
	callif 1, Route110_TrickHousePuzzle2_EventScript_161E3F
	compare 0x4003, 1
	callif 1, Route110_TrickHousePuzzle2_EventScript_161E52
	compare 0x4004, 1
	callif 1, Route110_TrickHousePuzzle2_EventScript_161E65
	end

Route110_TrickHousePuzzle2_MapScript1_161DAE:: @ 8161DAE
	setvar 0x4001, 0
	setvar 0x4002, 0
	setvar 0x4003, 0
	setvar 0x4004, 0
	end

Route110_TrickHousePuzzle2_EventScript_161DC3:: @ 8161DC3
	lockall
	compare 0x40ac, 0
	jumpeq Route110_TrickHousePuzzle2_EventScript_161DD5
	jump Route110_TrickHousePuzzle2_EventScript_161892
	end

Route110_TrickHousePuzzle2_EventScript_161DD5:: @ 8161DD5
	setvar 0x40ac, 1
	jump Route110_TrickHousePuzzle2_EventScript_16189C
	end

Route110_TrickHousePuzzle2_EventScript_161DE0:: @ 8161DE0
	lockall
	setvar 0x4001, 1
	playsfx 21
	call Route110_TrickHousePuzzle2_EventScript_161E2C
	special 142
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161DF3:: @ 8161DF3
	lockall
	setvar 0x4002, 1
	playsfx 21
	call Route110_TrickHousePuzzle2_EventScript_161E3F
	special 142
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161E06:: @ 8161E06
	lockall
	setvar 0x4003, 1
	playsfx 21
	call Route110_TrickHousePuzzle2_EventScript_161E52
	special 142
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161E19:: @ 8161E19
	lockall
	setvar 0x4004, 1
	playsfx 21
	call Route110_TrickHousePuzzle2_EventScript_161E65
	special 142
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161E2C:: @ 8161E2C
	setmaptile 14, 21, 601, 0
	setmaptile 1, 12, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E3F:: @ 8161E3F
	setmaptile 8, 17, 601, 0
	setmaptile 12, 13, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E52:: @ 8161E52
	setmaptile 4, 10, 601, 0
	setmaptile 8, 4, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E65:: @ 8161E65
	setmaptile 5, 2, 601, 0
	setmaptile 12, 5, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E78:: @ 8161E78
	trainerbattle 0, 274, 0, Route110_TrickHousePuzzle2_Text_19CD46, Route110_TrickHousePuzzle2_Text_19CD66
	loadptr 0, Route110_TrickHousePuzzle2_Text_19CD91
	callstd 6
	end

Route110_TrickHousePuzzle2_EventScript_161E8F:: @ 8161E8F
	trainerbattle 0, 275, 0, Route110_TrickHousePuzzle2_Text_19CDBF, Route110_TrickHousePuzzle2_Text_19CDF0
	loadptr 0, Route110_TrickHousePuzzle2_Text_19CE0D
	callstd 6
	end

Route110_TrickHousePuzzle2_EventScript_161EA6:: @ 8161EA6
	trainerbattle 0, 281, 0, Route110_TrickHousePuzzle2_Text_19CE52, Route110_TrickHousePuzzle2_Text_19CE98
	loadptr 0, Route110_TrickHousePuzzle2_Text_19CEB8
	callstd 6
	end

