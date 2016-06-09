DewfordTown_Gym_MapScripts:: @ 8153065
	map_script 3, DewfordTown_Gym_MapScript1_15306B
	.byte 0

DewfordTown_Gym_MapScript1_15306B:: @ 815306B
	call DewfordTown_Gym_EventScript_153071
	end

DewfordTown_Gym_EventScript_153071:: @ 8153071
	checktrainerflag 266
	jumpeq DewfordTown_Gym_EventScript_1530AA
	call DewfordTown_Gym_EventScript_153122
	copyvar 0x8001, 0x8000
	compare 0x8000, 0
	jumpeq DewfordTown_Gym_EventScript_1530BA
	compare 0x8000, 1
	jumpeq DewfordTown_Gym_EventScript_1530B6
	compare 0x8000, 2
	jumpeq DewfordTown_Gym_EventScript_1530B2
	jump DewfordTown_Gym_EventScript_1530AE

DewfordTown_Gym_EventScript_1530AA:: @ 81530AA
	darken 0
	return

DewfordTown_Gym_EventScript_1530AE:: @ 81530AE
	darken 1
	return

DewfordTown_Gym_EventScript_1530B2:: @ 81530B2
	darken 2
	return

DewfordTown_Gym_EventScript_1530B6:: @ 81530B6
	darken 3
	return

DewfordTown_Gym_EventScript_1530BA:: @ 81530BA
	darken 4
	return

DewfordTown_Gym_EventScript_1530BE:: @ 81530BE
	call DewfordTown_Gym_EventScript_153122
	snop1
	comparevars 0x8000, 0x8001
	jumpeq DewfordTown_Gym_EventScript_1530F5
	copyvar 0x8001, 0x8000
	compare 0x8000, 1
	jumpeq DewfordTown_Gym_EventScript_1530F6
	compare 0x8000, 2
	jumpeq DewfordTown_Gym_EventScript_153101
	compare 0x8000, 3
	jumpeq DewfordTown_Gym_EventScript_15310C

DewfordTown_Gym_EventScript_1530F5:: @ 81530F5
	return

DewfordTown_Gym_EventScript_1530F6:: @ 81530F6
	playsfx 35
	lighten 3
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153101:: @ 8153101
	playsfx 35
	lighten 2
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_15310C:: @ 815310C
	playsfx 35
	lighten 1
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153117:: @ 8153117
	playsfx 35
	lighten 0
	call DewfordTown_Gym_EventScript_153071
	return

DewfordTown_Gym_EventScript_153122:: @ 8153122
	setvar 0x8000, 0
	checktrainerflag 179
	jumpif 0, DewfordTown_Gym_EventScript_153135
	addvar 0x8000, 1

DewfordTown_Gym_EventScript_153135:: @ 8153135
	checktrainerflag 425
	jumpif 0, DewfordTown_Gym_EventScript_153143
	addvar 0x8000, 1

DewfordTown_Gym_EventScript_153143:: @ 8153143
	checktrainerflag 426
	jumpif 0, DewfordTown_Gym_EventScript_153151
	addvar 0x8000, 1

DewfordTown_Gym_EventScript_153151:: @ 8153151
	return

DewfordTown_Gym_EventScript_153152:: @ 8153152
	trainerbattle 1, 266, 0, DewfordTown_Gym_Text_175182, DewfordTown_Gym_Text_175246, DewfordTown_Gym_EventScript_153177
	checkflag 166
	jumpif 0, DewfordTown_Gym_EventScript_1531B5
	loadptr 0, DewfordTown_Gym_Text_175412
	callstd 4
	release
	end

DewfordTown_Gym_EventScript_153177:: @ 8153177
	call DewfordTown_Gym_EventScript_153117
	message DewfordTown_Gym_Text_1752BB
	waittext
	call DewfordTown_Gym_EventScript_1A02C5
	loadptr 0, DewfordTown_Gym_Text_1752E6
	callstd 4
	setflag 1204
	setflag 2056
	addvar 0x4085, 1
	compare 0x4085, 6
	callif 1, DewfordTown_Gym_EventScript_1A00FB
	setvar 0x8008, 2
	call DewfordTown_Gym_EventScript_1A01C0
	jump DewfordTown_Gym_EventScript_1531B5
	end

DewfordTown_Gym_EventScript_1531B5:: @ 81531B5
	setorcopyvar 0x8000, 0x128
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq DewfordTown_Gym_EventScript_1A029B
	loadptr 0, DewfordTown_Gym_Text_1753BF
	callstd 4
	setflag 166
	release
	end

DewfordTown_Gym_EventScript_1531D9:: @ 81531D9
	trainerbattle 2, 179, 0, DewfordTown_Gym_Text_174F61, DewfordTown_Gym_Text_174F7A, DewfordTown_Gym_EventScript_1531F4
	loadptr 0, DewfordTown_Gym_Text_174F8E
	callstd 6
	end

DewfordTown_Gym_EventScript_1531F4:: @ 81531F4
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_1531FB:: @ 81531FB
	trainerbattle 2, 425, 0, DewfordTown_Gym_Text_174FCE, DewfordTown_Gym_Text_175009, DewfordTown_Gym_EventScript_153216
	loadptr 0, DewfordTown_Gym_Text_175031
	callstd 6
	end

DewfordTown_Gym_EventScript_153216:: @ 8153216
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_15321D:: @ 815321D
	trainerbattle 2, 426, 0, DewfordTown_Gym_Text_1750C9, DewfordTown_Gym_Text_175104, DewfordTown_Gym_EventScript_153238
	loadptr 0, DewfordTown_Gym_Text_175117
	callstd 6
	end

DewfordTown_Gym_EventScript_153238:: @ 8153238
	call DewfordTown_Gym_EventScript_1530BE
	release
	end

DewfordTown_Gym_EventScript_15323F:: @ 815323F
	lock
	faceplayer
	checkflag 1204
	jumpeq DewfordTown_Gym_EventScript_153254
	loadptr 0, DewfordTown_Gym_Text_174D98
	callstd 4
	release
	end

DewfordTown_Gym_EventScript_153254:: @ 8153254
	loadptr 0, DewfordTown_Gym_Text_174F1E
	callstd 4
	release
	end

DewfordTown_Gym_EventScript_15325E:: @ 815325E
	lockall
	checkflag 2056
	jumpeq DewfordTown_Gym_EventScript_15327E
	jump DewfordTown_Gym_EventScript_153288
	end

DewfordTown_Gym_EventScript_15326E:: @ 815326E
	lockall
	checkflag 2056
	jumpeq DewfordTown_Gym_EventScript_15327E
	jump DewfordTown_Gym_EventScript_153288
	end

DewfordTown_Gym_EventScript_15327E:: @ 815327E
	loadptr 0, DewfordTown_Gym_Text_175490
	callstd 4
	releaseall
	end

DewfordTown_Gym_EventScript_153288:: @ 8153288
	loadptr 0, DewfordTown_Gym_Text_175477
	callstd 4
	releaseall
	end

