JaggedPass_MapScripts:: @ 815D266
	map_script 5, JaggedPass_MapScript1_15D271
	map_script 3, JaggedPass_MapScript1_15D274
	.byte 0

JaggedPass_MapScript1_15D271:: @ 815D271
	tileeffect 1
	end

JaggedPass_MapScript1_15D274:: @ 815D274
	compare 0x40bd, 1
	callif 1, JaggedPass_EventScript_15D280
	end

JaggedPass_EventScript_15D280:: @ 815D280
	setweather 7
	doweather
	return

JaggedPass_EventScript_15D285:: @ 815D285
	trainerbattle 0, 632, 0, JaggedPass_Text_195DAC, JaggedPass_Text_195E27
	msgbox JaggedPass_Text_195E3E, 6
	end

JaggedPass_EventScript_15D29C:: @ 815D29C
	trainerbattle 0, 474, 0, JaggedPass_Text_195E9E, JaggedPass_Text_195EDF
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq JaggedPass_EventScript_15D2C3
	msgbox JaggedPass_Text_195F04, 6
	end

JaggedPass_EventScript_15D2C3:: @ 815D2C3
	trainerbattle 5, 474, 0, JaggedPass_Text_195F58, JaggedPass_Text_195F8C
	msgbox JaggedPass_Text_195FB9, 6
	end

JaggedPass_EventScript_15D2DA:: @ 815D2DA
	trainerbattle 0, 216, 0, JaggedPass_Text_195FF2, JaggedPass_Text_196032
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq JaggedPass_EventScript_15D301
	msgbox JaggedPass_Text_196077, 6
	end

JaggedPass_EventScript_15D301:: @ 815D301
	trainerbattle 5, 216, 0, JaggedPass_Text_1960AA, JaggedPass_Text_1960E2
	msgbox JaggedPass_Text_196118, 6
	end

