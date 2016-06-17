Route110_SeasideCyclingRoadSouthEntrance_MapScripts:: @ 816347E
	.byte 0

Route110_SeasideCyclingRoadSouthEntrance_EventScript_16347F:: @ 816347F
	lock
	faceplayer
	msgbox Route110_SeasideCyclingRoadSouthEntrance_Text_19E326, 4
	release
	end

Route110_SeasideCyclingRoadSouthEntrance_EventScript_16348B:: @ 816348B
	lockall
	specialval RESULT, 227
	compare RESULT, 0
	jumpeq Route110_SeasideCyclingRoadSouthEntrance_EventScript_1634A6
	setflag 2091
	setvar 0x4001, 1
	releaseall
	end

Route110_SeasideCyclingRoadSouthEntrance_EventScript_1634A6:: @ 81634A6
	msgbox Route110_SeasideCyclingRoadSouthEntrance_Text_19E3AD, 4
	closebutton
	move 255, Route110_SeasideCyclingRoadSouthEntrance_Movement_1634BB
	waitmove 0
	releaseall
	end

Route110_SeasideCyclingRoadSouthEntrance_Movement_1634BB:: @ 81634BB
	step_left
	step_end

Route110_SeasideCyclingRoadSouthEntrance_EventScript_1634BD:: @ 81634BD
	lockall
	clearflag 2091
	setvar 0x4001, 0
	releaseall
	end

