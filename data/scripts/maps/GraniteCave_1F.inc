GraniteCave_1F_MapScripts:: @ 815CBA6
	.byte 0

GraniteCave_1F_EventScript_15CBA7:: @ 815CBA7
	lock
	faceplayer
	checkflag 109
	goto_if_eq GraniteCave_1F_EventScript_15CBD3
	msgbox GraniteCave_1F_Text_194917, 4
	giveitem ITEM_HM05
	setflag 109
	msgbox GraniteCave_1F_Text_194A3E, 4
	release
	end

GraniteCave_1F_EventScript_15CBD3:: @ 815CBD3
	msgbox GraniteCave_1F_Text_194A3E, 4
	release
	end
