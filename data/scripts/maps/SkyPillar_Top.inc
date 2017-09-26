SkyPillar_Top_MapScripts:: @ 815F302
	map_script 5, SkyPillar_Top_MapScript1_15F308
	.byte 0

SkyPillar_Top_MapScript1_15F308:: @ 815F308
	checkflag 2145
	call_if 1, SkyPillar_Top_EventScript_15F312
	end

SkyPillar_Top_EventScript_15F312:: @ 815F312
	removeobject LAST_TALKED
	return

SkyPillar_Top_EventScript_15F316:: @ 815F316
	lock
	faceplayer
	setwildbattle SPECIES_RAYQUAZA, 70, ITEM_NONE
	waitse
	pokecry SPECIES_RAYQUAZA, 2
	delay 40
	waitpokecry
	setflag 773
	setflag 2145
	special ScrSpecial_StartRayquazaBattle
	waitstate
	clearflag 2145
	release
	end
