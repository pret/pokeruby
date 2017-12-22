SootopolisCity_PokemonCenter_1F_MapScripts:: @ 815B190
	map_script 3, SootopolisCity_PokemonCenter_1F_MapScript1_15B196
	.byte 0

SootopolisCity_PokemonCenter_1F_MapScript1_15B196:: @ 815B196
	setrespawn 10
	end

@ 815B19A
	setvar 0x800B, 1
	call VerdanturfTown_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

SootopolisCity_PokemonCenter_1F_EventScript_15B1A8:: @ 815B1A8
	lock
	faceplayer
	checkflag FLAG_LEGENDARY_BATTLE_COMPLETED
	goto_if_eq SootopolisCity_PokemonCenter_1F_EventScript_15B1C6
	checkflag FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN
	goto_if 0, SootopolisCity_PokemonCenter_1F_EventScript_15B1C6
	msgbox SootopolisCity_PokemonCenter_1F_Text_18F770, 4
	release
	end

SootopolisCity_PokemonCenter_1F_EventScript_15B1C6:: @ 815B1C6
	msgbox SootopolisCity_PokemonCenter_1F_Text_18F6A2, 4
	release
	end

SootopolisCity_PokemonCenter_1F_EventScript_15B1D0:: @ 815B1D0
	lock
	faceplayer
	checkflag FLAG_LEGENDARY_BATTLE_COMPLETED
	goto_if_eq SootopolisCity_PokemonCenter_1F_EventScript_15B1EE
	checkflag FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN
	goto_if 0, SootopolisCity_PokemonCenter_1F_EventScript_15B1EE
	msgbox SootopolisCity_PokemonCenter_1F_Text_18F860, 4
	release
	end

SootopolisCity_PokemonCenter_1F_EventScript_15B1EE:: @ 815B1EE
	msgbox SootopolisCity_PokemonCenter_1F_Text_18F7EA, 4
	release
	end
