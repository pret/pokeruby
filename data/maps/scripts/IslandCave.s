IslandCave_MapScripts:: @ 815EEB6
	map_script 5, IslandCave_MapScript1_15EEC6
	map_script 1, IslandCave_MapScript1_15EED4
	map_script 3, IslandCave_MapScript1_15EF15
	.byte 0

IslandCave_MapScript1_15EEC6:: @ 815EEC6
	checkflag 2145
	callif 1, IslandCave_EventScript_15EED0
	end

IslandCave_EventScript_15EED0:: @ 815EED0
	disappear LAST_TALKED
	return

IslandCave_MapScript1_15EED4:: @ 815EED4
	checkflag 2129
	callif 0, IslandCave_EventScript_15EEDE
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

	.global gUnknown_0815EF19
gUnknown_0815EF19: @ 815EF19

	.incbin "baserom.gba", 0x15ef19, 0x40

IslandCave_EventScript_15EF59:: @ 815EF59
	lockall
	checkflag 2129
	jumpeq IslandCave_EventScript_15EF72
	braillemsg IslandCave_Braille_1C54FC
	special 280
	waitstate
	jump IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF72:: @ 815EF72
	msgbox IslandCave_Text_1A13BE, 4
	releaseall
	end

IslandCave_EventScript_15EF7C:: @ 815EF7C
	lockall
	braillemsg IslandCave_Braille_1C54FC
	checkflag 2129
	jumpeq IslandCave_EventScript_15EF95
	special 280
	waitstate
	jump IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF95:: @ 815EF95
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

IslandCave_EventScript_15EF9D:: @ 815EF9D
	lock
	faceplayer
	checksound
	pokecry SPECIES_REGICE, 2
	pause 40
	waitpokecry
	setwildbattle SPECIES_REGICE, 40, ITEM_NONE
	setflag 936
	setflag 2145
	special 313
	waitstate
	clearflag 2145
	release
	end
