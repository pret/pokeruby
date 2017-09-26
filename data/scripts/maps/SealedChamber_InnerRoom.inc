SealedChamber_InnerRoom_MapScripts:: @ 815F1E7
	.byte 0

SealedChamber_InnerRoom_EventScript_15F1E8:: @ 815F1E8
	lockall
	braillemsg SealedChamber_InnerRoom_Braille_1C53C1
	waitbutton
	hidebox 0, 0, 29, 19
	checkflag 228
	goto_if_eq SealedChamber_InnerRoom_EventScript_15F247
	specialvar RESULT, CheckRelicanthWailord
	compare RESULT, 0
	goto_if_eq SealedChamber_InnerRoom_EventScript_15F247
	fadeoutbgm 0
	playse 49
	special DoSealedChamberShakingEffect1
	waitstate
	delay 40
	special DoSealedChamberShakingEffect2
	waitstate
	playse 8
	delay 40
	special DoSealedChamberShakingEffect2
	waitstate
	playse 8
	delay 40
	special DoSealedChamberShakingEffect2
	waitstate
	playse 8
	delay 40
	msgbox SealedChamber_InnerRoom_Text_1A138B, 4
	closebutton
	fadeinbgm 0
	setflag 228
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F247:: @ 815F247
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F249:: @ 815F249
	lockall
	braillemsg SealedChamber_InnerRoom_Braille_1C53F2
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F257:: @ 815F257
	lockall
	braillemsg SealedChamber_InnerRoom_Braille_1C5414
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F265:: @ 815F265
	lockall
	braillemsg SealedChamber_InnerRoom_Braille_1C5435
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F273:: @ 815F273
	lockall
	braillemsg SealedChamber_InnerRoom_Braille_1C545C
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F281:: @ 815F281
	lockall
	braillemsg SealedChamber_InnerRoom_Braille_1C5470
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_InnerRoom_EventScript_15F28F:: @ 815F28F
	lockall
	braillemsg SealedChamber_InnerRoom_Braille_1C549B
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end
