LittlerootTown_MaysHouse_2F_MapScripts:: @ 8152A50
	map_script 3, LittlerootTown_MaysHouse_2F_MapScript1_152A5B
	map_script 4, LittlerootTown_MaysHouse_2F_MapScript2_152A86
	.byte 0

LittlerootTown_MaysHouse_2F_MapScript1_152A5B:: @ 8152A5B
	checkflag 130
	callif 0, LittlerootTown_MaysHouse_2F_EventScript_152A7A
	compare 0x4092, 4
	callif 1, LittlerootTown_MaysHouse_2F_EventScript_1B6950
	call LittlerootTown_MaysHouse_2F_EventScript_1A2F3D
	setvar 0x4089, 0
	end

LittlerootTown_MaysHouse_2F_EventScript_152A7A:: @ 8152A7A
	movespriteperm 1, 7, 2
	spritebehave 1, 7
	return

LittlerootTown_MaysHouse_2F_MapScript2_152A86:: @ 8152A86
	map_script_2 0x4089, 0, LittlerootTown_MaysHouse_2F_EventScript_152A90
	.2byte 0

LittlerootTown_MaysHouse_2F_EventScript_152A90:: @ 8152A90
	checkgender
	compare RESULT, 1
	jumpeq LittlerootTown_MaysHouse_2F_EventScript_1A2F68
	end

LittlerootTown_BrendansHouse_2F_EventScript_152A9D:: @ 8152A9D
LittlerootTown_MaysHouse_2F_EventScript_152A9D:: @ 8152A9D
	lockall
	checkflag 292
	jumpeq LittlerootTown_BrendansHouse_2F_EventScript_152BB5
	checkgender
	compare RESULT, 0
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152AD4
	compare RESULT, 1
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152B4A
	playsfx 9
	disappear LAST_TALKED
	setvar 0x408d, 3
	setvar 0x4050, 1
	playmusicbattle 0
	fadedefault
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152AD4:: @ 8152AD4
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_17337E
	callstd 4
	playmusic 415, 1
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmove 0
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0833
	waitmove 0
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0835
	waitmove 0
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_1733AF
	callstd 4
	closebutton
	compare FACING, 4
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152B29
	compare FACING, 2
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152B34
	compare FACING, 3
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152B3F
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B29:: @ 8152B29
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C11
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B34:: @ 8152B34
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C1C
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B3F:: @ 8152B3F
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C1C
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B4A:: @ 8152B4A
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_1735C9
	callstd 4
	playmusic 421, 1
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmove 0
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0833
	waitmove 0
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0835
	waitmove 0
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_1735FC
	callstd 4
	closebutton
	compare FACING, 4
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152B9F
	compare FACING, 2
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152B9F
	compare FACING, 3
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152BAA
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B9F:: @ 8152B9F
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C30
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BAA:: @ 8152BAA
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C25
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BB5:: @ 8152BB5
	move LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmove 0
	checkgender
	compare RESULT, 0
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152BDB
	compare RESULT, 1
	callif 1, LittlerootTown_BrendansHouse_2F_EventScript_152BED
	setflag 293
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152BDB:: @ 8152BDB
	checkflag 293
	jumpeq LittlerootTown_BrendansHouse_2F_EventScript_152BFF
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_1737AE
	callstd 4
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BED:: @ 8152BED
	checkflag 293
	jumpeq LittlerootTown_BrendansHouse_2F_EventScript_152C08
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_1738F2
	callstd 4
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BFF:: @ 8152BFF
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_173883
	callstd 4
	return

LittlerootTown_BrendansHouse_2F_EventScript_152C08:: @ 8152C08
	loadptr 0, LittlerootTown_BrendansHouse_2F_Text_1739CC
	callstd 4
	return

