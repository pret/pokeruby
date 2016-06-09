SeafloorCavern_Room1_MapScripts:: @ 815DA61
	map_script 3, SeafloorCavern_Room1_MapScript1_15DA67
	.byte 0

SeafloorCavern_Room1_MapScript1_15DA67:: @ 815DA67
	call SeafloorCavern_Room1_EventScript_1A0196
	end

SeafloorCavern_Room1_EventScript_15DA6D:: @ 815DA6D
	trainerbattle 0, 571, 0, SeafloorCavern_Room1_Text_1974BA, SeafloorCavern_Room1_Text_1974EA
	loadptr 0, SeafloorCavern_Room1_Text_1974FF
	callstd 6
	end

SeafloorCavern_Room1_EventScript_15DA84:: @ 815DA84
	trainerbattle 0, 572, 0, SeafloorCavern_Room1_Text_19753C, SeafloorCavern_Room1_Text_197573
	loadptr 0, SeafloorCavern_Room1_Text_197589
	callstd 6
	end

