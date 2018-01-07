SealedChamber_InnerRoom_MapScripts:: @ 815F1E7
	.byte 0

SealedChamber_InnerRoom_EventScript_15F1E8:: @ 815F1E8
	lockall
	braillemessage SealedChamber_InnerRoom_Braille_1C53C1
	waitbuttonpress
	erasebox 0, 0, 29, 19
	goto_if_set FLAG_REGI_DOORS_OPENED, SealedChamber_InnerRoom_EventScript_15F247
	specialvar RESULT, CheckRelicanthWailord
	compare RESULT, 0
	goto_if_eq SealedChamber_InnerRoom_EventScript_15F247
	fadeoutbgm 0
	playse SE_TRACK_MOVE
	special DoSealedChamberShakingEffect1
	waitstate
	delay 40
	special DoSealedChamberShakingEffect2
	waitstate
	playse SE_DOOR
	delay 40
	special DoSealedChamberShakingEffect2
	waitstate
	playse SE_DOOR
	delay 40
	special DoSealedChamberShakingEffect2
	waitstate
	playse SE_DOOR
	delay 40
	msgbox SealedChamber_InnerRoom_Text_1A138B, 4
	closemessage
	fadeinbgm 0
	setflag FLAG_REGI_DOORS_OPENED
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F247:: @ 815F247
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F249:: @ 815F249
	lockall
	braillemessage SealedChamber_InnerRoom_Braille_1C53F2
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F257:: @ 815F257
	lockall
	braillemessage SealedChamber_InnerRoom_Braille_1C5414
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F265:: @ 815F265
	lockall
	braillemessage SealedChamber_InnerRoom_Braille_1C5435
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F273:: @ 815F273
	lockall
	braillemessage SealedChamber_InnerRoom_Braille_1C545C
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F281:: @ 815F281
	lockall
	braillemessage SealedChamber_InnerRoom_Braille_1C5470
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F28F:: @ 815F28F
	lockall
	braillemessage SealedChamber_InnerRoom_Braille_1C549B
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
