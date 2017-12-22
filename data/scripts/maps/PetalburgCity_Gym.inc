PetalburgCity_Gym_MapScripts:: @ 8154477
	map_script 1, PetalburgCity_Gym_MapScript1_15448C
	map_script 3, PetalburgCity_Gym_MapScript1_15451B
	map_script 4, PetalburgCity_Gym_MapScript2_154553
	map_script 2, PetalburgCity_Gym_MapScript2_154562
	.byte 0

PetalburgCity_Gym_MapScript1_15448C:: @ 815448C
	compare 0x4085, 6
	goto_if_eq PetalburgCity_Gym_EventScript_1544A3
	compare 0x4085, 7
	call_if 4, PetalburgCity_Gym_EventScript_1544ED
	end

PetalburgCity_Gym_EventScript_1544A3:: @ 81544A3
	setvar 0x8005, 1
	call PetalburgCity_Gym_EventScript_154F9A
	checktrainerflag OPPONENT_RANDALL
	call_if 1, PetalburgCity_Gym_EventScript_154FBB
	checktrainerflag OPPONENT_MARY
	call_if 1, PetalburgCity_Gym_EventScript_154FDC
	checktrainerflag OPPONENT_PARKER
	call_if 1, PetalburgCity_Gym_EventScript_154FFD
	checktrainerflag OPPONENT_LORI
	call_if 1, PetalburgCity_Gym_EventScript_15501E
	checktrainerflag OPPONENT_GEORGE
	call_if 1, PetalburgCity_Gym_EventScript_15503F
	checktrainerflag OPPONENT_JODY
	call_if 1, PetalburgCity_Gym_EventScript_155060
	checktrainerflag OPPONENT_BERKE
	call_if 1, PetalburgCity_Gym_EventScript_155081
	end

PetalburgCity_Gym_EventScript_1544ED:: @ 81544ED
	setvar 0x8005, 1
	call PetalburgCity_Gym_EventScript_154F9A
	call PetalburgCity_Gym_EventScript_154FBB
	call PetalburgCity_Gym_EventScript_154FDC
	call PetalburgCity_Gym_EventScript_154FFD
	call PetalburgCity_Gym_EventScript_15501E
	call PetalburgCity_Gym_EventScript_15503F
	call PetalburgCity_Gym_EventScript_155060
	call PetalburgCity_Gym_EventScript_155081
	return

PetalburgCity_Gym_MapScript1_15451B:: @ 815451B
	compare 0x4085, 1
	call_if 1, PetalburgCity_Gym_EventScript_15453B
	compare 0x4085, 6
	call_if 0, PetalburgCity_Gym_EventScript_154543
	checkflag FLAG_SYS_GAME_CLEAR
	call_if 1, PetalburgCity_Gym_EventScript_15454B
	end

PetalburgCity_Gym_EventScript_15453B:: @ 815453B
	setobjectxyperm 10, 5, 108
	return

PetalburgCity_Gym_EventScript_154543:: @ 8154543
	setobjectxyperm 1, 4, 107
	return

PetalburgCity_Gym_EventScript_15454B:: @ 815454B
	setobjectxyperm 1, 4, 107
	return

PetalburgCity_Gym_MapScript2_154553:: @ 8154553
	map_script_2 0x4085, 1, PetalburgCity_Gym_EventScript_15455D
	.2byte 0

PetalburgCity_Gym_EventScript_15455D:: @ 815455D
	turnobject 255, 2
	end

PetalburgCity_Gym_MapScript2_154562:: @ 8154562
	map_script_2 0x4085, 1, PetalburgCity_Gym_EventScript_15456C
	.2byte 0

