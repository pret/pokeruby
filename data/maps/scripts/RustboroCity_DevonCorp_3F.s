RustboroCity_DevonCorp_3F_MapScripts:: @ 8157711
	map_script 3, RustboroCity_DevonCorp_3F_MapScript1_157721
	map_script 4, RustboroCity_DevonCorp_3F_MapScript2_157739
	map_script 2, RustboroCity_DevonCorp_3F_MapScript2_157748
	.byte 0

RustboroCity_DevonCorp_3F_MapScript1_157721:: @ 8157721
	compare 0x408f, 0
	callif 1, RustboroCity_DevonCorp_3F_EventScript_15772D
	end

RustboroCity_DevonCorp_3F_EventScript_15772D:: @ 815772D
	movespriteperm 2, 3, 2
	spritebehave 2, 9
	return

RustboroCity_DevonCorp_3F_MapScript2_157739:: @ 8157739
	map_script_2 0x408f, 0, RustboroCity_DevonCorp_3F_EventScript_157743
	.2byte 0

RustboroCity_DevonCorp_3F_EventScript_157743:: @ 8157743
	spriteface 255, 4
	end

RustboroCity_DevonCorp_3F_MapScript2_157748:: @ 8157748
	map_script_2 0x408f, 0, RustboroCity_DevonCorp_3F_EventScript_157752
	.2byte 0

RustboroCity_DevonCorp_3F_EventScript_157752:: @ 8157752
	lockall
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18374C
	callstd 4
	closebutton
	move 2, RustboroCity_DevonCorp_3F_Movement_157815
	waitmove 0
	pause 80
	move 2, RustboroCity_DevonCorp_3F_Movement_15781E
	waitmove 0
	loadptr 0, RustboroCity_DevonCorp_3F_Text_183903
	callstd 4
	closebutton
	playmusic 420, 0
	move 2, RustboroCity_DevonCorp_3F_Movement_157803
	move 255, RustboroCity_DevonCorp_3F_Movement_157827
	waitmove 0
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18394A
	callstd 4
	closebutton
	fadedefault
	move 2, RustboroCity_DevonCorp_3F_Movement_157812
	move 255, RustboroCity_DevonCorp_3F_Movement_157835
	waitmove 0
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18320B
	callstd 4
	setorcopyvar 0x8000, 0x112
	setorcopyvar 0x8001, 0x1
	callstd 0
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18337E
	callstd 4
	fanfare 370
	message RustboroCity_DevonCorp_3F_Text_183422
	waitfanfare
	waittext
	setflag 2050
	setflag 188
	loadptr 0, RustboroCity_DevonCorp_3F_Text_183439
	callstd 4
	setflag 894
	clearflag 807
	clearflag 983
	clearflag 739
	clearflag 881
	setvar 0x4096, 1
	clearflag 814
	setvar 0x408f, 1
	releaseall
	end

	.incbin "baserom.gba", 0x1577fe, 0x5

RustboroCity_DevonCorp_3F_Movement_157803:: @ 8157803
	step_right
	step_right
	step_right
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_27
	step_end

RustboroCity_DevonCorp_3F_Movement_157812:: @ 8157812
	step_14
	step_25
	step_end

RustboroCity_DevonCorp_3F_Movement_157815:: @ 8157815
	step_right
	step_right
	step_right
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

RustboroCity_DevonCorp_3F_Movement_15781E:: @ 815781E
	step_left
	step_left
	step_left
	step_left
	step_up
	step_left
	step_left
	step_left
	step_end

RustboroCity_DevonCorp_3F_Movement_157827:: @ 8157827
	step_right
	step_right
	step_right
	step_right
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

RustboroCity_DevonCorp_3F_Movement_157835:: @ 8157835
	step_14
	step_14
	step_down
	step_down
	step_28
	step_end

RustboroCity_DevonCorp_3F_EventScript_15783B:: @ 815783B
	lock
	faceplayer
	checkflag 272
	jumpeq RustboroCity_DevonCorp_3F_EventScript_15789B
	checkflag 189
	jumpeq RustboroCity_DevonCorp_3F_EventScript_157864
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18351E
	callstd 4
	closebutton
	move LAST_TALKED, RustboroCity_DevonCorp_3F_Movement_1A083D
	waitmove 0
	release
	end

RustboroCity_DevonCorp_3F_EventScript_157864:: @ 8157864
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18353E
	callstd 4
	setorcopyvar 0x8000, 0xb6
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq RustboroCity_DevonCorp_3F_EventScript_1A029B
	setflag 272
	loadptr 0, RustboroCity_DevonCorp_3F_Text_1835B3
	callstd 4
	closebutton
	move LAST_TALKED, RustboroCity_DevonCorp_3F_Movement_1A083D
	waitmove 0
	release
	end

RustboroCity_DevonCorp_3F_EventScript_15789B:: @ 815789B
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18368D
	callstd 4
	closebutton
	move LAST_TALKED, RustboroCity_DevonCorp_3F_Movement_1A083D
	waitmove 0
	release
	end

RustboroCity_DevonCorp_3F_EventScript_1578B0:: @ 81578B0
	lock
	faceplayer
	checkflag 256
	jumpeq RustboroCity_DevonCorp_3F_EventScript_1578C5
	loadptr 0, RustboroCity_DevonCorp_3F_Text_18395C
	callstd 4
	release
	end

RustboroCity_DevonCorp_3F_EventScript_1578C5:: @ 81578C5
	loadptr 0, RustboroCity_DevonCorp_3F_Text_1839A3
	callstd 4
	release
	end

RustboroCity_DevonCorp_3F_EventScript_1578CF:: @ 81578CF
	loadptr 0, RustboroCity_DevonCorp_3F_Text_183A04
	callstd 3
	end

