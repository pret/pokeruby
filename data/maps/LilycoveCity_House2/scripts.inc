LilycoveCity_House2_MapScripts:: @ 8159BA2
	.byte 0

LilycoveCity_House2_EventScript_FatMan:: @ 8159BA3
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM44, LilycoveCity_House2_EventScript_ReceivedRest
	msgbox LilycoveCity_House2_Text_NotAwakeYetHaveThis, MSGBOX_DEFAULT
	giveitem ITEM_TM44_REST
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_TM44
	msgbox LilycoveCity_House2_Text_SleepIsEssential, MSGBOX_DEFAULT
	release
	end

LilycoveCity_House2_EventScript_ReceivedRest:: @ 8159BDA
	msgbox LilycoveCity_House2_Text_SleepIsEssential, MSGBOX_DEFAULT
	release
	end
