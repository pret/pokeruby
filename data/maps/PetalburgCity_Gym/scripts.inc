PetalburgCity_Gym_MapScripts:: @ 8154477
	map_script MAP_SCRIPT_ON_LOAD, PetalburgCity_Gym_MapScript1_15448C
	map_script MAP_SCRIPT_ON_TRANSITION, PetalburgCity_Gym_MapScript1_15451B
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PetalburgCity_Gym_MapScript2_154553
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PetalburgCity_Gym_MapScript2_154562
	.byte 0

PetalburgCity_Gym_MapScript1_15448C:: @ 815448C
	compare VAR_PETALBURG_GYM_STATE, 6
	goto_if_eq PetalburgCity_Gym_EventScript_1544A3
	compare VAR_PETALBURG_GYM_STATE, 7
	call_if_ge PetalburgCity_Gym_EventScript_1544ED
	end

PetalburgCity_Gym_EventScript_1544A3:: @ 81544A3
	setvar VAR_0x8005, 1
	call PetalburgCity_Gym_EventScript_154F9A
	call_if_defeated TRAINER_RANDALL, PetalburgCity_Gym_EventScript_154FBB
	call_if_defeated TRAINER_MARY, PetalburgCity_Gym_EventScript_154FDC
	call_if_defeated TRAINER_PARKER, PetalburgCity_Gym_EventScript_154FFD
	call_if_defeated TRAINER_LORI, PetalburgCity_Gym_EventScript_15501E
	call_if_defeated TRAINER_GEORGE, PetalburgCity_Gym_EventScript_15503F
	call_if_defeated TRAINER_JODY, PetalburgCity_Gym_EventScript_155060
	call_if_defeated TRAINER_BERKE, PetalburgCity_Gym_EventScript_155081
	end

PetalburgCity_Gym_EventScript_1544ED:: @ 81544ED
	setvar VAR_0x8005, 1
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
	compare VAR_PETALBURG_GYM_STATE, 1
	call_if_eq PetalburgCity_Gym_EventScript_15453B
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_lt PetalburgCity_Gym_EventScript_154543
	call_if_set FLAG_SYS_GAME_CLEAR, PetalburgCity_Gym_EventScript_15454B
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
	map_script_2 VAR_PETALBURG_GYM_STATE, 1, PetalburgCity_Gym_EventScript_15455D
	.2byte 0

PetalburgCity_Gym_EventScript_15455D:: @ 815455D
	turnobject LOCALID_PLAYER, 2
	end

PetalburgCity_Gym_MapScript2_154562:: @ 8154562
	map_script_2 VAR_PETALBURG_GYM_STATE, 1, PetalburgCity_Gym_EventScript_15456C
	.2byte 0

PetalburgCity_Gym_EventScript_15456C:: @ 815456C
	lockall
	msgbox PetalburgCity_Gym_Text_17A196, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_17A1B0, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_1545B4
	waitmovement 0
	playse SE_EXIT
	removeobject 10
	setflag FLAG_HIDE_WALLY_PETALBURG
	delay 30
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox PetalburgCity_Gym_Text_17A2A4, MSGBOX_DEFAULT
	setvar VAR_PETALBURG_GYM_STATE, 2
	releaseall
	end

PetalburgCity_Gym_Movement_1545B4:: @ 81545B4
	walk_down
	walk_down
	walk_down
	delay_16
	step_end

PetalburgCity_Gym_EventScript_1545B9:: @ 81545B9
	lock
	faceplayer
	switch VAR_PETALBURG_GYM_STATE
	case 2, PetalburgCity_Gym_EventScript_154907
	case 3, PetalburgCity_Gym_EventScript_154911
	case 4, PetalburgCity_Gym_EventScript_15491B
	case 5, PetalburgCity_Gym_EventScript_154925
	case 6, PetalburgCity_Gym_EventScript_1549D6
	case 7, PetalburgCity_Gym_EventScript_15493D
	msgbox PetalburgCity_Gym_Text_179DF6, MSGBOX_DEFAULT
	closemessage
	switch VAR_FACING
	case 1, PetalburgCity_Gym_EventScript_15463D
	case 2, PetalburgCity_Gym_EventScript_154648
	case 3, PetalburgCity_Gym_EventScript_154653
	case 4, PetalburgCity_Gym_EventScript_15465E
	end

