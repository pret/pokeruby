GraniteCave_StevensRoom_MapScripts:: @ 815CBF9
	.byte 0

GraniteCave_StevensRoom_EventScript_15CBFA:: @ 815CBFA
	lock
	faceplayer
	msgbox GraniteCave_StevensRoom_Text_194AE5, 4
	setvar 0x8004, 274
	call GraniteCave_StevensRoom_EventScript_1A067F
	setflag 189
	msgbox GraniteCave_StevensRoom_Text_194BDD, 4
	giveitem ITEM_TM47
	compare RESULT, 0
	callif EQUAL, GraniteCave_StevensRoom_EventScript_15CC83
	msgbox GraniteCave_StevensRoom_Text_194C8D, 4
	closebutton
	compare FACING, 2
	callif EQUAL, GraniteCave_StevensRoom_EventScript_15CC6D
	compare FACING, 1
	callif EQUAL, GraniteCave_StevensRoom_EventScript_15CC78
	compare FACING, 3
	callif EQUAL, GraniteCave_StevensRoom_EventScript_15CC6D
	compare FACING, 4
	callif EQUAL, GraniteCave_StevensRoom_EventScript_15CC6D
	playsfx 9
	disappear 1
	release
	end

GraniteCave_StevensRoom_EventScript_15CC6D:: @ 815CC6D
	move 1, GraniteCave_StevensRoom_Movement_15CC8C
	waitmove 0
	return

GraniteCave_StevensRoom_EventScript_15CC78:: @ 815CC78
	move 1, GraniteCave_StevensRoom_Movement_15CC93
	waitmove 0
	return

GraniteCave_StevensRoom_EventScript_15CC83:: @ 815CC83
	msgbox GraniteCave_StevensRoom_Text_194D43, 4
	return

GraniteCave_StevensRoom_Movement_15CC8C:: @ 815CC8C
	step_up
	step_up
	step_up
	step_up
	step_up
	step_13
	step_end

GraniteCave_StevensRoom_Movement_15CC93:: @ 815CC93
	step_left
	step_up
	step_up
	step_up
	step_right
	step_up
	step_up
	step_13
	step_end
