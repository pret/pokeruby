LittlerootTown_BrendansHouse_2F_EventScript_1B6950:: @ 81B6950
LittlerootTown_MaysHouse_2F_EventScript_1B6950:: @ 81B6950
	setvar VAR_LITTLEROOT_INTRO_STATE, 5
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6956:: @ 81B6956
LittlerootTown_MaysHouse_1F_EventScript_1B6956:: @ 81B6956
	msgbox LittlerootTown_BrendansHouse_1F_Text_172429, 4
	applymovement SPECIALVAR_4, LittlerootTown_BrendansHouse_1F_Movement_1A0839
	waitmovement 0
	compare SPECIALVAR_5, 0
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B699F
	compare SPECIALVAR_5, 1
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B69AA
	msgbox LittlerootTown_BrendansHouse_1F_Text_172453, 4
	closemessage
	setvar VAR_LITTLEROOT_INTRO_STATE, 4
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B69B5
	applymovement SPECIALVAR_4, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	waitmovement 0
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B699F:: @ 81B699F
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1A0843
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B69AA:: @ 81B69AA
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_Movement_1B69B5:: @ 81B69B5
	step_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B69B7:: @ 81B69B7
LittlerootTown_MaysHouse_1F_EventScript_1B69B7:: @ 81B69B7
	msgbox LittlerootTown_BrendansHouse_1F_Text_172531, 4
	closemessage
	applymovement SPECIALVAR_4, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CDC
	waitmovement 0
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69D3:: @ 81B69D3
	lockall
	setvar SPECIALVAR_4, 0
	goto LittlerootTown_BrendansHouse_2F_EventScript_1B69EB
	end

LittlerootTown_MaysHouse_2F_EventScript_1B69DF:: @ 81B69DF
	lockall
	setvar SPECIALVAR_4, 1
	goto LittlerootTown_MaysHouse_2F_EventScript_1B69EB
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69EB:: @ 81B69EB
LittlerootTown_MaysHouse_2F_EventScript_1B69EB:: @ 81B69EB
	checkflag FLAG_SET_WALL_CLOCK
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_1B6A91
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E18, 4
	call LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B
	delay 30
	setvar VAR_LITTLEROOT_INTRO_STATE, 6
	setflag FLAG_SET_WALL_CLOCK
	setflag FLAG_HIDE_MACHOKE_MOVER_1
	setflag FLAG_HIDE_MACHOKE_MOVER_2
	checkplayergender
	compare RESULT, 0
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_1B6A31
	compare RESULT, 1
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_1B6A61
	playse 9
	removeobject SPECIALVAR_8
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A31:: @ 81B6A31
	setvar SPECIALVAR_8, 14
	addobject SPECIALVAR_8
	applymovement SPECIALVAR_8, LittlerootTown_BrendansHouse_2F_Movement_1B6AA2
	waitmovement 0
	applymovement 255, LittlerootTown_BrendansHouse_2F_Movement_1A0843
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E4C, 4
	closemessage
	applymovement SPECIALVAR_8, LittlerootTown_BrendansHouse_2F_Movement_1B6AA9
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A61:: @ 81B6A61
	setvar SPECIALVAR_8, 14
	addobject SPECIALVAR_8
	applymovement SPECIALVAR_8, LittlerootTown_BrendansHouse_2F_Movement_1B6AAD
	waitmovement 0
	applymovement 255, LittlerootTown_BrendansHouse_2F_Movement_1A083F
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E4C, 4
	closemessage
	applymovement SPECIALVAR_8, LittlerootTown_BrendansHouse_2F_Movement_1B6AB4
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A91:: @ 81B6A91
	incrementgamestat GAME_STAT_CHECKED_CLOCK
	fadescreen 1
	special ScrSpecial_ViewWallClock
	waitstate
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B:: @ 81B6A9B
	fadescreen 1
	special StartWallClock
	waitstate
	return

