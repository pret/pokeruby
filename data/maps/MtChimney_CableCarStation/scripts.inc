MtChimney_CableCarStation_MapScripts:: @ 815C0FA
	map_script MAP_SCRIPT_ON_TRANSITION, MtChimney_CableCarStation_MapScript1_15C105
	map_script MAP_SCRIPT_ON_FRAME_TABLE, MtChimney_CableCarStation_MapScript2_15C11D
	.byte 0

MtChimney_CableCarStation_MapScript1_15C105:: @ 815C105
	compare VAR_CABLE_CAR_STATION_STATE, 1
	call_if_eq MtChimney_CableCarStation_EventScript_15C111
	end

MtChimney_CableCarStation_EventScript_15C111:: @ 815C111
	setobjectxyperm 1, 5, 4
	setobjectmovementtype 1, 10
	return

MtChimney_CableCarStation_MapScript2_15C11D:: @ 815C11D
	map_script_2 VAR_CABLE_CAR_STATION_STATE, 1, MtChimney_CableCarStation_EventScript_15C127
	.2byte 0

MtChimney_CableCarStation_EventScript_15C127:: @ 815C127
	lockall
	applymovement LOCALID_PLAYER, MtChimney_CableCarStation_Movement_15C1B4
	applymovement 1, MtChimney_CableCarStation_Movement_15C1AA
	waitmovement 0
	setvar VAR_CABLE_CAR_STATION_STATE, 0
	setobjectxyperm 1, 6, 7
	setobjectmovementtype 1, 8
	releaseall
	end

MtChimney_CableCarStation_EventScript_15C14B:: @ 815C14B
	lock
	faceplayer
	msgbox MtChimney_CableCarStation_Text_19256A, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq MtChimney_CableCarStation_EventScript_15C16C
	compare VAR_RESULT, NO
	goto_if_eq MtChimney_CableCarStation_EventScript_15C19B
	end

MtChimney_CableCarStation_EventScript_15C16C:: @ 815C16C
	msgbox MtChimney_CableCarStation_Text_1925A9, MSGBOX_DEFAULT
	closemessage
	applymovement 1, MtChimney_CableCarStation_Movement_15C1A5
	applymovement LOCALID_PLAYER, MtChimney_CableCarStation_Movement_15C1AF
	waitmovement 0
	setvar VAR_0x8004, 1
	setvar VAR_CABLE_CAR_STATION_STATE, 2
	incrementgamestat GAME_STAT_RODE_CABLE_CAR
	special CableCarWarp
	special CableCar
	waitstate
	release
	end

MtChimney_CableCarStation_EventScript_15C19B:: @ 815C19B
	msgbox MtChimney_CableCarStation_Text_1925BF, MSGBOX_DEFAULT
	release
	end

MtChimney_CableCarStation_Movement_15C1A5:: @ 815C1A5
	walk_up
	walk_up
	walk_left
	walk_in_place_fastest_right
	step_end

MtChimney_CableCarStation_Movement_15C1AA:: @ 815C1AA
	delay_16
	walk_right
	walk_down
	walk_down
	step_end

MtChimney_CableCarStation_Movement_15C1AF:: @ 815C1AF
	walk_up
	walk_up
	walk_up
	delay_16
	step_end

MtChimney_CableCarStation_Movement_15C1B4:: @ 815C1B4
	walk_down
	walk_down
	walk_down
	delay_16
	step_end
