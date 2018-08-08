AbandonedShip_Corridors_B1F_MapScripts:: @ 815E98F
	map_script 5, AbandonedShip_Corridors_B1F_MapScript1_15E99A
	map_script 1, AbandonedShip_Corridors_B1F_MapScript1_15E9A3
	.byte 0

AbandonedShip_Corridors_B1F_MapScript1_15E99A:: @ 815E99A
	setdivewarp MAP_ABANDONED_SHIP_UNDERWATER1, 255, 5, 4
	end

AbandonedShip_Corridors_B1F_MapScript1_15E9A3:: @ 815E9A3
	call_if_unset FLAG_USED_STORAGE_KEY, AbandonedShip_Corridors_B1F_EventScript_15E9B6
	call_if_set FLAG_USED_STORAGE_KEY, AbandonedShip_Corridors_B1F_EventScript_15E9C0
	end

AbandonedShip_Corridors_B1F_EventScript_15E9B6:: @ 815E9B6
	setmetatile 11, 4, 563, 1
	return

AbandonedShip_Corridors_B1F_EventScript_15E9C0:: @ 815E9C0
	setmetatile 11, 4, 555, 1
	return

AbandonedShip_Corridors_B1F_EventScript_15E9CA:: @ 815E9CA
	msgbox AbandonedShip_Corridors_B1F_Text_19864A, 2
	end

AbandonedShip_Corridors_B1F_EventScript_15E9D3:: @ 815E9D3
	lockall
	goto_if_set FLAG_USED_STORAGE_KEY, AbandonedShip_Corridors_B1F_EventScript_15EA14
	checkitem ITEM_STORAGE_KEY, 1
	compare RESULT, 0
	goto_if_eq AbandonedShip_Corridors_B1F_EventScript_15EA0A
	msgbox AbandonedShip_Corridors_B1F_Text_198692, 4
	playse SE_PIN
	takeitem ITEM_STORAGE_KEY, 1
	setflag FLAG_USED_STORAGE_KEY
	call AbandonedShip_Corridors_B1F_EventScript_15E9C0
	special DrawWholeMapView
	releaseall
	end

AbandonedShip_Corridors_B1F_EventScript_15EA0A:: @ 815EA0A
	msgbox AbandonedShip_Corridors_B1F_Text_19865C, 4
	releaseall
	end

AbandonedShip_Corridors_B1F_EventScript_15EA14:: @ 815EA14
	msgbox AbandonedShip_Corridors_B1F_Text_1986EC, 4
	releaseall
	end

AbandonedShip_Corridors_B1F_EventScript_15EA1E:: @ 815EA1E
	trainerbattle 0, TRAINER_DUNCAN, 0, AbandonedShip_Corridors_B1F_Text_19856F, AbandonedShip_Corridors_B1F_Text_1985C5
	msgbox AbandonedShip_Corridors_B1F_Text_1985D7, 6
	end