PetalburgCity_Gym_EventScript_15456C:: @ 815456C
	lockall
	msgbox PetalburgCity_Gym_Text_17A196, 4
	msgbox PetalburgCity_Gym_Text_17A1B0, 4
	closemessage
	applymovement 255, PetalburgCity_Gym_Movement_1A0845
	applymovement 10, PetalburgCity_Gym_Movement_1545B4
	waitmovement 0
	playse 9
	removeobject 10
	setflag FLAG_HIDE_WALLY_PETALBURG
	delay 30
	applymovement 255, PetalburgCity_Gym_Movement_1A0841
	waitmovement 0
	msgbox PetalburgCity_Gym_Text_17A2A4, 4
	setvar 0x4085, 2
	releaseall
	end

PetalburgCity_Gym_Movement_1545B4:: @ 81545B4
	step_down
	step_down
	step_down
	step_14
	step_end

PetalburgCity_Gym_EventScript_1545B9:: @ 81545B9
	lock
	faceplayer
	switch 0x4085
	case 2, PetalburgCity_Gym_EventScript_154907
	case 3, PetalburgCity_Gym_EventScript_154911
	case 4, PetalburgCity_Gym_EventScript_15491B
	case 5, PetalburgCity_Gym_EventScript_154925
	case 6, PetalburgCity_Gym_EventScript_1549D6
	case 7, PetalburgCity_Gym_EventScript_15493D
	msgbox PetalburgCity_Gym_Text_179DF6, 4
	closemessage
	switch FACING
	case 1, PetalburgCity_Gym_EventScript_15463D
	case 2, PetalburgCity_Gym_EventScript_154648
	case 3, PetalburgCity_Gym_EventScript_154653
	case 4, PetalburgCity_Gym_EventScript_15465E
	end

PetalburgCity_Gym_EventScript_15463D:: @ 815463D
	setvar 0x8008, 0
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_154648:: @ 8154648
	setvar 0x8008, 1
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_154653:: @ 8154653
	setvar 0x8008, 2
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_15465E:: @ 815465E
	setvar 0x8008, 3
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_154669:: @ 8154669
	addobject 10
	playse 8
	compare 0x8008, 0
	call_if 1, PetalburgCity_Gym_EventScript_1547EE
	compare 0x8008, 1
	call_if 1, PetalburgCity_Gym_EventScript_154800
	compare 0x8008, 2
	call_if 1, PetalburgCity_Gym_EventScript_15481C
	compare 0x8008, 3
	call_if 1, PetalburgCity_Gym_EventScript_15481C
	msgbox PetalburgCity_Gym_Text_179F07, 4
	msgbox PetalburgCity_Gym_Text_179F37, 4
	msgbox PetalburgCity_Gym_Text_179F70, 4
	msgbox PetalburgCity_Gym_Text_17A03A, 4
	compare 0x8008, 0
	call_if 1, PetalburgCity_Gym_EventScript_154884
	compare 0x8008, 1
	call_if 1, PetalburgCity_Gym_EventScript_15488F
	compare 0x8008, 2
	call_if 1, PetalburgCity_Gym_EventScript_1548A1
	compare 0x8008, 3
	call_if 1, PetalburgCity_Gym_EventScript_1548B3
	msgbox PetalburgCity_Gym_Text_17A04A, 4
	compare 0x8008, 0
	call_if 1, PetalburgCity_Gym_EventScript_1548C5
	compare 0x8008, 1
	call_if 1, PetalburgCity_Gym_EventScript_1548D0
	compare 0x8008, 2
	call_if 1, PetalburgCity_Gym_EventScript_1548DB
	compare 0x8008, 3
	call_if 1, PetalburgCity_Gym_EventScript_1548E6
	msgbox PetalburgCity_Gym_Text_17A0A8, 4
	msgbox PetalburgCity_Gym_Text_17A0EB, 4
	msgbox PetalburgCity_Gym_Text_17A156, 4
	compare 0x8008, 0
	call_if 1, PetalburgCity_Gym_EventScript_15492F
	compare 0x8008, 1
	call_if 1, PetalburgCity_Gym_EventScript_154930
	compare 0x8008, 2
	call_if 1, PetalburgCity_Gym_EventScript_15493B
	compare 0x8008, 3
	call_if 1, PetalburgCity_Gym_EventScript_15493C
	compare 0x8008, 0
	call_if 1, PetalburgCity_Gym_EventScript_1548F1
	compare 0x8008, 1
	call_if 1, PetalburgCity_Gym_EventScript_1548FC
	compare 0x8008, 2
	call_if 1, PetalburgCity_Gym_EventScript_1548F1
	compare 0x8008, 3
	call_if 1, PetalburgCity_Gym_EventScript_1548F1
	msgbox PetalburgCity_Gym_Text_17A171, 4
	closemessage
	setflag FLAG_SPECIAL_FLAG_1
	playbgm 420, 0
	compare 0x8008, 0
	call_if 1, PetalburgCity_Gym_EventScript_154835
	compare 0x8008, 1
	call_if 1, PetalburgCity_Gym_EventScript_15484E
	compare 0x8008, 2
	call_if 1, PetalburgCity_Gym_EventScript_154860
	compare 0x8008, 3
	call_if 1, PetalburgCity_Gym_EventScript_154872
	removeobject 10
	setflag FLAG_HIDE_WALLY_MOM_PETALBURG_1
	setvar 0x4085, 1
	setvar 0x4057, 2
	clearflag FLAG_HIDE_WALLY_PETALBURG
	clearflag FLAG_HIDE_WALLY_PETALBURG_GYM
	setflag FLAG_HIDE_RIVAL_BIRCH_LAB
	special InitBirchState
	warp MAP_PETALBURG_CITY, 255, 15, 8
	waitstate
	release
	end

