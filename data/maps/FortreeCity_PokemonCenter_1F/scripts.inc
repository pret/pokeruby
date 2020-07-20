FortreeCity_PokemonCenter_1F_MapScripts:: @ 8158011
	map_script MAP_SCRIPT_ON_TRANSITION, FortreeCity_PokemonCenter_1F_MapScript1_158017
	.byte 0

FortreeCity_PokemonCenter_1F_MapScript1_158017:: @ 8158017
	setrespawn HEAL_LOCATION_FORTREE_CITY
	end

FortreeCity_PokemonCenter_1F_EventScript_15801B:: @ 815801B
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

FortreeCity_PokemonCenter_1F_EventScript_158029:: @ 8158029
	msgbox FortreeCity_PokemonCenter_1F_Text_186027, MSGBOX_NPC
	end

FortreeCity_PokemonCenter_1F_EventScript_158032:: @ 8158032
	msgbox FortreeCity_PokemonCenter_1F_Text_186086, MSGBOX_NPC
	end

FortreeCity_PokemonCenter_1F_EventScript_15803B:: @ 815803B
	msgbox FortreeCity_PokemonCenter_1F_Text_186138, MSGBOX_NPC
	end
