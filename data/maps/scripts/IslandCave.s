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

