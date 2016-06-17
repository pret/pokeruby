AbandonedShip_CaptainsOffice_MapScripts:: @ 815EAF4
	.byte 0

AbandonedShip_CaptainsOffice_EventScript_15EAF5:: @ 815EAF5
	lock
	faceplayer
	checkflag 294
	jumpeq AbandonedShip_CaptainsOffice_EventScript_15EB2D
	checkitem ITEM_SCANNER, 1
	compare RESULT, 1
	jumpeq AbandonedShip_CaptainsOffice_EventScript_15EB23
	checkflag 1078
	jumpeq AbandonedShip_CaptainsOffice_EventScript_15EB2D
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

