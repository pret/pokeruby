VictoryRoad_1F_MapScripts:: @ 815DE83
	map_script 3, VictoryRoad_1F_MapScript1_15DE89
	.byte 0

VictoryRoad_1F_MapScript1_15DE89:: @ 815DE89
	checkflag 126
	call_if 1, VictoryRoad_1F_EventScript_15DE93
	end

VictoryRoad_1F_EventScript_15DE93:: @ 815DE93
	setflag 858
	return

VictoryRoad_1F_EventScript_15DE97:: @ 815DE97
	lockall
	addobject 4
	applymovement 4, VictoryRoad_1F_Movement_15DF07
	waitmovement 0
	goto VictoryRoad_1F_EventScript_15DED3
	end

VictoryRoad_1F_EventScript_15DEAB:: @ 815DEAB
	lockall
	addobject 4
	applymovement 4, VictoryRoad_1F_Movement_15DF13
	waitmovement 0
	goto VictoryRoad_1F_EventScript_15DED3
	end

VictoryRoad_1F_EventScript_15DEBF:: @ 815DEBF
	lockall
	addobject 4
	applymovement 4, VictoryRoad_1F_Movement_15DF1E
	waitmovement 0
	goto VictoryRoad_1F_EventScript_15DED3
	end

VictoryRoad_1F_EventScript_15DED3:: @ 815DED3
	applymovement 255, VictoryRoad_1F_Movement_1A083F
	waitmovement 0
	msgbox VictoryRoad_1F_Text_19782B, 4
	trainerbattle 3, OPPONENT_WALLY_1, 0, VictoryRoad_1F_Text_197943
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
	trainerbattle 0, OPPONENT_WALLY_3, 0, VictoryRoad_1F_Text_1979BA, VictoryRoad_1F_Text_197A23
	specialvar RESULT, sub_8082C68
	compare RESULT, 1
	goto_if_eq VictoryRoad_1F_EventScript_15DF58
	msgbox VictoryRoad_1F_Text_197A47, 6
	end

VictoryRoad_1F_EventScript_15DF58:: @ 815DF58
	trainerbattle 5, OPPONENT_WALLY_3, 0, VictoryRoad_1F_Text_1979BA, VictoryRoad_1F_Text_197A23
	msgbox VictoryRoad_1F_Text_197A47, 6
	end

VictoryRoad_1F_EventScript_15DF6F:: @ 815DF6F
	trainerbattle 0, OPPONENT_EDGAR, 0, VictoryRoad_1F_Text_197AD1, VictoryRoad_1F_Text_197B1A
	msgbox VictoryRoad_1F_Text_197B36, 6
	end

VictoryRoad_1F_EventScript_15DF86:: @ 815DF86
	trainerbattle 0, OPPONENT_ALBERT, 0, VictoryRoad_1F_Text_197B99, VictoryRoad_1F_Text_197BE1
	msgbox VictoryRoad_1F_Text_197BF7, 6
	end

VictoryRoad_1F_EventScript_15DF9D:: @ 815DF9D
	trainerbattle 0, OPPONENT_HOPE, 0, VictoryRoad_1F_Text_197C45, VictoryRoad_1F_Text_197C8D
	msgbox VictoryRoad_1F_Text_197CAF, 6
	end
