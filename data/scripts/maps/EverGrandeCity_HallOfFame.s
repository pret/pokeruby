EverGrandeCity_HallOfFame_MapScripts:: @ 815BB84
	map_script 2, EverGrandeCity_HallOfFame_MapScript2_15BB9E
	map_script 4, EverGrandeCity_HallOfFame_MapScript2_15BB8F
	.byte 0

EverGrandeCity_HallOfFame_MapScript2_15BB8F:: @ 815BB8F
	map_script_2 0x4001, 0, EverGrandeCity_HallOfFame_EventScript_15BB99
	.2byte 0

EverGrandeCity_HallOfFame_EventScript_15BB99:: @ 815BB99
	spriteface 255, 2
	end

EverGrandeCity_HallOfFame_MapScript2_15BB9E:: @ 815BB9E
	map_script_2 0x4001, 0, EverGrandeCity_HallOfFame_EventScript_15BBA8
	.2byte 0

EverGrandeCity_HallOfFame_EventScript_15BBA8:: @ 815BBA8
	lockall
	move 1, EverGrandeCity_HallOfFame_Movement_15BC59
	move 255, EverGrandeCity_HallOfFame_Movement_15BC59
	waitmove 0
	move 1, EverGrandeCity_HallOfFame_Movement_1A0843
	move 255, EverGrandeCity_HallOfFame_Movement_1A083F
	waitmove 0
	msgbox EverGrandeCity_HallOfFame_Text_191841, 4
	closebutton
	move 1, EverGrandeCity_HallOfFame_Movement_15BC60
	move 255, EverGrandeCity_HallOfFame_Movement_15BC60
	waitmove 0
	pause 20
	move 1, EverGrandeCity_HallOfFame_Movement_1A0843
	move 255, EverGrandeCity_HallOfFame_Movement_1A083F
	waitmove 0
	msgbox EverGrandeCity_HallOfFame_Text_1918D7, 4
	closebutton
	move 1, EverGrandeCity_HallOfFame_Movement_1A0841
	move 255, EverGrandeCity_HallOfFame_Movement_1A0841
	waitmove 0
	pause 20
	doanimation 62
	checkanimation 62
	pause 40
	setvar 0x4001, 1
	call EverGrandeCity_HallOfFame_EventScript_19FC13
	checkgender
	compare RESULT, 0
	jumpif EQUAL, EverGrandeCity_HallOfFame_EventScript_15BC41
	compare RESULT, 1
	jumpif EQUAL, EverGrandeCity_HallOfFame_EventScript_15BC4D
	end

EverGrandeCity_HallOfFame_EventScript_15BC41:: @ 815BC41
	sethealplace 1
	fadescreendelay 1, 24
	special 272
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_EventScript_15BC4D:: @ 815BC4D
	sethealplace 2
	fadescreendelay 1, 24
	special 272
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_Movement_15BC59:: @ 815BC59
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

EverGrandeCity_HallOfFame_Movement_15BC60:: @ 815BC60
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
