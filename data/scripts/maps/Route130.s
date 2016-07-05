Route130_MapScripts:: @ 81523C2
	map_script 3, Route130_MapScript1_1523C8
	.byte 0

Route130_MapScript1_1523C8:: @ 81523C8
	specialval RESULT, 209
	compare RESULT, 1
	jumpeq Route130_EventScript_15240C
	setflag 17
	setflag 18
	setflag 19
	setflag 20
	setflag 21
	setflag 22
	setflag 23
	setflag 24
	setflag 25
	setflag 26
	setflag 27
	setflag 28
	setflag 29
	setflag 30
	setflag 31
	setflag 32
	setmapfooter 264
	end

Route130_EventScript_15240C:: @ 815240C
	setmapfooter 46
	end

Route130_EventScript_152410:: @ 8152410
	trainerbattle 0, 165, 0, Route130_Text_1C2401, Route130_Text_1C245D
	msgbox Route130_Text_1C2479, 6
	end

Route130_EventScript_152427:: @ 8152427
	trainerbattle 0, 455, 0, Route130_Text_1C24DC, Route130_Text_1C2525
	msgbox Route130_Text_1C256E, 6
	end
