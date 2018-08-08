AbandonedShip_Rooms2_1F_MapScripts:: @ 815EA67
	.byte 0

AbandonedShip_Rooms2_1F_EventScript_15EA68:: @ 815EA68
	trainerbattle 4, TRAINER_LOIS_AND_HAL_1, 0, AbandonedShip_Rooms2_1F_Text_1987C1, AbandonedShip_Rooms2_1F_Text_1987FE, AbandonedShip_Rooms2_1F_Text_19887F
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq AbandonedShip_Rooms2_1F_EventScript_15EA93
	msgbox AbandonedShip_Rooms2_1F_Text_198835, 6
	end

AbandonedShip_Rooms2_1F_EventScript_15EA93:: @ 815EA93
	trainerbattle 7, TRAINER_LOIS_AND_HAL_1, 0, AbandonedShip_Rooms2_1F_Text_1989DF, AbandonedShip_Rooms2_1F_Text_198A53, AbandonedShip_Rooms2_1F_Text_198AEE
	msgbox AbandonedShip_Rooms2_1F_Text_198A70, 6
	end

AbandonedShip_Rooms2_1F_EventScript_15EAAE:: @ 815EAAE
	trainerbattle 4, TRAINER_LOIS_AND_HAL_1, 0, AbandonedShip_Rooms2_1F_Text_1988CC, AbandonedShip_Rooms2_1F_Text_198916, AbandonedShip_Rooms2_1F_Text_19899A
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq AbandonedShip_Rooms2_1F_EventScript_15EAD9
	msgbox AbandonedShip_Rooms2_1F_Text_198934, 6
	end

AbandonedShip_Rooms2_1F_EventScript_15EAD9:: @ 815EAD9
	trainerbattle 7, TRAINER_LOIS_AND_HAL_1, 0, AbandonedShip_Rooms2_1F_Text_198B3B, AbandonedShip_Rooms2_1F_Text_198BCF, AbandonedShip_Rooms2_1F_Text_198C40
	msgbox AbandonedShip_Rooms2_1F_Text_198BEA, 6
	end