PetalburgCity_Gym_EventScript_15463D:: @ 815463D
	setvar VAR_0x8008, 0
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_154648:: @ 8154648
	setvar VAR_0x8008, 1
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_154653:: @ 8154653
	setvar VAR_0x8008, 2
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_15465E:: @ 815465E
	setvar VAR_0x8008, 3
	goto PetalburgCity_Gym_EventScript_154669
	end

PetalburgCity_Gym_EventScript_154669:: @ 8154669
	addobject 10
	playse SE_DOOR
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_1547EE
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_154800
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_15481C
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_15481C
	msgbox PetalburgCity_Gym_Text_179F07, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_179F37, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_179F70, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_17A03A, MSGBOX_DEFAULT
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_154884
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_15488F
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_1548A1
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_1548B3
	msgbox PetalburgCity_Gym_Text_17A04A, MSGBOX_DEFAULT
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_1548C5
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_1548D0
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_1548DB
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_1548E6
	msgbox PetalburgCity_Gym_Text_17A0A8, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_17A0EB, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_17A156, MSGBOX_DEFAULT
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_15492F
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_154930
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_15493B
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_15493C
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_1548F1
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_1548FC
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_1548F1
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_1548F1
	msgbox PetalburgCity_Gym_Text_17A171, MSGBOX_DEFAULT
	closemessage
	setflag FLAG_DONT_TRANSITION_MUSIC
	playbgm MUS_FOLLOW_ME, FALSE
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_Gym_EventScript_154835
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_Gym_EventScript_15484E
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_Gym_EventScript_154860
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_Gym_EventScript_154872
	removeobject 10
	setflag FLAG_HIDE_WALLY_MOM_PETALBURG_1
	setvar VAR_PETALBURG_GYM_STATE, 1
	setvar VAR_PETALBURG_STATE, 2
	clearflag FLAG_HIDE_WALLY_PETALBURG
	clearflag FLAG_HIDE_WALLY_PETALBURG_GYM
	setflag FLAG_HIDE_RIVAL_BIRCH_LAB
	special InitBirchState
	warp MAP_PETALBURG_CITY, 255, 15, 8
	waitstate
	release
	end

PetalburgCity_Gym_EventScript_1547EE:: @ 81547EE
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_154B27
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154800:: @ 8154800
	applymovement 10, PetalburgCity_Gym_Movement_154B1D
	waitmovement 0
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15481C:: @ 815481C
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_154B27
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154835:: @ 8154835
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement 10, PetalburgCity_Gym_Movement_154B3E
	applymovement LOCALID_PLAYER, PetalburgCity_Gym_Movement_154B4D
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15484E:: @ 815484E
	applymovement 10, PetalburgCity_Gym_Movement_154B2E
	applymovement LOCALID_PLAYER, PetalburgCity_Gym_Movement_154B45
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154860:: @ 8154860
	applymovement 10, PetalburgCity_Gym_Movement_154B3E
	applymovement LOCALID_PLAYER, PetalburgCity_Gym_Movement_154B57
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154872:: @ 8154872
	applymovement 10, PetalburgCity_Gym_Movement_154B36
	applymovement LOCALID_PLAYER, PetalburgCity_Gym_Movement_154B5F
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154884:: @ 8154884
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15488F:: @ 815488F
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548A1:: @ 81548A1
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548B3:: @ 81548B3
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548C5:: @ 81548C5
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548D0:: @ 81548D0
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548DB:: @ 81548DB
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548E6:: @ 81548E6
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548F1:: @ 81548F1
	applymovement 10, Common_Movement_FacePlayer
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_1548FC:: @ 81548FC
	applymovement 10, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154907:: @ 8154907
	msgbox PetalburgCity_Gym_Text_17A41E, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_154911:: @ 8154911
	msgbox PetalburgCity_Gym_Text_17A518, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_15491B:: @ 815491B
	msgbox PetalburgCity_Gym_Text_17A5F3, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_154925:: @ 8154925
	msgbox PetalburgCity_Gym_Text_17A5F3, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_15492F:: @ 815492F
	return

