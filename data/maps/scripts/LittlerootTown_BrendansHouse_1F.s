LittlerootTown_BrendansHouse_1F_MapScripts:: @ 815263B
	map_script 1, LittlerootTown_BrendansHouse_1F_MapScript1_15264B
	map_script 3, LittlerootTown_BrendansHouse_1F_MapScript1_15268A
	map_script 2, LittlerootTown_BrendansHouse_1F_MapScript2_1526D0
	.byte 0

LittlerootTown_BrendansHouse_1F_MapScript1_15264B:: @ 815264B
	compare 0x4092, 6
	callif 0, LittlerootTown_BrendansHouse_1F_EventScript_152660
	checkflag 274
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_152673
	end

LittlerootTown_BrendansHouse_1F_EventScript_152660:: @ 8152660
	setmaptile 5, 4, 624, 1
	setmaptile 5, 2, 616, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_152673:: @ 8152673
	checkgender
	compare RESULT, 0
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_152680
	return

LittlerootTown_BrendansHouse_1F_EventScript_152680:: @ 8152680
	setmaptile 3, 7, 659, 1
	return

LittlerootTown_BrendansHouse_1F_MapScript1_15268A:: @ 815268A
	compare 0x4092, 3
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1526C4
	compare 0x4092, 5
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1526AC
	compare 0x4092, 6
	callif 1, LittlerootTown_BrendansHouse_1F_EventScript_1526B8
	end

LittlerootTown_BrendansHouse_1F_EventScript_1526AC:: @ 81526AC
	movespriteperm 1, 8, 4
	spritebehave 1, 7
	return

LittlerootTown_BrendansHouse_1F_EventScript_1526B8:: @ 81526B8
	movespriteperm 1, 4, 5
	spritebehave 1, 7
	return

LittlerootTown_BrendansHouse_1F_EventScript_1526C4:: @ 81526C4
	movespriteperm 1, 9, 8
	spritebehave 1, 7
	return

LittlerootTown_BrendansHouse_1F_MapScript2_1526D0:: @ 81526D0
	map_script_2 0x4092, 3, LittlerootTown_BrendansHouse_1F_EventScript_152722
	map_script_2 0x4092, 5, LittlerootTown_BrendansHouse_1F_EventScript_1526FA
	map_script_2 0x4092, 6, LittlerootTown_BrendansHouse_1F_EventScript_152733
	map_script_2 0x4082, 1, LittlerootTown_BrendansHouse_1F_EventScript_152744
	map_script_2 0x4082, 3, LittlerootTown_BrendansHouse_1F_EventScript_1B6CDE
	.2byte 0

LittlerootTown_BrendansHouse_1F_EventScript_1526FA:: @ 81526FA
	lockall
	loadptr 0, LittlerootTown_BrendansHouse_1F_Text_172574
	callstd 4
	closebutton
	move 255, LittlerootTown_BrendansHouse_1F_Movement_152720
	move 1, LittlerootTown_BrendansHouse_1F_Movement_152720
	waitmove 0
	warp LittlerootTown_BrendansHouse_2F, 255, 7, 1
	waitstate
	releaseall
	end

LittlerootTown_BrendansHouse_1F_Movement_152720:: @ 8152720
	step_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_152722:: @ 8152722
	lockall
	setvar 0x8004, 1
	setvar 0x8005, 0
	jump LittlerootTown_BrendansHouse_1F_EventScript_1B6956
	end

LittlerootTown_BrendansHouse_1F_EventScript_152733:: @ 8152733
	lockall
	setvar 0x8004, 0
	setvar 0x8005, 1
	jump LittlerootTown_BrendansHouse_1F_EventScript_1B6ABF
	end

LittlerootTown_BrendansHouse_1F_EventScript_152744:: @ 8152744
	lockall
	playsfx 21
	move 4, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmove 0
	move 4, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmove 0
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	move 4, LittlerootTown_BrendansHouse_1F_Movement_152782
	waitmove 0
	special 149
	loadptr 0, LittlerootTown_BrendansHouse_1F_Text_1730C2
	callstd 4
	setflag 87
	setvar 0x4082, 2
	releaseall
	end

LittlerootTown_BrendansHouse_1F_Movement_152782:: @ 8152782
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_152789:: @ 8152789
	lockall
	setvar 0x8004, 1
	setvar 0x8005, 0
	move 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmove 0
	jump LittlerootTown_BrendansHouse_1F_EventScript_1B69B7
	end

