LittlerootTown_MaysHouse_1F_MapScripts:: @ 8152879
	map_script 1, LittlerootTown_MaysHouse_1F_MapScript1_152889
	map_script 3, LittlerootTown_MaysHouse_1F_MapScript1_1528C8
	map_script 2, LittlerootTown_MaysHouse_1F_MapScript2_15290E
	.byte 0

LittlerootTown_MaysHouse_1F_MapScript1_152889:: @ 8152889
	compare 0x4092, 6
	callif 0, LittlerootTown_MaysHouse_1F_EventScript_15289E
	checkflag 274
	callif 1, LittlerootTown_MaysHouse_1F_EventScript_1528B1
	end

LittlerootTown_MaysHouse_1F_EventScript_15289E:: @ 815289E
	setmaptile 5, 4, 624, 1
	setmaptile 5, 2, 616, 1
	return

LittlerootTown_MaysHouse_1F_EventScript_1528B1:: @ 81528B1
	checkgender
	compare RESULT, 1
	jumpeq LittlerootTown_MaysHouse_1F_EventScript_1528BE
	return

LittlerootTown_MaysHouse_1F_EventScript_1528BE:: @ 81528BE
	setmaptile 6, 7, 659, 1
	return

LittlerootTown_MaysHouse_1F_MapScript1_1528C8:: @ 81528C8
	compare 0x4092, 3
	callif 1, LittlerootTown_MaysHouse_1F_EventScript_152902
	compare 0x4092, 5
	callif 1, LittlerootTown_MaysHouse_1F_EventScript_1528EA
	compare 0x4092, 6
	callif 1, LittlerootTown_MaysHouse_1F_EventScript_1528F6
	end

LittlerootTown_MaysHouse_1F_EventScript_1528EA:: @ 81528EA
	movespriteperm 1, 2, 4
	spritebehave 1, 7
	return

LittlerootTown_MaysHouse_1F_EventScript_1528F6:: @ 81528F6
	movespriteperm 1, 6, 5
	spritebehave 1, 7
	return

LittlerootTown_MaysHouse_1F_EventScript_152902:: @ 8152902
	movespriteperm 1, 1, 8
	spritebehave 1, 7
	return

LittlerootTown_MaysHouse_1F_MapScript2_15290E:: @ 815290E
	map_script_2 0x4092, 3, LittlerootTown_MaysHouse_1F_EventScript_152960
	map_script_2 0x4092, 5, LittlerootTown_MaysHouse_1F_EventScript_152938
	map_script_2 0x4092, 6, LittlerootTown_MaysHouse_1F_EventScript_152971
	map_script_2 0x408c, 1, LittlerootTown_MaysHouse_1F_EventScript_152982
	map_script_2 0x4082, 3, LittlerootTown_MaysHouse_1F_EventScript_1B6CDE
	.2byte 0

LittlerootTown_MaysHouse_1F_EventScript_152938:: @ 8152938
	lockall
	loadptr 0, LittlerootTown_MaysHouse_1F_Text_172574
	callstd 4
	closebutton
	move 255, LittlerootTown_MaysHouse_1F_Movement_15295E
	move 1, LittlerootTown_MaysHouse_1F_Movement_15295E
	waitmove 0
	warp LittlerootTown_MaysHouse_2F, 255, 1, 1
	waitstate
	releaseall
	end

LittlerootTown_MaysHouse_1F_Movement_15295E:: @ 815295E
	step_up
	step_end

LittlerootTown_MaysHouse_1F_EventScript_152960:: @ 8152960
	lockall
	setvar 0x8004, 1
	setvar 0x8005, 1
	jump LittlerootTown_MaysHouse_1F_EventScript_1B6956
	end

LittlerootTown_MaysHouse_1F_EventScript_152971:: @ 8152971
	lockall
	setvar 0x8004, 1
	setvar 0x8005, 1
	jump LittlerootTown_MaysHouse_1F_EventScript_1B6B2E
	end

LittlerootTown_MaysHouse_1F_EventScript_152982:: @ 8152982
	lockall
	playsfx 21
	move 4, LittlerootTown_MaysHouse_1F_Movement_1A0833
	waitmove 0
	move 4, LittlerootTown_MaysHouse_1F_Movement_1A0835
	waitmove 0
	move 255, LittlerootTown_MaysHouse_1F_Movement_1A0843
	move 4, LittlerootTown_MaysHouse_1F_Movement_1529C0
	waitmove 0
	special 149
	loadptr 0, LittlerootTown_MaysHouse_1F_Text_1730C2
	callstd 4
	setflag 87
	setvar 0x408c, 2
	releaseall
	end

LittlerootTown_MaysHouse_1F_Movement_1529C0:: @ 81529C0
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

	.incbin "baserom.gba", 0x1529c7, 0x24

LittlerootTown_BrendansHouse_1F_EventScript_1529EB:: @ 81529EB
LittlerootTown_MaysHouse_1F_EventScript_1529EB:: @ 81529EB
	lock
	faceplayer
	checkflag 130
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_152A21
	checkflag 301
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_152A17
	compare 0x408d, 3
	jumpeq LittlerootTown_BrendansHouse_1F_EventScript_152A2B
	special 149
	loadptr 0, LittlerootTown_BrendansHouse_1F_Text_1731C6
	callstd 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_152A17:: @ 8152A17
	loadptr 0, LittlerootTown_BrendansHouse_1F_Text_173262
	callstd 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_152A21:: @ 8152A21
	loadptr 0, LittlerootTown_BrendansHouse_1F_Text_1732B9
	callstd 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_152A2B:: @ 8152A2B
	loadptr 0, LittlerootTown_BrendansHouse_1F_Text_1731E3
	callstd 4
	release
	end

LittlerootTown_MaysHouse_1F_EventScript_152A35:: @ 8152A35
	lockall
	setvar 0x8004, 1
	setvar 0x8005, 1
	move 0x8004, LittlerootTown_MaysHouse_1F_Movement_1A0843
	waitmove 0
	jump LittlerootTown_MaysHouse_1F_EventScript_1B69B7
	end

