PetalburgCity_MapScripts:: @ 814B70C
	map_script 3, PetalburgCity_MapScript1_14B717
	map_script 2, PetalburgCity_MapScript2_14B73D
	.byte 0

PetalburgCity_MapScript1_14B717:: @ 814B717
	setflag 2070
	compare 0x4057, 0
	callif 1, PetalburgCity_EventScript_14B731
	compare 0x4057, 2
	callif 1, PetalburgCity_EventScript_14B739
	end

PetalburgCity_EventScript_14B731:: @ 814B731
	movespriteperm 9, 5, 11
	return

PetalburgCity_EventScript_14B739:: @ 814B739
	playmusicbattle 420
	return

PetalburgCity_MapScript2_14B73D:: @ 814B73D
	map_script_2 0x4057, 2, PetalburgCity_EventScript_14B747
	.2byte 0

PetalburgCity_EventScript_14B747:: @ 814B747
	lockall
	setflag 0x4000
	special 39
	special 301
	move 2, PetalburgCity_Movement_14B7ED
	move 255, PetalburgCity_Movement_14B7CC
	waitmove 0
	loadptr 0, PetalburgCity_Text_16D361
	callstd 4
	special 157
	waitstate
	loadptr 0, PetalburgCity_Text_16D3DE
	callstd 4
	movecoords 2, PetalburgCity_Movement_1A083F, 0, 0
	waitmovexy 0, 0, 2
	loadptr 0, PetalburgCity_Text_16D408
	callstd 4
	closebutton
	clearflag 0x4000
	setvar 0x4057, 3
	fadedefault
	clearflag 0x4001
	special 40
	setvar 0x4085, 1
	warp PetalburgCity_Gym, 255, 4, 108
	waitstate
	releaseall
	end

PetalburgCity_EventScript_14B7AC:: @ 814B7AC
	lock
	faceplayer
	loadptr 0, PetalburgCity_Text_164490
	callstd 4
	closebutton
	move 3, PetalburgCity_Movement_1A083D
	waitmove 0
	release
	end

PetalburgCity_EventScript_14B7C3:: @ 814B7C3
	loadptr 0, PetalburgCity_Text_16433E
	callstd 2
	end

PetalburgCity_Movement_14B7CC:: @ 814B7CC
	step_13
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
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
	step_right
	step_up
	step_up
	step_28
	step_end

PetalburgCity_Movement_14B7ED:: @ 814B7ED
	step_13
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
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
	step_right
	step_up
	step_up
	step_right
	step_14
	step_26
	step_14
	step_14
	step_28
	step_end

PetalburgCity_EventScript_14B812:: @ 814B812
	loadptr 0, PetalburgCity_Text_1645BB
	callstd 3
	end

PetalburgCity_EventScript_14B81B:: @ 814B81B
	loadptr 0, PetalburgCity_Text_164602
	callstd 3
	end

PetalburgCity_EventScript_14B824:: @ 814B824
	loadptr 0, PetalburgCity_Text_16453F
	callstd 2
	end

PetalburgCity_EventScript_14B82D:: @ 814B82D
	loadptr 0, PetalburgCity_Text_164634
	callstd 3
	end

PetalburgCity_EventScript_14B836:: @ 814B836
	lockall
	setvar 0x8008, 0
	jump PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B842:: @ 814B842
	lockall
	setvar 0x8008, 1
	jump PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B84E:: @ 814B84E
	lockall
	setvar 0x8008, 2
	jump PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B85A:: @ 814B85A
	lockall
	setvar 0x8008, 3
	jump PetalburgCity_EventScript_14B866
	end

