SlateportCity_OceanicMuseum_2F_MapScripts:: @ 8155CDA
	map_script 3, SlateportCity_OceanicMuseum_2F_MapScript1_155CE0
	.byte 0

SlateportCity_OceanicMuseum_2F_MapScript1_155CE0:: @ 8155CE0
	call SlateportCity_OceanicMuseum_2F_EventScript_1A0196
	end

SlateportCity_OceanicMuseum_2F_EventScript_155CE6:: @ 8155CE6
	lock
	faceplayer
	msgbox SlateportCity_OceanicMuseum_2F_Text_17ECFD, 4
	closebutton
	playmusic BGM_EVIL_TEAM, 1
	reappear 3
	move 3, SlateportCity_OceanicMuseum_2F_Movement_155EB4
	waitmove 0
	reappear 4
	move 4, SlateportCity_OceanicMuseum_2F_Movement_155EC3
	waitmove 0
	move 3, SlateportCity_OceanicMuseum_2F_Movement_155EB8
	move 4, SlateportCity_OceanicMuseum_2F_Movement_155EC5
	waitmove 0
	compare FACING, 1
	callif 1, SlateportCity_OceanicMuseum_2F_EventScript_155E62
	compare FACING, 4
	callif 1, SlateportCity_OceanicMuseum_2F_EventScript_155E62
	msgbox SlateportCity_OceanicMuseum_2F_Text_17EDAE, 4
	compare FACING, 4
	callif 5, SlateportCity_OceanicMuseum_2F_EventScript_155E6D
	msgbox SlateportCity_OceanicMuseum_2F_Text_17EDD7, 4
	msgbox SlateportCity_OceanicMuseum_2F_Text_17EE01, 4
	closebutton
	move 4, SlateportCity_OceanicMuseum_2F_Movement_155EB2
	waitmove 0
	compare FACING, 1
	callif 1, SlateportCity_OceanicMuseum_2F_EventScript_155E78
	compare FACING, 3
	callif 1, SlateportCity_OceanicMuseum_2F_EventScript_155E83
	trainerbattle 3, TRAINER_MUSEUM_2F_GRUNT_1, 0, SlateportCity_OceanicMuseum_2F_Text_17EE4E
	msgbox SlateportCity_OceanicMuseum_2F_Text_17EE66, 4
	closebutton
	move 4, SlateportCity_OceanicMuseum_2F_Movement_155EBF
	waitmove 0
	move 3, SlateportCity_OceanicMuseum_2F_Movement_155EB2
	waitmove 0
	msgbox SlateportCity_OceanicMuseum_2F_Text_17EEA5, 4
	playmusicbattle 0
	trainerbattle 3, TRAINER_MUSEUM_2F_GRUNT_2, 0, SlateportCity_OceanicMuseum_2F_Text_17EED6
	move 3, SlateportCity_OceanicMuseum_2F_Movement_155EBF
	waitmove 0
	move 3, SlateportCity_OceanicMuseum_2F_Movement_1A0845
	move 4, SlateportCity_OceanicMuseum_2F_Movement_1A0841
	waitmove 0
	msgbox SlateportCity_OceanicMuseum_2F_Text_17EEEA, 4
	closebutton
	pause 35
	reappear 2
	move 2, SlateportCity_OceanicMuseum_2F_Movement_155EA8
	move 4, SlateportCity_OceanicMuseum_2F_Movement_155ECE
	waitmove 0
	msgbox SlateportCity_OceanicMuseum_2F_Text_17EF62, 4
	move 2, SlateportCity_OceanicMuseum_2F_Movement_155EA6
	waitmove 0
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F17E, 4
	closebutton
	fadescreen 1
	disappear 2
	disappear 3
	disappear 4
	fadescreen 0
	pause 30
	setflag 883
	move 255, SlateportCity_OceanicMuseum_2F_Movement_1A0843
	waitmove 0
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F352, 4
	setvar 0x8004, 269
	call SlateportCity_OceanicMuseum_2F_EventScript_1A067F
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F433, 4
	closebutton
	move 1, SlateportCity_OceanicMuseum_2F_Movement_155E98
	waitmove 0
	playsfx 9
	disappear 1
	setflag 900
	setflag 149
	clearflag 947
	setflag 949
	release
	end

SlateportCity_OceanicMuseum_2F_EventScript_155E62:: @ 8155E62
	move 255, SlateportCity_OceanicMuseum_2F_Movement_1A083F
	waitmove 0
	return

SlateportCity_OceanicMuseum_2F_EventScript_155E6D:: @ 8155E6D
	move 1, SlateportCity_OceanicMuseum_2F_Movement_1A083F
	waitmove 0
	return

SlateportCity_OceanicMuseum_2F_EventScript_155E78:: @ 8155E78
	move 255, SlateportCity_OceanicMuseum_2F_Movement_155E8E
	waitmove 0
	return

SlateportCity_OceanicMuseum_2F_EventScript_155E83:: @ 8155E83
	move 255, SlateportCity_OceanicMuseum_2F_Movement_155E92
	waitmove 0
	return

SlateportCity_OceanicMuseum_2F_Movement_155E8E:: @ 8155E8E
	step_left
	step_down
	step_27
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155E92:: @ 8155E92
	step_up
	step_left
	step_left
	step_down
	step_27
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155E98:: @ 8155E98
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_left
	step_left
	step_up
	step_up
	step_13
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EA6:: @ 8155EA6
	step_right
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EA8:: @ 8155EA8
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EB2:: @ 8155EB2
	step_right
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EB4:: @ 8155EB4
	step_down
	step_right
	step_25
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EB8:: @ 8155EB8
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EBF:: @ 8155EBF
	step_40
	step_left
	step_41
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EC3:: @ 8155EC3
	step_down
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155EC5:: @ 8155EC5
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

SlateportCity_OceanicMuseum_2F_Movement_155ECE:: @ 8155ECE
	step_14
	step_14
	step_14
	step_14
	step_14
	step_14
	step_14
	step_14
	step_13
	step_15
	step_26
	step_end

SlateportCity_OceanicMuseum_2F_EventScript_155EDA:: @ 8155EDA
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F572, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155EE3:: @ 8155EE3
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F5E3, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155EEC:: @ 8155EEC
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F653, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155EF5:: @ 8155EF5
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F754, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155EFE:: @ 8155EFE
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F7BC, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F07:: @ 8155F07
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F84E, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F10:: @ 8155F10
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F8BC, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F19:: @ 8155F19
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F918, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F22:: @ 8155F22
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F975, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F2B:: @ 8155F2B
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F9C7, 3
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F34:: @ 8155F34
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F4B6, 2
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F3D:: @ 8155F3D
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F50E, 2
	end

SlateportCity_OceanicMuseum_2F_EventScript_155F46:: @ 8155F46
	lock
	faceplayer
	msgbox SlateportCity_OceanicMuseum_2F_Text_17F53B, 4
	closebutton
	move LAST_TALKED, SlateportCity_OceanicMuseum_2F_Movement_1A083D
	waitmove 0
	release
	end

