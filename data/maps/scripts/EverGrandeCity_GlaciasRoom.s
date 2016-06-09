EverGrandeCity_GlaciasRoom_MapScripts:: @ 815B673
	map_script 2, EverGrandeCity_GlaciasRoom_MapScript2_15B692
	map_script 1, EverGrandeCity_GlaciasRoom_MapScript1_15B6A9
	map_script 4, EverGrandeCity_GlaciasRoom_MapScript2_15B683
	.byte 0

EverGrandeCity_GlaciasRoom_MapScript2_15B683:: @ 815B683
	map_script_2 0x4001, 0, EverGrandeCity_GlaciasRoom_EventScript_15B68D
	.2byte 0

EverGrandeCity_GlaciasRoom_EventScript_15B68D:: @ 815B68D
	spriteface 255, 2
	end

EverGrandeCity_GlaciasRoom_MapScript2_15B692:: @ 815B692
	map_script_2 0x409c, 2, EverGrandeCity_GlaciasRoom_EventScript_15B69C
	.2byte 0

EverGrandeCity_GlaciasRoom_EventScript_15B69C:: @ 815B69C
	lockall
	call EverGrandeCity_GlaciasRoom_EventScript_1A0710
	setvar 0x409c, 3
	releaseall
	end

EverGrandeCity_GlaciasRoom_MapScript1_15B6A9:: @ 815B6A9
	checkflag 1247
	callif 1, EverGrandeCity_GlaciasRoom_EventScript_15B6BE
	compare 0x409c, 3
	callif 1, EverGrandeCity_GlaciasRoom_EventScript_15B6C4
	end

EverGrandeCity_GlaciasRoom_EventScript_15B6BE:: @ 815B6BE
	call EverGrandeCity_GlaciasRoom_EventScript_1A0757
	return

EverGrandeCity_GlaciasRoom_EventScript_15B6C4:: @ 815B6C4
	call EverGrandeCity_GlaciasRoom_EventScript_1A07FA
	return

EverGrandeCity_GlaciasRoom_EventScript_15B6CA:: @ 815B6CA
	lock
	faceplayer
	checkflag 1247
	jumpeq EverGrandeCity_GlaciasRoom_EventScript_15B6F1
	playmusic 450, 0
	loadptr 0, EverGrandeCity_GlaciasRoom_Text_190AF9
	callstd 4
	trainerbattle 3, 263, 0, EverGrandeCity_GlaciasRoom_Text_190C01
	jump EverGrandeCity_GlaciasRoom_EventScript_15B6FB
	end

EverGrandeCity_GlaciasRoom_EventScript_15B6F1:: @ 815B6F1
	loadptr 0, EverGrandeCity_GlaciasRoom_Text_190C8F
	callstd 4
	release
	end

EverGrandeCity_GlaciasRoom_EventScript_15B6FB:: @ 815B6FB
	setflag 1247
	call EverGrandeCity_GlaciasRoom_EventScript_1A0693
	loadptr 0, EverGrandeCity_GlaciasRoom_Text_190C8F
	callstd 4
	release
	end

