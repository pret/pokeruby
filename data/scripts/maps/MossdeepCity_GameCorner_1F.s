MossdeepCity_GameCorner_1F_MapScripts:: @ 815AC52
	map_script 1, MossdeepCity_GameCorner_1F_MapScript1_15AC62
	map_script 3, MossdeepCity_GameCorner_1F_MapScript1_15AC84
	map_script 2, MossdeepCity_GameCorner_1F_MapScript2_15ACBB
	.byte 0

MossdeepCity_GameCorner_1F_MapScript1_15AC62:: @ 815AC62
	special 246
	compare RESULT, 1
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AC71
	end

MossdeepCity_GameCorner_1F_EventScript_15AC71:: @ 815AC71
	setmaptile 3, 0, 653, 1
	setmaptile 3, 1, 661, 1
	return

MossdeepCity_GameCorner_1F_MapScript1_15AC84:: @ 815AC84
	special 246
	compare RESULT, 0
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AC9E
	compare 0x40c0, 0
	callif NOT_EQUAL, MossdeepCity_GameCorner_1F_EventScript_15ACAF
	end

MossdeepCity_GameCorner_1F_EventScript_15AC9E:: @ 815AC9E
	setvar 0x4001, 1
	movespriteperm 1, 3, 2
	spritebehave 1, 8
	return

MossdeepCity_GameCorner_1F_EventScript_15ACAF:: @ 815ACAF
	movespriteperm 1, 2, 2
	spritebehave 1, 10
	return

MossdeepCity_GameCorner_1F_MapScript2_15ACBB:: @ 815ACBB
	map_script_2 0x40c0, 1, MossdeepCity_GameCorner_1F_EventScript_15ACD5
	map_script_2 0x40c0, 2, MossdeepCity_GameCorner_1F_EventScript_15ACD5
	map_script_2 0x40c0, 3, MossdeepCity_GameCorner_1F_EventScript_15ACD5
	.2byte 0

MossdeepCity_GameCorner_1F_EventScript_15ACD5:: @ 815ACD5
	lockall
	move 255, MossdeepCity_GameCorner_1F_Movement_15AD3D
	waitmove 0
	move 1, MossdeepCity_GameCorner_1F_Movement_15AD3F
	waitmove 0
	moveoffscreen 1
	move 255, MossdeepCity_GameCorner_1F_Movement_1A0841
	waitmove 0
	compare 0x40c0, 1
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AD22
	compare 0x40c0, 2
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AD2B
	compare 0x40c0, 3
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AD34
	special 40
	setvar 0x40c0, 0
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
	step_down
	step_end

MossdeepCity_GameCorner_1F_Movement_15AD3F:: @ 815AD3F
	step_right
	step_25
	step_end

MossdeepCity_GameCorner_1F_EventScript_15AD42:: @ 815AD42
	lock
	faceplayer
	compare 0x4001, 1
	jumpif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AD59
	msgbox MossdeepCity_GameCorner_1F_Text_18E59A, 4
	release
	end

MossdeepCity_GameCorner_1F_EventScript_15AD59:: @ 815AD59
	special 39
	special 285
	msgbox MossdeepCity_GameCorner_1F_Text_18E650, 5
	compare RESULT, 0
	jumpif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15ADE8
	call MossdeepCity_GameCorner_1F_EventScript_15ADF5
	compare RESULT, 0
	jumpif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15ADE8
	msgbox MossdeepCity_GameCorner_1F_Text_18E741, 5
	compare RESULT, 0
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15ADE8
	special 40
	call MossdeepCity_GameCorner_1F_EventScript_19F806
	compare RESULT, 0
	jumpif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15ADE8
	hidebox 0, 0, 15, 10
	special 39
	special 248
	msgbox MossdeepCity_GameCorner_1F_Text_18E777, 4
	closebutton
	compare FACING, 2
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AE04
	compare FACING, 4
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AE16
	compare FACING, 3
	callif EQUAL, MossdeepCity_GameCorner_1F_EventScript_15AE28
	warp MossdeepCity_GameCorner_B1F, 255, 3, 1
	waitstate
	release
	end

MossdeepCity_GameCorner_1F_EventScript_15ADE8:: @ 815ADE8
	special 40
	msgbox MossdeepCity_GameCorner_1F_Text_18E698, 4
	release
	end

MossdeepCity_GameCorner_1F_EventScript_15ADF5:: @ 815ADF5
	msgbox MossdeepCity_GameCorner_1F_Text_18E6DA, 4
	fadescreen 1
	special 41
	waitstate
	return

MossdeepCity_GameCorner_1F_EventScript_15AE04:: @ 815AE04
	move LAST_TALKED, MossdeepCity_GameCorner_1F_Movement_15AE46
	move 255, MossdeepCity_GameCorner_1F_Movement_15AE3A
	waitmove 0
	return

MossdeepCity_GameCorner_1F_EventScript_15AE16:: @ 815AE16
	move LAST_TALKED, MossdeepCity_GameCorner_1F_Movement_15AE49
	move 255, MossdeepCity_GameCorner_1F_Movement_15AE3E
	waitmove 0
	return

MossdeepCity_GameCorner_1F_EventScript_15AE28:: @ 815AE28
	move LAST_TALKED, MossdeepCity_GameCorner_1F_Movement_15AE46
	move 255, MossdeepCity_GameCorner_1F_Movement_15AE42
	waitmove 0
	return

MossdeepCity_GameCorner_1F_Movement_15AE3A:: @ 815AE3A
	step_14
	step_up
	step_up
	step_end

MossdeepCity_GameCorner_1F_Movement_15AE3E:: @ 815AE3E
	step_14
	step_right
	step_up
	step_end

MossdeepCity_GameCorner_1F_Movement_15AE42:: @ 815AE42
	step_14
	step_left
	step_up
	step_end

MossdeepCity_GameCorner_1F_Movement_15AE46:: @ 815AE46
	step_left
	step_28
	step_end

MossdeepCity_GameCorner_1F_Movement_15AE49:: @ 815AE49
	step_right
	step_27
	step_end

MossdeepCity_GameCorner_1F_EventScript_15AE4C:: @ 815AE4C
	msgbox MossdeepCity_GameCorner_1F_Text_18E631, 3
	end
