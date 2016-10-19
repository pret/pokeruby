SootopolisCity_House1_MapScripts:: @ 815B29A
	.byte 0

SootopolisCity_House1_EventScript_15B29B:: @ 815B29B
	lock
	faceplayer
	checkflag 121
	jumpif FLAG_IS_SET, SootopolisCity_House1_EventScript_15B2C7
	msgbox SootopolisCity_House1_Text_18F991, 4
	giveitem ITEM_TM31
	setflag 121
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
	checksound
	pokecry SPECIES_KECLEON, 0
	msgbox SootopolisCity_House1_Text_18FA50, 4
	waitpokecry
	release
	end
