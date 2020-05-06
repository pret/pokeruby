EverGrandeCity_ChampionsRoom_MapScripts:: @ 815B7AF
	map_script MAP_SCRIPT_ON_TRANSITION, EverGrandeCity_ChampionsRoom_MapScript1_15B7BF
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_ChampionsRoom_MapScript2_15B7C5
	map_script MAP_SCRIPT_ON_FRAME_TABLE, EverGrandeCity_ChampionsRoom_MapScript2_15B7D4
	.byte 0

EverGrandeCity_ChampionsRoom_MapScript1_15B7BF:: @ 815B7BF
	call Common_EventScript_SetupRivalGfxId
	end

EverGrandeCity_ChampionsRoom_MapScript2_15B7C5:: @ 815B7C5
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_ChampionsRoom_EventScript_15B7CF
	.2byte 0

EverGrandeCity_ChampionsRoom_EventScript_15B7CF:: @ 815B7CF
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

EverGrandeCity_ChampionsRoom_MapScript2_15B7D4:: @ 815B7D4
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_ChampionsRoom_EventScript_15B7DE
	.2byte 0

EverGrandeCity_ChampionsRoom_EventScript_15B7DE:: @ 815B7DE
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkUp4
	waitmovement 0
	delay 40
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_ChampionsRoom_Movement_15B802
	waitmovement 0
	setvar VAR_TEMP_1, 1
	goto EverGrandeCity_ChampionsRoom_EventScript_15B805
	releaseall
	end

EverGrandeCity_ChampionsRoom_Movement_15B802:: @ 815B802
	walk_up
	walk_up
	step_end

EverGrandeCity_ChampionsRoom_EventScript_15B805:: @ 815B805
	playbgm MUS_DAIGO, FALSE
	msgbox EverGrandeCity_ChampionsRoom_Text_190F9C, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_STEVEN, EverGrandeCity_ChampionsRoom_Text_1910A0
	goto EverGrandeCity_ChampionsRoom_EventScript_15B821
	end

EverGrandeCity_ChampionsRoom_EventScript_15B821:: @ 815B821
	playse SE_DOOR
	setmetatile 6, 1, METATILE_EliteFour_OpenDoorChampion_Frame, 0
	setmetatile 6, 2, METATILE_EliteFour_OpenDoorChampion_Opening, 0
	special DrawWholeMapView
	msgbox EverGrandeCity_ChampionsRoom_Text_1910FE, MSGBOX_DEFAULT
	closemessage
	playse SE_DOOR
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_15B87C
	compare VAR_RESULT, 1
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_15B881
	addobject 2
	call EverGrandeCity_ChampionsRoom_EventScript_15B9BD
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq EverGrandeCity_ChampionsRoom_EventScript_15B886
	compare VAR_RESULT, 1
	goto_if_eq EverGrandeCity_ChampionsRoom_EventScript_15B8BB
	end

EverGrandeCity_ChampionsRoom_EventScript_15B87C:: @ 815B87C
	playbgm MUS_GIRL_SUP, FALSE
	return

EverGrandeCity_ChampionsRoom_EventScript_15B881:: @ 815B881
	playbgm MUS_BOY_SUP, FALSE
	return

EverGrandeCity_ChampionsRoom_EventScript_15B886:: @ 815B886
	msgbox EverGrandeCity_ChampionsRoom_Text_191225, MSGBOX_DEFAULT
	delay 40
	playse SE_PIN
	applymovement 2, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 2, Common_Movement_Delay48
	waitmovement 0
	call EverGrandeCity_ChampionsRoom_EventScript_15B9D2
	msgbox EverGrandeCity_ChampionsRoom_Text_191268, MSGBOX_DEFAULT
	goto EverGrandeCity_ChampionsRoom_EventScript_15B8F0
	end

