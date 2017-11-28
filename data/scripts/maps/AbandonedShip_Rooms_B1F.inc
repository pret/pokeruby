AbandonedShip_Rooms_B1F_MapScripts:: @ 815EA35
	map_script 5, AbandonedShip_Rooms_B1F_MapScript1_15EA3B
	.byte 0

AbandonedShip_Rooms_B1F_MapScript1_15EA3B:: @ 815EA3B
	setdivewarp MAP_ABANDONED_SHIP_UNDERWATER2, 255, 17, 4
	end

AbandonedShip_Rooms_B1F_EventScript_15EA44:: @ 815EA44
	msgbox AbandonedShip_Rooms_B1F_Text_1986FE, 2
	end
