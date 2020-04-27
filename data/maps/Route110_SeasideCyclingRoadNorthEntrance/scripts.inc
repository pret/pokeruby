Route110_SeasideCyclingRoadNorthEntrance_MapScripts:: @ 81634C8
	map_script MAP_SCRIPT_ON_TRANSITION, Route110_SeasideCyclingRoadNorthEntrance_MapScript1_1634CE
	.byte 0

Route110_SeasideCyclingRoadNorthEntrance_MapScript1_1634CE:: @ 81634CE
	compare VAR_CYCLING_CHALLENGE_STATE, 3
	call_if_eq Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634E5
	compare VAR_CYCLING_CHALLENGE_STATE, 2
	call_if_eq Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634E5
	end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634E5:: @ 81634E5
	setvar VAR_CYCLING_CHALLENGE_STATE, 1
	return

Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634EB:: @ 81634EB
	lock
	faceplayer
	msgbox Route110_SeasideCyclingRoadNorthEntrance_Text_19E406, MSGBOX_DEFAULT
	release
	end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634F7:: @ 81634F7
@ Coord event directly in front of the gatesman heading left to right
	lockall
	specialvar VAR_RESULT, GetPlayerAvatarBike @ player state?
	compare VAR_RESULT, 2
	call_if_eq Route110_SeasideCyclingRoadNorthEntrance_EventScript_16351D
	compare VAR_RESULT, 0
	goto_if_eq Route110_SeasideCyclingRoadNorthEntrance_EventScript_163523
	setflag FLAG_SYS_CYCLING_ROAD
	setvar VAR_TEMP_1, 1
	releaseall
	end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_16351D:: @ 816351D
@ You're on the Mach Bike!
	setvar VAR_CYCLING_CHALLENGE_STATE, 1
	return

Route110_SeasideCyclingRoadNorthEntrance_EventScript_163523:: @ 8163523
@ You don't have a bike!
	msgbox Route110_SeasideCyclingRoadNorthEntrance_Text_19E3AD, MSGBOX_DEFAULT
	closemessage
	applymovement 255, Route110_SeasideCyclingRoadNorthEntrance_Movement_163538
	waitmovement 0
	releaseall
	end

Route110_SeasideCyclingRoadNorthEntrance_Movement_163538:: @ 8163538
	walk_left
	step_end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_16353A:: @ 816353A
@ Coord event directly in front of the gatesman heading right to left
	lockall
	setvar VAR_CYCLING_CHALLENGE_STATE, 0
	clearflag FLAG_SYS_CYCLING_ROAD
	setvar VAR_TEMP_1, 0
	releaseall
	end