PetalburgCity_Gym_EventScript_1547EE:: @ 81547EE
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	applymovement 10, PetalburgCity_Gym_Movement_154B27
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154800:: @ 8154800
	applymovement 10, PetalburgCity_Gym_Movement_154B1D
	waitmovement 0
	applymovement 1, PetalburgCity_Gym_Movement_1A0843
	applymovement 255, PetalburgCity_Gym_Movement_1A0843
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15481C:: @ 815481C
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	applymovement 255, PetalburgCity_Gym_Movement_1A0845
	applymovement 10, PetalburgCity_Gym_Movement_154B27
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154835:: @ 8154835
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	applymovement 10, PetalburgCity_Gym_Movement_154B3E
	applymovement 255, PetalburgCity_Gym_Movement_154B4D
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15484E:: @ 815484E
	applymovement 10, PetalburgCity_Gym_Movement_154B2E
	applymovement 255, PetalburgCity_Gym_Movement_154B45
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154860:: @ 8154860
	applymovement 10, PetalburgCity_Gym_Movement_154B3E
	applymovement 255, PetalburgCity_Gym_Movement_154B57
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154872:: @ 8154872
	applymovement 10, PetalburgCity_Gym_Movement_154B36
	applymovement 255, PetalburgCity_Gym_Movement_154B5F
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154884:: @ 8154884
	applymovement 1, PetalburgCity_Gym_Movement_1A0841
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15488F:: @ 815488F
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	applymovement 255, PetalburgCity_Gym_Movement_1A0841
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548A1:: @ 81548A1
	applymovement 1, PetalburgCity_Gym_Movement_1A0843
	applymovement 255, PetalburgCity_Gym_Movement_1A083F
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548B3:: @ 81548B3
	applymovement 1, PetalburgCity_Gym_Movement_1A083F
	applymovement 255, PetalburgCity_Gym_Movement_1A0843
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548C5:: @ 81548C5
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548D0:: @ 81548D0
	applymovement 1, PetalburgCity_Gym_Movement_1A0843
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548DB:: @ 81548DB
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548E6:: @ 81548E6
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548F1:: @ 81548F1
	applymovement 10, PetalburgCity_Gym_Movement_1A0839
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548FC:: @ 81548FC
	applymovement 10, PetalburgCity_Gym_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154907:: @ 8154907
	msgbox PetalburgCity_Gym_Text_17A41E, 4
	release
	end

