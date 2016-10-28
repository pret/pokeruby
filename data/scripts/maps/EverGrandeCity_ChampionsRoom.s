EverGrandeCity_ChampionsRoom_MapScripts:: @ 815B7AF
	map_script 3, EverGrandeCity_ChampionsRoom_MapScript1_15B7BF
	map_script 4, EverGrandeCity_ChampionsRoom_MapScript2_15B7C5
	map_script 2, EverGrandeCity_ChampionsRoom_MapScript2_15B7D4
	.byte 0

EverGrandeCity_ChampionsRoom_MapScript1_15B7BF:: @ 815B7BF
	call EverGrandeCity_ChampionsRoom_EventScript_1A014E
	end

EverGrandeCity_ChampionsRoom_MapScript2_15B7C5:: @ 815B7C5
	map_script_2 0x4001, 0, EverGrandeCity_ChampionsRoom_EventScript_15B7CF
	.2byte 0

EverGrandeCity_ChampionsRoom_EventScript_15B7CF:: @ 815B7CF
	spriteface 255, 2
	end

EverGrandeCity_ChampionsRoom_MapScript2_15B7D4:: @ 815B7D4
	map_script_2 0x4001, 0, EverGrandeCity_ChampionsRoom_EventScript_15B7DE
	.2byte 0

EverGrandeCity_ChampionsRoom_EventScript_15B7DE:: @ 815B7DE
	lockall
	move 255, EverGrandeCity_ChampionsRoom_Movement_1A084E
	waitmove 0
	pause 40
	move 255, EverGrandeCity_ChampionsRoom_Movement_15B802
	waitmove 0
	setvar 0x4001, 1
	jump EverGrandeCity_ChampionsRoom_EventScript_15B805
	releaseall
	end

EverGrandeCity_ChampionsRoom_Movement_15B802:: @ 815B802
	step_up
	step_up
	step_end

EverGrandeCity_ChampionsRoom_EventScript_15B805:: @ 815B805
	playmusic 454, 0
	msgbox EverGrandeCity_ChampionsRoom_Text_190F9C, 4
	trainerbattle 3, OPPONENT_STEVEN, 0, EverGrandeCity_ChampionsRoom_Text_1910A0
	jump EverGrandeCity_ChampionsRoom_EventScript_15B821
	end

EverGrandeCity_ChampionsRoom_EventScript_15B821:: @ 815B821
	playsfx 8
	setmaptile 6, 1, 838, 0
	setmaptile 6, 2, 839, 0
	special 142
	msgbox EverGrandeCity_ChampionsRoom_Text_1910FE, 4
	closebutton
	playsfx 8
	checkgender
	compare RESULT, 0
	callif EQUAL, EverGrandeCity_ChampionsRoom_EventScript_15B87C
	compare RESULT, 1
	callif EQUAL, EverGrandeCity_ChampionsRoom_EventScript_15B881
	reappear 2
	call EverGrandeCity_ChampionsRoom_EventScript_15B9BD
	checkgender
	compare RESULT, 0
	jumpif EQUAL, EverGrandeCity_ChampionsRoom_EventScript_15B886
	compare RESULT, 1
	jumpif EQUAL, EverGrandeCity_ChampionsRoom_EventScript_15B8BB
	end

EverGrandeCity_ChampionsRoom_EventScript_15B87C:: @ 815B87C
	playmusic 415, 0
	return

EverGrandeCity_ChampionsRoom_EventScript_15B881:: @ 815B881
	playmusic 421, 0
	return

EverGrandeCity_ChampionsRoom_EventScript_15B886:: @ 815B886
	msgbox EverGrandeCity_ChampionsRoom_Text_191225, 4
	pause 40
	playsfx 21
	move 2, EverGrandeCity_ChampionsRoom_Movement_1A0833
	waitmove 0
	move 2, EverGrandeCity_ChampionsRoom_Movement_1A0835
	waitmove 0
	call EverGrandeCity_ChampionsRoom_EventScript_15B9D2
	msgbox EverGrandeCity_ChampionsRoom_Text_191268, 4
	jump EverGrandeCity_ChampionsRoom_EventScript_15B8F0
	end

