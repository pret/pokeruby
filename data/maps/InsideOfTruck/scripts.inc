InsideOfTruck_MapScripts:: @ 815FBFF
	map_script 1, InsideOfTruck_MapScript1_15FC0A
	map_script 5, InsideOfTruck_MapScript1_15FC26
	.byte 0

InsideOfTruck_MapScript1_15FC0A:: @ 815FC0A
	setmetatile 4, 1, 520, 0
	setmetatile 4, 2, 528, 0
	setmetatile 4, 3, 536, 0
	end

InsideOfTruck_MapScript1_15FC26:: @ 815FC26
	setstepcallback 5
	end

InsideOfTruck_EventScript_15FC29:: @ 815FC29
	lockall
	setflag FLAG_SPECIAL_FLAG_0
	checkplayergender
	compare RESULT, 0
	goto_if_eq InsideOfTruck_EventScript_15FC45
	compare RESULT, 1
	goto_if_eq InsideOfTruck_EventScript_15FC68
	end

InsideOfTruck_EventScript_15FC45:: @ 815FC45
	setrespawn HEAL_LOCATION_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F
	setvar VAR_LITTLEROOT_INTRO_STATE, 1
	setflag FLAG_HIDE_MAY_MOM_DOWNSTAIRS
	setflag FLAG_HIDE_MOVING_TRUCK_MAY
	setflag FLAG_HIDE_BRENDAN_MOM
	setflag FLAG_HIDE_BRENDAN_UPSTAIRS
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 1
	setdynamicwarp MAP_LITTLEROOT_TOWN, 255, 3, 10
	releaseall
	end

InsideOfTruck_EventScript_15FC68:: @ 815FC68
	setrespawn HEAL_LOCATION_LITTLEROOT_TOWN_MAYS_HOUSE_2F
	setvar VAR_LITTLEROOT_INTRO_STATE, 2
	setflag FLAG_HIDE_BRENDAN_MOM_DOWNSTAIRS
	setflag FLAG_HIDE_MOVING_TRUCK_BRENDAN
	setflag FLAG_HIDE_MAY_MOM
	setflag FLAG_HIDE_MAY_UPSTAIRS
	setvar VAR_LITTLEROOT_HOUSES_STATE, 1
	setdynamicwarp MAP_LITTLEROOT_TOWN, 255, 12, 10
	releaseall
	end

InsideOfTruck_EventScript_15FC8B:: @ 815FC8B
	msgbox InsideOfTruck_Text_198FAD, 3
	end
