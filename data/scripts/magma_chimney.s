MtChimney_EventScript_1B2C95:: @ 81B2C95
	lock
	faceplayer
	checkflag 219
	callif FLAG_NOT_SET, MtChimney_EventScript_1B2CB9
	checkflag 219
	callif FLAG_IS_SET, MtChimney_EventScript_1B2CC2
	closebutton
	move 1, MtChimney_Movement_1A083D
	waitmove 0
	setflag 219
	release
	end

MtChimney_EventScript_1B2CB9:: @ 81B2CB9
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B350B, 4
	.else
	msgbox MtChimney_Text_1B3EC1, 4
	.endif
	return

MtChimney_EventScript_1B2CC2:: @ 81B2CC2
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3598, 4
	.else
	msgbox MtChimney_Text_1B3F8C, 4
	.endif
	return

MtChimney_EventScript_1B2CCB:: @ 81B2CCB
	lockall
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B2DEE, 4
	.else
	msgbox MtChimney_Text_1B37BB, 4
	.endif
	move 2, MtChimney_Movement_1A0839
	waitmove 0
	playsfx 21
	move 2, MtChimney_Movement_1A0833
	waitmove 0
	move 2, MtChimney_Movement_1A0835
	waitmove 0
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B2ED9, 4
	.else
	msgbox MtChimney_Text_1B38B3, 4
	.endif
	.ifdef SAPPHIRE
	trainerbattle 3, OPPONENT_MT_CHIMNEY_GRUNT_3, 0, MtChimney_Text_1B3099
	.else
	trainerbattle 3, OPPONENT_MT_CHIMNEY_GRUNT_3, 0, MtChimney_Text_1B3A68
	.endif
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B30C2, 4
	.else
	msgbox MtChimney_Text_1B3A90, 4
	.endif
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
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3608, 4
	.else
	msgbox MtChimney_Text_1B3FFE, 4
	.endif
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
