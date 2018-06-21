Route112_CableCarStation_MapScripts:: @ 815C033
	map_script 3, Route112_CableCarStation_MapScript1_15C03E
	map_script 2, Route112_CableCarStation_MapScript2_15C05E
	.byte 0

Route112_CableCarStation_MapScript1_15C03E:: @ 815C03E
	setescapewarp MAP_ROUTE112, 255, 28, 28
	compare VAR_CABLE_CAR_STATION_STATE, 2
	call_if_eq Route112_CableCarStation_EventScript_15C052
	end

Route112_CableCarStation_EventScript_15C052:: @ 815C052
	setobjectxyperm 1, 7, 4
	setobjectmovementtype 1, 9
	return

Route112_CableCarStation_MapScript2_15C05E:: @ 815C05E
	map_script_2 VAR_CABLE_CAR_STATION_STATE, 2, Route112_CableCarStation_EventScript_15C068
	.2byte 0

Route112_CableCarStation_EventScript_15C068:: @ 815C068
	lockall
	applymovement 255, Route112_CableCarStation_Movement_15C0F5
	applymovement 1, Route112_CableCarStation_Movement_15C0EB
	waitmovement 0
	setvar VAR_CABLE_CAR_STATION_STATE, 0
	setobjectxyperm 1, 6, 7
	setobjectmovementtype 1, 8
	releaseall
	end

Route112_CableCarStation_EventScript_15C08C:: @ 815C08C
	lock
	faceplayer
	msgbox Route112_CableCarStation_Text_1924F5, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq Route112_CableCarStation_EventScript_15C0AD
	compare RESULT, NO
	goto_if_eq Route112_CableCarStation_EventScript_15C0DC
	end

Route112_CableCarStation_EventScript_15C0AD:: @ 815C0AD
	msgbox Route112_CableCarStation_Text_1925A9, 4
	closemessage
	applymovement 1, Route112_CableCarStation_Movement_15C0E6
	applymovement 255, Route112_CableCarStation_Movement_15C0F0
	waitmovement 0
	setvar VAR_SPECIAL_4, 0
	setvar VAR_CABLE_CAR_STATION_STATE, 1
	incrementgamestat GAME_STAT_RODE_CABLE_CAR
	special CableCarWarp
	special CableCar
	waitstate
	release
	end

Route112_CableCarStation_EventScript_15C0DC:: @ 815C0DC
	msgbox Route112_CableCarStation_Text_192548, 4
	release
	end

Route112_CableCarStation_Movement_15C0E6:: @ 815C0E6
	walk_up
	walk_up
	walk_right
	walk_in_place_fastest_left
	end_movement

Route112_CableCarStation_Movement_15C0EB:: @ 815C0EB
	delay_16
	walk_left
	walk_down
	walk_down
	end_movement

Route112_CableCarStation_Movement_15C0F0:: @ 815C0F0
	walk_up
	walk_up
	walk_up
	delay_16
	end_movement

Route112_CableCarStation_Movement_15C0F5:: @ 815C0F5
	walk_down
	walk_down
	walk_down
	delay_16
	end_movement
