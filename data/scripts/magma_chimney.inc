MtChimney_EventScript_1B2C95:: @ 81B2C95
	lock
	faceplayer
	call_if_unset FLAG_EVIL_LEADER_PLEASE_STOP, MtChimney_EventScript_1B2CB9
	call_if_set FLAG_EVIL_LEADER_PLEASE_STOP, MtChimney_EventScript_1B2CC2
	closemessage
	applymovement 1, Common_Movement_FaceOriginalDirection
	waitmovement 0
	setflag FLAG_EVIL_LEADER_PLEASE_STOP
	release
	end

MtChimney_EventScript_1B2CB9:: @ 81B2CB9
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B350B, MSGBOX_DEFAULT
	.else
	msgbox MtChimney_Text_1B3EC1, MSGBOX_DEFAULT
	.endif
	return

MtChimney_EventScript_1B2CC2:: @ 81B2CC2
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3598, MSGBOX_DEFAULT
	.else
	msgbox MtChimney_Text_1B3F8C, MSGBOX_DEFAULT
	.endif
	return

MtChimney_EventScript_1B2CCB:: @ 81B2CCB
	lockall
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B2DEE, MSGBOX_DEFAULT
	.else
	msgbox MtChimney_Text_1B37BB, MSGBOX_DEFAULT
	.endif
	applymovement 2, Common_Movement_FacePlayer
	waitmovement 0
	playse SE_PIN
	applymovement 2, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 2, Common_Movement_Delay48
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B2ED9, MSGBOX_DEFAULT
	.else
	msgbox MtChimney_Text_1B38B3, MSGBOX_DEFAULT
	.endif
	.ifdef SAPPHIRE
	trainerbattle_no_intro TRAINER_MT_CHIMNEY_GRUNT_3, MtChimney_Text_1B3099
	.else
	trainerbattle_no_intro TRAINER_MT_CHIMNEY_GRUNT_3, MtChimney_Text_1B3A68
	.endif
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B30C2, MSGBOX_DEFAULT
	.else
	msgbox MtChimney_Text_1B3A90, MSGBOX_DEFAULT
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
	compare VAR_FACING, 4
	call_if_eq MtChimney_EventScript_1B2D7D
	compare VAR_FACING, 2
	call_if_eq MtChimney_EventScript_1B2D88
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3608, MSGBOX_DEFAULT
	.else
	msgbox MtChimney_Text_1B3FFE, MSGBOX_DEFAULT
	.endif
	closemessage
	compare VAR_FACING, 4
	call_if_eq MtChimney_EventScript_1B2D93
	compare VAR_FACING, 2
	call_if_eq MtChimney_EventScript_1B2D9E
	removeobject 1
	setflag FLAG_HIDE_OTHER_TEAM_MT_CHIMNEY
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
