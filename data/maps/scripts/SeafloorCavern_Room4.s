SeafloorCavern_Room4_MapScripts:: @ 815DABF
	map_script 3, SeafloorCavern_Room4_MapScript1_15DAC5
	.byte 0

SeafloorCavern_Room4_MapScript1_15DAC5:: @ 815DAC5
	call SeafloorCavern_Room4_EventScript_1A0196
	end

SeafloorCavern_Room4_EventScript_15DACB:: @ 815DACB
	trainerbattle 0, 573, 0, SeafloorCavern_Room4_Text_1977B9, SeafloorCavern_Room4_Text_1977E2
	loadptr 0, SeafloorCavern_Room4_Text_1977ED
	callstd 6
	end

