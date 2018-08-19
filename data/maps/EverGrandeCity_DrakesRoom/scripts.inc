EverGrandeCity_DrakesRoom_MapScripts:: @ 815B70D
	map_script 2, EverGrandeCity_DrakesRoom_MapScript2_15B72C
	map_script 1, EverGrandeCity_DrakesRoom_MapScript1_15B743
	map_script 4, EverGrandeCity_DrakesRoom_MapScript2_15B570
	.byte 0

@ 815B71D
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_DrakesRoom_EventScript_15B727
	.2byte 0

EverGrandeCity_DrakesRoom_EventScript_15B727:: @ 815B727
	turnobject 255, 2
	end

EverGrandeCity_DrakesRoom_MapScript2_15B72C:: @ 815B72C
	map_script_2 VAR_ELITE_4_STATE, 3, EverGrandeCity_DrakesRoom_EventScript_15B736
	.2byte 0

EverGrandeCity_DrakesRoom_EventScript_15B736:: @ 815B736
	lockall
	call EverGrandeCity_DrakesRoom_EventScript_1A0710
	setvar VAR_ELITE_4_STATE, 4
	releaseall
	end

EverGrandeCity_DrakesRoom_MapScript1_15B743:: @ 815B743
	call_if_set FLAG_DEFEATED_ELITE_4_DRAKE, EverGrandeCity_DrakesRoom_EventScript_15B758
	compare VAR_ELITE_4_STATE, 4
	call_if_eq EverGrandeCity_DrakesRoom_EventScript_15B75E
	end

EverGrandeCity_DrakesRoom_EventScript_15B758:: @ 815B758
	call EverGrandeCity_DrakesRoom_EventScript_1A0757
	return

EverGrandeCity_DrakesRoom_EventScript_15B75E:: @ 815B75E
	call EverGrandeCity_DrakesRoom_EventScript_1A07FA
	return

EverGrandeCity_DrakesRoom_EventScript_15B764:: @ 815B764
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_ELITE_4_DRAKE, EverGrandeCity_DrakesRoom_EventScript_15B78B
	playbgm MUS_SITENNOU, FALSE
	msgbox EverGrandeCity_DrakesRoom_Text_190CEB, 4
	trainerbattle 3, TRAINER_DRAKE, 0, EverGrandeCity_DrakesRoom_Text_190E42
	goto EverGrandeCity_DrakesRoom_EventScript_15B795
	end

EverGrandeCity_DrakesRoom_EventScript_15B78B:: @ 815B78B
	msgbox EverGrandeCity_DrakesRoom_Text_190E5D, 4
	release
	end

EverGrandeCity_DrakesRoom_EventScript_15B795:: @ 815B795
	setvar VAR_SPECIAL_4, 0
	special sub_810FF60
	setflag FLAG_DEFEATED_ELITE_4_DRAKE
	call EverGrandeCity_DrakesRoom_EventScript_1A0693
	msgbox EverGrandeCity_DrakesRoom_Text_190E5D, 4
	release
	end
