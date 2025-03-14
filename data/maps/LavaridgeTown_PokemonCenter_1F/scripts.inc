LavaridgeTown_PokemonCenter_1F_MapScripts:: @ 815390C
	map_script MAP_SCRIPT_ON_TRANSITION, LavaridgeTown_PokemonCenter_1F_OnTransition
	.byte 0

LavaridgeTown_PokemonCenter_1F_OnTransition:: @ 8153912
	setrespawn HEAL_LOCATION_LAVARIDGE_TOWN
	call Common_EventScript_UpdateBrineyLocation
	end

LavaridgeTown_PokemonCenter_1F_EventScript_Nurse:: @ 815391B
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

LavaridgeTown_PokemonCenter_1F_EventScript_Youngster:: @ 8153929
	msgbox LavaridgeTown_PokemonCenter_1F_Text_HotSpringCanInvigorate, MSGBOX_NPC
	end

LavaridgeTown_PokemonCenter_1F_EventScript_Woman:: @ 8153932
	msgbox LavaridgeTown_PokemonCenter_1F_Text_TrainersPokemonSpendTimeTogether, MSGBOX_NPC
	end

LavaridgeTown_PokemonCenter_1F_EventScript_Gentleman:: @ 815393B
	msgbox LavaridgeTown_PokemonCenter_1F_Text_TrainersShouldRestToo, MSGBOX_NPC
	end
