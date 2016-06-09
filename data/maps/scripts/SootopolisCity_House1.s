SootopolisCity_House1_MapScripts:: @ 815B29A
	.byte 0

SootopolisCity_House1_EventScript_15B29B:: @ 815B29B
	lock
	faceplayer
	checkflag 121
	jumpeq SootopolisCity_House1_EventScript_15B2C7
	loadptr 0, SootopolisCity_House1_Text_18F991
	callstd 4
	setorcopyvar 0x8000, 0x13f
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 121
	loadptr 0, SootopolisCity_House1_Text_18FA03
	callstd 4
	release
	end

SootopolisCity_House1_EventScript_15B2C7:: @ 815B2C7
	loadptr 0, SootopolisCity_House1_Text_18FA03
	callstd 4
	release
	end

SootopolisCity_House1_EventScript_15B2D1:: @ 815B2D1
	lock
	faceplayer
	checksound
	pokecry SPECIES_KECLEON, 0
	loadptr 0, SootopolisCity_House1_Text_18FA50
	callstd 4
	waitpokecry
	release
	end

