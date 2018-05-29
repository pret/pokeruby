MossdeepCity_GameCorner_1F_MapScripts:: @ 815AC52
	map_script 1, MossdeepCity_GameCorner_1F_MapScript1_15AC62
	map_script 3, MossdeepCity_GameCorner_1F_MapScript1_15AC84
	map_script 2, MossdeepCity_GameCorner_1F_MapScript2_15ACBB
	.byte 0

MossdeepCity_GameCorner_1F_MapScript1_15AC62:: @ 815AC62
	special ValidateEReaderTrainer
	compare RESULT, 1
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AC71
	end

MossdeepCity_GameCorner_1F_EventScript_15AC71:: @ 815AC71
	setmetatile 3, 0, 653, 1
	setmetatile 3, 1, 661, 1
	return

MossdeepCity_GameCorner_1F_MapScript1_15AC84:: @ 815AC84
	special ValidateEReaderTrainer
	compare RESULT, 0
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AC9E
	compare VAR_GAME_CORNER_STATE, 0
	call_if_ne MossdeepCity_GameCorner_1F_EventScript_15ACAF
	end

MossdeepCity_GameCorner_1F_EventScript_15AC9E:: @ 815AC9E
	setvar VAR_TEMP_1, 1
	setobjectxyperm 1, 3, 2
	setobjectmovementtype 1, 8
	return

MossdeepCity_GameCorner_1F_EventScript_15ACAF:: @ 815ACAF
	setobjectxyperm 1, 2, 2
	setobjectmovementtype 1, 10
	return

MossdeepCity_GameCorner_1F_MapScript2_15ACBB:: @ 815ACBB
	map_script_2 VAR_GAME_CORNER_STATE, 1, MossdeepCity_GameCorner_1F_EventScript_15ACD5
	map_script_2 VAR_GAME_CORNER_STATE, 2, MossdeepCity_GameCorner_1F_EventScript_15ACD5
	map_script_2 VAR_GAME_CORNER_STATE, 3, MossdeepCity_GameCorner_1F_EventScript_15ACD5
	.2byte 0

MossdeepCity_GameCorner_1F_EventScript_15ACD5:: @ 815ACD5
	lockall
	applymovement 255, MossdeepCity_GameCorner_1F_Movement_15AD3D
	waitmovement 0
	applymovement 1, MossdeepCity_GameCorner_1F_Movement_15AD3F
	waitmovement 0
	moveobjectoffscreen 1
	applymovement 255, MossdeepCity_GameCorner_1F_Movement_1A0841
	waitmovement 0
	compare VAR_GAME_CORNER_STATE, 1
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AD22
	compare VAR_GAME_CORNER_STATE, 2
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AD2B
	compare VAR_GAME_CORNER_STATE, 3
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AD34
	special LoadPlayerParty
	setvar VAR_GAME_CORNER_STATE, 0
	releaseall
	end

MossdeepCity_GameCorner_1F_EventScript_15AD22:: @ 815AD22
	msgbox MossdeepCity_GameCorner_1F_Text_18E80E, 4
	return

MossdeepCity_GameCorner_1F_EventScript_15AD2B:: @ 815AD2B
	msgbox MossdeepCity_GameCorner_1F_Text_18E859, 4
	return

MossdeepCity_GameCorner_1F_EventScript_15AD34:: @ 815AD34
	msgbox MossdeepCity_GameCorner_1F_Text_18E7B1, 4
	return

MossdeepCity_GameCorner_1F_Movement_15AD3D:: @ 815AD3D
	walk_down
	end_movement

MossdeepCity_GameCorner_1F_Movement_15AD3F:: @ 815AD3F
	walk_right
	walk_in_place_fastest_down
	end_movement

MossdeepCity_GameCorner_1F_EventScript_15AD42:: @ 815AD42
	lock
	faceplayer
	compare VAR_TEMP_1, 1
	goto_if_eq MossdeepCity_GameCorner_1F_EventScript_15AD59
	msgbox MossdeepCity_GameCorner_1F_Text_18E59A, 4
	release
	end

MossdeepCity_GameCorner_1F_EventScript_15AD59:: @ 815AD59
	special SavePlayerParty
	special BufferEReaderTrainerName
	msgbox MossdeepCity_GameCorner_1F_Text_18E650, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq MossdeepCity_GameCorner_1F_EventScript_15ADE8
	call MossdeepCity_GameCorner_1F_EventScript_15ADF5
	compare RESULT, 0
	goto_if_eq MossdeepCity_GameCorner_1F_EventScript_15ADE8
	msgbox MossdeepCity_GameCorner_1F_Text_18E741, MSGBOX_YESNO
	compare RESULT, NO
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15ADE8
	special LoadPlayerParty
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq MossdeepCity_GameCorner_1F_EventScript_15ADE8
	erasebox 0, 0, 15, 10
	special SavePlayerParty
	special ReducePlayerPartyToThree
	msgbox MossdeepCity_GameCorner_1F_Text_18E777, 4
	closemessage
	compare FACING, 2
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AE04
	compare FACING, 4
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AE16
	compare FACING, 3
	call_if_eq MossdeepCity_GameCorner_1F_EventScript_15AE28
	warp MAP_MOSSDEEP_CITY_GAME_CORNER_B1F, 255, 3, 1
	waitstate
	release
	end

MossdeepCity_GameCorner_1F_EventScript_15ADE8:: @ 815ADE8
	special LoadPlayerParty
	msgbox MossdeepCity_GameCorner_1F_Text_18E698, 4
	release
	end

MossdeepCity_GameCorner_1F_EventScript_15ADF5:: @ 815ADF5
	msgbox MossdeepCity_GameCorner_1F_Text_18E6DA, 4
	fadescreen 1
	special sub_80C5568
	waitstate
	return

MossdeepCity_GameCorner_1F_EventScript_15AE04:: @ 815AE04
	applymovement LAST_TALKED, MossdeepCity_GameCorner_1F_Movement_15AE46
	applymovement 255, MossdeepCity_GameCorner_1F_Movement_15AE3A
	waitmovement 0
	return

MossdeepCity_GameCorner_1F_EventScript_15AE16:: @ 815AE16
	applymovement LAST_TALKED, MossdeepCity_GameCorner_1F_Movement_15AE49
	applymovement 255, MossdeepCity_GameCorner_1F_Movement_15AE3E
	waitmovement 0
	return

MossdeepCity_GameCorner_1F_EventScript_15AE28:: @ 815AE28
	applymovement LAST_TALKED, MossdeepCity_GameCorner_1F_Movement_15AE46
	applymovement 255, MossdeepCity_GameCorner_1F_Movement_15AE42
	waitmovement 0
	return

MossdeepCity_GameCorner_1F_Movement_15AE3A:: @ 815AE3A
	delay_16
	walk_up
	walk_up
	end_movement

MossdeepCity_GameCorner_1F_Movement_15AE3E:: @ 815AE3E
	delay_16
	walk_right
	walk_up
	end_movement

MossdeepCity_GameCorner_1F_Movement_15AE42:: @ 815AE42
	delay_16
	walk_left
	walk_up
	end_movement

MossdeepCity_GameCorner_1F_Movement_15AE46:: @ 815AE46
	walk_left
	walk_in_place_fastest_right
	end_movement

MossdeepCity_GameCorner_1F_Movement_15AE49:: @ 815AE49
	walk_right
	walk_in_place_fastest_left
	end_movement

MossdeepCity_GameCorner_1F_EventScript_15AE4C:: @ 815AE4C
	msgbox MossdeepCity_GameCorner_1F_Text_18E631, 3
	end
