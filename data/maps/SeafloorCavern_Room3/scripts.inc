SeafloorCavern_Room3_MapScripts:: @ 815DA9C
	map_script 3, SeafloorCavern_Room3_MapScript1_15DAA2
	.byte 0

SeafloorCavern_Room3_MapScript1_15DAA2:: @ 815DAA2
	call SeafloorCavern_Room3_EventScript_1A0196
	end

SeafloorCavern_Room3_EventScript_15DAA8:: @ 815DAA8
	trainerbattle 0, TRAINER_SEAFLOOR_CAVERN_GRUNT_3, 0, SeafloorCavern_Room3_Text_1975DC, SeafloorCavern_Room3_Text_1976F3
	msgbox SeafloorCavern_Room3_Text_197704, 6
	end
