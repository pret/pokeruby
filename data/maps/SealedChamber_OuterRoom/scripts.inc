SealedChamber_OuterRoom_MapScripts:: @ 815F0C6
	map_script 5, SealedChamber_OuterRoom_MapScript1_15F0D6
	map_script 3, SealedChamber_OuterRoom_MapScript1_15F0E7
	map_script 1, SealedChamber_OuterRoom_MapScript1_15F0EB
	.byte 0

SealedChamber_OuterRoom_MapScript1_15F0D6:: @ 815F0D6
	setdivewarp MAP_UNDERWATER_SEALED_CHAMBER, 255, 12, 44
	setescapewarp MAP_UNDERWATER_SEALED_CHAMBER, 255, 12, 44
	end

SealedChamber_OuterRoom_MapScript1_15F0E7:: @ 815F0E7
	setflag FLAG_LANDMARK_SEALED_CHAMBER
	end

SealedChamber_OuterRoom_MapScript1_15F0EB:: @ 815F0EB
	call_if_unset FLAG_SYS_BRAILLE_DIG, SealedChamber_OuterRoom_EventScript_15F0F5
	end

SealedChamber_OuterRoom_EventScript_15F0F5:: @ 815F0F5
	setmetatile 9, 1, 553, 1
	setmetatile 10, 1, 553, 1
	setmetatile 11, 1, 553, 1
	setmetatile 9, 2, 565, 1
	setmetatile 10, 2, 565, 1
	setmetatile 11, 2, 565, 1
	return

SealedChamber_OuterRoom_EventScript_15F12C:: @ 815F12C
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C534F
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F13A:: @ 815F13A
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C5359
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F148:: @ 815F148
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C5363
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F156:: @ 815F156
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C536D
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F164:: @ 815F164
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C5377
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F172:: @ 815F172
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C5381
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F180:: @ 815F180
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C538B
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F18E:: @ 815F18E
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C5396
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F19C:: @ 815F19C
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C539E
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F1AA:: @ 815F1AA
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C53A9
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F1B8:: @ 815F1B8
	lockall
	goto_if_set FLAG_SYS_BRAILLE_DIG, SealedChamber_OuterRoom_EventScript_15F1CF
	braillemessage SealedChamber_OuterRoom_Braille_1C53B1
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F1CF:: @ 815F1CF
	msgbox SealedChamber_OuterRoom_Text_1A13BE, 4
	releaseall
	end

SealedChamber_OuterRoom_EventScript_15F1D9:: @ 815F1D9
	lockall
	braillemessage SealedChamber_OuterRoom_Braille_1C53B1
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
