SouthernIsland_Interior_MapScripts:: @ 8160B53
	map_script 5, SouthernIsland_Interior_MapScript1_160B5E
	map_script 3, SouthernIsland_Interior_MapScript1_160B6C
	.byte 0

SouthernIsland_Interior_MapScript1_160B5E:: @ 8160B5E
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, SouthernIsland_Interior_EventScript_160B68
	end

SouthernIsland_Interior_EventScript_160B68:: @ 8160B68
	removeobject 2
	return

SouthernIsland_Interior_MapScript1_160B6C:: @ 8160B6C
	.ifdef SAPPHIRE
	setvar VAR_OBJ_GFX_ID_1, EVENT_OBJ_GFX_LATIOS
	.else
	setvar VAR_OBJ_GFX_ID_1, EVENT_OBJ_GFX_LATIAS
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
	setvar VAR_OBJ_GFX_ID_0, EVENT_OBJ_GFX_RIVAL_BRENDAN_NORMAL
	return

SouthernIsland_Interior_EventScript_160B95:: @ 8160B95
	setvar VAR_OBJ_GFX_ID_0, EVENT_OBJ_GFX_RIVAL_MAY_NORMAL
	return

SouthernIsland_Interior_EventScript_160B9B:: @ 8160B9B
	lockall
	setvar VAR_SPECIAL_8, 12
	goto SouthernIsland_Interior_EventScript_160BA7
	end

SouthernIsland_Interior_EventScript_160BA7:: @ 8160BA7
	goto_if_set FLAG_ENCOUNTERED_LATIAS_OR_LATIOS, SouthernIsland_Interior_EventScript_160C08
	goto_if_unset FLAG_SYS_HAS_EON_TICKET, SouthernIsland_Interior_EventScript_160C08
	setflag FLAG_ENCOUNTERED_LATIAS_OR_LATIOS
	special SpawnCameraDummy
	applymovement 127, SouthernIsland_Interior_Movement_160C12
	waitmovement 0
	delay 50
	waitse
	playmoncry SPECIES_LATIAS_OR_LATIOS, 0
	delay 30
	waitmoncry
	addobject 2
	delay 30
	applymovement 127, SouthernIsland_Interior_Movement_160C16
	applymovement 2, SouthernIsland_Interior_Movement_160C22
	waitmovement 0
	delay 50
	special RemoveCameraDummy
	setwildbattle SPECIES_LATIAS_OR_LATIOS, 50, ITEM_SOUL_DEW
	setflag FLAG_HIDE_LATIOS_OR_LATIAS_STATIONARY
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	special ScrSpecial_StartSouthernIslandBattle
	waitstate
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	releaseall
	end

SouthernIsland_Interior_EventScript_160C08:: @ 8160C08
	msgbox SouthernIsland_Interior_Text_1C52C5, 4
	releaseall
	end

SouthernIsland_Interior_Movement_160C12:: @ 8160C12
	walk_up
	walk_up
	walk_up
	end_movement

SouthernIsland_Interior_Movement_160C16:: @ 8160C16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_up
	end_movement

SouthernIsland_Interior_Movement_160C22:: @ 8160C22
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement
