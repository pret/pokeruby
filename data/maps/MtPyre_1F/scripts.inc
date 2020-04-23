MtPyre_1F_MapScripts:: @ 815D322
	.byte 0

MtPyre_1F_EventScript_15D323:: @ 815D323
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_CLEANSE_TAG, MtPyre_1F_EventScript_15D352
	msgbox MtPyre_1F_Text_196151, MSGBOX_DEFAULT
	giveitem ITEM_CLEANSE_TAG
	compare VAR_RESULT, 0
	goto_if_eq MtPyre_1F_EventScript_1A029B
	setflag FLAG_RECEIVED_CLEANSE_TAG
	release
	end

MtPyre_1F_EventScript_15D352:: @ 815D352
	msgbox MtPyre_1F_Text_1961CE, MSGBOX_DEFAULT
	release
	end

MtPyre_1F_EventScript_15D35C:: @ 815D35C
	msgbox MtPyre_1F_Text_196218, MSGBOX_NPC
	end

MtPyre_1F_EventScript_15D365:: @ 815D365
	msgbox MtPyre_1F_Text_196283, MSGBOX_NPC
	end
