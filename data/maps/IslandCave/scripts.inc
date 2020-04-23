IslandCave_MapScripts:: @ 815EEB6
	map_script MAP_SCRIPT_ON_RESUME, IslandCave_MapScript1_15EEC6
	map_script MAP_SCRIPT_ON_LOAD, IslandCave_MapScript1_15EED4
	map_script MAP_SCRIPT_ON_TRANSITION, IslandCave_MapScript1_15EF15
	.byte 0

IslandCave_MapScript1_15EEC6:: @ 815EEC6
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, IslandCave_EventScript_15EED0
	end

IslandCave_EventScript_15EED0:: @ 815EED0
	removeobject VAR_LAST_TALKED
	return

IslandCave_MapScript1_15EED4:: @ 815EED4
	call_if_unset FLAG_SYS_BRAILLE_WAIT, IslandCave_EventScript_15EEDE
	end

IslandCave_EventScript_15EEDE:: @ 815EEDE
	setmetatile 7, 19, METATILE_Cave_EntranceCover, 1
	setmetatile 8, 19, METATILE_Cave_EntranceCover, 1
	setmetatile 9, 19, METATILE_Cave_EntranceCover, 1
	setmetatile 7, 20, METATILE_Cave_SealedChamberBraille_Mid, 1
	setmetatile 8, 20, METATILE_Cave_SealedChamberBraille_Mid, 1
	setmetatile 9, 20, METATILE_Cave_SealedChamberBraille_Mid, 1
	return

IslandCave_MapScript1_15EF15:: @ 815EF15
	setflag FLAG_LANDMARK_ISLAND_CAVE
	end

S_OpenRegiceChamber:: @ 815EF19
	setmetatile 7, 19, METATILE_Cave_SealedChamberEntrance_TopLeft, 1
	setmetatile 8, 19, METATILE_Cave_SealedChamberEntrance_TopMid, 1
	setmetatile 9, 19, METATILE_Cave_SealedChamberEntrance_TopRight, 1
	setmetatile 7, 20, METATILE_Cave_SealedChamberEntrance_BottomLeft, 1
	setmetatile 8, 20, METATILE_Cave_SealedChamberEntrance_BottomMid, 0
	setmetatile 9, 20, METATILE_Cave_SealedChamberEntrance_BottomRight, 1
	special DrawWholeMapView
	playse SE_BAN
	setflag FLAG_SYS_BRAILLE_WAIT
	end

IslandCave_EventScript_15EF59:: @ 815EF59
	lockall
	goto_if_set FLAG_SYS_BRAILLE_WAIT, IslandCave_EventScript_15EF72
	braillemessage IslandCave_Braille_1C54FC
	special DoBrailleWait
	waitstate
	goto IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF72:: @ 815EF72
	msgbox IslandCave_Text_1A13BE, MSGBOX_DEFAULT
	releaseall
	end

IslandCave_EventScript_15EF7C:: @ 815EF7C
	lockall
	braillemessage IslandCave_Braille_1C54FC
	goto_if_set FLAG_SYS_BRAILLE_WAIT, IslandCave_EventScript_15EF95
	special DoBrailleWait
	waitstate
	goto IslandCave_EventScript_15EF95
	end

IslandCave_EventScript_15EF95:: @ 815EF95
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

IslandCave_EventScript_15EF9D:: @ 815EF9D
	lock
	faceplayer
	waitse
	playmoncry SPECIES_REGICE, 2
	delay 40
	waitmoncry
	setwildbattle SPECIES_REGICE, 40, ITEM_NONE
	setflag FLAG_HIDE_REGICE
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	special ScrSpecial_StartRegiBattle
	waitstate
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end
