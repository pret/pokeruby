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
	specialval RESULT, GetLeadMonFriendshipScore
	compare RESULT, 4
	jumpif 4, PacifidlogTown_House2_EventScript_1541EC
	specialval RESULT, GetLeadMonFriendshipScore
	compare RESULT, 2
	jumpif 4, PacifidlogTown_House2_EventScript_15421B
	goto PacifidlogTown_House2_EventScript_154225
	end

PacifidlogTown_House2_EventScript_1541B4:: @ 81541B4
	checkflag 299
	jumpif 0, PacifidlogTown_House2_EventScript_1A14DC
	specialval RESULT, sub_810F908
	compare RESULT, 0
	callif 1, PacifidlogTown_House2_EventScript_1541E8
	return

PacifidlogTown_House2_EventScript_1541CE:: @ 81541CE
	msgbox PacifidlogTown_House2_Text_179155, 4
	return

PacifidlogTown_House2_EventScript_1541D7:: @ 81541D7
	msgbox PacifidlogTown_House2_Text_1790C1, 4
	msgbox PacifidlogTown_House2_Text_179155, 4
	return

PacifidlogTown_House2_EventScript_1541E8:: @ 81541E8
	clearflag 299
	return

PacifidlogTown_House2_EventScript_1541EC:: @ 81541EC
	msgbox PacifidlogTown_House2_Text_179169, 4
	giveitem ITEM_TM27
	compare RESULT, 0
	jumpeq PacifidlogTown_House2_EventScript_1A029B
	setflag 299
	special sub_810F950
	msgbox PacifidlogTown_House2_Text_179283, 4
	release
	end

PacifidlogTown_House2_EventScript_15421B:: @ 815421B
	msgbox PacifidlogTown_House2_Text_1791CA, 4
	release
	end

PacifidlogTown_House2_EventScript_154225:: @ 8154225
	msgbox PacifidlogTown_House2_Text_17922D, 4
	giveitem ITEM_TM21
	compare RESULT, 0
	jumpeq PacifidlogTown_House2_EventScript_1A029B
	setflag 299
	special sub_810F950
	msgbox PacifidlogTown_House2_Text_179283, 4
	release
	end

PacifidlogTown_House2_EventScript_154254:: @ 8154254
	specialval RESULT, sub_810F908
	buffernum 0, RESULT
	msgbox PacifidlogTown_House2_Text_1792F2, 4
	release
	end

PacifidlogTown_House2_EventScript_154267:: @ 8154267
	lock
	faceplayer
	checksound
	pokecry SPECIES_AZURILL, 0
	msgbox PacifidlogTown_House2_Text_17938B, 4
	waitpokecry
	msgbox PacifidlogTown_House2_Text_17939B, 4
	release
	end

PacifidlogTown_House2_EventScript_154282:: @ 8154282
	lock
	faceplayer
	checksound
	pokecry SPECIES_AZURILL, 2
	msgbox PacifidlogTown_House2_Text_1793CC, 4
	waitpokecry
	msgbox PacifidlogTown_House2_Text_1793DD, 4
	release
	end
