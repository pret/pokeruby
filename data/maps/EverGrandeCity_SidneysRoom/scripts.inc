EverGrandeCity_SidneysRoom_MapScripts:: @ 815B53F
	map_script MAP_SCRIPT_ON_LOAD, EverGrandeCity_SidneysRoom_MapScript1_15B54F
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_SidneysRoom_MapScript2_15B570
	map_script MAP_SCRIPT_ON_FRAME_TABLE, EverGrandeCity_SidneysRoom_MapScript2_15B57F
	.byte 0

EverGrandeCity_SidneysRoom_MapScript1_15B54F:: @ 815B54F
	call_if_set FLAG_DEFEATED_ELITE_4_SYDNEY, EverGrandeCity_SidneysRoom_EventScript_15B564
	compare VAR_ELITE_4_STATE, 1
	call_if_eq EverGrandeCity_SidneysRoom_EventScript_15B56A
	end

EverGrandeCity_SidneysRoom_EventScript_15B564:: @ 815B564
	call PokemonLeague_EliteFour_EventScript_ResetAdvanceToNextRoom
	return

EverGrandeCity_SidneysRoom_EventScript_15B56A:: @ 815B56A
	call PokemonLeague_EliteFour_EventScript_CloseDoor
	return

EverGrandeCity_SidneysRoom_OnWarp:: @ 815B570
EverGrandeCity_SidneysRoom_MapScript2_15B570:: @ 815B570
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_SidneysRoom_EventScript_15B57A
	.2byte 0

EverGrandeCity_SidneysRoom_EventScript_15B57A:: @ 815B57A
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

EverGrandeCity_SidneysRoom_MapScript2_15B57F:: @ 815B57F
	map_script_2 VAR_ELITE_4_STATE, 0, EverGrandeCity_SidneysRoom_EventScript_15B589
	.2byte 0

EverGrandeCity_SidneysRoom_EventScript_15B589:: @ 815B589
	lockall
	call PokemonLeague_EliteFour_EventScript_WalkInCloseDoor
	setvar VAR_ELITE_4_STATE, 1
	releaseall
	end

EverGrandeCity_SidneysRoom_EventScript_15B596:: @ 815B596
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_ELITE_4_SYDNEY, EverGrandeCity_SidneysRoom_EventScript_15B5BD
	playbgm MUS_ENCOUNTER_ELITE_FOUR, FALSE
	msgbox EverGrandeCity_SidneysRoom_Text_190728, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_SIDNEY, EverGrandeCity_SidneysRoom_Text_190823
	goto EverGrandeCity_SidneysRoom_EventScript_15B5C7
	end

EverGrandeCity_SidneysRoom_EventScript_15B5BD:: @ 815B5BD
	msgbox EverGrandeCity_SidneysRoom_Text_19086D, MSGBOX_DEFAULT
	release
	end

EverGrandeCity_SidneysRoom_EventScript_15B5C7:: @ 815B5C7
	setflag FLAG_DEFEATED_ELITE_4_SYDNEY
	call PokemonLeague_EliteFour_SetAdvanceToNextRoomMetatiles
	msgbox EverGrandeCity_SidneysRoom_Text_19086D, MSGBOX_DEFAULT
	release
	end
