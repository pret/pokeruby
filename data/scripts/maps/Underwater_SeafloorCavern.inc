Underwater_SeafloorCavern_MapScripts:: @ 815D99E
	map_script 5, Underwater_SeafloorCavern_MapScript1_15DA36
	map_script 3, Underwater_SeafloorCavern_MapScript1_15D9AE
	map_script 1, Underwater_SeafloorCavern_MapScript1_15D9BF
	.byte 0

Underwater_SeafloorCavern_MapScript1_15D9AE:: @ 815D9AE
	setflag FLAG_LANDMARK_SEAFLOOR_CAVERN
	goto_if_set FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, Underwater_SeafloorCavern_EventScript_15D9BB
	end

Underwater_SeafloorCavern_EventScript_15D9BB:: @ 815D9BB
	setflag FLAG_HIDE_UNDERWATER_SUBMARINE_INTERACTION
	end

Underwater_SeafloorCavern_MapScript1_15D9BF:: @ 815D9BF
	call_if_set FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, Underwater_SeafloorCavern_EventScript_15D9C9
	end

Underwater_SeafloorCavern_EventScript_15D9C9:: @ 815D9C9
	setmetatile 5, 3, 542, 1
	setmetatile 6, 3, 542, 1
	setmetatile 7, 3, 542, 1
	setmetatile 8, 3, 542, 1
	setmetatile 5, 4, 552, 0
	setmetatile 6, 4, 552, 0
	setmetatile 7, 4, 552, 0
	setmetatile 8, 4, 552, 0
	setmetatile 5, 5, 552, 0
	setmetatile 6, 5, 552, 0
	setmetatile 7, 5, 552, 0
	setmetatile 8, 5, 552, 0
	return

Underwater_SeafloorCavern_MapScript1_15DA36:: @ 815DA36
	setdivewarp MAP_SEAFLOOR_CAVERN_ENTRANCE, 255, 10, 17
	end

Underwater_SeafloorCavern_EventScript_15DA3F:: @ 815DA3F
	lockall
	msgbox Underwater_SeafloorCavern_Text_197435, 4
	releaseall
	end
