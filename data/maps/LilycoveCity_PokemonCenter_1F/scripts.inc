LilycoveCity_PokemonCenter_1F_MapScripts:: @ 8159327
	map_script MAP_SCRIPT_ON_TRANSITION, LilycoveCity_PokemonCenter_1F_MapScript1_15932D
	.byte 0

LilycoveCity_PokemonCenter_1F_MapScript1_15932D:: @ 815932D
	setrespawn HEAL_LOCATION_LILYCOVE_CITY
	end

LilycoveCity_PokemonCenter_1F_EventScript_159331:: @ 8159331
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_15933F:: @ 815933F
	msgbox LilycoveCity_PokemonCenter_1F_Text_189FC9, MSGBOX_NPC
	end

LilycoveCity_PokemonCenter_1F_EventScript_159348:: @ 8159348
	lock
	faceplayer
	goto_if_set FLAG_BADGE07_GET, LilycoveCity_PokemonCenter_1F_EventScript_15935D
	msgbox LilycoveCity_PokemonCenter_1F_Text_18A048, MSGBOX_DEFAULT
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_15935D:: @ 815935D
	msgbox LilycoveCity_PokemonCenter_1F_Text_18A0A1, MSGBOX_DEFAULT
	release
	end
