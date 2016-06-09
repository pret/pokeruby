GraniteCave_StevensRoom_MapScripts:: @ 815CBF9
	.byte 0

GraniteCave_StevensRoom_EventScript_15CBFA:: @ 815CBFA
	lock
	faceplayer
	loadptr 0, GraniteCave_StevensRoom_Text_194AE5
	callstd 4
	setvar 0x8004, 274
	call GraniteCave_StevensRoom_EventScript_1A067F
	setflag 189
	loadptr 0, GraniteCave_StevensRoom_Text_194BDD
	callstd 4
	setorcopyvar 0x8000, 0x14f
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	callif 1, GraniteCave_StevensRoom_EventScript_15CC83
	loadptr 0, GraniteCave_StevensRoom_Text_194C8D
	callstd 4
	closebutton
	compare FACING, 2
	callif 1, GraniteCave_StevensRoom_EventScript_15CC6D
	compare FACING, 1
	callif 1, GraniteCave_StevensRoom_EventScript_15CC78
	compare FACING, 3
	callif 1, GraniteCave_StevensRoom_EventScript_15CC6D
	compare FACING, 4
	callif 1, GraniteCave_StevensRoom_EventScript_15CC6D
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
	loadptr 0, GraniteCave_StevensRoom_Text_194D43
	callstd 4
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

