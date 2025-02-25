AbandonedShip_Underwater2_MapScripts:: @ 815EB37
	map_script MAP_SCRIPT_ON_RESUME, AbandonedShip_Underwater2_OnResume
	.byte 0

AbandonedShip_Underwater2_OnResume:: @ 815EB3D
	setdivewarp MAP_ABANDONED_SHIP_ROOMS_B1F, 255, 13, 7
	end
