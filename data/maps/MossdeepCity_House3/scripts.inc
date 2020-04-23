MossdeepCity_House3_MapScripts:: @ 815A971
	.byte 0

MossdeepCity_House3_EventScript_15A972:: @ 815A972
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_SUPER_ROD, MossdeepCity_House3_EventScript_15A9B1
	msgbox MossdeepCity_House3_Text_18D909, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq MossdeepCity_House3_EventScript_15A9BB
	msgbox MossdeepCity_House3_Text_18D9A9, MSGBOX_DEFAULT
	giveitem ITEM_SUPER_ROD
	setflag FLAG_RECEIVED_SUPER_ROD
	msgbox MossdeepCity_House3_Text_18D9E3, MSGBOX_DEFAULT
	release
	end

MossdeepCity_House3_EventScript_15A9B1:: @ 815A9B1
	msgbox MossdeepCity_House3_Text_18DA44, MSGBOX_DEFAULT
	release
	end

MossdeepCity_House3_EventScript_15A9BB:: @ 815A9BB
	msgbox MossdeepCity_House3_Text_18DA26, MSGBOX_DEFAULT
	release
	end
