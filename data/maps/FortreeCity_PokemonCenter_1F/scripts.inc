FortreeCity_PokemonCenter_1F_MapScripts:: @ 8158011
	map_script 3, FortreeCity_PokemonCenter_1F_MapScript1_158017
	.byte 0

FortreeCity_PokemonCenter_1F_MapScript1_158017:: @ 8158017
	setrespawn HEAL_LOCATION_FORTREE_CITY
	end

FortreeCity_PokemonCenter_1F_EventScript_15801B:: @ 815801B
	setvar VAR_SPECIAL_B, 1
	call FortreeCity_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

FortreeCity_PokemonCenter_1F_EventScript_158029:: @ 8158029
	msgbox FortreeCity_PokemonCenter_1F_Text_186027, 2
	end

FortreeCity_PokemonCenter_1F_EventScript_158032:: @ 8158032
	msgbox FortreeCity_PokemonCenter_1F_Text_186086, 2
	end

FortreeCity_PokemonCenter_1F_EventScript_15803B:: @ 815803B
	msgbox FortreeCity_PokemonCenter_1F_Text_186138, 2
	end