PetalburgCity_Gym_EventScript_154930:: @ 8154930
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_15493B:: @ 815493B
	return

PetalburgCity_Gym_EventScript_15493C:: @ 815493C
	return

PetalburgCity_Gym_EventScript_15493D:: @ 815493D
	call PetalburgCity_Gym_EventScript_154969
	compare VAR_RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_1549B8
	goto_if_unset FLAG_RECEIVED_TM42, PetalburgCity_Gym_EventScript_154A2C
	goto_if_set FLAG_SYS_GAME_CLEAR, PetalburgCity_Gym_EventScript_154B69
	msgbox PetalburgCity_Gym_Text_17AA6B, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_154969:: @ 8154969
	specialvar VAR_RESULT, IsEnigmaBerryValid
	compare VAR_RESULT, 0
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	checkitem ITEM_ENIGMA_BERRY, 1
	compare VAR_RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	checkpcitem ITEM_ENIGMA_BERRY, 1
	compare VAR_RESULT, 1
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	compare VAR_ENIGMA_BERRY_AVAILABLE, 0
	goto_if_eq PetalburgCity_Gym_EventScript_1549B2
	msgbox PetalburgCity_Gym_Text_1C5570, MSGBOX_DEFAULT
	setvar VAR_RESULT, 1
	return

PetalburgCity_Gym_EventScript_1549B2:: @ 81549B2
	setvar VAR_RESULT, 0
	return

PetalburgCity_Gym_EventScript_1549B8:: @ 81549B8
	giveitem ITEM_ENIGMA_BERRY
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setvar VAR_ENIGMA_BERRY_AVAILABLE, 0
	release
	end

PetalburgCity_Gym_EventScript_1549D6:: @ 81549D6
	msgbox PetalburgCity_Gym_Text_17A653, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_NORMAN, PetalburgCity_Gym_Text_17A77A
	message PetalburgCity_Gym_Text_17A7DD
	waitmessage
	call Common_EventScript_PlayGymBadgeFanfare
	msgbox PetalburgCity_Gym_Text_17A805, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_PETALBURG_GYM
	setvar VAR_PETALBURG_GYM_STATE, 7
	setflag FLAG_BADGE05_GET
	call EventScript_HideMrBriney
	setflag FLAG_HIDE_WATTSON_MAUVILLE_GYM
	clearflag FLAG_HIDE_WATTSON_MAUVILLE
	setvar VAR_0x8008, 5
	call Common_EventScript_SetGymTrainers
	clearflag FLAG_HIDE_SLUDGE_BOMB_MAN_DEWFORD_HALL
	call PetalburgCity_Gym_EventScript_1544ED
	special DrawWholeMapView
	goto PetalburgCity_Gym_EventScript_154A2C
	end

PetalburgCity_Gym_EventScript_154A2C:: @ 8154A2C
	giveitem ITEM_TM42_FACADE
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_TM42
	msgbox PetalburgCity_Gym_Text_17A8CF, MSGBOX_DEFAULT
	msgbox PetalburgCity_Gym_Text_17A976, MSGBOX_DEFAULT
	closemessage
	compare VAR_FACING, 2
	call_if_eq PetalburgCity_Gym_EventScript_154ABC
	compare VAR_FACING, 1
	call_if_eq PetalburgCity_Gym_EventScript_154AC7
	compare VAR_FACING, 3
	call_if_eq PetalburgCity_Gym_EventScript_154AD2
	compare VAR_FACING, 4
	call_if_eq PetalburgCity_Gym_EventScript_154ADD
	delay 70
	compare VAR_FACING, 2
	call_if_eq PetalburgCity_Gym_EventScript_154AE8
	compare VAR_FACING, 1
	call_if_eq PetalburgCity_Gym_EventScript_154AF3
	compare VAR_FACING, 3
	call_if_eq PetalburgCity_Gym_EventScript_154AFE
	compare VAR_FACING, 4
	call_if_eq PetalburgCity_Gym_EventScript_154B09
	msgbox PetalburgCity_Gym_Text_17A9F6, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_154ABC:: @ 8154ABC
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AC7:: @ 8154AC7
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AD2:: @ 8154AD2
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154ADD:: @ 8154ADD
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AE8:: @ 8154AE8
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AF3:: @ 8154AF3
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154AFE:: @ 8154AFE
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PetalburgCity_Gym_EventScript_154B09:: @ 8154B09
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

