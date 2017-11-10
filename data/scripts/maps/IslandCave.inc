IslandCave_MapScripts:: @ 815EEB6
	map_script 5, IslandCave_MapScript1_15EEC6
	map_script 1, IslandCave_MapScript1_15EED4
	map_script 3, IslandCave_MapScript1_15EF15
	.byte 0

IslandCave_MapScript1_15EEC6:: @ 815EEC6
	checkflag 2145
	call_if 1, IslandCave_EventScript_15EED0
	end

IslandCave_EventScript_15EED0:: @ 815EED0
	removeobject LAST_TALKED
	return

IslandCave_MapScript1_15EED4:: @ 815EED4
	checkflag 2129
	call_if 0, IslandCave_EventScript_15EEDE
	end

IslandCave_EventScript_15EEDE:: @ 815EEDE
	setmaptile 7, 19, 553, 1
	setmaptile 8, 19, 553, 1
	setmaptile 9, 19, 553, 1
	setmaptile 7, 20, 565, 1
	setmaptile 8, 20, 565, 1
	setmaptile 9, 20, 565, 1
	return

IslandCave_MapScript1_15EF15:: @ 815EF15
	setflag 2133
	end

S_OpenRegiceChamber:: @ 815EF19
	setmaptile 7, 19, 554, 1
	setmaptile 8, 19, 555, 1
	setmaptile 9, 19, 556, 1
	setmaptile 7, 20, 562, 1
	setmaptile 8, 20, 563, 0
	setmaptile 9, 20, 564, 1
	special DrawWholeMapView
	playse SE_BAN
	setflag 2129
	end

IslandCave_EventScript_15EF59:: @ 815EF59
	lockall
	checkflag 2129
	goto_if_eq IslandCave_EventScript_15EF72
	braillemessage IslandCave_Braille_1C54FC
	special DoBrailleWait
	waitstate
	goto IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF72:: @ 815EF72
	msgbox IslandCave_Text_1A13BE, 4
	releaseall
	end

IslandCave_EventScript_15EF7C:: @ 815EF7C
	lockall
	braillemessage IslandCave_Braille_1C54FC
	checkflag 2129
	goto_if_eq IslandCave_EventScript_15EF95
	special DoBrailleWait
	waitstate
	goto IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF95:: @ 815EF95
	waitbutton
	erasebox 0, 0, 29, 19
	releaseall
	end

IslandCave_EventScript_15EF9D:: @ 815EF9D
	lock
	faceplayer
	waitse
	playpokecry SPECIES_REGICE, 2
	delay 40
	waitpokecry
	setwildbattle SPECIES_REGICE, 40, ITEM_NONE
	setflag 936
	setflag 2145
	special ScrSpecial_StartRegiBattle
	waitstate
	clearflag 2145
	release
	end
