SootopolisCity_Gym_1F_MapScripts:: @ 815AF07
	map_script 2, SootopolisCity_Gym_1F_MapScript2_15AF86
	map_script 5, SootopolisCity_Gym_1F_MapScript1_15AF22
	map_script 1, SootopolisCity_Gym_1F_MapScript1_15AF25
	map_script 3, SootopolisCity_Gym_1F_MapScript1_15AF1C
	.byte 0

SootopolisCity_Gym_1F_MapScript1_15AF1C:: @ 815AF1C
	setvar VAR_ICE_STEP_COUNT, 1
	end

SootopolisCity_Gym_1F_MapScript1_15AF22:: @ 815AF22
	setstepcallback 4
	end

SootopolisCity_Gym_1F_MapScript1_15AF25:: @ 815AF25
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special SetSootopolisGymCrackedIceMetatiles
	end

SootopolisCity_Gym_1F_EventScript_15AF2E:: @ 815AF2E
	compare VAR_ICE_STEP_COUNT, 8
	goto_if_lt SootopolisCity_Gym_1F_EventScript_15AF85
	compare VAR_ICE_STEP_COUNT, 28
	goto_if_lt SootopolisCity_Gym_1F_EventScript_15AF73
	compare VAR_ICE_STEP_COUNT, 69
	goto_if_lt SootopolisCity_Gym_1F_EventScript_15AF61
	setmetatile 8, 4, 519, 0
	setmetatile 8, 5, 519, 0

SootopolisCity_Gym_1F_EventScript_15AF61:: @ 815AF61
	setmetatile 8, 10, 519, 0
	setmetatile 8, 11, 519, 0

SootopolisCity_Gym_1F_EventScript_15AF73:: @ 815AF73
	setmetatile 8, 15, 519, 0
	setmetatile 8, 16, 519, 0

SootopolisCity_Gym_1F_EventScript_15AF85:: @ 815AF85
	return

SootopolisCity_Gym_1F_MapScript2_15AF86:: @ 815AF86
	map_script_2 VAR_ICE_STEP_COUNT, 8, SootopolisCity_Gym_1F_EventScript_15AFA8
	map_script_2 VAR_ICE_STEP_COUNT, 28, SootopolisCity_Gym_1F_EventScript_15AFBC
	map_script_2 VAR_ICE_STEP_COUNT, 69, SootopolisCity_Gym_1F_EventScript_15AFD0
	map_script_2 VAR_ICE_STEP_COUNT, 0, SootopolisCity_Gym_1F_EventScript_15AFE4
	.2byte 0

SootopolisCity_Gym_1F_EventScript_15AFA8:: @ 815AFA8
	addvar VAR_ICE_STEP_COUNT, 1
	delay 40
	playse SE_RU_GASHIN
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special DrawWholeMapView
	end

SootopolisCity_Gym_1F_EventScript_15AFBC:: @ 815AFBC
	addvar VAR_ICE_STEP_COUNT, 1
	delay 40
	playse SE_RU_GASHIN
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special DrawWholeMapView
	end

SootopolisCity_Gym_1F_EventScript_15AFD0:: @ 815AFD0
	addvar VAR_ICE_STEP_COUNT, 1
	delay 40
	playse SE_RU_GASHIN
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special DrawWholeMapView
	end

SootopolisCity_Gym_1F_EventScript_15AFE4:: @ 815AFE4
	lockall
	delay 20
	applymovement 255, SootopolisCity_Gym_1F_Movement_15AFFD
	waitmovement 0
	playse SE_RU_HYUU
	delay 60
	warphole MAP_SOOTOPOLIS_CITY_GYM_B1F
	waitstate
	end

SootopolisCity_Gym_1F_Movement_15AFFD:: @ 815AFFD
	set_invisible
	end_movement

SootopolisCity_Gym_1F_EventScript_15AFFF:: @ 815AFFF
	trainerbattle 1, TRAINER_WALLACE, 0, SootopolisCity_Gym_1F_Text_18F0CA, SootopolisCity_Gym_1F_Text_18F282, SootopolisCity_Gym_1F_EventScript_15B02D
	goto_if_unset FLAG_RECEIVED_TM03, SootopolisCity_Gym_1F_EventScript_15B056
	goto_if_unset FLAG_BADGE06_GET, SootopolisCity_Gym_1F_EventScript_15B07A
	msgbox SootopolisCity_Gym_1F_Text_18F4D7, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B02D:: @ 815B02D
	message SootopolisCity_Gym_1F_Text_18F342
	waitmessage
	call SootopolisCity_Gym_1F_EventScript_1A02C5
	msgbox SootopolisCity_Gym_1F_Text_18F36B, 4
	setflag FLAG_DEFEATED_SOOTOPOLIS_GYM
	setflag FLAG_BADGE08_GET
	setvar VAR_SPECIAL_8, 8
	call SootopolisCity_Gym_1F_EventScript_1A01C0
	goto SootopolisCity_Gym_1F_EventScript_15B056
	end

SootopolisCity_Gym_1F_EventScript_15B056:: @ 815B056
	giveitem_std ITEM_TM03_WATER_PULSE
	compare RESULT, 0
	goto_if_eq SootopolisCity_Gym_1F_EventScript_1A029B
	msgbox SootopolisCity_Gym_1F_Text_18F466, 4
	setflag FLAG_RECEIVED_TM03
	release
	end

SootopolisCity_Gym_1F_EventScript_15B07A:: @ 815B07A
	msgbox SootopolisCity_Gym_1F_Text_18F5B4, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B084:: @ 815B084
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_SOOTOPOLIS_GYM, SootopolisCity_Gym_1F_EventScript_15B099
	msgbox SootopolisCity_Gym_1F_Text_18E8A5, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B099:: @ 815B099
	msgbox SootopolisCity_Gym_1F_Text_18E9C9, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B0A3:: @ 815B0A3
	lockall
	goto_if_set FLAG_BADGE08_GET, SootopolisCity_Gym_1F_EventScript_15B0C3
	goto SootopolisCity_Gym_1F_EventScript_15B0CD
	end

SootopolisCity_Gym_1F_EventScript_15B0B3:: @ 815B0B3
	lockall
	goto_if_set FLAG_BADGE08_GET, SootopolisCity_Gym_1F_EventScript_15B0C3
	goto SootopolisCity_Gym_1F_EventScript_15B0CD
	end

SootopolisCity_Gym_1F_EventScript_15B0C3:: @ 815B0C3
	msgbox SootopolisCity_Gym_1F_Text_18F665, 4
	releaseall
	end

SootopolisCity_Gym_1F_EventScript_15B0CD:: @ 815B0CD
	msgbox SootopolisCity_Gym_1F_Text_18F649, 4
	releaseall
	end
