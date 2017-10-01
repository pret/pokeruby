SouthernIsland_Interior_MapScripts:: @ 8160B53
	map_script 5, SouthernIsland_Interior_MapScript1_160B5E
	map_script 3, SouthernIsland_Interior_MapScript1_160B6C
	.byte 0

SouthernIsland_Interior_MapScript1_160B5E:: @ 8160B5E
	checkflag 2145
	call_if 1, SouthernIsland_Interior_EventScript_160B68
	end

SouthernIsland_Interior_EventScript_160B68:: @ 8160B68
	removeobject 2
	return

SouthernIsland_Interior_MapScript1_160B6C:: @ 8160B6C
	.ifdef SAPPHIRE
	setvar 0x4011, 188
	.else
	setvar 0x4011, 187
	.endif
	call SouthernIsland_Interior_EventScript_160B77
	end

SouthernIsland_Interior_EventScript_160B77:: @ 8160B77
	checkplayergender
	compare RESULT, 0
	goto_if_eq SouthernIsland_Interior_EventScript_160B8F
	compare RESULT, 1
	goto_if_eq SouthernIsland_Interior_EventScript_160B95
	end

SouthernIsland_Interior_EventScript_160B8F:: @ 8160B8F
	setvar 0x4010, 100
	return

SouthernIsland_Interior_EventScript_160B95:: @ 8160B95
	setvar 0x4010, 105
	return

SouthernIsland_Interior_EventScript_160B9B:: @ 8160B9B
	lockall
	setvar 0x8008, 12
	goto SouthernIsland_Interior_EventScript_160BA7
	end

SouthernIsland_Interior_EventScript_160BA7:: @ 8160BA7
	checkflag 206
	goto_if_eq SouthernIsland_Interior_EventScript_160C08
	checkflag 2131
	goto_if 0, SouthernIsland_Interior_EventScript_160C08
	setflag 206
	special SpawnCameraDummy
	applymovement 127, SouthernIsland_Interior_Movement_160C12
	waitmovement 0
	delay 50
	waitse
	playpokecry SPECIES_LATIAS_OR_LATIOS, 0
	delay 30
	waitpokecry
	addobject 2
	delay 30
	applymovement 127, SouthernIsland_Interior_Movement_160C16
	applymovement 2, SouthernIsland_Interior_Movement_160C22
	waitmovement 0
	delay 50
	special RemoveCameraDummy
	setwildbattle SPECIES_LATIAS_OR_LATIOS, 50, ITEM_SOUL_DEW
	setflag 911
	setflag 2145
	special ScrSpecial_StartSouthernIslandBattle
	waitstate
	clearflag 2145
	releaseall
	end

SouthernIsland_Interior_EventScript_160C08:: @ 8160C08
	msgbox SouthernIsland_Interior_Text_1C52C5, 4
	releaseall
	end

SouthernIsland_Interior_Movement_160C12:: @ 8160C12
	step_up
	step_up
	step_up
	step_end

SouthernIsland_Interior_Movement_160C16:: @ 8160C16
	step_14
	step_14
	step_14
	step_14
	step_14
	step_14
	step_14
	step_down
	step_down
	step_down
	step_26
	step_end

SouthernIsland_Interior_Movement_160C22:: @ 8160C22
	step_down
	step_down
	step_down
	step_down
	step_down
	step_14
	step_14
	step_down
	step_down
	step_down
	step_down
	step_end
