GraniteCave_StevensRoom_MapScripts:: @ 815CBF9
	.byte 0

GraniteCave_StevensRoom_EventScript_15CBFA:: @ 815CBFA
	lock
	faceplayer
	msgbox GraniteCave_StevensRoom_Text_194AE5, 4
	setvar VAR_SPECIAL_4, ITEM_LETTER
	call GraniteCave_StevensRoom_EventScript_1A067F
	setflag FLAG_DELIVERED_STEVEN_LETTER
	msgbox GraniteCave_StevensRoom_Text_194BDD, 4
	giveitem_std ITEM_TM47_STEEL_WING
	compare RESULT, 0
	call_if_eq GraniteCave_StevensRoom_EventScript_15CC83
	msgbox GraniteCave_StevensRoom_Text_194C8D, 4
	closemessage
	compare FACING, 2
	call_if_eq GraniteCave_StevensRoom_EventScript_15CC6D
	compare FACING, 1
	call_if_eq GraniteCave_StevensRoom_EventScript_15CC78
	compare FACING, 3
	call_if_eq GraniteCave_StevensRoom_EventScript_15CC6D
	compare FACING, 4
	call_if_eq GraniteCave_StevensRoom_EventScript_15CC6D
	playse SE_KAIDAN
	removeobject 1
	release
	end

GraniteCave_StevensRoom_EventScript_15CC6D:: @ 815CC6D
	applymovement 1, GraniteCave_StevensRoom_Movement_15CC8C
	waitmovement 0
	return

GraniteCave_StevensRoom_EventScript_15CC78:: @ 815CC78
	applymovement 1, GraniteCave_StevensRoom_Movement_15CC93
	waitmovement 0
	return

GraniteCave_StevensRoom_EventScript_15CC83:: @ 815CC83
	msgbox GraniteCave_StevensRoom_Text_194D43, 4
	return

GraniteCave_StevensRoom_Movement_15CC8C:: @ 815CC8C
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	delay_8
	end_movement

GraniteCave_StevensRoom_Movement_15CC93:: @ 815CC93
	walk_left
	walk_up
	walk_up
	walk_up
	walk_right
	walk_up
	walk_up
	delay_8
	end_movement