PetalburgCity_Gym_EventScript_154911:: @ 8154911
	msgbox PetalburgCity_Gym_Text_17A518, 4
	release
	end

PetalburgCity_Gym_EventScript_15491B:: @ 815491B
	msgbox PetalburgCity_Gym_Text_17A5F3, 4
	release
	end

PetalburgCity_Gym_EventScript_154925:: @ 8154925
	msgbox PetalburgCity_Gym_Text_17A5F3, 4
	release
	end

PetalburgCity_Gym_EventScript_15492F:: @ 815492F
	return

PetalburgCity_Gym_EventScript_154930:: @ 8154930
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15493B:: @ 815493B
	return

PetalburgCity_Gym_EventScript_15493C:: @ 815493C
	return

PetalburgCity_Gym_EventScript_15493D:: @ 815493D
	call PetalburgCity_Gym_EventScript_154969
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_1549B8
	checkflag FLAG_RECEIVED_TM42
	goto_if 0, PetalburgCity_Gym_EventScript_154A2C
	checkflag FLAG_SYS_GAME_CLEAR
	goto_if_eq PetalburgCity_Gym_EventScript_154B69
	msgbox PetalburgCity_Gym_Text_17AA6B, 4
	release
	end

PetalburgCity_Gym_EventScript_154969:: @ 8154969
	specialvar RESULT, IsEnigmaBerryValid
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	checkitem ITEM_ENIGMA_BERRY, 1
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	checkpcitem ITEM_ENIGMA_BERRY, 1
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	compare 0x402d, 0
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	msgbox PetalburgCity_Gym_Text_1C5570, 4
	setvar RESULT, 1
	return

PetalburgCity_Gym_EventScript_1549B2:: @ 81549B2
	setvar RESULT, 0
	return

PetalburgCity_Gym_EventScript_1549B8:: @ 81549B8
	giveitem_std ITEM_ENIGMA_BERRY
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_1A029B
	setvar 0x402d, 0
	release
	end

PetalburgCity_Gym_EventScript_1549D6:: @ 81549D6
	msgbox PetalburgCity_Gym_Text_17A653, 4
	trainerbattle 3, OPPONENT_NORMAN, 0, PetalburgCity_Gym_Text_17A77A
	message PetalburgCity_Gym_Text_17A7DD
	waitmessage
	call PetalburgCity_Gym_EventScript_1A02C5
	msgbox PetalburgCity_Gym_Text_17A805, 4
	setflag FLAG_DEFEATED_PETALBURG_GYM
	setvar 0x4085, 7
	setflag FLAG_BADGE05_GET
	call PetalburgCity_Gym_EventScript_1A0424
	setflag FLAG_HIDE_WATTSON_MAUVILLE_GYM
	clearflag FLAG_HIDE_WATTSON_MAUVILLE
	setvar 0x8008, 5
	call PetalburgCity_Gym_EventScript_1A01C0
	clearflag FLAG_HIDE_SLUDGE_BOMB_MAN_DEWFORD_HALL
	call PetalburgCity_Gym_EventScript_1544ED
	special DrawWholeMapView
	goto PetalburgCity_Gym_EventScript_154A2C
	end

PetalburgCity_Gym_EventScript_154A2C:: @ 8154A2C
	giveitem_std ITEM_TM42
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_1A029B
	setflag FLAG_RECEIVED_TM42
	msgbox PetalburgCity_Gym_Text_17A8CF, 4
	msgbox PetalburgCity_Gym_Text_17A976, 4
	closemessage
	compare FACING, 2
	call_if 1, PetalburgCity_Gym_EventScript_154ABC
	compare FACING, 1
	call_if 1, PetalburgCity_Gym_EventScript_154AC7
	compare FACING, 3
	call_if 1, PetalburgCity_Gym_EventScript_154AD2
	compare FACING, 4
	call_if 1, PetalburgCity_Gym_EventScript_154ADD
	delay 70
	compare FACING, 2
	call_if 1, PetalburgCity_Gym_EventScript_154AE8
	compare FACING, 1
	call_if 1, PetalburgCity_Gym_EventScript_154AF3
	compare FACING, 3
	call_if 1, PetalburgCity_Gym_EventScript_154AFE
	compare FACING, 4
	call_if 1, PetalburgCity_Gym_EventScript_154B09
	msgbox PetalburgCity_Gym_Text_17A9F6, 4
	release
	end