EverGrandeCity_ChampionsRoom_EventScript_15B8BB:: @ 815B8BB
	msgbox EverGrandeCity_ChampionsRoom_Text_1912B3, 4
	pause 40
	playsfx 21
	move 2, EverGrandeCity_ChampionsRoom_Movement_1A0833
	waitmove 0
	move 2, EverGrandeCity_ChampionsRoom_Movement_1A0835
	waitmove 0
	call EverGrandeCity_ChampionsRoom_EventScript_15B9D2
	msgbox EverGrandeCity_ChampionsRoom_Text_191305, 4
	jump EverGrandeCity_ChampionsRoom_EventScript_15B8F0
	end

EverGrandeCity_ChampionsRoom_EventScript_15B8F0:: @ 815B8F0
	closebutton
	reappear 3
	move 3, EverGrandeCity_ChampionsRoom_Movement_15BA03
	waitmove 0
	move 255, EverGrandeCity_ChampionsRoom_Movement_1A0843
	waitmove 0
	msgbox EverGrandeCity_ChampionsRoom_Text_19134D, 4
	call EverGrandeCity_ChampionsRoom_EventScript_1A03B0
	msgbox EverGrandeCity_ChampionsRoom_Text_1914C6, 4
	move 1, EverGrandeCity_ChampionsRoom_Movement_1A0841
	waitmove 0
	pause 20
	move 1, EverGrandeCity_ChampionsRoom_Movement_1A0845
	waitmove 0
	msgbox EverGrandeCity_ChampionsRoom_Text_191512, 4
	closebutton
	pause 30
	move 1, EverGrandeCity_ChampionsRoom_Movement_15B9FB
	move 255, EverGrandeCity_ChampionsRoom_Movement_15B9DD
	move 3, EverGrandeCity_ChampionsRoom_Movement_1A0841
	move 2, EverGrandeCity_ChampionsRoom_Movement_15B9F8
	waitmove 0
	pause 20
	move 255, EverGrandeCity_ChampionsRoom_Movement_1A0845
	waitmove 0
	msgbox EverGrandeCity_ChampionsRoom_Text_191546, 4
	checkgender
	compare RESULT, 0
	callif EQUAL, EverGrandeCity_ChampionsRoom_EventScript_15B9AB
	compare RESULT, 1
	callif EQUAL, EverGrandeCity_ChampionsRoom_EventScript_15B9B4
	closebutton
	move 1, EverGrandeCity_ChampionsRoom_Movement_15B9FF
	move 255, EverGrandeCity_ChampionsRoom_Movement_15B9E0
	waitmove 0
	setflag 781
	warp EverGrandeCity_HallOfFame, 255, 7, 16
	waitstate
	releaseall
	end

EverGrandeCity_ChampionsRoom_EventScript_15B9AB:: @ 815B9AB
	msgbox EverGrandeCity_ChampionsRoom_Text_1915D7, 4
	return

EverGrandeCity_ChampionsRoom_EventScript_15B9B4:: @ 815B9B4
	msgbox EverGrandeCity_ChampionsRoom_Text_191675, 4
	return

EverGrandeCity_ChampionsRoom_EventScript_15B9BD:: @ 815B9BD
	move 2, EverGrandeCity_ChampionsRoom_Movement_15B9E6
	waitmove 0
	move 255, EverGrandeCity_ChampionsRoom_Movement_1A083F
	waitmove 0
	return

EverGrandeCity_ChampionsRoom_EventScript_15B9D2:: @ 815B9D2
	move 2, EverGrandeCity_ChampionsRoom_Movement_15B9EF
	waitmove 0
	return

EverGrandeCity_ChampionsRoom_Movement_15B9DD:: @ 815B9DD
	step_up
	step_up
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9E0:: @ 815B9E0
	step_up
	step_14
	step_up
	step_13
	step_54
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9E6:: @ 815B9E6
	step_up
	step_up
	step_up
	step_up
	step_up
	step_left
	step_up
	step_28
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9EF:: @ 815B9EF
	step_26
	step_14
	step_28
	step_14
	step_26
	step_13
	step_28
	step_14
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9F8:: @ 815B9F8
	step_right
	step_up
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9FB:: @ 815B9FB
	step_up
	step_up
	step_25
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9FF:: @ 815B9FF
	step_up
	step_13
	step_54
	step_end

EverGrandeCity_ChampionsRoom_Movement_15BA03:: @ 815BA03
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_up
	step_27
	step_end
