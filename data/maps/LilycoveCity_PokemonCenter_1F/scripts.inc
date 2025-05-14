LilycoveCity_PokemonCenter_1F_MapScripts:: @ 8159327
	map_script MAP_SCRIPT_ON_TRANSITION, LilycoveCity_PokemonCenter_1F_OnTransition
	.byte 0

LilycoveCity_PokemonCenter_1F_OnTransition:: @ 815932D
	setrespawn HEAL_LOCATION_LILYCOVE_CITY
	end

LilycoveCity_PokemonCenter_1F_EventScript_Nurse:: @ 8159331
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_Boy:: @ 815933F
	msgbox LilycoveCity_PokemonCenter_1F_Text_HowManyKindsOfPokemon, MSGBOX_NPC
	end

LilycoveCity_PokemonCenter_1F_EventScript_Maniac:: @ 8159348
	lock
	faceplayer
	goto_if_set FLAG_BADGE07_GET, LilycoveCity_PokemonCenter_1F_EventScript_ManiacBadTeamGone
	msgbox LilycoveCity_PokemonCenter_1F_Text_HeardAboutRottenScoundrels, MSGBOX_DEFAULT
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_ManiacBadTeamGone:: @ 815935D
	msgbox LilycoveCity_PokemonCenter_1F_Text_HaventSeenRottenScoundrels, MSGBOX_DEFAULT
	release
	end
