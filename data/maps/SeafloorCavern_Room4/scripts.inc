SeafloorCavern_Room4_MapScripts:: @ 815DABF
	map_script MAP_SCRIPT_ON_TRANSITION, SeafloorCavern_Room4_MapScript1_15DAC5
	.byte 0

SeafloorCavern_Room4_MapScript1_15DAC5:: @ 815DAC5
	call SeafloorCavern_Room4_EventScript_1A0196
	end

SeafloorCavern_Room4_EventScript_15DACB:: @ 815DACB
	trainerbattle_single TRAINER_SEAFLOOR_CAVERN_GRUNT_4, SeafloorCavern_Room4_Text_1977B9, SeafloorCavern_Room4_Text_1977E2
	msgbox SeafloorCavern_Room4_Text_1977ED, MSGBOX_AUTOCLOSE
	end