PetalburgCity_Gym_EventScript_154ABC:: @ 8154ABC
	applymovement 1, PetalburgCity_Gym_Movement_1A0841
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AC7:: @ 8154AC7
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AD2:: @ 8154AD2
	applymovement 1, PetalburgCity_Gym_Movement_1A083F
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154ADD:: @ 8154ADD
	applymovement 1, PetalburgCity_Gym_Movement_1A0843
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AE8:: @ 8154AE8
	applymovement 1, PetalburgCity_Gym_Movement_1A0845
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AF3:: @ 8154AF3
	applymovement 1, PetalburgCity_Gym_Movement_1A0841
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AFE:: @ 8154AFE
	applymovement 1, PetalburgCity_Gym_Movement_1A0843
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154B09:: @ 8154B09
	applymovement 1, PetalburgCity_Gym_Movement_1A083F
	waitmovement 0
	return

@ 8154B14
	step_26
	step_14
	step_14
	step_14
	step_14
	step_14
	step_13
	step_25
	step_end

PetalburgCity_Gym_Movement_154B1D:: @ 8154B1D
	step_14
	step_up
	step_14
	step_13
	step_up
	step_right
	step_up
	step_up
	step_27
	step_end

PetalburgCity_Gym_Movement_154B27:: @ 8154B27
	step_14
	step_up
	step_14
	step_13
	step_up
	step_up
	step_end

PetalburgCity_Gym_Movement_154B2E:: @ 8154B2E
	step_down
	step_down
	step_down
	step_down
	step_26
	step_14
	step_1d
	step_end

PetalburgCity_Gym_Movement_154B36:: @ 8154B36
	step_down
	step_down
	step_right
	step_down
	step_26
	step_14
	step_1d
	step_end

PetalburgCity_Gym_Movement_154B3E:: @ 8154B3E
	step_down
	step_down
	step_down
	step_26
	step_14
	step_1d
	step_end

PetalburgCity_Gym_Movement_154B45:: @ 8154B45
	step_14
	step_14
	step_14
	step_down
	step_down
	step_down
	step_13
	step_end

PetalburgCity_Gym_Movement_154B4D:: @ 8154B4D
	step_14
	step_14
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_13
	step_end

PetalburgCity_Gym_Movement_154B57:: @ 8154B57
	step_14
	step_14
	step_down
	step_down
	step_down
	step_down
	step_13
	step_end

PetalburgCity_Gym_Movement_154B5F:: @ 8154B5F
	step_25
	step_14
	step_14
	step_down
	step_down
	step_down
	step_right
	step_down
	step_13
	step_end

PetalburgCity_Gym_EventScript_154B69:: @ 8154B69
	msgbox PetalburgCity_Gym_Text_17AB17, 4
	release
	end

PetalburgCity_Gym_EventScript_154B73:: @ 8154B73
	lockall
	compare 0x4085, 6
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 7
	setvar 0x8009, 85
	msgbox PetalburgCity_Gym_Text_17B870, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154BA8:: @ 8154BA8
	closemessage
	delay 30
	warpdoor MAP_PETALBURG_CITY_GYM, 255, 32776, 32777
	waitstate
	releaseall
	end

PetalburgCity_Gym_EventScript_154BB7:: @ 8154BB7
	releaseall
	end

PetalburgCity_Gym_EventScript_154BB9:: @ 8154BB9
	msgbox PetalburgCity_Gym_Text_17B844, 4
	releaseall
	end

