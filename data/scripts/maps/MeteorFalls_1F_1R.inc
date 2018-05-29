MeteorFalls_1F_1R_MapScripts:: @ 815C490
	map_script 3, MeteorFalls_1F_1R_MapScript1_15C496
	.byte 0

MeteorFalls_1F_1R_MapScript1_15C496:: @ 815C496
	call MeteorFalls_1F_1R_EventScript_1A0196
	end

MeteorFalls_1F_1R_EventScript_15C49C:: @ 815C49C
	lockall
	applymovement 255, MeteorFalls_1F_1R_Movement_1A0845
	waitmovement 0
	delay 30
	applymovement 5, MeteorFalls_1F_1R_Movement_1A0845
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193237, 4
	closemessage
	applymovement 5, MeteorFalls_1F_1R_Movement_1A0841
	applymovement 6, MeteorFalls_1F_1R_Movement_1A0841
	waitmovement 0
	playse SE_PIN
	applymovement 5, MeteorFalls_1F_1R_Movement_1A0833
	waitmovement 0
	applymovement 5, MeteorFalls_1F_1R_Movement_1A0835
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193268, 4
	closemessage
	applymovement 5, MeteorFalls_1F_1R_Movement_15C5EE
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_1932C5, 4
	closemessage
	applymovement 255, MeteorFalls_1F_1R_Movement_1A083F
	applymovement 5, MeteorFalls_1F_1R_Movement_1A083F
	applymovement 6, MeteorFalls_1F_1R_Movement_1A083F
	waitmovement 0
	addobject 7
	addobject 8
	addobject 9
	applymovement 7, MeteorFalls_1F_1R_Movement_15C608
	applymovement 8, MeteorFalls_1F_1R_Movement_15C60F
	applymovement 9, MeteorFalls_1F_1R_Movement_15C617
	waitmovement 0
	applymovement 5, MeteorFalls_1F_1R_Movement_1A083F
	applymovement 6, MeteorFalls_1F_1R_Movement_1A083F
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193320, 4
	closemessage
	applymovement 255, MeteorFalls_1F_1R_Movement_15C64F
	applymovement 5, MeteorFalls_1F_1R_Movement_15C5F1
	applymovement 6, MeteorFalls_1F_1R_Movement_15C5FC
	waitmovement 0
	removeobject 5
	removeobject 6
	applymovement 7, MeteorFalls_1F_1R_Movement_15C628
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox MeteorFalls_1F_1R_Text_1933EC, 4
	.else
	msgbox MeteorFalls_1F_1R_Text_193584, 4
	.endif
	closemessage
	applymovement 8, MeteorFalls_1F_1R_Movement_15C639
	applymovement 9, MeteorFalls_1F_1R_Movement_15C64A
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193720, 4
	applymovement 7, MeteorFalls_1F_1R_Movement_1A0845
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193747, 4
	applymovement 7, MeteorFalls_1F_1R_Movement_1A083F
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_1937AA, 4
	closemessage
	applymovement 7, MeteorFalls_1F_1R_Movement_15C61F
	applymovement 8, MeteorFalls_1F_1R_Movement_15C62E
	applymovement 9, MeteorFalls_1F_1R_Movement_15C63E
	waitmovement 0
	removeobject 7
	removeobject 8
	removeobject 9
	setflag FLAG_HIDE_GRUNTS_BLOCKING_CABLE_CAR
	setvar VAR_METEOR_FALLS_STATE, 1
	releaseall
	end

MeteorFalls_1F_1R_Movement_15C5EE:: @ 815C5EE
	walk_right
	walk_right
	end_movement

MeteorFalls_1F_1R_Movement_15C5F1:: @ 815C5F1
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	end_movement

MeteorFalls_1F_1R_Movement_15C5FC:: @ 815C5FC
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	end_movement

MeteorFalls_1F_1R_Movement_15C608:: @ 815C608
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

MeteorFalls_1F_1R_Movement_15C60F:: @ 815C60F
	delay_16
	delay_16
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

MeteorFalls_1F_1R_Movement_15C617:: @ 815C617
	delay_16
	delay_16
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

MeteorFalls_1F_1R_Movement_15C61F:: @ 815C61F
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

MeteorFalls_1F_1R_Movement_15C628:: @ 815C628
	walk_right
	walk_right
	walk_up
	walk_up
	walk_in_place_fastest_left
	end_movement

MeteorFalls_1F_1R_Movement_15C62E:: @ 815C62E
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

MeteorFalls_1F_1R_Movement_15C639:: @ 815C639
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

MeteorFalls_1F_1R_Movement_15C63E:: @ 815C63E
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

MeteorFalls_1F_1R_Movement_15C64A:: @ 815C64A
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

MeteorFalls_1F_1R_Movement_15C64F:: @ 815C64F
	walk_in_place_fastest_down
	delay_4
	walk_in_place_fastest_right
	lock_facing_direction
	walk_left
	unlock_facing_direction
	end_movement

MeteorFalls_1F_1R_EventScript_15C656:: @ 815C656
	lock
	faceplayer
	goto_if_set FLAG_MET_PROF_COSMO, MeteorFalls_1F_1R_EventScript_15C66E
	setflag FLAG_MET_PROF_COSMO
	msgbox MeteorFalls_1F_1R_Text_1937EB, 4
	release
	end

MeteorFalls_1F_1R_EventScript_15C66E:: @ 815C66E
	msgbox MeteorFalls_1F_1R_Text_19396A, 4
	release
	end
