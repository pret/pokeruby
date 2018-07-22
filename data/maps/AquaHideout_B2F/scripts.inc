AquaHideout_B2F_MapScripts:: @ 815D8B1
	map_script 3, AquaHideout_B2F_MapScript1_15D8B7
	.byte 0

AquaHideout_B2F_MapScript1_15D8B7:: @ 815D8B7
	call AquaHideout_B2F_EventScript_1A0196
	end

AquaHideout_B2F_EventScript_15D8BD:: @ 815D8BD
MagmaHideout_B2F_EventScript_15D8BD:: @ 815D8BD
	lockall
	setvar VAR_SPECIAL_8, 1
	playse SE_PIN
	applymovement VAR_SPECIAL_8, AquaHideout_B2F_Movement_1A0833
	waitmovement 0
	.ifdef SAPPHIRE
	applymovement VAR_SPECIAL_8, AquaHideout_B2F_Movement_1A0839
	.else
	applymovement VAR_SPECIAL_8, AquaHideout_B2F_Movement_1A0841
	.endif
	waitmovement 0
	setvar VAR_TEMP_1, 1
	releaseall
	end

AquaHideout_B2F_EventScript_15D8E1:: @ 815D8E1
MagmaHideout_B2F_EventScript_15D8E1:: @ 815D8E1
	trainerbattle 2, TRAINER_HIDEOUT_B2F_GRUNT_1, 0, AquaHideout_B2F_Text_197093, AquaHideout_B2F_Text_197145, AquaHideout_B2F_EventScript_15D8FD
	msgbox AquaHideout_B2F_Text_1971AE, 4
	release
	end

AquaHideout_B2F_EventScript_15D8FD:: @ 815D8FD
	setvar VAR_SPECIAL_8, 1
	.ifdef SAPPHIRE
	setvar VAR_SPECIAL_9, 4
	.else
	setvar VAR_SPECIAL_9, 3
	.endif
	.ifdef SAPPHIRE
	applymovement VAR_SPECIAL_8, Movement_1A083F
	.else
	applymovement VAR_SPECIAL_8, AquaHideout_B2F_Movement_1A0843
	.endif
	waitmovement 0
	delay 20
	applymovement VAR_SPECIAL_8, AquaHideout_B2F_Movement_1A0839
	waitmovement 0
	msgbox AquaHideout_B2F_Text_197162, 4
	closemessage
	.ifdef SAPPHIRE
	applymovement VAR_SPECIAL_8, Movement_1A083F
	.else
	applymovement VAR_SPECIAL_8, AquaHideout_B2F_Movement_1A0843
	.endif
	.ifdef SAPPHIRE
	applymovement VAR_SPECIAL_9, AquaHideout_B2F_Movement_15D958
	.else
	applymovement VAR_SPECIAL_9, AquaHideout_B2F_Movement_15D95D
	.endif
	waitmovement 0
	removeobject VAR_SPECIAL_9
	delay 20
	applymovement VAR_SPECIAL_8, AquaHideout_B2F_Movement_1A0839
	waitmovement 0
	msgbox AquaHideout_B2F_Text_1971AE, 4
	setflag FLAG_EVIL_TEAM_ESCAPED_IN_SUBMARINE
	setflag FLAG_HIDE_GRUNTS_LILYCOVE
	release
	end

AquaHideout_B2F_Movement_15D958:: @ 815D958
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

AquaHideout_B2F_Movement_15D95D:: @ 815D95D
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

AquaHideout_B2F_EventScript_15D962:: @ 815D962
MagmaHideout_B2F_EventScript_15D962:: @ 815D962
	trainerbattle 2, TRAINER_HIDEOUT_B2F_GRUNT_2, 0, AquaHideout_B2F_Text_197270, AquaHideout_B2F_Text_1972AC, AquaHideout_B2F_EventScript_15D97D
	msgbox AquaHideout_B2F_Text_1972D2, 6
	end

AquaHideout_B2F_EventScript_15D97D:: @ 815D97D
	msgbox AquaHideout_B2F_Text_1972D2, 4
	release
	end

AquaHideout_B2F_EventScript_15D987:: @ 815D987
MagmaHideout_B2F_EventScript_15D987:: @ 815D987
	trainerbattle 0, TRAINER_HIDEOUT_B2F_GRUNT_3, 0, AquaHideout_B2F_Text_1972EF, AquaHideout_B2F_Text_197390
	msgbox AquaHideout_B2F_Text_1973C0, 6
	end
