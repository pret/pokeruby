PacifidlogTown_House2_MapScripts:: @ 8154167
	.byte 0

PacifidlogTown_House2_EventScript_154168:: @ 8154168
	lock
	faceplayer
	dotimebasedevents
	call PacifidlogTown_House2_EventScript_1541B4
	goto_if_set FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK, PacifidlogTown_House2_EventScript_154254
	call_if_set FLAG_MET_FANCLUB_YOUNGER_BROTHER, PacifidlogTown_House2_EventScript_1541CE
	call_if_unset FLAG_MET_FANCLUB_YOUNGER_BROTHER, PacifidlogTown_House2_EventScript_1541D7
	setflag FLAG_MET_FANCLUB_YOUNGER_BROTHER
	specialvar VAR_RESULT, GetLeadMonFriendshipScore
	compare VAR_RESULT, 4
	goto_if_ge PacifidlogTown_House2_EventScript_1541EC
	specialvar VAR_RESULT, GetLeadMonFriendshipScore
	compare VAR_RESULT, 2
	goto_if_ge PacifidlogTown_House2_EventScript_15421B
	goto PacifidlogTown_House2_EventScript_154225
	end

PacifidlogTown_House2_EventScript_1541B4:: @ 81541B4
	goto_if_unset FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK, Common_EventScript_Return
	specialvar VAR_RESULT, GetDaysUntilPacifidlogTMAvailable
	compare VAR_RESULT, 0
	call_if_eq PacifidlogTown_House2_EventScript_1541E8
	return

PacifidlogTown_House2_EventScript_1541CE:: @ 81541CE
	msgbox PacifidlogTown_House2_Text_179155, MSGBOX_DEFAULT
	return

PacifidlogTown_House2_EventScript_1541D7:: @ 81541D7
	msgbox PacifidlogTown_House2_Text_1790C1, MSGBOX_DEFAULT
	msgbox PacifidlogTown_House2_Text_179155, MSGBOX_DEFAULT
	return

PacifidlogTown_House2_EventScript_1541E8:: @ 81541E8
	clearflag FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK
	return

PacifidlogTown_House2_EventScript_1541EC:: @ 81541EC
	msgbox PacifidlogTown_House2_Text_179169, MSGBOX_DEFAULT
	giveitem ITEM_TM27_RETURN
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK
	special SetPacifidlogTMReceivedDay
	msgbox PacifidlogTown_House2_Text_179283, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House2_EventScript_15421B:: @ 815421B
	msgbox PacifidlogTown_House2_Text_1791CA, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House2_EventScript_154225:: @ 8154225
	msgbox PacifidlogTown_House2_Text_17922D, MSGBOX_DEFAULT
	giveitem ITEM_TM21_FRUSTRATION
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_FANCLUB_TM_THIS_WEEK
	special SetPacifidlogTMReceivedDay
	msgbox PacifidlogTown_House2_Text_179283, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House2_EventScript_154254:: @ 8154254
	specialvar VAR_RESULT, GetDaysUntilPacifidlogTMAvailable
	buffernumberstring 0, VAR_RESULT
	msgbox PacifidlogTown_House2_Text_1792F2, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House2_EventScript_154267:: @ 8154267
	lock
	faceplayer
	waitse
	playmoncry SPECIES_AZURILL, 0
	msgbox PacifidlogTown_House2_Text_17938B, MSGBOX_DEFAULT
	waitmoncry
	msgbox PacifidlogTown_House2_Text_17939B, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House2_EventScript_154282:: @ 8154282
	lock
	faceplayer
	waitse
	playmoncry SPECIES_AZURILL, 2
	msgbox PacifidlogTown_House2_Text_1793CC, MSGBOX_DEFAULT
	waitmoncry
	msgbox PacifidlogTown_House2_Text_1793DD, MSGBOX_DEFAULT
	release
	end
