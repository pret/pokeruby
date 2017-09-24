MeteorFalls_1F_1R_MapScripts:: @ 815C490
	map_script 3, MeteorFalls_1F_1R_MapScript1_15C496
	.byte 0

MeteorFalls_1F_1R_MapScript1_15C496:: @ 815C496
	call MeteorFalls_1F_1R_EventScript_1A0196
	end

MeteorFalls_1F_1R_EventScript_15C49C:: @ 815C49C
	lockall
	move 255, MeteorFalls_1F_1R_Movement_1A0845
	waitmove 0
	pause 30
	move 5, MeteorFalls_1F_1R_Movement_1A0845
	waitmove 0
	msgbox MeteorFalls_1F_1R_Text_193237, 4
	closebutton
	move 5, MeteorFalls_1F_1R_Movement_1A0841
	move 6, MeteorFalls_1F_1R_Movement_1A0841
	waitmove 0
	playsfx 21
	move 5, MeteorFalls_1F_1R_Movement_1A0833
	waitmove 0
	move 5, MeteorFalls_1F_1R_Movement_1A0835
	waitmove 0
	msgbox MeteorFalls_1F_1R_Text_193268, 4
	closebutton
	move 5, MeteorFalls_1F_1R_Movement_15C5EE
	waitmove 0
	msgbox MeteorFalls_1F_1R_Text_1932C5, 4
	closebutton
	move 255, MeteorFalls_1F_1R_Movement_1A083F
	move 5, MeteorFalls_1F_1R_Movement_1A083F
	move 6, MeteorFalls_1F_1R_Movement_1A083F
	waitmove 0
	reappear 7
	reappear 8
	reappear 9
	move 7, MeteorFalls_1F_1R_Movement_15C608
	move 8, MeteorFalls_1F_1R_Movement_15C60F
	move 9, MeteorFalls_1F_1R_Movement_15C617
	waitmove 0
	move 5, MeteorFalls_1F_1R_Movement_1A083F
	move 6, MeteorFalls_1F_1R_Movement_1A083F
	waitmove 0
	msgbox MeteorFalls_1F_1R_Text_193320, 4
	closebutton
	move 255, MeteorFalls_1F_1R_Movement_15C64F
	move 5, MeteorFalls_1F_1R_Movement_15C5F1
	move 6, MeteorFalls_1F_1R_Movement_15C5FC
	waitmove 0
	disappear 5
	disappear 6
	move 7, MeteorFalls_1F_1R_Movement_15C628
	waitmove 0
	.ifdef SAPPHIRE
	msgbox MeteorFalls_1F_1R_Text_1933EC, 4
	.else
	msgbox MeteorFalls_1F_1R_Text_193584, 4
	.endif
	closebutton
	move 8, MeteorFalls_1F_1R_Movement_15C639
	move 9, MeteorFalls_1F_1R_Movement_15C64A
	waitmove 0
	msgbox MeteorFalls_1F_1R_Text_193720, 4
	move 7, MeteorFalls_1F_1R_Movement_1A0845
	waitmove 0
	msgbox MeteorFalls_1F_1R_Text_193747, 4
	move 7, MeteorFalls_1F_1R_Movement_1A083F
	waitmove 0
	msgbox MeteorFalls_1F_1R_Text_1937AA, 4
	closebutton
	move 7, MeteorFalls_1F_1R_Movement_15C61F
	move 8, MeteorFalls_1F_1R_Movement_15C62E
	move 9, MeteorFalls_1F_1R_Movement_15C63E
	waitmove 0
	disappear 7
	disappear 8
	disappear 9
	setflag 819
	setvar 0x40bf, 1
	releaseall
	end

MeteorFalls_1F_1R_Movement_15C5EE:: @ 815C5EE
	step_right
	step_right
	step_end

MeteorFalls_1F_1R_Movement_15C5F1:: @ 815C5F1
	step_16
	step_16
	step_18
	step_18
	step_18
	step_18
	step_18
	step_18
	step_18
	step_18
	step_end

MeteorFalls_1F_1R_Movement_15C5FC:: @ 815C5FC
	step_16
	step_16
	step_16
	step_18
	step_18
	step_18
	step_18
	step_18
	step_18
	step_18
	step_18
	step_end

MeteorFalls_1F_1R_Movement_15C608:: @ 815C608
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MeteorFalls_1F_1R_Movement_15C60F:: @ 815C60F
	step_14
	step_14
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MeteorFalls_1F_1R_Movement_15C617:: @ 815C617
	step_14
	step_14
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MeteorFalls_1F_1R_Movement_15C61F:: @ 815C61F
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MeteorFalls_1F_1R_Movement_15C628:: @ 815C628
	step_right
	step_right
	step_up
	step_up
	step_27
	step_end

MeteorFalls_1F_1R_Movement_15C62E:: @ 815C62E
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MeteorFalls_1F_1R_Movement_15C639:: @ 815C639
	step_right
	step_right
	step_right
	step_26
	step_end

MeteorFalls_1F_1R_Movement_15C63E:: @ 815C63E
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MeteorFalls_1F_1R_Movement_15C64A:: @ 815C64A
	step_right
	step_right
	step_right
	step_26
	step_end

MeteorFalls_1F_1R_Movement_15C64F:: @ 815C64F
	step_25
	step_12
	step_28
	step_40
	step_left
	step_41
	step_end

MeteorFalls_1F_1R_EventScript_15C656:: @ 815C656
	lock
	faceplayer
	checkflag 244
	goto_if_eq MeteorFalls_1F_1R_EventScript_15C66E
	setflag 244
	msgbox MeteorFalls_1F_1R_Text_1937EB, 4
	release
	end

MeteorFalls_1F_1R_EventScript_15C66E:: @ 815C66E
	msgbox MeteorFalls_1F_1R_Text_19396A, 4
	release
	end
