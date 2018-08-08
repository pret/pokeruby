Route130_MapScripts:: @ 81523C2
	map_script 3, Route130_MapScript1_1523C8
	.byte 0

Route130_MapScript1_1523C8:: @ 81523C8
	specialvar RESULT, IsMirageIslandPresent
	compare RESULT, 1
	goto_if_eq Route130_EventScript_15240C
	setflag FLAG_TEMP_11
	setflag FLAG_TEMP_12
	setflag FLAG_TEMP_13
	setflag FLAG_TEMP_14
	setflag FLAG_TEMP_15
	setflag FLAG_TEMP_16
	setflag FLAG_TEMP_17
	setflag FLAG_TEMP_18
	setflag FLAG_TEMP_19
	setflag FLAG_TEMP_1A
	setflag FLAG_TEMP_1B
	setflag FLAG_TEMP_1C
	setflag FLAG_TEMP_1D
	setflag FLAG_TEMP_1E
	setflag FLAG_TEMP_1F
	setflag FLAG_TEMP_20
	setmaplayoutindex 264
	end

Route130_EventScript_15240C:: @ 815240C
	setmaplayoutindex 46
	end

Route130_EventScript_152410:: @ 8152410
	trainerbattle 0, TRAINER_RODNEY, 0, Route130_Text_1C2401, Route130_Text_1C245D
	msgbox Route130_Text_1C2479, 6
	end

Route130_EventScript_152427:: @ 8152427
	trainerbattle 0, TRAINER_KATIE, 0, Route130_Text_1C24DC, Route130_Text_1C2525
	msgbox Route130_Text_1C256E, 6
	end
