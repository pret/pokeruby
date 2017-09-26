DesertRuins_MapScripts:: @ 815CAF3
	map_script 5, DesertRuins_MapScript1_15CB03
	map_script 1, DesertRuins_MapScript1_15CB11
	map_script 3, DesertRuins_MapScript1_15CB52
	.byte 0

DesertRuins_MapScript1_15CB03:: @ 815CB03
	checkflag 2145
	call_if 1, DesertRuins_EventScript_15CB0D
	end

DesertRuins_EventScript_15CB0D:: @ 815CB0D
	removeobject LAST_TALKED
	return

DesertRuins_MapScript1_15CB11:: @ 815CB11
	checkflag 2128
	call_if 0, DesertRuins_EventScript_15CB1B
	end

DesertRuins_EventScript_15CB1B:: @ 815CB1B
	setmaptile 7, 19, 553, 1
	setmaptile 8, 19, 553, 1
	setmaptile 9, 19, 553, 1
	setmaptile 7, 20, 565, 1
	setmaptile 8, 20, 565, 1
	setmaptile 9, 20, 565, 1
	return

DesertRuins_MapScript1_15CB52:: @ 815CB52
	setflag 2134
	end

DesertRuins_EventScript_15CB56:: @ 815CB56
	lockall
	checkflag 2128
	goto_if_eq DesertRuins_EventScript_15CB6D
	braillemsg DesertRuins_Braille_1C54C8
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

DesertRuins_EventScript_15CB6D:: @ 815CB6D
	msgbox DesertRuins_Text_1A13BE, 4
	releaseall
	end

DesertRuins_EventScript_15CB77:: @ 815CB77
	lockall
	braillemsg DesertRuins_Braille_1C54C8
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

DesertRuins_EventScript_15CB85:: @ 815CB85
	lock
	faceplayer
	waitse
	pokecry SPECIES_REGIROCK, 2
	delay 40
	waitpokecry
	setwildbattle SPECIES_REGIROCK, 40, ITEM_NONE
	setflag 935
	setflag 2145
	special ScrSpecial_StartRegiBattle
	waitstate
	clearflag 2145
	release
	end
