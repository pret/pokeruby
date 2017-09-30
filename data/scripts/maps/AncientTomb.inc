AncientTomb_MapScripts:: @ 815EFBE
	map_script 5, AncientTomb_MapScript1_15EFCE
	map_script 1, AncientTomb_MapScript1_15EFE0
	map_script 3, AncientTomb_MapScript1_15EFDC
	.byte 0

AncientTomb_MapScript1_15EFCE:: @ 815EFCE
	checkflag 2145
	callif 1, AncientTomb_EventScript_15EFD8
	end

AncientTomb_EventScript_15EFD8:: @ 815EFD8
	disappear LAST_TALKED
	return

AncientTomb_MapScript1_15EFDC:: @ 815EFDC
	setflag 2137
	end

AncientTomb_MapScript1_15EFE0:: @ 815EFE0
	checkflag 2130
	callif 0, AncientTomb_EventScript_15EFEA
	end

AncientTomb_EventScript_15EFEA:: @ 815EFEA
	setmaptile 7, 19, 553, 1
	setmaptile 8, 19, 553, 1
	setmaptile 9, 19, 553, 1
	setmaptile 7, 20, 565, 1
	setmaptile 8, 20, 565, 1
	setmaptile 9, 20, 565, 1
	return

AncientTomb_EventScript_15F021:: @ 815F021
	lockall
	checkflag 2130
	jumpeq AncientTomb_EventScript_15F038
	braillemsg AncientTomb_Braille_1C552E
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

AncientTomb_EventScript_15F038:: @ 815F038
	msgbox AncientTomb_Text_1A13BE, 4
	releaseall
	end

AncientTomb_EventScript_15F042:: @ 815F042
	lockall
	braillemsg AncientTomb_Braille_1C552E
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

AncientTomb_EventScript_15F050:: @ 815F050
	lock
	faceplayer
	checksound
	pokecry SPECIES_REGISTEEL, 2
	pause 40
	waitpokecry
	setwildbattle SPECIES_REGISTEEL, 40, ITEM_NONE
	setflag 937
	setflag 2145
	special ScrSpecial_StartRegiBattle
	waitstate
	clearflag 2145
	release
	end
