SlateportCity_House1_MapScripts:: @ 815567A
	.byte 0

SlateportCity_House1_EventScript_15567B:: @ 815567B
	lock
	faceplayer
	msgbox SlateportCity_House1_Text_17D46A, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_House1_EventScript_15569C
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15569C:: @ 815569C
	msgbox SlateportCity_House1_Text_17D4DB, MSGBOX_DEFAULT
	special SelectMonForNPCTrade
	waitstate
	compare VAR_0x8004, 255
	goto_if_ne SlateportCity_House1_EventScript_1556C9
	compare VAR_0x8004, 255
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_1556BF:: @ 81556BF
	msgbox SlateportCity_House1_Text_17D61E, MSGBOX_DEFAULT
	release
	end

SlateportCity_House1_EventScript_1556C9:: @ 81556C9
	specialvar VAR_RESULT, ScriptGetPartyMonSpecies
	compare VAR_RESULT, SPECIES_EGG
	goto_if_eq SlateportCity_House1_EventScript_15571C
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	special TV_CheckMonOTIDEqualsPlayerID
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_155726
	specialvar VAR_RESULT, MonOTNameMatchesPlayer
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_155726
	msgbox SlateportCity_House1_Text_17D505, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_House1_EventScript_155730
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15571C:: @ 815571C
	msgbox SlateportCity_House1_Text_17D752, MSGBOX_DEFAULT
	release
	end

SlateportCity_House1_EventScript_155726:: @ 8155726
	msgbox SlateportCity_House1_Text_17D6CC, MSGBOX_DEFAULT
	release
	end

SlateportCity_House1_EventScript_155730:: @ 8155730
	msgbox SlateportCity_House1_Text_17D580, MSGBOX_DEFAULT
	call Common_EventScript_NameReceivedPartyMon
	specialvar VAR_RESULT, TV_PutNameRaterShowOnTheAirIfNicnkameChanged
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_15575A
	msgbox SlateportCity_House1_Text_17D63A, MSGBOX_DEFAULT
	release
	end

SlateportCity_House1_EventScript_15575A:: @ 815575A
	msgbox SlateportCity_House1_Text_17D5B0, MSGBOX_DEFAULT
	release
	end
