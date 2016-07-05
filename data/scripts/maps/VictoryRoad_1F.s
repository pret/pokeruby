VictoryRoad_1F_MapScripts:: @ 815DE83
	map_script 3, VictoryRoad_1F_MapScript1_15DE89
	.byte 0

VictoryRoad_1F_MapScript1_15DE89:: @ 815DE89
	checkflag 126
	callif 1, VictoryRoad_1F_EventScript_15DE93
	end

VictoryRoad_1F_EventScript_15DE93:: @ 815DE93
	setflag 858
	return

VictoryRoad_1F_EventScript_15DE97:: @ 815DE97
	lockall
	reappear 4
	move 4, VictoryRoad_1F_Movement_15DF07
	waitmove 0
	jump VictoryRoad_1F_EventScript_15DED3
	end

VictoryRoad_1F_EventScript_15DEAB:: @ 815DEAB
	lockall
	reappear 4
	move 4, VictoryRoad_1F_Movement_15DF13
	waitmove 0
	jump VictoryRoad_1F_EventScript_15DED3
	end

VictoryRoad_1F_EventScript_15DEBF:: @ 815DEBF
	lockall
	reappear 4
	move 4, VictoryRoad_1F_Movement_15DF1E
	waitmove 0
	jump VictoryRoad_1F_EventScript_15DED3
	end

VictoryRoad_1F_EventScript_15DED3:: @ 815DED3
	move 255, VictoryRoad_1F_Movement_1A083F
	waitmove 0
	msgbox VictoryRoad_1F_Text_19782B, 4
	trainerbattle 3, 519, 0, VictoryRoad_1F_Text_197943
	msgbox VictoryRoad_1F_Text_197967, 4
	clearflag 858
	moveoffscreen 4
	setflag 126
	setvar 0x40c3, 1
	releaseall
	end

VictoryRoad_1F_Movement_15DF07:: @ 815DF07
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

VictoryRoad_1F_Movement_15DF13:: @ 815DF13
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

VictoryRoad_1F_Movement_15DF1E:: @ 815DF1E
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

VictoryRoad_1F_EventScript_15DF28:: @ 815DF28
	msgbox VictoryRoad_1F_Text_197967, 2
	end

VictoryRoad_1F_EventScript_15DF31:: @ 815DF31
	trainerbattle 0, 657, 0, VictoryRoad_1F_Text_1979BA, VictoryRoad_1F_Text_197A23
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq VictoryRoad_1F_EventScript_15DF58
	msgbox VictoryRoad_1F_Text_197A47, 6
	end

VictoryRoad_1F_EventScript_15DF58:: @ 815DF58
	trainerbattle 5, 657, 0, VictoryRoad_1F_Text_1979BA, VictoryRoad_1F_Text_197A23
	msgbox VictoryRoad_1F_Text_197A47, 6
	end

VictoryRoad_1F_EventScript_15DF6F:: @ 815DF6F
	trainerbattle 0, 79, 0, VictoryRoad_1F_Text_197AD1, VictoryRoad_1F_Text_197B1A
	msgbox VictoryRoad_1F_Text_197B36, 6
	end

VictoryRoad_1F_EventScript_15DF86:: @ 815DF86
	trainerbattle 0, 80, 0, VictoryRoad_1F_Text_197B99, VictoryRoad_1F_Text_197BE1
	msgbox VictoryRoad_1F_Text_197BF7, 6
	end

VictoryRoad_1F_EventScript_15DF9D:: @ 815DF9D
	trainerbattle 0, 96, 0, VictoryRoad_1F_Text_197C45, VictoryRoad_1F_Text_197C8D
	msgbox VictoryRoad_1F_Text_197CAF, 6
	end
