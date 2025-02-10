MeteorFalls_1F_1R_MapScripts:: @ 815C490
	map_script MAP_SCRIPT_ON_TRANSITION, MeteorFalls_1F_1R_MapScript1_15C496
	.byte 0

MeteorFalls_1F_1R_MapScript1_15C496:: @ 815C496
	call Common_EventScript_SetupEvilTeamGfxIds
	end

MeteorFalls_1F_1R_EventScript_15C49C:: @ 815C49C
	lockall
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 30
	applymovement 5, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193237, MSGBOX_DEFAULT
	closemessage
	applymovement 5, Common_Movement_WalkInPlaceFastestUp
	applymovement 6, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	playse SE_PIN
	applymovement 5, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 5, Common_Movement_Delay48
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193268, MSGBOX_DEFAULT
	closemessage
	applymovement 5, MeteorFalls_1F_1R_Movement_15C5EE
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_1932C5, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	applymovement 5, Common_Movement_WalkInPlaceFastestLeft
	applymovement 6, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	addobject 7
	addobject 8
	addobject 9
	applymovement 7, MeteorFalls_1F_1R_Movement_15C608
	applymovement 8, MeteorFalls_1F_1R_Movement_15C60F
	applymovement 9, MeteorFalls_1F_1R_Movement_15C617
	waitmovement 0
	applymovement 5, Common_Movement_WalkInPlaceFastestLeft
	applymovement 6, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193320, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_PLAYER, MeteorFalls_1F_1R_Movement_15C64F
	applymovement 5, MeteorFalls_1F_1R_Movement_15C5F1
	applymovement 6, MeteorFalls_1F_1R_Movement_15C5FC
	waitmovement 0
	removeobject 5
	removeobject 6
	applymovement 7, MeteorFalls_1F_1R_Movement_15C628
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox MeteorFalls_1F_1R_Text_1933EC, MSGBOX_DEFAULT
	.else
	msgbox MeteorFalls_1F_1R_Text_193584, MSGBOX_DEFAULT
	.endif
	closemessage
	applymovement 8, MeteorFalls_1F_1R_Movement_15C639
	applymovement 9, MeteorFalls_1F_1R_Movement_15C64A
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193720, MSGBOX_DEFAULT
	applymovement 7, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_193747, MSGBOX_DEFAULT
	applymovement 7, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox MeteorFalls_1F_1R_Text_1937AA, MSGBOX_DEFAULT
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
	step_end

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
	step_end

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
	step_end

MeteorFalls_1F_1R_Movement_15C608:: @ 815C608
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

MeteorFalls_1F_1R_Movement_15C60F:: @ 815C60F
	delay_16
	delay_16
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

MeteorFalls_1F_1R_Movement_15C617:: @ 815C617
	delay_16
	delay_16
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

MeteorFalls_1F_1R_Movement_15C61F:: @ 815C61F
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

MeteorFalls_1F_1R_Movement_15C628:: @ 815C628
	walk_right
	walk_right
	walk_up
	walk_up
	walk_in_place_fastest_left
	step_end

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
	step_end

MeteorFalls_1F_1R_Movement_15C639:: @ 815C639
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

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
	step_end

MeteorFalls_1F_1R_Movement_15C64A:: @ 815C64A
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

MeteorFalls_1F_1R_Movement_15C64F:: @ 815C64F
	walk_in_place_fastest_down
	delay_4
	walk_in_place_fastest_right
	lock_facing_direction
	walk_left
	unlock_facing_direction
	step_end

MeteorFalls_1F_1R_EventScript_15C656:: @ 815C656
	lock
	faceplayer
	goto_if_set FLAG_MET_PROF_COSMO, MeteorFalls_1F_1R_EventScript_15C66E
	setflag FLAG_MET_PROF_COSMO
	msgbox MeteorFalls_1F_1R_Text_1937EB, MSGBOX_DEFAULT
	release
	end

MeteorFalls_1F_1R_EventScript_15C66E:: @ 815C66E
	msgbox MeteorFalls_1F_1R_Text_19396A, MSGBOX_DEFAULT
	release
	end
