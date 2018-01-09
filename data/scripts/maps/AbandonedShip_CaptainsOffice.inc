AbandonedShip_CaptainsOffice_MapScripts:: @ 815EAF4
	.byte 0

AbandonedShip_CaptainsOffice_EventScript_15EAF5:: @ 815EAF5
	lock
	faceplayer
	goto_if_set FLAG_EXCHANGED_SCANNER, AbandonedShip_CaptainsOffice_EventScript_15EB2D
	checkitem ITEM_SCANNER, 1
	compare RESULT, 1
	goto_if_eq AbandonedShip_CaptainsOffice_EventScript_15EB23
	goto_if_set FLAG_ITEM_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS_2, AbandonedShip_CaptainsOffice_EventScript_15EB2D
	msgbox AbandonedShip_CaptainsOffice_Text_198C85, 4
	release
	end

AbandonedShip_CaptainsOffice_EventScript_15EB23:: @ 815EB23
	msgbox AbandonedShip_CaptainsOffice_Text_198D00, 4
	release
	end

AbandonedShip_CaptainsOffice_EventScript_15EB2D:: @ 815EB2D
	msgbox AbandonedShip_CaptainsOffice_Text_198D7B, 4
	release
	end