@ 8154B14
	walk_in_place_fastest_up
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_8
	walk_in_place_fastest_down
	step_end

PetalburgCity_Gym_Movement_154B1D:: @ 8154B1D
	delay_16
	walk_up
	delay_16
	delay_8
	walk_up
	walk_right
	walk_up
	walk_up
	walk_in_place_fastest_left
	step_end

PetalburgCity_Gym_Movement_154B27:: @ 8154B27
	delay_16
	walk_up
	delay_16
	delay_8
	walk_up
	walk_up
	step_end

PetalburgCity_Gym_Movement_154B2E:: @ 8154B2E
	walk_down
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_up
	delay_16
	walk_in_place_down
	step_end

PetalburgCity_Gym_Movement_154B36:: @ 8154B36
	walk_down
	walk_down
	walk_right
	walk_down
	walk_in_place_fastest_up
	delay_16
	walk_in_place_down
	step_end

PetalburgCity_Gym_Movement_154B3E:: @ 8154B3E
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_up
	delay_16
	walk_in_place_down
	step_end

PetalburgCity_Gym_Movement_154B45:: @ 8154B45
	delay_16
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_Movement_154B4D:: @ 8154B4D
	delay_16
	delay_16
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_Movement_154B57:: @ 8154B57
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_Movement_154B5F:: @ 8154B5F
	walk_in_place_fastest_down
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	walk_right
	walk_down
	delay_8
	step_end

PetalburgCity_Gym_EventScript_154B69:: @ 8154B69
	msgbox PetalburgCity_Gym_Text_17AB17, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_154B73:: @ 8154B73
	lockall
	compare VAR_PETALBURG_GYM_STATE, 6
	goto_if_lt PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 85
	msgbox PetalburgCity_Gym_Text_17B870, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
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
	msgbox PetalburgCity_Gym_Text_17B844, MSGBOX_DEFAULT
	releaseall
	end

PetalburgCity_Gym_EventScript_154BC3:: @ 8154BC3
	lockall
	compare VAR_PETALBURG_GYM_STATE, 6
	goto_if_lt PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 98
	msgbox PetalburgCity_Gym_Text_17B8D4, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154BF8:: @ 8154BF8
	lockall
	goto_if_not_defeated TRAINER_RANDALL, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 46
	msgbox PetalburgCity_Gym_Text_17B90F, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154C2B:: @ 8154C2B
	lockall
	goto_if_not_defeated TRAINER_RANDALL, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 59
	msgbox PetalburgCity_Gym_Text_17B950, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154C5E:: @ 8154C5E
	lockall
	goto_if_not_defeated TRAINER_MARY, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 59
	msgbox PetalburgCity_Gym_Text_17B950, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154C91:: @ 8154C91
	lockall
	goto_if_not_defeated TRAINER_MARY, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 72
	msgbox PetalburgCity_Gym_Text_17B98A, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154CC4:: @ 8154CC4
	lockall
	goto_if_not_defeated TRAINER_PARKER, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 20
	msgbox PetalburgCity_Gym_Text_17B9C5, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154CF7:: @ 8154CF7
	lockall
	goto_if_not_defeated TRAINER_LORI, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 20
	msgbox PetalburgCity_Gym_Text_17B9C5, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154D2A:: @ 8154D2A
	lockall
	goto_if_not_defeated TRAINER_LORI, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 33
	msgbox PetalburgCity_Gym_Text_17BA00, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154D5D:: @ 8154D5D
	lockall
	goto_if_not_defeated TRAINER_GEORGE, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 33
	msgbox PetalburgCity_Gym_Text_17BA00, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154D90:: @ 8154D90
	lockall
	goto_if_not_defeated TRAINER_JODY, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 7
	msgbox PetalburgCity_Gym_Text_17BA3D, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154DC3:: @ 8154DC3
	lockall
	goto_if_not_defeated TRAINER_BERKE, PetalburgCity_Gym_EventScript_154BB9
	setvar VAR_0x8008, 7
	setvar VAR_0x8009, 7
	msgbox PetalburgCity_Gym_Text_17BA3D, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq PetalburgCity_Gym_EventScript_154BA8
	compare VAR_RESULT, NO
	goto_if_eq PetalburgCity_Gym_EventScript_154BB7
	end

