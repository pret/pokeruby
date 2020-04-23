LittlerootTown_ProfessorBirchsLab_MapScripts:: @ 8152C82
	map_script 3, LittlerootTown_ProfessorBirchsLab_MapScript1_152C92
	map_script 4, LittlerootTown_ProfessorBirchsLab_MapScript2_152C9D
	map_script 2, LittlerootTown_ProfessorBirchsLab_MapScript2_152CAC
	.byte 0

LittlerootTown_ProfessorBirchsLab_MapScript1_152C92:: @ 8152C92
	call LittlerootTown_ProfessorBirchsLab_EventScript_1A014E
	call LittlerootTown_ProfessorBirchsLab_EventScript_1A02F4
	end

LittlerootTown_ProfessorBirchsLab_MapScript2_152C9D:: @ 8152C9D
	map_script_2 VAR_BIRCH_LAB_STATE, 2, LittlerootTown_ProfessorBirchsLab_EventScript_152CA7
	.2byte 0

LittlerootTown_ProfessorBirchsLab_EventScript_152CA7:: @ 8152CA7
	turnobject 255, 2
	end

LittlerootTown_ProfessorBirchsLab_MapScript2_152CAC:: @ 8152CAC
	map_script_2 VAR_BIRCH_LAB_STATE, 2, LittlerootTown_ProfessorBirchsLab_EventScript_152CBE
	map_script_2 VAR_BIRCH_LAB_STATE, 4, LittlerootTown_ProfessorBirchsLab_EventScript_152D4A
	.2byte 0

LittlerootTown_ProfessorBirchsLab_EventScript_152CBE:: @ 8152CBE
	lockall
	bufferleadmonspeciesname 0
	message LittlerootTown_ProfessorBirchsLab_Text_173D94
	waitmessage
	playfanfare MUS_FANFA4
	waitfanfare
	msgbox LittlerootTown_ProfessorBirchsLab_Text_173EF8, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152CEA
	compare VAR_RESULT, NO
	goto_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152CFA
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152CEA:: @ 8152CEA
	setvar VAR_0x8004, 0
	call LittlerootTown_ProfessorBirchsLab_EventScript_1A0678
	goto LittlerootTown_ProfessorBirchsLab_EventScript_152CFA
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152CFA:: @ 8152CFA
	msgbox LittlerootTown_ProfessorBirchsLab_Text_173F3D, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152D19
	compare VAR_RESULT, NO
	goto_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152D2B
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152D19:: @ 8152D19
	msgbox LittlerootTown_ProfessorBirchsLab_Text_174015, MSGBOX_DEFAULT
	clearflag FLAG_HIDE_BOY_ROUTE101
	setvar VAR_BIRCH_LAB_STATE, 3
	releaseall
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152D2B:: @ 8152D2B
	msgbox LittlerootTown_ProfessorBirchsLab_Text_174075, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152D19
	compare VAR_RESULT, NO
	goto_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152D2B
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152D4A:: @ 8152D4A
	lockall
	applymovement 255, LittlerootTown_ProfessorBirchsLab_Movement_152D5B
	waitmovement 0
	goto LittlerootTown_ProfessorBirchsLab_EventScript_152DBA
	end

LittlerootTown_ProfessorBirchsLab_Movement_152D5B:: @ 8152D5B
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

