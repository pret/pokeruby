AbandonedShip_Corridors_B1F_MapScripts:: @ 815E98F
	map_script 5, AbandonedShip_Corridors_B1F_MapScript1_15E99A
	map_script 1, AbandonedShip_Corridors_B1F_MapScript1_15E9A3
	.byte 0

AbandonedShip_Corridors_B1F_MapScript1_15E99A:: @ 815E99A
	warp4 AbandonedShip_Underwater1, 255, 5, 4
	end

AbandonedShip_Corridors_B1F_MapScript1_15E9A3:: @ 815E9A3
	checkflag 239
	callif 0, AbandonedShip_Corridors_B1F_EventScript_15E9B6
	checkflag 239
	callif 1, AbandonedShip_Corridors_B1F_EventScript_15E9C0
	end

AbandonedShip_Corridors_B1F_EventScript_15E9B6:: @ 815E9B6
	setmaptile 11, 4, 563, 1
	return

AbandonedShip_Corridors_B1F_EventScript_15E9C0:: @ 815E9C0
	setmaptile 11, 4, 555, 1
	return

AbandonedShip_Corridors_B1F_EventScript_15E9CA:: @ 815E9CA
	loadptr 0, AbandonedShip_Corridors_B1F_Text_19864A
	callstd 2
	end

AbandonedShip_Corridors_B1F_EventScript_15E9D3:: @ 815E9D3
	lockall
	checkflag 239
	jumpeq AbandonedShip_Corridors_B1F_EventScript_15EA14
	checkitem ITEM_STORAGE_KEY, 1
	compare RESULT, 0
	jumpeq AbandonedShip_Corridors_B1F_EventScript_15EA0A
	loadptr 0, AbandonedShip_Corridors_B1F_Text_198692
	callstd 4
	playsfx 21
	removeitem ITEM_STORAGE_KEY, 1
	setflag 239
	call AbandonedShip_Corridors_B1F_EventScript_15E9C0
	special 142
	releaseall
	end

AbandonedShip_Corridors_B1F_EventScript_15EA0A:: @ 815EA0A
	loadptr 0, AbandonedShip_Corridors_B1F_Text_19865C
	callstd 4
	releaseall
	end

AbandonedShip_Corridors_B1F_EventScript_15EA14:: @ 815EA14
	loadptr 0, AbandonedShip_Corridors_B1F_Text_1986EC
	callstd 4
	releaseall
	end

AbandonedShip_Corridors_B1F_EventScript_15EA1E:: @ 815EA1E
	trainerbattle 0, 496, 0, AbandonedShip_Corridors_B1F_Text_19856F, AbandonedShip_Corridors_B1F_Text_1985C5
	loadptr 0, AbandonedShip_Corridors_B1F_Text_1985D7
	callstd 6
	end