PetalburgCity_Gym_EventScript_154BC3:: @ 8154BC3
	lockall
	compare 0x4085, 6
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 1
	setvar 0x8009, 98
	msgbox PetalburgCity_Gym_Text_17B8D4, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154BF8:: @ 8154BF8
	lockall
	checktrainerflag OPPONENT_RANDALL
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 7
	setvar 0x8009, 46
	msgbox PetalburgCity_Gym_Text_17B90F, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154C2B:: @ 8154C2B
	lockall
	checktrainerflag OPPONENT_RANDALL
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 1
	setvar 0x8009, 59
	msgbox PetalburgCity_Gym_Text_17B950, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154C5E:: @ 8154C5E
	lockall
	checktrainerflag OPPONENT_MARY
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 7
	setvar 0x8009, 59
	msgbox PetalburgCity_Gym_Text_17B950, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154C91:: @ 8154C91
	lockall
	checktrainerflag OPPONENT_MARY
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 1
	setvar 0x8009, 72
	msgbox PetalburgCity_Gym_Text_17B98A, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154CC4:: @ 8154CC4
	lockall
	checktrainerflag OPPONENT_PARKER
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 1
	setvar 0x8009, 20
	msgbox PetalburgCity_Gym_Text_17B9C5, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154CF7:: @ 8154CF7
	lockall
	checktrainerflag OPPONENT_LORI
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 7
	setvar 0x8009, 20
	msgbox PetalburgCity_Gym_Text_17B9C5, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154D2A:: @ 8154D2A
	lockall
	checktrainerflag OPPONENT_LORI
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 1
	setvar 0x8009, 33
	msgbox PetalburgCity_Gym_Text_17BA00, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154D5D:: @ 8154D5D
	lockall
	checktrainerflag OPPONENT_GEORGE
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 7
	setvar 0x8009, 33
	msgbox PetalburgCity_Gym_Text_17BA00, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154D90:: @ 8154D90
	lockall
	checktrainerflag OPPONENT_JODY
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 1
	setvar 0x8009, 7
	msgbox PetalburgCity_Gym_Text_17BA3D, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154DC3:: @ 8154DC3
	lockall
	checktrainerflag OPPONENT_BERKE
	goto_if 0, PetalburgCity_Gym_EventScript_154BB9
	setvar 0x8008, 7
	setvar 0x8009, 7
	msgbox PetalburgCity_Gym_Text_17BA3D, 5
	compare RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154DF6:: @ 8154DF6
	trainerbattle 2, OPPONENT_RANDALL, 0, PetalburgCity_Gym_Text_17ADA5, PetalburgCity_Gym_Text_17AE11, PetalburgCity_Gym_EventScript_154E1A
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_154E29
	msgbox PetalburgCity_Gym_Text_17AE30, 6
	end

PetalburgCity_Gym_EventScript_154E1A:: @ 8154E1A
	setvar 0x8005, 0
	call PetalburgCity_Gym_EventScript_154FBB
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154E29:: @ 8154E29
	msgbox PetalburgCity_Gym_Text_17AEBB, 2
	end

PetalburgCity_Gym_EventScript_154E32:: @ 8154E32
	trainerbattle 2, OPPONENT_PARKER, 0, PetalburgCity_Gym_Text_17AF5A, PetalburgCity_Gym_Text_17AF98, PetalburgCity_Gym_EventScript_154E56
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_154E65
	msgbox PetalburgCity_Gym_Text_17AFD3, 6
	end

PetalburgCity_Gym_EventScript_154E56:: @ 8154E56
	setvar 0x8005, 0
	call PetalburgCity_Gym_EventScript_154FFD
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154E65:: @ 8154E65
	msgbox PetalburgCity_Gym_Text_17B016, 2
	end

