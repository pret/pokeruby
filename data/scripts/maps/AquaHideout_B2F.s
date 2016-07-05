AquaHideout_B2F_MapScripts:: @ 815D8B1
	map_script 3, AquaHideout_B2F_MapScript1_15D8B7
	.byte 0

AquaHideout_B2F_MapScript1_15D8B7:: @ 815D8B7
	call AquaHideout_B2F_EventScript_1A0196
	end

AquaHideout_B2F_EventScript_15D8BD:: @ 815D8BD
MagmaHideout_B2F_EventScript_15D8BD:: @ 815D8BD
	lockall
	setvar 0x8008, 1
	playsfx 21
	move 0x8008, AquaHideout_B2F_Movement_1A0833
	waitmove 0
	.ifdef SAPPHIRE
	move 0x8008, AquaHideout_B2F_Movement_1A0839
	.else
	move 0x8008, AquaHideout_B2F_Movement_1A0841
	.endif
	waitmove 0
	setvar 0x4001, 1
	releaseall
	end

AquaHideout_B2F_EventScript_15D8E1:: @ 815D8E1
MagmaHideout_B2F_EventScript_15D8E1:: @ 815D8E1
	trainerbattle 2, TRAINER_HIDEOUT_B2F_GRUNT_1, 0, AquaHideout_B2F_Text_197093, AquaHideout_B2F_Text_197145, AquaHideout_B2F_EventScript_15D8FD
	msgbox AquaHideout_B2F_Text_1971AE, 4
	release
	end

AquaHideout_B2F_EventScript_15D8FD:: @ 815D8FD
	setvar 0x8008, 1
	.ifdef SAPPHIRE
	setvar 0x8009, 4
	.else
	setvar 0x8009, 3
	.endif
	.ifdef SAPPHIRE
	move 0x8008, Movement_1A083F
	.else
	move 0x8008, AquaHideout_B2F_Movement_1A0843
	.endif
	waitmove 0
	pause 20
	move 0x8008, AquaHideout_B2F_Movement_1A0839
	waitmove 0
	msgbox AquaHideout_B2F_Text_197162, 4
	closebutton
	.ifdef SAPPHIRE
	move 0x8008, Movement_1A083F
	.else
	move 0x8008, AquaHideout_B2F_Movement_1A0843
	.endif
	.ifdef SAPPHIRE
	move 0x8009, AquaHideout_B2F_Movement_15D958
	.else
	move 0x8009, AquaHideout_B2F_Movement_15D95D
	.endif
	waitmove 0
	disappear 0x8009
	pause 20
	move 0x8008, AquaHideout_B2F_Movement_1A0839
	waitmove 0
	msgbox AquaHideout_B2F_Text_1971AE, 4
	setflag 112
	setflag 852
	release
	end

AquaHideout_B2F_Movement_15D958:: @ 815D958
	step_left
	step_left
	step_left
	step_left
	step_end

AquaHideout_B2F_Movement_15D95D:: @ 815D95D
	step_right
	step_right
	step_right
	step_right
	step_end

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