PetalburgCity_Gym_EventScript_154DF6:: @ 8154DF6
	trainerbattle_single TRAINER_RANDALL, PetalburgCity_Gym_Text_17ADA5, PetalburgCity_Gym_Text_17AE11, PetalburgCity_Gym_EventScript_154E1A
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_154E29
	msgbox PetalburgCity_Gym_Text_17AE30, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_154E1A:: @ 8154E1A
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_154FBB
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154E29:: @ 8154E29
	msgbox PetalburgCity_Gym_Text_17AEBB, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_154E32:: @ 8154E32
	trainerbattle_single TRAINER_PARKER, PetalburgCity_Gym_Text_17AF5A, PetalburgCity_Gym_Text_17AF98, PetalburgCity_Gym_EventScript_154E56
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_154E65
	msgbox PetalburgCity_Gym_Text_17AFD3, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_154E56:: @ 8154E56
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_154FFD
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154E65:: @ 8154E65
	msgbox PetalburgCity_Gym_Text_17B016, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_154E6E:: @ 8154E6E
	trainerbattle_single TRAINER_GEORGE, PetalburgCity_Gym_Text_17B058, PetalburgCity_Gym_Text_17B0F7, PetalburgCity_Gym_EventScript_154E92
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_154EA1
	msgbox PetalburgCity_Gym_Text_17B12C, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_154E92:: @ 8154E92
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_15503F
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154EA1:: @ 8154EA1
	msgbox PetalburgCity_Gym_Text_17B1F4, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_154EAA:: @ 8154EAA
	trainerbattle_single TRAINER_BERKE, PetalburgCity_Gym_Text_17B237, PetalburgCity_Gym_Text_17B2C0, PetalburgCity_Gym_EventScript_154ECE
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_154EDD
	msgbox PetalburgCity_Gym_Text_17B2E4, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_154ECE:: @ 8154ECE
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_155081
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154EDD:: @ 8154EDD
	msgbox PetalburgCity_Gym_Text_17B39B, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_154EE6:: @ 8154EE6
	trainerbattle_single TRAINER_MARY, PetalburgCity_Gym_Text_17B3F7, PetalburgCity_Gym_Text_17B454, PetalburgCity_Gym_EventScript_154F0A
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_154F19
	msgbox PetalburgCity_Gym_Text_17B46F, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_154F0A:: @ 8154F0A
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_154FDC
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154F19:: @ 8154F19
	msgbox PetalburgCity_Gym_Text_17B521, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_154F22:: @ 8154F22
	trainerbattle_single TRAINER_LORI, PetalburgCity_Gym_Text_17B58D, PetalburgCity_Gym_Text_17B5CB, PetalburgCity_Gym_EventScript_154F46
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_154F55
	msgbox PetalburgCity_Gym_Text_17B5EA, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_154F46:: @ 8154F46
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_15501E
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154F55:: @ 8154F55
	msgbox PetalburgCity_Gym_Text_17B6B5, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_154F5E:: @ 8154F5E
	trainerbattle_single TRAINER_JODY, PetalburgCity_Gym_Text_17B6D4, PetalburgCity_Gym_Text_17B732, PetalburgCity_Gym_EventScript_154F82
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_154F91
	msgbox PetalburgCity_Gym_Text_17B749, MSGBOX_AUTOCLOSE
	end

PetalburgCity_Gym_EventScript_154F82:: @ 8154F82
	setvar VAR_0x8005, 0
	call PetalburgCity_Gym_EventScript_155060
	special DrawWholeMapView
	release
	end

