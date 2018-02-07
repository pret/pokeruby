DesertRuins_MapScripts:: @ 815CAF3
	map_script 5, DesertRuins_MapScript1_15CB03
	map_script 1, DesertRuins_MapScript1_15CB11
	map_script 3, DesertRuins_MapScript1_15CB52
	.byte 0

DesertRuins_MapScript1_15CB03:: @ 815CB03
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, DesertRuins_EventScript_15CB0D
	end

DesertRuins_EventScript_15CB0D:: @ 815CB0D
	removeobject LAST_TALKED
	return

DesertRuins_MapScript1_15CB11:: @ 815CB11
	call_if_unset FLAG_SYS_BRAILLE_STRENGTH, DesertRuins_EventScript_15CB1B
	end

DesertRuins_EventScript_15CB1B:: @ 815CB1B
	setmetatile 7, 19, 553, 1
	setmetatile 8, 19, 553, 1
	setmetatile 9, 19, 553, 1
	setmetatile 7, 20, 565, 1
	setmetatile 8, 20, 565, 1
	setmetatile 9, 20, 565, 1
	return

DesertRuins_MapScript1_15CB52:: @ 815CB52
	setflag FLAG_LANDMARK_DESERT_RUINS
	end

DesertRuins_EventScript_15CB56:: @ 815CB56
	lockall
	goto_if_set FLAG_SYS_BRAILLE_STRENGTH, DesertRuins_EventScript_15CB6D
	braillemessage DesertRuins_Braille_1C54C8
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

DesertRuins_EventScript_15CB6D:: @ 815CB6D
	msgbox DesertRuins_Text_1A13BE, 4
	releaseall
	end

DesertRuins_EventScript_15CB77:: @ 815CB77
	lockall
	braillemessage DesertRuins_Braille_1C54C8
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

DesertRuins_EventScript_15CB85:: @ 815CB85
	lock
	faceplayer
	waitse
	playmoncry SPECIES_REGIROCK, 2
	delay 40
	waitmoncry
	setwildbattle SPECIES_REGIROCK, 40, ITEM_NONE
	setflag FLAG_HIDE_REGIROCK
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	special ScrSpecial_StartRegiBattle
	waitstate
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end
