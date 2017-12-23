SootopolisCity_House1_MapScripts:: @ 815B29A
	.byte 0

SootopolisCity_House1_EventScript_15B29B:: @ 815B29B
	lock
	faceplayer
	checkflag FLAG_RECEIVED_TM31
	goto_if_eq SootopolisCity_House1_EventScript_15B2C7
	msgbox SootopolisCity_House1_Text_18F991, 4
	giveitem_std ITEM_TM31
	setflag FLAG_RECEIVED_TM31
	msgbox SootopolisCity_House1_Text_18FA03, 4
	release
	end

SootopolisCity_House1_EventScript_15B2C7:: @ 815B2C7
	msgbox SootopolisCity_House1_Text_18FA03, 4
	release
	end

SootopolisCity_House1_EventScript_15B2D1:: @ 815B2D1
	lock
	faceplayer
	waitse
	playmoncry SPECIES_KECLEON, 0
	msgbox SootopolisCity_House1_Text_18FA50, 4
	waitmoncry
	release
	end
