FortreeCity_House4_MapScripts:: @ 815817E
	.byte 0

FortreeCity_House4_EventScript_15817F:: @ 815817F
	msgbox FortreeCity_House4_Text_1867AF, MSGBOX_NPC
	end

FortreeCity_House4_EventScript_158188:: @ 8158188
	lockall
	goto_if_set FLAG_RECEIVED_MENTAL_HERB, FortreeCity_House4_EventScript_158204
	goto_if_set FLAG_WINGULL_DELIVERED_MAIL, FortreeCity_House4_EventScript_1581D6
	goto_if_set FLAG_WINGULL_SENT_ON_ERRAND, FortreeCity_House4_EventScript_1581C2
	msgbox FortreeCity_House4_Text_186835, MSGBOX_DEFAULT
	closemessage
	setflag FLAG_WINGULL_SENT_ON_ERRAND
	clearflag FLAG_HIDE_WINGULL_MOSSDEEP_HOUSE
	applymovement 3, FortreeCity_House4_Movement_158218
	waitmovement 0
	removeobject 3
	releaseall
	end

FortreeCity_House4_EventScript_1581C2:: @ 81581C2
	applymovement VAR_LAST_TALKED, FortreeCity_House4_Movement_1A0839
	waitmovement 0
	msgbox FortreeCity_House4_Text_18684E, MSGBOX_DEFAULT
	releaseall
	end

FortreeCity_House4_EventScript_1581D6:: @ 81581D6
	applymovement VAR_LAST_TALKED, FortreeCity_House4_Movement_1A0839
	waitmovement 0
	msgbox FortreeCity_House4_Text_186881, MSGBOX_DEFAULT
	giveitem ITEM_MENTAL_HERB
	compare VAR_RESULT, 0
	goto_if_eq FortreeCity_House4_EventScript_1A029B
	setflag FLAG_RECEIVED_MENTAL_HERB
	releaseall
	end

FortreeCity_House4_EventScript_158204:: @ 8158204
	applymovement VAR_LAST_TALKED, FortreeCity_House4_Movement_1A0839
	waitmovement 0
	msgbox FortreeCity_House4_Text_186924, MSGBOX_DEFAULT
	releaseall
	end

FortreeCity_House4_Movement_158218:: @ 8158218
	walk_fast_down
	walk_fast_down
	walk_fast_right
	walk_in_place_fastest_down
	delay_8
	end_movement

FortreeCity_House4_EventScript_15821E:: @ 815821E
	lock
	faceplayer
	waitse
	playmoncry SPECIES_WINGULL, 0
	msgbox FortreeCity_House4_Text_18695C, MSGBOX_DEFAULT
	waitmoncry
	release
	end
