MtChimney_CableCarStation_MapScripts:: @ 815C0FA
	map_script 3, MtChimney_CableCarStation_MapScript1_15C105
	map_script 2, MtChimney_CableCarStation_MapScript2_15C11D
	.byte 0

MtChimney_CableCarStation_MapScript1_15C105:: @ 815C105
	compare_var_to_imm 0x40a3, 1
	call_if 1, MtChimney_CableCarStation_EventScript_15C111
	end

MtChimney_CableCarStation_EventScript_15C111:: @ 815C111
	movespriteperm 1, 5, 4
	spritebehave 1, 10
	return

MtChimney_CableCarStation_MapScript2_15C11D:: @ 815C11D
	map_script_2 0x40a3, 1, MtChimney_CableCarStation_EventScript_15C127
	.2byte 0

MtChimney_CableCarStation_EventScript_15C127:: @ 815C127
	lockall
	applymovement 255, MtChimney_CableCarStation_Movement_15C1B4
	applymovement 1, MtChimney_CableCarStation_Movement_15C1AA
	waitmovement 0
	setvar 0x40a3, 0
	movespriteperm 1, 6, 7
	spritebehave 1, 8
	releaseall
	end

MtChimney_CableCarStation_EventScript_15C14B:: @ 815C14B
	lock
	faceplayer
	msgbox MtChimney_CableCarStation_Text_19256A, 5
	compare_var_to_imm RESULT, 1
	goto_if_eq MtChimney_CableCarStation_EventScript_15C16C
	compare_var_to_imm RESULT, 0
	goto_if_eq MtChimney_CableCarStation_EventScript_15C19B
	end

MtChimney_CableCarStation_EventScript_15C16C:: @ 815C16C
	msgbox MtChimney_CableCarStation_Text_1925A9, 4
	closebutton
	applymovement 1, MtChimney_CableCarStation_Movement_15C1A5
	applymovement 255, MtChimney_CableCarStation_Movement_15C1AF
	waitmovement 0
	setvar 0x8004, 1
	setvar 0x40a3, 2
	inccounter GAME_STAT_RODE_CABLE_CAR
	special CableCarWarp
	special sub_8123218
	waitstate
	release
	end

MtChimney_CableCarStation_EventScript_15C19B:: @ 815C19B
	msgbox MtChimney_CableCarStation_Text_1925BF, 4
	release
	end

MtChimney_CableCarStation_Movement_15C1A5:: @ 815C1A5
	step_up
	step_up
	step_left
	step_28
	step_end

MtChimney_CableCarStation_Movement_15C1AA:: @ 815C1AA
	step_14
	step_right
	step_down
	step_down
	step_end

MtChimney_CableCarStation_Movement_15C1AF:: @ 815C1AF
	step_up
	step_up
	step_up
	step_14
	step_end

MtChimney_CableCarStation_Movement_15C1B4:: @ 815C1B4
	step_down
	step_down
	step_down
	step_14
	step_end
