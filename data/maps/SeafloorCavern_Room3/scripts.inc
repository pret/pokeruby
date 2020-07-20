SeafloorCavern_Room3_MapScripts:: @ 815DA9C
	map_script MAP_SCRIPT_ON_TRANSITION, SeafloorCavern_Room3_MapScript1_15DAA2
	.byte 0

SeafloorCavern_Room3_MapScript1_15DAA2:: @ 815DAA2
	call Common_EventScript_SetupEvilTeamGfxIds
	end

SeafloorCavern_Room3_EventScript_15DAA8:: @ 815DAA8
	trainerbattle_single TRAINER_SEAFLOOR_CAVERN_GRUNT_3, SeafloorCavern_Room3_Text_1975DC, SeafloorCavern_Room3_Text_1976F3
	msgbox SeafloorCavern_Room3_Text_197704, MSGBOX_AUTOCLOSE
	end