LittlerootTown_ProfessorBirchsLab_EventScript_152D63:: @ 8152D63
	lock
	faceplayer
	compare VAR_BIRCH_LAB_STATE, 3
	goto_if_ge LittlerootTown_ProfessorBirchsLab_EventScript_152D90
	goto_if_set FLAG_BIRCH_AIDE_MET, LittlerootTown_ProfessorBirchsLab_EventScript_152D86
	msgbox LittlerootTown_ProfessorBirchsLab_Text_173B29, MSGBOX_DEFAULT
	setflag FLAG_BIRCH_AIDE_MET
	release
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152D86:: @ 8152D86
	msgbox LittlerootTown_ProfessorBirchsLab_Text_173C88, MSGBOX_DEFAULT
	release
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152D90:: @ 8152D90
	msgbox LittlerootTown_ProfessorBirchsLab_Text_173D15, MSGBOX_DEFAULT
	release
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152D9A:: @ 8152D9A
	lock
	faceplayer
	goto_if_unset FLAG_UNKNOWN_BIRCH_380, LittlerootTown_ProfessorBirchsLab_EventScript_1A037F
	compare VAR_BIRCH_LAB_STATE, 5
	goto_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152E7B
	msgbox LittlerootTown_ProfessorBirchsLab_Text_1740B4, MSGBOX_DEFAULT
	release
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152DBA:: @ 8152DBA
	msgbox LittlerootTown_ProfessorBirchsLab_Text_17411F, MSGBOX_DEFAULT
	call LittlerootTown_ProfessorBirchsLab_EventScript_152E6D
	msgbox LittlerootTown_ProfessorBirchsLab_Text_174248, MSGBOX_DEFAULT
	applymovement 3, LittlerootTown_ProfessorBirchsLab_Movement_152E97
	waitmovement 0
	applymovement 255, LittlerootTown_ProfessorBirchsLab_Movement_1A0843
	waitmovement 0
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152E13
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152E40
	setvar VAR_BIRCH_LAB_STATE, 5
	setflag FLAG_ADVENTURE_STARTED
	setvar VAR_ROUTE102_ACCESSIBLE, 1
	setvar VAR_LITTLEROOT_RIVAL_STATE, 4
	setvar VAR_LITTLEROOT_STATE, 3
	releaseall
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152E13:: @ 8152E13
	msgbox LittlerootTown_ProfessorBirchsLab_Text_1743D4, MSGBOX_DEFAULT
	giveitem ITEM_POKE_BALL, 5
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152E85
	msgbox LittlerootTown_ProfessorBirchsLab_Text_17443D, MSGBOX_DEFAULT
	setvar VAR_RESULT, 0
	return

LittlerootTown_ProfessorBirchsLab_EventScript_152E40:: @ 8152E40
	msgbox LittlerootTown_ProfessorBirchsLab_Text_17453C, MSGBOX_DEFAULT
	giveitem ITEM_POKE_BALL, 5
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152E8E
	msgbox LittlerootTown_ProfessorBirchsLab_Text_17458C, MSGBOX_DEFAULT
	setvar VAR_RESULT, 1
	return

LittlerootTown_ProfessorBirchsLab_EventScript_152E6D:: @ 8152E6D
	playfanfare MUS_FANFA4
	message LittlerootTown_ProfessorBirchsLab_Text_17422F
	waitfanfare
	waitmessage
	setflag FLAG_SYS_POKEDEX_GET
	return

LittlerootTown_ProfessorBirchsLab_EventScript_152E7B:: @ 8152E7B
	msgbox LittlerootTown_ProfessorBirchsLab_Text_17436C, MSGBOX_DEFAULT
	release
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152E85:: @ 8152E85
	msgbox LittlerootTown_ProfessorBirchsLab_Text_1744F0, MSGBOX_DEFAULT
	return

LittlerootTown_ProfessorBirchsLab_EventScript_152E8E:: @ 8152E8E
	msgbox LittlerootTown_ProfessorBirchsLab_Text_17465B, MSGBOX_DEFAULT
	return

LittlerootTown_ProfessorBirchsLab_Movement_152E97:: @ 8152E97
	walk_down
	walk_in_place_fastest_left
	end_movement

LittlerootTown_ProfessorBirchsLab_EventScript_152E9A:: @ 8152E9A
	msgbox LittlerootTown_ProfessorBirchsLab_Text_1746A2, MSGBOX_SIGN
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152EA3:: @ 8152EA3
	lock
	faceplayer
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152EBE
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_ProfessorBirchsLab_EventScript_152EC7
	release
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152EBE:: @ 8152EBE
	msgbox LittlerootTown_ProfessorBirchsLab_Text_174505, MSGBOX_DEFAULT
	return

LittlerootTown_ProfessorBirchsLab_EventScript_152EC7:: @ 8152EC7
	msgbox LittlerootTown_ProfessorBirchsLab_Text_174671, MSGBOX_DEFAULT
	return

LittlerootTown_ProfessorBirchsLab_EventScript_152ED0:: @ 8152ED0
	msgbox LittlerootTown_ProfessorBirchsLab_Text_1746E7, MSGBOX_SIGN
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152ED9:: @ 8152ED9
	msgbox LittlerootTown_ProfessorBirchsLab_Text_174724, MSGBOX_SIGN
	end

LittlerootTown_ProfessorBirchsLab_EventScript_152EE2:: @ 8152EE2
	msgbox LittlerootTown_ProfessorBirchsLab_Text_174748, MSGBOX_SIGN
	end
