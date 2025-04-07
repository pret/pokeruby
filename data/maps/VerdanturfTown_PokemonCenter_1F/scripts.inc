VerdanturfTown_PokemonCenter_1F_MapScripts:: @ 8153F09
	map_script MAP_SCRIPT_ON_TRANSITION, VerdanturfTown_PokemonCenter_1F_OnTransition
	.byte 0

VerdanturfTown_PokemonCenter_1F_OnTransition:: @ 8153F0F
	setrespawn HEAL_LOCATION_VERDANTURF_TOWN
	call Common_EventScript_UpdateBrineyLocation
	end

VerdanturfTown_PokemonCenter_1F_EventScript_Nurse:: @ 8153F18
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

VerdanturfTown_PokemonCenter_1F_EventScript_Gentleman:: @ 8153F26
	msgbox VerdanturfTown_PokemonCenter_1F_Text_TrainerIsntQualifiedIf, MSGBOX_NPC
	end

VerdanturfTown_PokemonCenter_1F_EventScript_ExpertM:: @ 8153F2F
	msgbox VerdanturfTown_PokemonCenter_1F_Text_AllContestsOriginateHere, MSGBOX_NPC
	end