LittlerootTown_BrendansHouse_2F_Movement_1B6AA2:: @ 81B6AA2
	step_13
	step_down
	step_27
	step_14
	step_13
	step_left
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AA9:: @ 81B6AA9
	step_right
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AAD:: @ 81B6AAD
	step_13
	step_down
	step_28
	step_14
	step_13
	step_right
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AB4:: @ 81B6AB4
	step_left
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
LittlerootTown_MaysHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
	setvar VAR_LITTLEROOT_INTRO_STATE, 7
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6ABF:: @ 81B6ABF
	applymovement SPECIALVAR_5, LittlerootTown_BrendansHouse_1F_Movement_1A0843
	waitmovement 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CCC
	waitmovement 0
	playbgm 453, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725C9, 4
	closemessage
	applymovement SPECIALVAR_5, LittlerootTown_BrendansHouse_1F_Movement_1B6BDB
	waitmovement 0
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CD2
	waitmovement 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725FE, 4
	msgbox LittlerootTown_BrendansHouse_1F_Text_172644, 4
	closemessage
	setvar VAR_TEMP_1, 1
	applymovement SPECIALVAR_5, LittlerootTown_BrendansHouse_1F_Movement_1B6BE1
	waitmovement 0
	goto LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_MaysHouse_1F_EventScript_1B6B2E:: @ 81B6B2E
	applymovement SPECIALVAR_5, LittlerootTown_MaysHouse_1F_Movement_1A083F
	waitmovement 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6B9D
	applymovement 255, LittlerootTown_MaysHouse_1F_Movement_1B6CD4
	waitmovement 0
	playbgm 453, 0
	msgbox LittlerootTown_MaysHouse_1F_Text_1725C9, 4
	closemessage
	applymovement SPECIALVAR_5, LittlerootTown_MaysHouse_1F_Movement_1B6BDE
	waitmovement 0
	applymovement 255, LittlerootTown_MaysHouse_1F_Movement_1B6CDA
	waitmovement 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6BBE
	applymovement 255, LittlerootTown_MaysHouse_1F_Movement_1A0843
	waitmovement 0
	msgbox LittlerootTown_MaysHouse_1F_Text_1725FE, 4
	msgbox LittlerootTown_MaysHouse_1F_Text_172644, 4
	closemessage
	setvar VAR_TEMP_1, 1
	applymovement SPECIALVAR_5, LittlerootTown_MaysHouse_1F_Movement_1B6BE5
	waitmovement 0
	goto LittlerootTown_MaysHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
LittlerootTown_MaysHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
	playse 21
	applymovement SPECIALVAR_5, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmovement 0
	applymovement SPECIALVAR_5, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725A3, 4
	closemessage
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
LittlerootTown_MaysHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_172841, 4
	fadedefaultbgm
	special TurnOffTVScreen
	setflag FLAG_SYS_TV_HOME
	delay 35
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6BDB:: @ 81B6BDB
	step_left
	step_28
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BDE:: @ 81B6BDE
	step_right
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6BE1:: @ 81B6BE1
	step_left
	step_down
	step_28
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BE5:: @ 81B6BE5
	step_right
	step_down
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
LittlerootTown_MaysHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
	lock
	faceplayer
	compare VAR_LITTLEROOT_HOUSES_STATE, 4
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	compare VAR_LITTLEROOT_HOUSES_STATE_2, 4
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	checkflag FLAG_BADGE05_GET
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D
	checkflag FLAG_RESCUED_BIRCH
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	compare VAR_TEMP_1, 1
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C80
	compare VAR_LITTLEROOT_INTRO_STATE, 7
	goto_if 4, LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C
	msgbox LittlerootTown_BrendansHouse_1F_Text_172429, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C33:: @ 81B6C33
	msgbox LittlerootTown_BrendansHouse_1F_Text_172BBC, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D:: @ 81B6C3D
	checkflag FLAG_RECEIVED_AMULET_COIN
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	msgbox LittlerootTown_BrendansHouse_1F_Text_172782, 4
	giveitem_std ITEM_AMULET_COIN
	compare RESULT, 0
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1A029B
	msgbox LittlerootTown_BrendansHouse_1F_Text_1727CD, 4
	setflag FLAG_RECEIVED_AMULET_COIN
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C72:: @ 81B6C72
	msgbox LittlerootTown_BrendansHouse_1F_Text_172717, 4
	goto LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C80:: @ 81B6C80
	msgbox LittlerootTown_BrendansHouse_1F_Text_1726D2, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A:: @ 81B6C8A
	closemessage
	call LittlerootTown_BrendansHouse_1F_EventScript_1A02CA
	incrementgamestat GAME_STAT_RESTED_AT_HOME
	msgbox LittlerootTown_BrendansHouse_1F_Text_17276B, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C:: @ 81B6C9C
	msgbox LittlerootTown_BrendansHouse_1F_Text_1726E7, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
