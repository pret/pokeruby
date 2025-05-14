AbandonedShip_Underwater1_MapScripts:: @ 815EA57
	map_script MAP_SCRIPT_ON_RESUME, AbandonedShip_Underwater1_OnResume
	.byte 0

AbandonedShip_Underwater1_OnResume:: @ 815EA5D
	setdivewarp MAP_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS, 255, 0, 10
	end
