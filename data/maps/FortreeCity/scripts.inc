FortreeCity_MapScripts:: @ 814C943
	map_script MAP_SCRIPT_ON_TRANSITION, FortreeCity_MapScript1_14C94E
	map_script MAP_SCRIPT_ON_RESUME, FortreeCity_MapScript1_14C952
	.byte 0

FortreeCity_MapScript1_14C94E:: @ 814C94E
	setflag FLAG_VISITED_FORTREE_CITY
	end

FortreeCity_MapScript1_14C952:: @ 814C952
	setstepcallback 2
	end

FortreeCity_EventScript_14C955:: @ 814C955
	msgbox FortreeCity_Text_167577, MSGBOX_NPC
	end

FortreeCity_EventScript_14C95E:: @ 814C95E
	lock
	faceplayer
	goto_if_set FLAG_KECLEON_FLED_FORTREE, FortreeCity_EventScript_14C973
	msgbox FortreeCity_Text_1675C2, MSGBOX_DEFAULT
	release
	end

FortreeCity_EventScript_14C973:: @ 814C973
	msgbox FortreeCity_Text_167642, MSGBOX_DEFAULT
	release
	end

FortreeCity_EventScript_14C97D:: @ 814C97D
	msgbox FortreeCity_Text_16768A, MSGBOX_NPC
	end

FortreeCity_EventScript_14C986:: @ 814C986
	msgbox FortreeCity_Text_16770E, MSGBOX_NPC
	end

FortreeCity_EventScript_14C98F:: @ 814C98F
	msgbox FortreeCity_Text_1677BD, MSGBOX_NPC
	end

FortreeCity_EventScript_14C998:: @ 814C998
	msgbox FortreeCity_Text_16782C, MSGBOX_NPC
	end

FortreeCity_EventScript_14C9A1:: @ 814C9A1
	msgbox FortreeCity_Text_16792F, MSGBOX_SIGN
	end

FortreeCity_EventScript_14C9AA:: @ 814C9AA
	msgbox FortreeCity_Text_167969, MSGBOX_SIGN
	end

FortreeCity_EventScript_14C9B3:: @ 814C9B3
	lock
	faceplayer
	checkitem ITEM_DEVON_SCOPE, 1
	compare VAR_RESULT, 1
	goto_if_eq FortreeCity_EventScript_14C9CF
	msgbox FortreeCity_Text_167868, MSGBOX_DEFAULT
	release
	end

FortreeCity_EventScript_14C9CF:: @ 814C9CF
	msgbox FortreeCity_Text_16788B, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FortreeCity_EventScript_14C9E4
	release
	end

FortreeCity_EventScript_14C9E4:: @ 814C9E4
	msgbox FortreeCity_Text_1678CB, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Movement_KecleonAppears
	waitmovement 0
	waitse
	playmoncry SPECIES_KECLEON, 2
	delay 40
	waitmoncry
	applymovement VAR_LAST_TALKED, FortreeCity_Movement_14CA13
	waitmovement 0
	removeobject VAR_LAST_TALKED
	setflag FLAG_KECLEON_FLED_FORTREE
	release
	end

FortreeCity_Movement_14CA13:: @ 814CA13
	walk_right
	step_end
