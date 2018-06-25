SkyPillar_Top_MapScripts:: @ 815F302
	map_script 5, SkyPillar_Top_MapScript1_15F308
	.byte 0

SkyPillar_Top_MapScript1_15F308:: @ 815F308
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, SkyPillar_Top_EventScript_15F312
	end

SkyPillar_Top_EventScript_15F312:: @ 815F312
	removeobject LAST_TALKED
	return

SkyPillar_Top_EventScript_15F316:: @ 815F316
	lock
	faceplayer
	setwildbattle SPECIES_RAYQUAZA, 70, ITEM_NONE
	waitse
	playmoncry SPECIES_RAYQUAZA, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_RAYQUAZA
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	special ScrSpecial_StartRayquazaBattle
	waitstate
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end
