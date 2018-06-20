SafariZone_Southeast_MapScripts:: @ 8160036
	map_script 3, SafariZone_Southeast_MapScript1_160073
	map_script 2, SafariZone_Southeast_MapScript2_160041
	.byte 0

SafariZone_Southeast_MapScript2_160041:: @ 8160041
	map_script_2 VAR_SAFARI_ZONE_STATE, 2, SafariZone_Southeast_EventScript_16004B
	.2byte 0

SafariZone_Southeast_EventScript_16004B:: @ 816004B
	lockall
	setvar VAR_TEMP_1, 0
	applymovement 255, SafariZone_Southeast_Movement_160087
	waitmovement 0
	applymovement 1, SafariZone_Southeast_Movement_160089
	waitmovement 0
	setobjectxyperm 1, 32, 34
	setvar VAR_SAFARI_ZONE_STATE, 0
	releaseall
	end

SafariZone_Southeast_MapScript1_160073:: @ 8160073
	compare VAR_SAFARI_ZONE_STATE, 2
	call_if_eq SafariZone_Southeast_EventScript_16007F
	end

SafariZone_Southeast_EventScript_16007F:: @ 816007F
	setobjectxyperm 1, 31, 34
	return

SafariZone_Southeast_Movement_160087:: @ 8160087
	walk_down
	end_movement

SafariZone_Southeast_Movement_160089:: @ 8160089
	walk_right
	walk_in_place_fastest_down
	end_movement

SafariZone_Southeast_EventScript_16008C:: @ 816008C
	msgbox SafariZone_Southeast_Text_1C3B71, 2
	end

SafariZone_Southeast_EventScript_160095:: @ 8160095
	msgbox SafariZone_Southeast_Text_1C3BBD, 2
	end

SafariZone_Southeast_EventScript_16009E:: @ 816009E
	msgbox SafariZone_Southeast_Text_1C3DCE, 2
	end

SafariZone_Southeast_EventScript_1600A7:: @ 81600A7
	lock
	faceplayer
	compare VAR_TEMP_1, 0
	goto_if_eq SafariZone_Southeast_EventScript_1600D1
	msgbox SafariZone_Southeast_Text_1C3A56, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SafariZone_Southeast_EventScript_1600E0
	msgbox SafariZone_Southeast_Text_1C3A9C, 4
	release
	end

SafariZone_Southeast_EventScript_1600D1:: @ 81600D1
	setvar VAR_TEMP_1, 1
	msgbox SafariZone_Southeast_Text_1C3B2D, 4
	release
	end

SafariZone_Southeast_EventScript_1600E0:: @ 81600E0
	msgbox SafariZone_Southeast_Text_1C3ACA, 4
	closemessage
	switch FACING
	case 2, SafariZone_Southeast_EventScript_160105
	case 4, SafariZone_Southeast_EventScript_16011F
	end

SafariZone_Southeast_EventScript_160105:: @ 8160105
	applymovement 1, SafariZone_Southeast_Movement_160150
	waitmovement 0
	applymovement 255, SafariZone_Southeast_Movement_16014B
	waitmovement 0
	goto SafariZone_Southeast_EventScript_160139
	end

SafariZone_Southeast_EventScript_16011F:: @ 816011F
	applymovement 1, SafariZone_Southeast_Movement_160153
	waitmovement 0
	applymovement 255, SafariZone_Southeast_Movement_16014D
	waitmovement 0
	goto SafariZone_Southeast_EventScript_160139
	end

SafariZone_Southeast_EventScript_160139:: @ 8160139
	setvar VAR_SAFARI_ZONE_STATE, 1
	special ExitSafariMode
	warpdoor MAP_ROUTE121_SAFARI_ZONE_ENTRANCE, 255, 2, 5
	waitstate
	end

SafariZone_Southeast_Movement_16014B:: @ 816014B
	walk_up
	end_movement

SafariZone_Southeast_Movement_16014D:: @ 816014D
	walk_right
	walk_in_place_fastest_up
	end_movement

SafariZone_Southeast_Movement_160150:: @ 8160150
	walk_left
	walk_in_place_fastest_right
	end_movement

SafariZone_Southeast_Movement_160153:: @ 8160153
	walk_down
	walk_in_place_fastest_up
	end_movement
