MtChimney_EventScript_1B2C95:: @ 81B2C95
	lock
	faceplayer
	checkflag 219
	callif 0, MtChimney_EventScript_1B2CB9
	checkflag 219
	callif 1, MtChimney_EventScript_1B2CC2
	closebutton
	move 1, MtChimney_Movement_1A083D
	waitmove 0
	setflag 219
	release
	end

MtChimney_EventScript_1B2CB9:: @ 81B2CB9
	msgbox MtChimney_Text_1B3EC1, 4
	return

MtChimney_EventScript_1B2CC2:: @ 81B2CC2
	msgbox MtChimney_Text_1B3F8C, 4
	return

MtChimney_EventScript_1B2CCB:: @ 81B2CCB
	lockall
	msgbox MtChimney_Text_1B37BB, 4
	move 2, MtChimney_Movement_1A0839
	waitmove 0
	playsfx 21
	move 2, MtChimney_Movement_1A0833
	waitmove 0
	move 2, MtChimney_Movement_1A0835
	waitmove 0
	msgbox MtChimney_Text_1B38B3, 4
	trainerbattle 3, 602, 0, MtChimney_Text_1B3A68
	msgbox MtChimney_Text_1B3A90, 4
	closebutton
	pause 30
	fadescreen 1
	disappear 2
	disappear 3
	disappear 22
	setflag 926
	fadescreen 0
	movespriteperm 1, 10, 12
	reappear 1
	compare FACING, 4
	callif 1, MtChimney_EventScript_1B2D7D
	compare FACING, 2
	callif 1, MtChimney_EventScript_1B2D88
	move 255, MtChimney_Movement_1A083F
	waitmove 0
	msgbox MtChimney_Text_1B3FFE, 4
	closebutton
	compare FACING, 4
	callif 1, MtChimney_EventScript_1B2D93
	compare FACING, 2
	callif 1, MtChimney_EventScript_1B2D9E
	disappear 1
	setflag 927
	setflag 139
	clearflag 928
	setflag 942
	releaseall
	end

MtChimney_EventScript_1B2D7D:: @ 81B2D7D
	move 1, MtChimney_Movement_15D025
	waitmove 0
	return

MtChimney_EventScript_1B2D88:: @ 81B2D88
	move 1, MtChimney_Movement_15D036
	waitmove 0
	return

MtChimney_EventScript_1B2D93:: @ 81B2D93
	move 1, MtChimney_Movement_15D02D
	waitmove 0
	return

MtChimney_EventScript_1B2D9E:: @ 81B2D9E
	move 1, MtChimney_Movement_15D03E
	waitmove 0
	return