PetalburgCity_Gym_EventScript_154F91:: @ 8154F91
	msgbox PetalburgCity_Gym_Text_17B7C0, MSGBOX_NPC
	end

PetalburgCity_Gym_EventScript_154F9A:: @ 8154F9A
	setvar VAR_0x8004, 1
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_1550A2
	return

PetalburgCity_Gym_EventScript_154FBB:: @ 8154FBB
	setvar VAR_0x8004, 2
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_1550C7
	return

PetalburgCity_Gym_EventScript_154FDC:: @ 8154FDC
	setvar VAR_0x8004, 3
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_1550EC
	return

PetalburgCity_Gym_EventScript_154FFD:: @ 8154FFD
	setvar VAR_0x8004, 4
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_155111
	return

PetalburgCity_Gym_EventScript_15501E:: @ 815501E
	setvar VAR_0x8004, 5
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_155124
	return

PetalburgCity_Gym_EventScript_15503F:: @ 815503F
	setvar VAR_0x8004, 6
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_155149
	return

PetalburgCity_Gym_EventScript_155060:: @ 8155060
	setvar VAR_0x8004, 7
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_15515C
	return

PetalburgCity_Gym_EventScript_155081:: @ 8155081
	setvar VAR_0x8004, 8
	compare VAR_0x8005, 0
	call_if_eq PetalburgCity_Gym_EventScript_155182
	compare VAR_0x8005, 1
	call_if_eq PetalburgCity_Gym_EventScript_155187
	call PetalburgCity_Gym_EventScript_15516F
	return

PetalburgCity_Gym_EventScript_1550A2:: @ 81550A2
	setmetatile 6, 85, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 85, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 98, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 98, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_1550C7:: @ 81550C7
	setmetatile 6, 46, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 46, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 59, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 59, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_1550EC:: @ 81550EC
	setmetatile 6, 59, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 59, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 72, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 72, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_155111:: @ 8155111
	setmetatile 1, 20, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 20, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_155124:: @ 8155124
	setmetatile 6, 20, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 20, METATILE_PetalburgGym_RoomEntrance_Right, 0
	setmetatile 1, 33, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 33, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_155149:: @ 8155149
	setmetatile 6, 33, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 33, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_15515C:: @ 815515C
	setmetatile 1, 7, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 2, 7, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_15516F:: @ 815516F
	setmetatile 6, 7, METATILE_PetalburgGym_RoomEntrance_Left, 0
	setmetatile 7, 7, METATILE_PetalburgGym_RoomEntrance_Right, 0
	return

PetalburgCity_Gym_EventScript_155182:: @ 8155182
	special PetalburgGymSlideOpenDoors
	waitstate
	return

PetalburgCity_Gym_EventScript_155187:: @ 8155187
	special PetalburgGymOpenDoorsInstantly
	return

PetalburgCity_Gym_EventScript_15518B:: @ 815518B
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_PETALBURG_GYM, PetalburgCity_Gym_EventScript_1551A0
	msgbox PetalburgCity_Gym_Text_17AB96, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_1551A0:: @ 81551A0
	msgbox PetalburgCity_Gym_Text_17AD49, MSGBOX_DEFAULT
	release
	end

PetalburgCity_Gym_EventScript_1551AA:: @ 81551AA
	lockall
	goto_if_set FLAG_BADGE05_GET, PetalburgCity_Gym_EventScript_1551CA
	goto PetalburgCity_Gym_EventScript_1551D4
	end

PetalburgCity_Gym_EventScript_1551BA:: @ 81551BA
	lockall
	goto_if_set FLAG_BADGE05_GET, PetalburgCity_Gym_EventScript_1551CA
	goto PetalburgCity_Gym_EventScript_1551D4
	end

PetalburgCity_Gym_EventScript_1551CA:: @ 81551CA
	msgbox PetalburgCity_Gym_Text_17BAC0, MSGBOX_DEFAULT
	releaseall
	end

PetalburgCity_Gym_EventScript_1551D4:: @ 81551D4
	msgbox PetalburgCity_Gym_Text_17BAA5, MSGBOX_DEFAULT
	releaseall
	end
