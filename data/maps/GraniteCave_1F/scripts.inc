GraniteCave_1F_MapScripts:: @ 815CBA6
	.byte 0

GraniteCave_1F_EventScript_15CBA7:: @ 815CBA7
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_HM05, GraniteCave_1F_EventScript_15CBD3
	msgbox GraniteCave_1F_Text_194917, MSGBOX_DEFAULT
	giveitem ITEM_HM05_FLASH
	setflag FLAG_RECEIVED_HM05
	msgbox GraniteCave_1F_Text_194A3E, MSGBOX_DEFAULT
	release
	end

GraniteCave_1F_EventScript_15CBD3:: @ 815CBD3
	msgbox GraniteCave_1F_Text_194A3E, MSGBOX_DEFAULT
	release
	end