PetalburgCity_Gym_EventScript_154E6E:: @ 8154E6E
	trainerbattle 2, OPPONENT_GEORGE, 0, PetalburgCity_Gym_Text_17B058, PetalburgCity_Gym_Text_17B0F7, PetalburgCity_Gym_EventScript_154E92
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_154EA1
	msgbox PetalburgCity_Gym_Text_17B12C, 6
	end

PetalburgCity_Gym_EventScript_154E92:: @ 8154E92
	setvar 0x8005, 0
	call PetalburgCity_Gym_EventScript_15503F
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154EA1:: @ 8154EA1
	msgbox PetalburgCity_Gym_Text_17B1F4, 2
	end

PetalburgCity_Gym_EventScript_154EAA:: @ 8154EAA
	trainerbattle 2, OPPONENT_BERKE, 0, PetalburgCity_Gym_Text_17B237, PetalburgCity_Gym_Text_17B2C0, PetalburgCity_Gym_EventScript_154ECE
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_154EDD
	msgbox PetalburgCity_Gym_Text_17B2E4, 6
	end

PetalburgCity_Gym_EventScript_154ECE:: @ 8154ECE
	setvar 0x8005, 0
	call PetalburgCity_Gym_EventScript_155081
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154EDD:: @ 8154EDD
	msgbox PetalburgCity_Gym_Text_17B39B, 2
	end

PetalburgCity_Gym_EventScript_154EE6:: @ 8154EE6
	trainerbattle 2, OPPONENT_MARY, 0, PetalburgCity_Gym_Text_17B3F7, PetalburgCity_Gym_Text_17B454, PetalburgCity_Gym_EventScript_154F0A
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_154F19
	msgbox PetalburgCity_Gym_Text_17B46F, 6
	end

PetalburgCity_Gym_EventScript_154F0A:: @ 8154F0A
	setvar 0x8005, 0
	call PetalburgCity_Gym_EventScript_154FDC
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154F19:: @ 8154F19
	msgbox PetalburgCity_Gym_Text_17B521, 2
	end

PetalburgCity_Gym_EventScript_154F22:: @ 8154F22
	trainerbattle 2, OPPONENT_LORI, 0, PetalburgCity_Gym_Text_17B58D, PetalburgCity_Gym_Text_17B5CB, PetalburgCity_Gym_EventScript_154F46
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_154F55
	msgbox PetalburgCity_Gym_Text_17B5EA, 6
	end

PetalburgCity_Gym_EventScript_154F46:: @ 8154F46
	setvar 0x8005, 0
	call PetalburgCity_Gym_EventScript_15501E
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154F55:: @ 8154F55
	msgbox PetalburgCity_Gym_Text_17B6B5, 2
	end

PetalburgCity_Gym_EventScript_154F5E:: @ 8154F5E
	trainerbattle 2, OPPONENT_JODY, 0, PetalburgCity_Gym_Text_17B6D4, PetalburgCity_Gym_Text_17B732, PetalburgCity_Gym_EventScript_154F82
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_154F91
	msgbox PetalburgCity_Gym_Text_17B749, 6
	end

PetalburgCity_Gym_EventScript_154F82:: @ 8154F82
	setvar 0x8005, 0
	call PetalburgCity_Gym_EventScript_155060
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154F91:: @ 8154F91
	msgbox PetalburgCity_Gym_Text_17B7C0, 2
	end

PetalburgCity_Gym_EventScript_154F9A:: @ 8154F9A
	setvar 0x8004, 1
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_1550A2
	return

PetalburgCity_Gym_EventScript_154FBB:: @ 8154FBB
	setvar 0x8004, 2
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_1550C7
	return

PetalburgCity_Gym_EventScript_154FDC:: @ 8154FDC
	setvar 0x8004, 3
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_1550EC
	return

PetalburgCity_Gym_EventScript_154FFD:: @ 8154FFD
	setvar 0x8004, 4
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_155111
	return

PetalburgCity_Gym_EventScript_15501E:: @ 815501E
	setvar 0x8004, 5
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_155124
	return

