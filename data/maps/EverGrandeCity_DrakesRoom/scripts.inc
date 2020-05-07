EverGrandeCity_DrakesRoom_MapScripts:: @ 815B70D
	map_script MAP_SCRIPT_ON_FRAME_TABLE, EverGrandeCity_DrakesRoom_MapScript2_15B72C
	map_script MAP_SCRIPT_ON_LOAD, EverGrandeCity_DrakesRoom_MapScript1_15B743
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_DrakesRoom_MapScript2_15B570
	.byte 0

@ 815B71D
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_DrakesRoom_EventScript_15B727
	.2byte 0

EverGrandeCity_DrakesRoom_EventScript_15B727:: @ 815B727
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

EverGrandeCity_DrakesRoom_MapScript2_15B72C:: @ 815B72C
	map_script_2 VAR_ELITE_4_STATE, 3, EverGrandeCity_DrakesRoom_EventScript_15B736
	.2byte 0

EverGrandeCity_DrakesRoom_EventScript_15B736:: @ 815B736
	lockall
	call PokemonLeague_EliteFour_EventScript_WalkInCloseDoor
	setvar VAR_ELITE_4_STATE, 4
	releaseall
	end

EverGrandeCity_DrakesRoom_MapScript1_15B743:: @ 815B743
	call_if_set FLAG_DEFEATED_ELITE_4_DRAKE, EverGrandeCity_DrakesRoom_EventScript_15B758
	compare VAR_ELITE_4_STATE, 4
	call_if_eq EverGrandeCity_DrakesRoom_EventScript_15B75E
	end

EverGrandeCity_DrakesRoom_EventScript_15B758:: @ 815B758
	call PokemonLeague_EliteFour_EventScript_ResetAdvanceToNextRoom
	return

EverGrandeCity_DrakesRoom_EventScript_15B75E:: @ 815B75E
	call PokemonLeague_EliteFour_EventScript_CloseDoor
	return

EverGrandeCity_DrakesRoom_EventScript_15B764:: @ 815B764
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_ELITE_4_DRAKE, EverGrandeCity_DrakesRoom_EventScript_15B78B
	playbgm MUS_SITENNOU, FALSE
	msgbox EverGrandeCity_DrakesRoom_Text_190CEB, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_DRAKE, EverGrandeCity_DrakesRoom_Text_190E42
	goto EverGrandeCity_DrakesRoom_EventScript_15B795
	end

EverGrandeCity_DrakesRoom_EventScript_15B78B:: @ 815B78B
	msgbox EverGrandeCity_DrakesRoom_Text_190E5D, MSGBOX_DEFAULT
	release
	end

EverGrandeCity_DrakesRoom_EventScript_15B795:: @ 815B795
	setvar VAR_0x8004, 0
	special sub_810FF60
	setflag FLAG_DEFEATED_ELITE_4_DRAKE
	call PokemonLeague_EliteFour_SetAdvanceToNextRoomMetatiles
	msgbox EverGrandeCity_DrakesRoom_Text_190E5D, MSGBOX_DEFAULT
	release
	end
