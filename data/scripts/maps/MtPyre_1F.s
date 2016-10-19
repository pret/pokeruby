MtPyre_1F_MapScripts:: @ 815D322
	.byte 0

MtPyre_1F_EventScript_15D323:: @ 815D323
	lock
	faceplayer
	checkflag 282
	jumpif FLAG_IS_SET, MtPyre_1F_EventScript_15D352
	msgbox MtPyre_1F_Text_196151, 4
	giveitem ITEM_CLEANSE_TAG
	compare RESULT, 0
	jumpif EQUAL, MtPyre_1F_EventScript_1A029B
	setflag 282
	release
	end

MtPyre_1F_EventScript_15D352:: @ 815D352
	msgbox MtPyre_1F_Text_1961CE, 4
	release
	end

MtPyre_1F_EventScript_15D35C:: @ 815D35C
	msgbox MtPyre_1F_Text_196218, 2
	end

MtPyre_1F_EventScript_15D365:: @ 815D365
	msgbox MtPyre_1F_Text_196283, 2
	end
