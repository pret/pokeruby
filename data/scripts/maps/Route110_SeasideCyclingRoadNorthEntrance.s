Route110_SeasideCyclingRoadNorthEntrance_MapScripts:: @ 81634C8
	map_script 3, Route110_SeasideCyclingRoadNorthEntrance_MapScript1_1634CE
	.byte 0

Route110_SeasideCyclingRoadNorthEntrance_MapScript1_1634CE:: @ 81634CE
	compare 0x40a9, 3
	callif 1, Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634E5
	compare 0x40a9, 2
	callif 1, Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634E5
	end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634E5:: @ 81634E5
	setvar 0x40a9, 1
	return

Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634EB:: @ 81634EB
	lock
	faceplayer
	msgbox Route110_SeasideCyclingRoadNorthEntrance_Text_19E406, 4
	release
	end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634F7:: @ 81634F7
@ Coord event directly in front of the gatesman heading left to right
	lockall
	specialval RESULT, 227 @ player state?
	compare RESULT, 2
	callif 1, Route110_SeasideCyclingRoadNorthEntrance_EventScript_16351D
	compare RESULT, 0
	jumpif EQUAL, Route110_SeasideCyclingRoadNorthEntrance_EventScript_163523
	setflag 2091
	setvar 0x4001, 1
	releaseall
	end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_16351D:: @ 816351D
@ You're on the Mach Bike!
	setvar 0x40a9, 1
	return

Route110_SeasideCyclingRoadNorthEntrance_EventScript_163523:: @ 8163523
@ You don't have a bike!
	msgbox Route110_SeasideCyclingRoadNorthEntrance_Text_19E3AD, 4
	closebutton
	move 255, Route110_SeasideCyclingRoadNorthEntrance_Movement_163538
	waitmove 0
	releaseall
	end

Route110_SeasideCyclingRoadNorthEntrance_Movement_163538:: @ 8163538
	step_left
	step_end

Route110_SeasideCyclingRoadNorthEntrance_EventScript_16353A:: @ 816353A
@ Coord event directly in front of the gatesman heading right to left
	lockall
	setvar 0x40a9, 0
	clearflag 2091
	setvar 0x4001, 0
	releaseall
	end
