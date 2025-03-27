SlateportCity_House2_MapScripts:: @ 815638F
	.byte 0

SlateportCity_House_EventScript_PokefanM:: @ 8156390
	msgbox SlateportCity_House_Text_NatureToDoWithStatGains, MSGBOX_NPC
	end

SlateportCity_House_EventScript_Girl:: @ 8156399
	lock
	faceplayer
	checkitem ITEM_CONTEST_PASS, 1
	compare VAR_RESULT, 1
	goto_if_eq SlateportCity_House_EventScript_HaveContestPass
	msgbox SlateportCity_House_Text_NeedContestPass, MSGBOX_DEFAULT
	release
	end

SlateportCity_House_EventScript_HaveContestPass:: @ 81563B5
	msgbox SlateportCity_House_Text_HaveContestPass, MSGBOX_DEFAULT
	release
	end
