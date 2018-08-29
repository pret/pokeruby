EverGrandeCity_PokemonCenter_1F_MapScripts:: @ 815BC66
	map_script 3, EverGrandeCity_PokemonCenter_1F_MapScript1_15BC6C
	.byte 0

EverGrandeCity_PokemonCenter_1F_MapScript1_15BC6C:: @ 815BC6C
	setrespawn HEAL_LOCATION_EVER_GRANDE_CITY_1
	end

EverGrandeCity_PokemonCenter_1F_EventScript_15BC70:: @ 815BC70
SootopolisCity_PokemonCenter_1F_EventScript_15BC70:: @ 815BC70
	setvar VAR_SPECIAL_B, 1
	call SootopolisCity_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

EverGrandeCity_PokemonCenter_1F_EventScript_15BC7E:: @ 815BC7E
	msgbox EverGrandeCity_PokemonCenter_1F_Text_191967, 2
	end

EverGrandeCity_PokemonCenter_1F_EventScript_15BC87:: @ 815BC87
	msgbox EverGrandeCity_PokemonCenter_1F_Text_1919EF, 2
	end
