DewfordTown_Gym_MapScripts:: @ 8153065
	map_script 3, DewfordTown_Gym_MapScript1_15306B
	.byte 0

DewfordTown_Gym_MapScript1_15306B:: @ 815306B
	call DewfordTown_Gym_EventScript_153071
	end

DewfordTown_Gym_EventScript_153071:: @ 8153071
	goto_if_trainer_defeated TRAINER_BRAWLY, DewfordTown_Gym_EventScript_1530AA
	call DewfordTown_Gym_EventScript_153122
	copyvar VAR_SPECIAL_1, VAR_SPECIAL_0
	compare VAR_SPECIAL_0, 0
	goto_if_eq DewfordTown_Gym_EventScript_1530BA
	compare VAR_SPECIAL_0, 1
	goto_if_eq DewfordTown_Gym_EventScript_1530B6
	compare VAR_SPECIAL_0, 2
	goto_if_eq DewfordTown_Gym_EventScript_1530B2
	goto DewfordTown_Gym_EventScript_1530AE

DewfordTown_Gym_EventScript_1530AA:: @ 81530AA
	setflashradius 0
	return

DewfordTown_Gym_EventScript_1530AE:: @ 81530AE
	setflashradius 1
	return

DewfordTown_Gym_EventScript_1530B2:: @ 81530B2
	setflashradius 2
	return

DewfordTown_Gym_EventScript_1530B6:: @ 81530B6
	setflashradius 3
	return

DewfordTown_Gym_EventScript_1530BA:: @ 81530BA
	setflashradius 4
	return

DewfordTown_Gym_EventScript_1530BE:: @ 81530BE
	call DewfordTown_Gym_EventScript_153122
	nop1
	compare VAR_SPECIAL_0, VAR_SPECIAL_1
	goto_if_eq DewfordTown_Gym_EventScript_1530F5
	copyvar VAR_SPECIAL_1, VAR_SPECIAL_0
	compare VAR_SPECIAL_0, 1
	goto_if_eq DewfordTown_Gym_EventScript_1530F6
	compare VAR_SPECIAL_0, 2
	goto_if_eq DewfordTown_Gym_EventScript_153101
	compare VAR_SPECIAL_0, 3
	goto_if_eq DewfordTown_Gym_EventScript_15310C

DewfordTown_Gym_EventScript_1530F5:: @ 81530F5
	return

DewfordTown_Gym_EventScript_1530F6:: @ 81530F6
	playse SE_MU_PACHI
	animateflash 3
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153101:: @ 8153101
	playse SE_MU_PACHI
	animateflash 2
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_15310C:: @ 815310C
	playse SE_MU_PACHI
	animateflash 1
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153117:: @ 8153117
	playse SE_MU_PACHI
	animateflash 0
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153122:: @ 8153122
	setvar VAR_SPECIAL_0, 0
	goto_if_trainer_not_defeated TRAINER_HIDEKI, DewfordTown_Gym_EventScript_153135
	addvar VAR_SPECIAL_0, 1

DewfordTown_Gym_EventScript_153135:: @ 8153135
	goto_if_trainer_not_defeated TRAINER_TESSA, DewfordTown_Gym_EventScript_153143
	addvar VAR_SPECIAL_0, 1

DewfordTown_Gym_EventScript_153143:: @ 8153143
	goto_if_trainer_not_defeated TRAINER_LAURA, DewfordTown_Gym_EventScript_153151
	addvar VAR_SPECIAL_0, 1

DewfordTown_Gym_EventScript_153151:: @ 8153151
	return

DewfordTown_Gym_EventScript_153152:: @ 8153152
	trainerbattle 1, TRAINER_BRAWLY, 0, DewfordTown_Gym_Text_175182, DewfordTown_Gym_Text_175246, DewfordTown_Gym_EventScript_153177
	goto_if_unset FLAG_RECEIVED_TM08, DewfordTown_Gym_EventScript_1531B5
	msgbox DewfordTown_Gym_Text_175412, 4
	release
	end

DewfordTown_Gym_EventScript_153177:: @ 8153177
	call DewfordTown_Gym_EventScript_153117
	message DewfordTown_Gym_Text_1752BB
	waitmessage
	call DewfordTown_Gym_EventScript_1A02C5
	msgbox DewfordTown_Gym_Text_1752E6, 4
	setflag FLAG_DEFEATED_DEWFORD_GYM
	setflag FLAG_BADGE02_GET
	addvar VAR_PETALBURG_GYM_STATE, 1
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_eq DewfordTown_Gym_EventScript_1A00FB
	setvar VAR_SPECIAL_8, 2
	call DewfordTown_Gym_EventScript_1A01C0
	goto DewfordTown_Gym_EventScript_1531B5
	end

DewfordTown_Gym_EventScript_1531B5:: @ 81531B5
	giveitem_std ITEM_TM08_BULK_UP
	compare RESULT, 0
	goto_if_eq DewfordTown_Gym_EventScript_1A029B
	msgbox DewfordTown_Gym_Text_1753BF, 4
	setflag FLAG_RECEIVED_TM08
	release
	end

DewfordTown_Gym_EventScript_1531D9:: @ 81531D9
	trainerbattle 2, TRAINER_HIDEKI, 0, DewfordTown_Gym_Text_174F61, DewfordTown_Gym_Text_174F7A, DewfordTown_Gym_EventScript_1531F4
	msgbox DewfordTown_Gym_Text_174F8E, 6
	end

DewfordTown_Gym_EventScript_1531F4:: @ 81531F4
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_1531FB:: @ 81531FB
	trainerbattle 2, TRAINER_TESSA, 0, DewfordTown_Gym_Text_174FCE, DewfordTown_Gym_Text_175009, DewfordTown_Gym_EventScript_153216
	msgbox DewfordTown_Gym_Text_175031, 6
	end

DewfordTown_Gym_EventScript_153216:: @ 8153216
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_15321D:: @ 815321D
	trainerbattle 2, TRAINER_LAURA, 0, DewfordTown_Gym_Text_1750C9, DewfordTown_Gym_Text_175104, DewfordTown_Gym_EventScript_153238
	msgbox DewfordTown_Gym_Text_175117, 6
	end

DewfordTown_Gym_EventScript_153238:: @ 8153238
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_15323F:: @ 815323F
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_DEWFORD_GYM, DewfordTown_Gym_EventScript_153254
	msgbox DewfordTown_Gym_Text_174D98, 4
	release
	end

DewfordTown_Gym_EventScript_153254:: @ 8153254
	msgbox DewfordTown_Gym_Text_174F1E, 4
	release
	end

DewfordTown_Gym_EventScript_15325E:: @ 815325E
	lockall
	goto_if_set FLAG_BADGE02_GET, DewfordTown_Gym_EventScript_15327E
	goto DewfordTown_Gym_EventScript_153288
	end

DewfordTown_Gym_EventScript_15326E:: @ 815326E
	lockall
	goto_if_set FLAG_BADGE02_GET, DewfordTown_Gym_EventScript_15327E
	goto DewfordTown_Gym_EventScript_153288
	end

DewfordTown_Gym_EventScript_15327E:: @ 815327E
	msgbox DewfordTown_Gym_Text_175490, 4
	releaseall
	end

DewfordTown_Gym_EventScript_153288:: @ 8153288
	msgbox DewfordTown_Gym_Text_175477, 4
	releaseall
	end
