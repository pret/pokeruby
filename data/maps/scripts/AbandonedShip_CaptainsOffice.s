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
	loadptr 0, AbandonedShip_CaptainsOffice_Text_198C85
	callstd 4
	release
	end

AbandonedShip_CaptainsOffice_EventScript_15EB23:: @ 815EB23
	loadptr 0, AbandonedShip_CaptainsOffice_Text_198D00
	callstd 4
	release
	end

AbandonedShip_CaptainsOffice_EventScript_15EB2D:: @ 815EB2D
	loadptr 0, AbandonedShip_CaptainsOffice_Text_198D7B
	callstd 4
	release
	end

