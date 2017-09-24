EverGrandeCity_DrakesRoom_MapScripts:: @ 815B70D
	map_script 2, EverGrandeCity_DrakesRoom_MapScript2_15B72C
	map_script 1, EverGrandeCity_DrakesRoom_MapScript1_15B743
	map_script 4, EverGrandeCity_DrakesRoom_MapScript2_15B570
	.byte 0

@ 815B71D
	map_script_2 0x4001, 0, EverGrandeCity_DrakesRoom_EventScript_15B727
	.2byte 0

EverGrandeCity_DrakesRoom_EventScript_15B727:: @ 815B727
	spriteface 255, 2
	end

EverGrandeCity_DrakesRoom_MapScript2_15B72C:: @ 815B72C
	map_script_2 0x409c, 3, EverGrandeCity_DrakesRoom_EventScript_15B736
	.2byte 0

EverGrandeCity_DrakesRoom_EventScript_15B736:: @ 815B736
	lockall
	call EverGrandeCity_DrakesRoom_EventScript_1A0710
	setvar 0x409c, 4
	releaseall
	end

EverGrandeCity_DrakesRoom_MapScript1_15B743:: @ 815B743
	checkflag 1248
	call_if 1, EverGrandeCity_DrakesRoom_EventScript_15B758
	compare_var_to_imm 0x409c, 4
	call_if 1, EverGrandeCity_DrakesRoom_EventScript_15B75E
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
	checkflag 1248
	goto_if_eq EverGrandeCity_DrakesRoom_EventScript_15B78B
	playbgm 450, 0
	msgbox EverGrandeCity_DrakesRoom_Text_190CEB, 4
	trainerbattle 3, OPPONENT_DRAKE, 0, EverGrandeCity_DrakesRoom_Text_190E42
	goto EverGrandeCity_DrakesRoom_EventScript_15B795
	end

EverGrandeCity_DrakesRoom_EventScript_15B78B:: @ 815B78B
	msgbox EverGrandeCity_DrakesRoom_Text_190E5D, 4
	release
	end

EverGrandeCity_DrakesRoom_EventScript_15B795:: @ 815B795
	setvar 0x8004, 0
	special sub_810FF60
	setflag 1248
	call EverGrandeCity_DrakesRoom_EventScript_1A0693
	msgbox EverGrandeCity_DrakesRoom_Text_190E5D, 4
	release
	end
