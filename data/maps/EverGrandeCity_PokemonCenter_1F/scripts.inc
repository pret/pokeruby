EverGrandeCity_PokemonCenter_1F_MapScripts:: @ 815BC66
	map_script MAP_SCRIPT_ON_TRANSITION, EverGrandeCity_PokemonCenter_1F_OnTransition
	.byte 0

EverGrandeCity_PokemonCenter_1F_OnTransition:: @ 815BC6C
	setrespawn HEAL_LOCATION_EVER_GRANDE_CITY
	end

EverGrandeCity_PokemonCenter_1F_EventScript_Nurse:: @ 815BC70
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

EverGrandeCity_PokemonCenter_1F_EventScript_Woman:: @ 815BC7E
	msgbox EverGrandeCity_PokemonCenter_1F_Text_LeagueAfterVictoryRoad, MSGBOX_NPC
	end

EverGrandeCity_PokemonCenter_1F_EventScript_ExpertM:: @ 815BC87
	msgbox EverGrandeCity_PokemonCenter_1F_Text_BelieveInYourPokemon, MSGBOX_NPC
	end
