PacifidlogTown_House2_MapScripts:: @ 8154167
	.byte 0

PacifidlogTown_House2_EventScript_154168:: @ 8154168
	lock
	faceplayer
	dodailyevents
	call PacifidlogTown_House2_EventScript_1541B4
	goto_if_set FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK, PacifidlogTown_House2_EventScript_154254
	call_if_set FLAG_MET_FANCLUB_YOUNGER_BROTHER, PacifidlogTown_House2_EventScript_1541CE
	call_if_unset FLAG_MET_FANCLUB_YOUNGER_BROTHER, PacifidlogTown_House2_EventScript_1541D7
	setflag FLAG_MET_FANCLUB_YOUNGER_BROTHER
	specialvar RESULT, GetLeadMonFriendshipScore
	compare RESULT, 4
	goto_if_ge PacifidlogTown_House2_EventScript_1541EC
	specialvar RESULT, GetLeadMonFriendshipScore
	compare RESULT, 2
	goto_if_ge PacifidlogTown_House2_EventScript_15421B
	goto PacifidlogTown_House2_EventScript_154225
	end

PacifidlogTown_House2_EventScript_1541B4:: @ 81541B4
	goto_if_unset FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK, PacifidlogTown_House2_EventScript_1A14DC
	specialvar RESULT, GetDaysUntilPacifidlogTMAvailable
	compare RESULT, 0
	call_if_eq PacifidlogTown_House2_EventScript_1541E8
	return

PacifidlogTown_House2_EventScript_1541CE:: @ 81541CE
	msgbox PacifidlogTown_House2_Text_179155, 4
	return

PacifidlogTown_House2_EventScript_1541D7:: @ 81541D7
	msgbox PacifidlogTown_House2_Text_1790C1, 4
	msgbox PacifidlogTown_House2_Text_179155, 4
	return

PacifidlogTown_House2_EventScript_1541E8:: @ 81541E8
	clearflag FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK
	return

PacifidlogTown_House2_EventScript_1541EC:: @ 81541EC
	msgbox PacifidlogTown_House2_Text_179169, 4
	giveitem_std ITEM_TM27_RETURN
	compare RESULT, 0
	goto_if_eq PacifidlogTown_House2_EventScript_1A029B
	setflag FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK
	special SetPacifidlogTMReceivedDay
	msgbox PacifidlogTown_House2_Text_179283, 4
	release
	end

PacifidlogTown_House2_EventScript_15421B:: @ 815421B
	msgbox PacifidlogTown_House2_Text_1791CA, 4
	release
	end

PacifidlogTown_House2_EventScript_154225:: @ 8154225
	msgbox PacifidlogTown_House2_Text_17922D, 4
	giveitem_std ITEM_TM21_FRUSTRATION
	compare RESULT, 0
	goto_if_eq PacifidlogTown_House2_EventScript_1A029B
	setflag FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK
	special SetPacifidlogTMReceivedDay
	msgbox PacifidlogTown_House2_Text_179283, 4
	release
	end

PacifidlogTown_House2_EventScript_154254:: @ 8154254
	specialvar RESULT, GetDaysUntilPacifidlogTMAvailable
	buffernumberstring 0, RESULT
	msgbox PacifidlogTown_House2_Text_1792F2, 4
	release
	end

PacifidlogTown_House2_EventScript_154267:: @ 8154267
	lock
	faceplayer
	waitse
	playmoncry SPECIES_AZURILL, 0
	msgbox PacifidlogTown_House2_Text_17938B, 4
	waitmoncry
	msgbox PacifidlogTown_House2_Text_17939B, 4
	release
	end

PacifidlogTown_House2_EventScript_154282:: @ 8154282
	lock
	faceplayer
	waitse
	playmoncry SPECIES_AZURILL, 2
	msgbox PacifidlogTown_House2_Text_1793CC, 4
	waitmoncry
	msgbox PacifidlogTown_House2_Text_1793DD, 4
	release
	end
