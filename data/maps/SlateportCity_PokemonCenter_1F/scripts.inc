SlateportCity_PokemonCenter_1F_MapScripts:: @ 81563BF
	map_script MAP_SCRIPT_ON_TRANSITION, SlateportCity_PokemonCenter_1F_MapScript1_1563C5
	.byte 0

SlateportCity_PokemonCenter_1F_MapScript1_1563C5:: @ 81563C5
	setrespawn HEAL_LOCATION_SLATEPORT_CITY
	call Common_EventScript_UpdateBrineyLocation
	end

SlateportCity_PokemonCenter_1F_EventScript_1563CE:: @ 81563CE
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

SlateportCity_PokemonCenter_1F_EventScript_1563DC:: @ 81563DC
	msgbox SlateportCity_PokemonCenter_1F_Text_180602, MSGBOX_NPC
	end

SlateportCity_PokemonCenter_1F_EventScript_1563E5:: @ 81563E5
	msgbox SlateportCity_PokemonCenter_1F_Text_1806CB, MSGBOX_NPC
	end
