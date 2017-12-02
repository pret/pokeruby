DewfordTown_Gym_MapScripts:: @ 8153065
	map_script 3, DewfordTown_Gym_MapScript1_15306B
	.byte 0

DewfordTown_Gym_MapScript1_15306B:: @ 815306B
	call DewfordTown_Gym_EventScript_153071
	end

DewfordTown_Gym_EventScript_153071:: @ 8153071
	checktrainerflag OPPONENT_BRAWLY
	goto_if_eq DewfordTown_Gym_EventScript_1530AA
	call DewfordTown_Gym_EventScript_153122
	copyvar 0x8001, 0x8000
	compare 0x8000, 0
	goto_if_eq DewfordTown_Gym_EventScript_1530BA
	compare 0x8000, 1
	goto_if_eq DewfordTown_Gym_EventScript_1530B6
	compare 0x8000, 2
	goto_if_eq DewfordTown_Gym_EventScript_1530B2
	goto DewfordTown_Gym_EventScript_1530AE

DewfordTown_Gym_EventScript_1530AA:: @ 81530AA
	setdarklevel 0
	return

DewfordTown_Gym_EventScript_1530AE:: @ 81530AE
	setdarklevel 1
	return

DewfordTown_Gym_EventScript_1530B2:: @ 81530B2
	setdarklevel 2
	return

DewfordTown_Gym_EventScript_1530B6:: @ 81530B6
	setdarklevel 3
	return

DewfordTown_Gym_EventScript_1530BA:: @ 81530BA
	setdarklevel 4
	return

DewfordTown_Gym_EventScript_1530BE:: @ 81530BE
	call DewfordTown_Gym_EventScript_153122
	nop1
	compare 0x8000, 0x8001
	goto_if_eq DewfordTown_Gym_EventScript_1530F5
	copyvar 0x8001, 0x8000
	compare 0x8000, 1
	goto_if_eq DewfordTown_Gym_EventScript_1530F6
	compare 0x8000, 2
	goto_if_eq DewfordTown_Gym_EventScript_153101
	compare 0x8000, 3
	goto_if_eq DewfordTown_Gym_EventScript_15310C

DewfordTown_Gym_EventScript_1530F5:: @ 81530F5
	return

DewfordTown_Gym_EventScript_1530F6:: @ 81530F6
	playse 35
	animdarklevel 3
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153101:: @ 8153101
	playse 35
	animdarklevel 2
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_15310C:: @ 815310C
	playse 35
	animdarklevel 1
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153117:: @ 8153117
	playse 35
	animdarklevel 0
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153122:: @ 8153122
	setvar 0x8000, 0
	checktrainerflag OPPONENT_HIDEKI
	goto_if 0, DewfordTown_Gym_EventScript_153135
	addvar 0x8000, 1

DewfordTown_Gym_EventScript_153135:: @ 8153135
	checktrainerflag OPPONENT_TESSA
	goto_if 0, DewfordTown_Gym_EventScript_153143
	addvar 0x8000, 1

DewfordTown_Gym_EventScript_153143:: @ 8153143
	checktrainerflag OPPONENT_LAURA
	goto_if 0, DewfordTown_Gym_EventScript_153151
	addvar 0x8000, 1

DewfordTown_Gym_EventScript_153151:: @ 8153151
	return

DewfordTown_Gym_EventScript_153152:: @ 8153152
	trainerbattle 1, OPPONENT_BRAWLY, 0, DewfordTown_Gym_Text_175182, DewfordTown_Gym_Text_175246, DewfordTown_Gym_EventScript_153177
	checkflag 166
	goto_if 0, DewfordTown_Gym_EventScript_1531B5
	msgbox DewfordTown_Gym_Text_175412, 4
	release
	end

DewfordTown_Gym_EventScript_153177:: @ 8153177
	call DewfordTown_Gym_EventScript_153117
	message DewfordTown_Gym_Text_1752BB
	waitmessage
	call DewfordTown_Gym_EventScript_1A02C5
	msgbox DewfordTown_Gym_Text_1752E6, 4
	setflag 1204
	setflag BADGE02_GET
	addvar 0x4085, 1
	compare 0x4085, 6
	call_if 1, DewfordTown_Gym_EventScript_1A00FB
	setvar 0x8008, 2
	call DewfordTown_Gym_EventScript_1A01C0
	goto DewfordTown_Gym_EventScript_1531B5
	end

DewfordTown_Gym_EventScript_1531B5:: @ 81531B5
	giveitem ITEM_TM08
	compare RESULT, 0
	goto_if_eq DewfordTown_Gym_EventScript_1A029B
	msgbox DewfordTown_Gym_Text_1753BF, 4
	setflag 166
	release
	end

DewfordTown_Gym_EventScript_1531D9:: @ 81531D9
	trainerbattle 2, OPPONENT_HIDEKI, 0, DewfordTown_Gym_Text_174F61, DewfordTown_Gym_Text_174F7A, DewfordTown_Gym_EventScript_1531F4
	msgbox DewfordTown_Gym_Text_174F8E, 6
	end

DewfordTown_Gym_EventScript_1531F4:: @ 81531F4
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_1531FB:: @ 81531FB
	trainerbattle 2, OPPONENT_TESSA, 0, DewfordTown_Gym_Text_174FCE, DewfordTown_Gym_Text_175009, DewfordTown_Gym_EventScript_153216
	msgbox DewfordTown_Gym_Text_175031, 6
	end

DewfordTown_Gym_EventScript_153216:: @ 8153216
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_15321D:: @ 815321D
	trainerbattle 2, OPPONENT_LAURA, 0, DewfordTown_Gym_Text_1750C9, DewfordTown_Gym_Text_175104, DewfordTown_Gym_EventScript_153238
	msgbox DewfordTown_Gym_Text_175117, 6
	end

DewfordTown_Gym_EventScript_153238:: @ 8153238
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_15323F:: @ 815323F
	lock
	faceplayer
	checkflag 1204
	goto_if_eq DewfordTown_Gym_EventScript_153254
	msgbox DewfordTown_Gym_Text_174D98, 4
	release
	end

DewfordTown_Gym_EventScript_153254:: @ 8153254
	msgbox DewfordTown_Gym_Text_174F1E, 4
	release
	end

DewfordTown_Gym_EventScript_15325E:: @ 815325E
	lockall
	checkflag BADGE02_GET
	goto_if_eq DewfordTown_Gym_EventScript_15327E
	goto DewfordTown_Gym_EventScript_153288
	end

DewfordTown_Gym_EventScript_15326E:: @ 815326E
	lockall
	checkflag BADGE02_GET
	goto_if_eq DewfordTown_Gym_EventScript_15327E
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
