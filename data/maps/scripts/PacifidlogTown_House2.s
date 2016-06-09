PacifidlogTown_House2_MapScripts:: @ 8154167
	.byte 0

PacifidlogTown_House2_EventScript_154168:: @ 8154168
	lock
	faceplayer
	checkdailyflags
	call PacifidlogTown_House2_EventScript_1541B4
	checkflag 299
	jumpeq PacifidlogTown_House2_EventScript_154254
	checkflag 300
	callif 1, PacifidlogTown_House2_EventScript_1541CE
	checkflag 300
	callif 0, PacifidlogTown_House2_EventScript_1541D7
	setflag 300
	specialval RESULT, 230
	compare RESULT, 4
	jumpif 4, PacifidlogTown_House2_EventScript_1541EC
	specialval RESULT, 230
	compare RESULT, 2
	jumpif 4, PacifidlogTown_House2_EventScript_15421B
	jump PacifidlogTown_House2_EventScript_154225
	end

PacifidlogTown_House2_EventScript_1541B4:: @ 81541B4
	checkflag 299
	jumpif 0, PacifidlogTown_House2_EventScript_1A14DC
	specialval RESULT, 334
	compare RESULT, 0
	callif 1, PacifidlogTown_House2_EventScript_1541E8
	return

PacifidlogTown_House2_EventScript_1541CE:: @ 81541CE
	loadptr 0, PacifidlogTown_House2_Text_179155
	callstd 4
	return

PacifidlogTown_House2_EventScript_1541D7:: @ 81541D7
	loadptr 0, PacifidlogTown_House2_Text_1790C1
	callstd 4
	loadptr 0, PacifidlogTown_House2_Text_179155
	callstd 4
	return

PacifidlogTown_House2_EventScript_1541E8:: @ 81541E8
	clearflag 299
	return

PacifidlogTown_House2_EventScript_1541EC:: @ 81541EC
	loadptr 0, PacifidlogTown_House2_Text_179169
	callstd 4
	setorcopyvar 0x8000, 0x13b
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq PacifidlogTown_House2_EventScript_1A029B
	setflag 299
	special 333
	loadptr 0, PacifidlogTown_House2_Text_179283
	callstd 4
	release
	end

PacifidlogTown_House2_EventScript_15421B:: @ 815421B
	loadptr 0, PacifidlogTown_House2_Text_1791CA
	callstd 4
	release
	end

PacifidlogTown_House2_EventScript_154225:: @ 8154225
	loadptr 0, PacifidlogTown_House2_Text_17922D
	callstd 4
	setorcopyvar 0x8000, 0x135
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq PacifidlogTown_House2_EventScript_1A029B
	setflag 299
	special 333
	loadptr 0, PacifidlogTown_House2_Text_179283
	callstd 4
	release
	end

PacifidlogTown_House2_EventScript_154254:: @ 8154254
	specialval RESULT, 334
	buffernum 0, 32781
	loadptr 0, PacifidlogTown_House2_Text_1792F2
	callstd 4
	release
	end

PacifidlogTown_House2_EventScript_154267:: @ 8154267
	lock
	faceplayer
	checksound
	pokecry SPECIES_AZURILL, 0
	loadptr 0, PacifidlogTown_House2_Text_17938B
	callstd 4
	waitpokecry
	loadptr 0, PacifidlogTown_House2_Text_17939B
	callstd 4
	release
	end

PacifidlogTown_House2_EventScript_154282:: @ 8154282
	lock
	faceplayer
	checksound
	pokecry SPECIES_AZURILL, 2
	loadptr 0, PacifidlogTown_House2_Text_1793CC
	callstd 4
	waitpokecry
	loadptr 0, PacifidlogTown_House2_Text_1793DD
	callstd 4
	release
	end

