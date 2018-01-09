SlateportCity_House1_MapScripts:: @ 815567A
	.byte 0

SlateportCity_House1_EventScript_15567B:: @ 815567B
	lock
	faceplayer
	msgbox SlateportCity_House1_Text_17D46A, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SlateportCity_House1_EventScript_15569C
	compare RESULT, NO
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15569C:: @ 815569C
	msgbox SlateportCity_House1_Text_17D4DB, 4
	special SelectMonForNPCTrade
	waitstate
	compare VAR_SPECIAL_4, 255
	goto_if_ne SlateportCity_House1_EventScript_1556C9
	compare VAR_SPECIAL_4, 255
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_1556BF:: @ 81556BF
	msgbox SlateportCity_House1_Text_17D61E, 4
	release
	end

SlateportCity_House1_EventScript_1556C9:: @ 81556C9
	specialvar RESULT, ScriptGetPartyMonSpecies
	compare RESULT, SPECIES_EGG
	goto_if_eq SlateportCity_House1_EventScript_15571C
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	special TV_CheckMonOTIDEqualsPlayerID
	compare RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_155726
	specialvar RESULT, MonOTNameMatchesPlayer
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	compare RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_155726
	msgbox SlateportCity_House1_Text_17D505, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SlateportCity_House1_EventScript_155730
	compare RESULT, NO
	goto_if_eq SlateportCity_House1_EventScript_1556BF
	end

SlateportCity_House1_EventScript_15571C:: @ 815571C
	msgbox SlateportCity_House1_Text_17D752, 4
	release
	end

SlateportCity_House1_EventScript_155726:: @ 8155726
	msgbox SlateportCity_House1_Text_17D6CC, 4
	release
	end

SlateportCity_House1_EventScript_155730:: @ 8155730
	msgbox SlateportCity_House1_Text_17D580, 4
	call SlateportCity_House1_EventScript_1A0678
	specialvar RESULT, TV_PutNameRaterShowOnTheAirIfNicnkameChanged
	special TV_CopyNicknameToStringVar1AndEnsureTerminated
	compare RESULT, 1
	goto_if_eq SlateportCity_House1_EventScript_15575A
	msgbox SlateportCity_House1_Text_17D63A, 4
	release
	end

SlateportCity_House1_EventScript_15575A:: @ 815575A
	msgbox SlateportCity_House1_Text_17D5B0, 4
	release
	end
