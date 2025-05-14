DewfordTown_PokemonCenter_1F_MapScripts:: @ 8153014
	map_script MAP_SCRIPT_ON_TRANSITION, DewfordTown_PokemonCenter_1F_OnTransition
	.byte 0

DewfordTown_PokemonCenter_1F_OnTransition:: @ 815301A
	setrespawn HEAL_LOCATION_DEWFORD_TOWN
	call Common_EventScript_UpdateBrineyLocation
	end

DewfordTown_PokemonCenter_1F_EventScript_Nurse:: @ 8153023
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

DewfordTown_PokemonCenter_1F_EventScript_PokefanF:: @ 8153031
	msgbox DewfordTown_PokemonCenter_1F_Text_StoneCavern, MSGBOX_NPC
	end

DewfordTown_PokemonCenter_1F_EventScript_Man:: @ 815303A
	msgbox DewfordTown_PokemonCenter_1F_Text_FaintedMonCanUseHM, MSGBOX_NPC
	end
