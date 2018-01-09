SeafloorCavern_Entrance_MapScripts:: @ 815DA4A
	map_script 5, SeafloorCavern_Entrance_MapScript1_15DA50
	.byte 0

SeafloorCavern_Entrance_MapScript1_15DA50:: @ 815DA50
	setdivewarp MAP_UNDERWATER_SEAFLOOR_CAVERN, 255, 6, 5
	setescapewarp MAP_UNDERWATER_SEAFLOOR_CAVERN, 255, 6, 5
	end
