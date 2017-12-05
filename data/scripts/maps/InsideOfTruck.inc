InsideOfTruck_MapScripts:: @ 815FBFF
	map_script 1, InsideOfTruck_MapScript1_15FC0A
	map_script 5, InsideOfTruck_MapScript1_15FC26
	.byte 0

InsideOfTruck_MapScript1_15FC0A:: @ 815FC0A
	setmaptile 4, 1, 520, 0
	setmaptile 4, 2, 528, 0
	setmaptile 4, 3, 536, 0
	end

InsideOfTruck_MapScript1_15FC26:: @ 815FC26
	tileeffect 5
	end

InsideOfTruck_EventScript_15FC29:: @ 815FC29
	lockall
	setflag 0x4000
	checkplayergender
	compare RESULT, 0
	goto_if_eq InsideOfTruck_EventScript_15FC45
	compare RESULT, 1
	goto_if_eq InsideOfTruck_EventScript_15FC68
	end

InsideOfTruck_EventScript_15FC45:: @ 815FC45
	sethealplace 1
	setvar 0x4092, 1
	setflag 759
	setflag 762
	setflag 784
	setflag 760
	setvar 0x408c, 1
	setdynamicwarp MAP_LITTLEROOT_TOWN, 255, 3, 10
	releaseall
	end

InsideOfTruck_EventScript_15FC68:: @ 815FC68
	sethealplace 2
	setvar 0x4092, 2
	setflag 758
	setflag 761
	setflag 785
	setflag FLAG_HIDE_MAY_UPSTAIRS
	setvar 0x4082, 1
	setdynamicwarp MAP_LITTLEROOT_TOWN, 255, 12, 10
	releaseall
	end

InsideOfTruck_EventScript_15FC8B:: @ 815FC8B
	msgbox InsideOfTruck_Text_198FAD, 3
	end
