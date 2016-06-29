Underwater_SeafloorCavern_MapScripts:: @ 815D99E
	map_script 5, Underwater_SeafloorCavern_MapScript1_15DA36
	map_script 3, Underwater_SeafloorCavern_MapScript1_15D9AE
	map_script 1, Underwater_SeafloorCavern_MapScript1_15D9BF
	.byte 0

Underwater_SeafloorCavern_MapScript1_15D9AE:: @ 815D9AE
	setflag 2119
	checkflag 129
	jumpeq Underwater_SeafloorCavern_EventScript_15D9BB
	end

Underwater_SeafloorCavern_EventScript_15D9BB:: @ 815D9BB
	setflag 980
	end

Underwater_SeafloorCavern_MapScript1_15D9BF:: @ 815D9BF
	checkflag 129
	callif 1, Underwater_SeafloorCavern_EventScript_15D9C9
	end

Underwater_SeafloorCavern_EventScript_15D9C9:: @ 815D9C9
	setmaptile 5, 3, 542, 1
	setmaptile 6, 3, 542, 1
	setmaptile 7, 3, 542, 1
	setmaptile 8, 3, 542, 1
	setmaptile 5, 4, 552, 0
	setmaptile 6, 4, 552, 0
	setmaptile 7, 4, 552, 0
	setmaptile 8, 4, 552, 0
	setmaptile 5, 5, 552, 0
	setmaptile 6, 5, 552, 0
	setmaptile 7, 5, 552, 0
	setmaptile 8, 5, 552, 0
	return

Underwater_SeafloorCavern_MapScript1_15DA36:: @ 815DA36
	warp4 SeafloorCavern_Entrance, 255, 10, 17
	end

Underwater_SeafloorCavern_EventScript_15DA3F:: @ 815DA3F
	lockall
	msgbox Underwater_SeafloorCavern_Text_197435, 4
	releaseall
	end