LittlerootTown_MaysHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOKE, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_17281D, 4
	waitmoncry
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
LittlerootTown_MaysHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOKE, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_172831, 4
	waitmoncry
	release
	end

LittlerootTown_BrendansHouse_1F_Movement_1B6CCC:: @ 81B6CCC
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CD2:: @ 81B6CD2
	step_left
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CD4:: @ 81B6CD4
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CDA:: @ 81B6CDA
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CDC:: @ 81B6CDC
	step_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CDE:: @ 81B6CDE
LittlerootTown_MaysHouse_1F_EventScript_1B6CDE:: @ 81B6CDE
	lockall
	checkplayergender
	compare RESULT, 0
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD
	compare RESULT, 1
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD
	compare SPECIALVAR_8, 0
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D
	compare SPECIALVAR_8, 1
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6E28
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1A0839
	waitmovement 0
	playse 21
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmovement 0
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmovement 0
	delay 20
	compare SPECIALVAR_8, 0
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD
	compare SPECIALVAR_8, 1
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8
	msgbox LittlerootTown_BrendansHouse_1F_Text_17298B, 4
	giveitem_std ITEM_SS_TICKET
	msgbox LittlerootTown_BrendansHouse_1F_Text_172A7D, 4
	closemessage
	compare SPECIALVAR_8, 0
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3
	compare SPECIALVAR_8, 1
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE
	msgbox LittlerootTown_BrendansHouse_1F_Text_172B5E, 4
	closemessage
	compare SPECIALVAR_8, 0
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9
	compare SPECIALVAR_8, 1
	call_if 1, LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B
	playse 8
	removeobject SPECIALVAR_9
	setflag FLAG_RECEIVED_SS_TICKET
	setvar VAR_LITTLEROOT_HOUSES_STATE, 4
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 4
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD:: @ 81B6DAD
	setvar SPECIALVAR_8, 0
	setvar SPECIALVAR_9, 5
	setvar SPECIALVAR_A, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD:: @ 81B6DBD
	setvar SPECIALVAR_8, 1
	setvar SPECIALVAR_9, 5
	setvar SPECIALVAR_A, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD:: @ 81B6DCD
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1B6E33
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8:: @ 81B6DD8
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1B6E36
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3:: @ 81B6DE3
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1B6E39
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE:: @ 81B6DEE
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1B6E3B
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9:: @ 81B6DF9
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1B6E3D
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B:: @ 81B6E0B
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	applymovement SPECIALVAR_9, LittlerootTown_BrendansHouse_1F_Movement_1B6E43
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D:: @ 81B6E1D
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E49
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E28:: @ 81B6E28
	applymovement 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E54
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6E33:: @ 81B6E33
	step_right
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E36:: @ 81B6E36
	step_left
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E39:: @ 81B6E39
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3B:: @ 81B6E3B
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3D:: @ 81B6E3D
	step_down
	step_right
	step_right
	step_down
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E43:: @ 81B6E43
	step_down
	step_left
	step_left
	step_down
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E49:: @ 81B6E49
	step_14
	step_down
	step_down
	step_down
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E4F:: @ 81B6E4F
	step_14
	step_14
	step_14
	step_25
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E54:: @ 81B6E54
	step_14
	step_down
	step_down
	step_down
	step_28
	step_end
