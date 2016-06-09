SootopolisCity_House4_MapScripts:: @ 815B34C
	.byte 0

SootopolisCity_House4_EventScript_15B34D:: @ 815B34D
	loadptr 0, SootopolisCity_House4_Text_18FC92
	callstd 2
	end

SootopolisCity_House4_EventScript_15B356:: @ 815B356
	loadptr 0, SootopolisCity_House4_Text_18FD41
	callstd 2
	end

SootopolisCity_House4_EventScript_15B35F:: @ 815B35F
	lock
	faceplayer
	checksound
	pokecry SPECIES_AZUMARILL, 0
	loadptr 0, SootopolisCity_House4_Text_18FDD8
	callstd 4
	waitpokecry
	release
	end

