EverGrandeCity_PhoebesRoom_MapScripts:: @ 815B5D9
	map_script MAP_SCRIPT_ON_LOAD, EverGrandeCity_PhoebesRoom_MapScript1_15B60F
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_PhoebesRoom_MapScript2_15B5E9
	map_script MAP_SCRIPT_ON_FRAME_TABLE, EverGrandeCity_PhoebesRoom_MapScript2_15B5F8
	.byte 0

EverGrandeCity_PhoebesRoom_MapScript2_15B5E9:: @ 815B5E9
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_PhoebesRoom_EventScript_15B5F3
	.2byte 0

EverGrandeCity_PhoebesRoom_EventScript_15B5F3:: @ 815B5F3
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

EverGrandeCity_PhoebesRoom_MapScript2_15B5F8:: @ 815B5F8
	map_script_2 VAR_ELITE_4_STATE, 1, EverGrandeCity_PhoebesRoom_EventScript_15B602
	.2byte 0

EverGrandeCity_PhoebesRoom_EventScript_15B602:: @ 815B602
	lockall
	call PokemonLeague_EliteFour_EventScript_WalkInCloseDoor
	setvar VAR_ELITE_4_STATE, 2
	releaseall
	end

EverGrandeCity_PhoebesRoom_MapScript1_15B60F:: @ 815B60F
	call_if_set FLAG_DEFEATED_ELITE_4_PHOEBE, EverGrandeCity_PhoebesRoom_EventScript_15B624
	compare VAR_ELITE_4_STATE, 2
	call_if_eq EverGrandeCity_PhoebesRoom_EventScript_15B62A
	end

EverGrandeCity_PhoebesRoom_EventScript_15B624:: @ 815B624
	call PokemonLeague_EliteFour_EventScript_ResetAdvanceToNextRoom
	return

EverGrandeCity_PhoebesRoom_EventScript_15B62A:: @ 815B62A
	call PokemonLeague_EliteFour_EventScript_CloseDoor
	return

EverGrandeCity_PhoebesRoom_EventScript_15B630:: @ 815B630
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_ELITE_4_PHOEBE, EverGrandeCity_PhoebesRoom_EventScript_15B657
	playbgm MUS_SITENNOU, FALSE
	msgbox EverGrandeCity_PhoebesRoom_Text_1908F5, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_PHOEBE, EverGrandeCity_PhoebesRoom_Text_190A0C
	goto EverGrandeCity_PhoebesRoom_EventScript_15B661
	end

EverGrandeCity_PhoebesRoom_EventScript_15B657:: @ 815B657
	msgbox EverGrandeCity_PhoebesRoom_Text_190A2A, MSGBOX_DEFAULT
	release
	end

EverGrandeCity_PhoebesRoom_EventScript_15B661:: @ 815B661
	setflag FLAG_DEFEATED_ELITE_4_PHOEBE
	call PokemonLeague_EliteFour_SetAdvanceToNextRoomMetatiles
	msgbox EverGrandeCity_PhoebesRoom_Text_190A2A, MSGBOX_DEFAULT
	release
	end