PetalburgCity_Gym_EventScript_15503F:: @ 815503F
	setvar 0x8004, 6
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_155149
	return

PetalburgCity_Gym_EventScript_155060:: @ 8155060
	setvar 0x8004, 7
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_15515C
	return

PetalburgCity_Gym_EventScript_155081:: @ 8155081
	setvar 0x8004, 8
	compare 0x8005, 0
	call_if 1, PetalburgCity_Gym_EventScript_155182
	compare 0x8005, 1
	call_if 1, PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_15516F
	return

PetalburgCity_Gym_EventScript_1550A2:: @ 81550A2
	setmetatile 6, 85, 528, 0
	setmetatile 7, 85, 529, 0
	setmetatile 1, 98, 528, 0
	setmetatile 2, 98, 529, 0
	return

PetalburgCity_Gym_EventScript_1550C7:: @ 81550C7
	setmetatile 6, 46, 528, 0
	setmetatile 7, 46, 529, 0
	setmetatile 1, 59, 528, 0
	setmetatile 2, 59, 529, 0
	return

PetalburgCity_Gym_EventScript_1550EC:: @ 81550EC
	setmetatile 6, 59, 528, 0
	setmetatile 7, 59, 529, 0
	setmetatile 1, 72, 528, 0
	setmetatile 2, 72, 529, 0
	return

PetalburgCity_Gym_EventScript_155111:: @ 8155111
	setmetatile 1, 20, 528, 0
	setmetatile 2, 20, 529, 0
	return

PetalburgCity_Gym_EventScript_155124:: @ 8155124
	setmetatile 6, 20, 528, 0
	setmetatile 7, 20, 529, 0
	setmetatile 1, 33, 528, 0
	setmetatile 2, 33, 529, 0
	return

PetalburgCity_Gym_EventScript_155149:: @ 8155149
	setmetatile 6, 33, 528, 0
	setmetatile 7, 33, 529, 0
	return

PetalburgCity_Gym_EventScript_15515C:: @ 815515C
	setmetatile 1, 7, 528, 0
	setmetatile 2, 7, 529, 0
	return

PetalburgCity_Gym_EventScript_15516F:: @ 815516F
	setmetatile 6, 7, 528, 0
	setmetatile 7, 7, 529, 0
	return

PetalburgCity_Gym_EventScript_155182:: @ 8155182
	special PetalburgGymSpecial1
	waitstate
	return

PetalburgCity_Gym_EventScript_155187:: @ 8155187
	special PetalburgGymSpecial2
	return

PetalburgCity_Gym_EventScript_15518B:: @ 815518B
	lock
	faceplayer
	checkflag FLAG_DEFEATED_PETALBURG_GYM
	goto_if_eq PetalburgCity_Gym_EventScript_1551A0
	msgbox PetalburgCity_Gym_Text_17AB96, 4
	release
	end

PetalburgCity_Gym_EventScript_1551A0:: @ 81551A0
	msgbox PetalburgCity_Gym_Text_17AD49, 4
	release
	end

PetalburgCity_Gym_EventScript_1551AA:: @ 81551AA
	lockall
	checkflag FLAG_BADGE05_GET
	goto_if_eq PetalburgCity_Gym_EventScript_1551CA
	goto PetalburgCity_Gym_EventScript_1551D4
	end

PetalburgCity_Gym_EventScript_1551BA:: @ 81551BA
	lockall
	checkflag FLAG_BADGE05_GET
	goto_if_eq PetalburgCity_Gym_EventScript_1551CA
	goto PetalburgCity_Gym_EventScript_1551D4
	end

PetalburgCity_Gym_EventScript_1551CA:: @ 81551CA
	msgbox PetalburgCity_Gym_Text_17BAC0, 4
	releaseall
	end

PetalburgCity_Gym_EventScript_1551D4:: @ 81551D4
	msgbox PetalburgCity_Gym_Text_17BAA5, 4
	releaseall
	end
