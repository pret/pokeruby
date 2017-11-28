LittlerootTown_BrendansHouse_1F_MapScripts:: @ 815263B
	map_script 1, LittlerootTown_BrendansHouse_1F_MapScript1_15264B
	map_script 3, LittlerootTown_BrendansHouse_1F_MapScript1_15268A
	map_script 2, LittlerootTown_BrendansHouse_1F_MapScript2_1526D0
	.byte 0

LittlerootTown_BrendansHouse_1F_MapScript1_15264B:: @ 815264B
	compare 0x4092, 6
	call_if 0, LittlerootTown_BrendansHouse_1F_EventScript_152660
	checkflag 274
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_152673
	end

LittlerootTown_BrendansHouse_1F_EventScript_152660:: @ 8152660
	setmaptile 5, 4, 624, 1
	setmaptile 5, 2, 616, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_152673:: @ 8152673
	checkplayergender
	compare RESULT, 0
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_152680
	return

LittlerootTown_BrendansHouse_1F_EventScript_152680:: @ 8152680
	setmaptile 3, 7, 659, 1
	return

LittlerootTown_BrendansHouse_1F_MapScript1_15268A:: @ 815268A
	compare 0x4092, 3
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1526C4
	compare 0x4092, 5
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1526AC
	compare 0x4092, 6
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1526B8
	end

LittlerootTown_BrendansHouse_1F_EventScript_1526AC:: @ 81526AC
	setobjectxyperm 1, 8, 4
	setobjectmovementtype 1, 7
	return

LittlerootTown_BrendansHouse_1F_EventScript_1526B8:: @ 81526B8
	setobjectxyperm 1, 4, 5
	setobjectmovementtype 1, 7
	return

LittlerootTown_BrendansHouse_1F_EventScript_1526C4:: @ 81526C4
	setobjectxyperm 1, 9, 8
	setobjectmovementtype 1, 7
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
	msgbox LittlerootTown_BrendansHouse_1F_Text_172574, 4
	closemessage
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_152720
	applymovement 1, LittlerootTown_BrendansHouse_1F_Movement_152720
	waitmovement 0
	warp MAP_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F, 255, 7, 1
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
	goto LittlerootTown_BrendansHouse_1F_EventScript_1B6956
	end

LittlerootTown_BrendansHouse_1F_EventScript_152733:: @ 8152733
	lockall
	setvar 0x8004, 0
	setvar 0x8005, 1
	goto LittlerootTown_BrendansHouse_1F_EventScript_1B6ABF
	end

LittlerootTown_BrendansHouse_1F_EventScript_152744:: @ 8152744
	lockall
	playse 21
	applymovement 4, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmovement 0
	applymovement 4, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmovement 0
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	applymovement 4, LittlerootTown_BrendansHouse_1F_Movement_152782
	waitmovement 0
	special GetRivalSonDaughterString
	msgbox LittlerootTown_BrendansHouse_1F_Text_1730C2, 4
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
	applymovement 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmovement 0
	goto LittlerootTown_BrendansHouse_1F_EventScript_1B69B7
	end
