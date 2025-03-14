FallarborTown_PokemonCenter_1F_MapScripts:: @ 8153AF3
	map_script MAP_SCRIPT_ON_TRANSITION, FallarborTown_PokemonCenter_1F_OnTransition
	.byte 0

FallarborTown_PokemonCenter_1F_OnTransition:: @ 8153AF9
	setrespawn HEAL_LOCATION_FALLARBOR_TOWN
	call Common_EventScript_UpdateBrineyLocation
	end

FallarborTown_PokemonCenter_1F_EventScript_Nurse:: @ 8153B02
	setvar VAR_0x800B, 1
	call Common_EventScript_PkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end

FallarborTown_PokemonCenter_1F_EventScript_Girl:: @ 8153B10
	msgbox FallarborTown_PokemonCenter_1F_Text_FossilManiacEdgeOfTown, MSGBOX_NPC
	end

FallarborTown_PokemonCenter_1F_EventScript_ExpertM:: @ 8153B19
	msgbox FallarborTown_PokemonCenter_1F_Text_PlantHardyTrees, MSGBOX_NPC
	end

FallarborTown_PokemonCenter_1F_EventScript_Lanette:: @ 8153B22
	lock
	faceplayer
	msgbox FallarborTown_PokemonCenter_1F_Text_LanetteGreeting, MSGBOX_DEFAULT
	closemessage
	switch VAR_FACING
	case 2, FallarborTown_PokemonCenter_1F_EventScript_LanetteExitNorth
	case 3, FallarborTown_PokemonCenter_1F_EventScript_LanetteExitWest
	end

FallarborTown_PokemonCenter_1F_EventScript_LanetteExitNorth:: @ 8153B49
	applymovement 4, FallarborTown_PokemonCenter_1F_Movement_LanetteExitNorth
	waitmovement 0
	goto FallarborTown_PokemonCenter_1F_EventScript_LanetteExited
	end

FallarborTown_PokemonCenter_1F_EventScript_LanetteExitWest:: @ 8153B59
	applymovement 4, FallarborTown_PokemonCenter_1F_Movement_LanetteExitWest
	waitmovement 0
	goto FallarborTown_PokemonCenter_1F_EventScript_LanetteExited
	end

FallarborTown_PokemonCenter_1F_EventScript_LanetteExited:: @ 8153B69
	playse SE_SLIDING_DOOR
	removeobject 4
	clearflag FLAG_HIDE_LANETTE
	release
	end

FallarborTown_PokemonCenter_1F_Movement_LanetteExitNorth:: @ 8153B74
	walk_right
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	step_end

FallarborTown_PokemonCenter_1F_Movement_LanetteExitWest:: @ 8153B81
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	step_end