PetalburgCity_EventScript_14B866:: @ 814B866
	move 9, PetalburgCity_Movement_1A0839
	waitmove 0
	playmusic 420, 0
	playsfx 21
	move 9, PetalburgCity_Movement_1A0833
	waitmove 0
	move 9, PetalburgCity_Movement_1A0835
	waitmove 0
	compare 0x8008, 0
	callif 1, PetalburgCity_EventScript_14B91B
	compare 0x8008, 1
	callif 1, PetalburgCity_EventScript_14B930
	compare 0x8008, 2
	callif 1, PetalburgCity_EventScript_14B93B
	compare 0x8008, 3
	callif 1, PetalburgCity_EventScript_14B950
	loadptr 0, PetalburgCity_Text_16438A
	callstd 4
	closebutton
	compare 0x8008, 0
	callif 1, PetalburgCity_EventScript_14B965
	compare 0x8008, 1
	callif 1, PetalburgCity_EventScript_14B977
	compare 0x8008, 2
	callif 1, PetalburgCity_EventScript_14B989
	compare 0x8008, 3
	callif 1, PetalburgCity_EventScript_14B99B
	loadptr 0, PetalburgCity_Text_164426
	callstd 4
	move 9, PetalburgCity_Movement_1A0843
	move 255, PetalburgCity_Movement_1A0843
	waitmove 0
	loadptr 0, PetalburgCity_Text_164449
	callstd 4
	closebutton
	move 9, PetalburgCity_Movement_14B9F4
	waitmove 0
	fadedefault
	releaseall
	end

PetalburgCity_EventScript_14B91B:: @ 814B91B
	move 9, PetalburgCity_Movement_14B9B1
	waitmove 0
	move 255, PetalburgCity_Movement_1A0845
	waitmove 0
	return

PetalburgCity_EventScript_14B930:: @ 814B930
	move 9, PetalburgCity_Movement_14B9B6
	waitmove 0
	return

PetalburgCity_EventScript_14B93B:: @ 814B93B
	move 9, PetalburgCity_Movement_14B9B9
	waitmove 0
	move 255, PetalburgCity_Movement_1A0841
	waitmove 0
	return

PetalburgCity_EventScript_14B950:: @ 814B950
	move 9, PetalburgCity_Movement_14B9BE
	waitmove 0
	move 255, PetalburgCity_Movement_1A0841
	waitmove 0
	return

PetalburgCity_EventScript_14B965:: @ 814B965
	move 9, PetalburgCity_Movement_14B9C4
	move 255, PetalburgCity_Movement_14BA01
	waitmove 0
	return

PetalburgCity_EventScript_14B977:: @ 814B977
	move 9, PetalburgCity_Movement_14B9CF
	move 255, PetalburgCity_Movement_14BA0B
	waitmove 0
	return

PetalburgCity_EventScript_14B989:: @ 814B989
	move 9, PetalburgCity_Movement_14B9DD
	move 255, PetalburgCity_Movement_14BA18
	waitmove 0
	return

PetalburgCity_EventScript_14B99B:: @ 814B99B
	move 9, PetalburgCity_Movement_14B9E8
	move 255, PetalburgCity_Movement_14BA22
	waitmove 0
	return

	.incbin "baserom.gba", 0x14b9ad, 0x4

PetalburgCity_Movement_14B9B1:: @ 814B9B1
	step_right
	step_right
	step_right
	step_26
	step_end

PetalburgCity_Movement_14B9B6:: @ 814B9B6
	step_right
	step_right
	step_end

PetalburgCity_Movement_14B9B9:: @ 814B9B9
	step_right
	step_right
	step_right
	step_25
	step_end

PetalburgCity_Movement_14B9BE:: @ 814B9BE
	step_down
	step_right
	step_right
	step_right
	step_25
	step_end

PetalburgCity_Movement_14B9C4:: @ 814B9C4
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_right
	step_26
	step_end

PetalburgCity_Movement_14B9CF:: @ 814B9CF
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_right
	step_26
	step_end

PetalburgCity_Movement_14B9DD:: @ 814B9DD
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_right
	step_26
	step_end

PetalburgCity_Movement_14B9E8:: @ 814B9E8
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_right
	step_26
	step_end

PetalburgCity_Movement_14B9F4:: @ 814B9F4
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

PetalburgCity_Movement_14BA01:: @ 814BA01
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

PetalburgCity_Movement_14BA0B:: @ 814BA0B
	step_14
	step_14
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

PetalburgCity_Movement_14BA18:: @ 814BA18
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

PetalburgCity_Movement_14BA22:: @ 814BA22
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

PetalburgCity_EventScript_14BA2D:: @ 814BA2D
	loadptr 0, PetalburgCity_Text_16438A
	callstd 2
	end