EverGrandeCity_ChampionsRoom_EventScript_15B8BB:: @ 815B8BB
	msgbox EverGrandeCity_ChampionsRoom_Text_1912B3, MSGBOX_DEFAULT
	delay 40
	playse SE_PIN
	applymovement 2, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 2, Common_Movement_Delay48
	waitmovement 0
	call EverGrandeCity_ChampionsRoom_EventScript_15B9D2
	msgbox EverGrandeCity_ChampionsRoom_Text_191305, MSGBOX_DEFAULT
	goto EverGrandeCity_ChampionsRoom_EventScript_15B8F0
	end

EverGrandeCity_ChampionsRoom_EventScript_15B8F0:: @ 815B8F0
	closemessage
	addobject 3
	applymovement 3, EverGrandeCity_ChampionsRoom_Movement_15BA03
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox EverGrandeCity_ChampionsRoom_Text_19134D, MSGBOX_DEFAULT
	call EverGrandeCity_ChampionsRoom_EventScript_1A03B0
	msgbox EverGrandeCity_ChampionsRoom_Text_1914C6, MSGBOX_DEFAULT
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox EverGrandeCity_ChampionsRoom_Text_191512, MSGBOX_DEFAULT
	closemessage
	delay 30
	applymovement 1, EverGrandeCity_ChampionsRoom_Movement_15B9FB
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_ChampionsRoom_Movement_15B9DD
	applymovement 3, Common_Movement_WalkInPlaceFastestUp
	applymovement 2, EverGrandeCity_ChampionsRoom_Movement_15B9F8
	waitmovement 0
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox EverGrandeCity_ChampionsRoom_Text_191546, MSGBOX_DEFAULT
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_15B9AB
	compare VAR_RESULT, 1
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_15B9B4
	closemessage
	applymovement 1, EverGrandeCity_ChampionsRoom_Movement_15B9FF
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_ChampionsRoom_Movement_15B9E0
	waitmovement 0
	setflag FLAG_HIDE_PETALBURG_GYM_GUIDE
	warp MAP_EVER_GRANDE_CITY_HALL_OF_FAME, 255, 7, 16
	waitstate
	releaseall
	end

EverGrandeCity_ChampionsRoom_EventScript_15B9AB:: @ 815B9AB
	msgbox EverGrandeCity_ChampionsRoom_Text_1915D7, MSGBOX_DEFAULT
	return

EverGrandeCity_ChampionsRoom_EventScript_15B9B4:: @ 815B9B4
	msgbox EverGrandeCity_ChampionsRoom_Text_191675, MSGBOX_DEFAULT
	return

EverGrandeCity_ChampionsRoom_EventScript_15B9BD:: @ 815B9BD
	applymovement 2, EverGrandeCity_ChampionsRoom_Movement_15B9E6
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EverGrandeCity_ChampionsRoom_EventScript_15B9D2:: @ 815B9D2
	applymovement 2, EverGrandeCity_ChampionsRoom_Movement_15B9EF
	waitmovement 0
	return

EverGrandeCity_ChampionsRoom_Movement_15B9DD:: @ 815B9DD
	walk_up
	walk_up
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9E0:: @ 815B9E0
	walk_up
	delay_16
	walk_up
	delay_8
	set_invisible
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9E6:: @ 815B9E6
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_up
	walk_in_place_fastest_right
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9EF:: @ 815B9EF
	walk_in_place_fastest_up
	delay_16
	walk_in_place_fastest_right
	delay_16
	walk_in_place_fastest_up
	delay_8
	walk_in_place_fastest_right
	delay_16
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9F8:: @ 815B9F8
	walk_right
	walk_up
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9FB:: @ 815B9FB
	walk_up
	walk_up
	walk_in_place_fastest_down
	step_end

EverGrandeCity_ChampionsRoom_Movement_15B9FF:: @ 815B9FF
	walk_up
	delay_8
	set_invisible
	step_end

EverGrandeCity_ChampionsRoom_Movement_15BA03:: @ 815BA03
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_right
	walk_up
	walk_in_place_fastest_left
	step_end
