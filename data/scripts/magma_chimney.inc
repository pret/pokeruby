MtChimney_EventScript_1B2C95:: @ 81B2C95
	lock
	faceplayer
	call_if_unset FLAG_EVIL_LEADER_PLEASE_STOP, MtChimney_EventScript_1B2CB9
	call_if_set FLAG_EVIL_LEADER_PLEASE_STOP, MtChimney_EventScript_1B2CC2
	closemessage
	applymovement 1, MtChimney_Movement_1A083D
	waitmovement 0
	setflag FLAG_EVIL_LEADER_PLEASE_STOP
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
	applymovement 2, MtChimney_Movement_1A0839
	waitmovement 0
	playse SE_PIN
	applymovement 2, MtChimney_Movement_1A0833
	waitmovement 0
	applymovement 2, MtChimney_Movement_1A0835
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B2ED9, 4
	.else
	msgbox MtChimney_Text_1B38B3, 4
	.endif
	.ifdef SAPPHIRE
	trainerbattle 3, TRAINER_MT_CHIMNEY_GRUNT_3, 0, MtChimney_Text_1B3099
	.else
	trainerbattle 3, TRAINER_MT_CHIMNEY_GRUNT_3, 0, MtChimney_Text_1B3A68
	.endif
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B30C2, 4
	.else
	msgbox MtChimney_Text_1B3A90, 4
	.endif
	closemessage
	delay 30
	fadescreen 1
	removeobject 2
	removeobject 3
	removeobject 22
	setflag FLAG_HIDE_EVIL_TEAM_MT_CHIMNEY
	fadescreen 0
	setobjectxyperm 1, 10, 12
	addobject 1
	compare FACING, 4
	call_if_eq MtChimney_EventScript_1B2D7D
	compare FACING, 2
	call_if_eq MtChimney_EventScript_1B2D88
	applymovement 255, MtChimney_Movement_1A083F
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3608, 4
	.else
	msgbox MtChimney_Text_1B3FFE, 4
	.endif
	closemessage
	compare FACING, 4
	call_if_eq MtChimney_EventScript_1B2D93
	compare FACING, 2
	call_if_eq MtChimney_EventScript_1B2D9E
	removeobject 1
	setflag FLAG_HIDE_OTEHR_TEAM_MT_CHIMNEY
	setflag FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY
	clearflag FLAG_HIDE_PROF_COSMO_FALLARBOR
	setflag FLAG_HIDE_PROF_COSMO_METEOR_FALLS
	releaseall
	end

MtChimney_EventScript_1B2D7D:: @ 81B2D7D
	applymovement 1, MtChimney_Movement_15D025
	waitmovement 0
	return

MtChimney_EventScript_1B2D88:: @ 81B2D88
	applymovement 1, MtChimney_Movement_15D036
	waitmovement 0
	return

MtChimney_EventScript_1B2D93:: @ 81B2D93
	applymovement 1, MtChimney_Movement_15D02D
	waitmovement 0
	return

MtChimney_EventScript_1B2D9E:: @ 81B2D9E
	applymovement 1, MtChimney_Movement_15D03E
	waitmovement 0
	return
