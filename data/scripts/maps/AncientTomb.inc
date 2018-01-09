AncientTomb_MapScripts:: @ 815EFBE
	map_script 5, AncientTomb_MapScript1_15EFCE
	map_script 1, AncientTomb_MapScript1_15EFE0
	map_script 3, AncientTomb_MapScript1_15EFDC
	.byte 0

AncientTomb_MapScript1_15EFCE:: @ 815EFCE
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, AncientTomb_EventScript_15EFD8
	end

AncientTomb_EventScript_15EFD8:: @ 815EFD8
	removeobject LAST_TALKED
	return

AncientTomb_MapScript1_15EFDC:: @ 815EFDC
	setflag FLAG_LANDMARK_ANCIENT_TOMB
	end

AncientTomb_MapScript1_15EFE0:: @ 815EFE0
	call_if_unset FLAG_SYS_BRAILLE_FLY, AncientTomb_EventScript_15EFEA
	end

AncientTomb_EventScript_15EFEA:: @ 815EFEA
	setmetatile 7, 19, 553, 1
	setmetatile 8, 19, 553, 1
	setmetatile 9, 19, 553, 1
	setmetatile 7, 20, 565, 1
	setmetatile 8, 20, 565, 1
	setmetatile 9, 20, 565, 1
	return

AncientTomb_EventScript_15F021:: @ 815F021
	lockall
	goto_if_set FLAG_SYS_BRAILLE_FLY, AncientTomb_EventScript_15F038
	braillemessage AncientTomb_Braille_1C552E
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

AncientTomb_EventScript_15F038:: @ 815F038
	msgbox AncientTomb_Text_1A13BE, 4
	releaseall
	end

AncientTomb_EventScript_15F042:: @ 815F042
	lockall
	braillemessage AncientTomb_Braille_1C552E
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

AncientTomb_EventScript_15F050:: @ 815F050
	lock
	faceplayer
	waitse
	playmoncry SPECIES_REGISTEEL, 2
	delay 40
	waitmoncry
	setwildbattle SPECIES_REGISTEEL, 40, ITEM_NONE
	setflag FLAG_HIDE_REGISTEEL
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	special ScrSpecial_StartRegiBattle
	waitstate
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end
