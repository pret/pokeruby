FortreeCity_MapScripts:: @ 814C943
	map_script MAP_SCRIPT_ON_TRANSITION, FortreeCity_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, FortreeCity_OnResume
	.byte 0

FortreeCity_OnTransition:: @ 814C94E
	setflag FLAG_VISITED_FORTREE_CITY
	end

FortreeCity_OnResume:: @ 814C952
	setstepcallback 2
	end

FortreeCity_EventScript_Man:: @ 814C955
	msgbox FortreeCity_Text_YouSmellSinged, MSGBOX_NPC
	end

FortreeCity_EventScript_Woman:: @ 814C95E
	lock
	faceplayer
	goto_if_set FLAG_KECLEON_FLED_FORTREE, FortreeCity_EventScript_WomanGymAccessible
	msgbox FortreeCity_Text_SomethingBlockingGym, MSGBOX_DEFAULT
	release
	end

FortreeCity_EventScript_WomanGymAccessible:: @ 814C973
	msgbox FortreeCity_Text_ThisTimeIllBeatWinona, MSGBOX_DEFAULT
	release
	end

FortreeCity_EventScript_Girl:: @ 814C97D
	msgbox FortreeCity_Text_TreesGrowByDrinkingRainwater, MSGBOX_NPC
	end

FortreeCity_EventScript_OldMan:: @ 814C986
	msgbox FortreeCity_Text_EveryoneHealthyAndLively, MSGBOX_NPC
	end

FortreeCity_EventScript_Boy:: @ 814C98F
	msgbox FortreeCity_Text_BugPokemonComeThroughWindow, MSGBOX_NPC
	end

FortreeCity_EventScript_GameboyKid:: @ 814C998
	msgbox FortreeCity_Text_PokemonThatEvolveWhenTraded, MSGBOX_NPC
	end

FortreeCity_EventScript_CitySign:: @ 814C9A1
	msgbox FortreeCity_Text_CitySign, MSGBOX_SIGN
	end

FortreeCity_EventScript_GymSign:: @ 814C9AA
	msgbox FortreeCity_Text_GymSign, MSGBOX_SIGN
	end

FortreeCity_EventScript_Kecleon:: @ 814C9B3
	lock
	faceplayer
	checkitem ITEM_DEVON_SCOPE, 1
	compare VAR_RESULT, 1
	goto_if_eq FortreeCity_EventScript_AskUseDevonScope
	msgbox FortreeCity_Text_SomethingUnseeable, MSGBOX_DEFAULT
	release
	end

FortreeCity_EventScript_AskUseDevonScope:: @ 814C9CF
	msgbox FortreeCity_Text_UnseeableUseDevonScope, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FortreeCity_EventScript_UseDevonScope
	release
	end

FortreeCity_EventScript_UseDevonScope:: @ 814C9E4
	msgbox FortreeCity_Text_UsedDevonScopePokemonFled, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Movement_KecleonAppears
	waitmovement 0
	waitse
	playmoncry SPECIES_KECLEON, 2
	delay 40
	waitmoncry
	applymovement VAR_LAST_TALKED, FortreeCity_Movement_KecleonFlee
	waitmovement 0
	removeobject VAR_LAST_TALKED
	setflag FLAG_KECLEON_FLED_FORTREE
	release
	end

FortreeCity_Movement_KecleonFlee:: @ 814CA13
	walk_right
	step_end
