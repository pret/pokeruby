DewfordTown_PokemonCenter_1F_MapScripts:: @ 8153014
	map_script MAP_SCRIPT_ON_TRANSITION, DewfordTown_PokemonCenter_1F_MapScript1_15301A
	.byte 0

DewfordTown_PokemonCenter_1F_MapScript1_15301A:: @ 815301A
	setrespawn HEAL_LOCATION_DEWFORD_TOWN
	call Common_EventScript_UpdateBrineyLocation
	end

DewfordTown_PokemonCenter_1F_EventScript_153023:: @ 8153023
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

DewfordTown_PokemonCenter_1F_EventScript_153031:: @ 8153031
	msgbox DewfordTown_PokemonCenter_1F_Text_174CDB, MSGBOX_NPC
	end

DewfordTown_PokemonCenter_1F_EventScript_15303A:: @ 815303A
	msgbox DewfordTown_PokemonCenter_1F_Text_174D32, MSGBOX_NPC
	end
