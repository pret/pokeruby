SeafloorCavern_Room9_MapScripts:: @ 815DAE6
	map_script 3, SeafloorCavern_Room9_MapScript1_15DAEC
	.byte 0

SeafloorCavern_Room9_MapScript1_15DAEC:: @ 815DAEC
	call SeafloorCavern_Room9_EventScript_1A0196
	call SeafloorCavern_Room9_EventScript_1A01B5
	.ifdef SAPPHIRE
	setmapfooter 157
	.else
	setmapfooter 327
	.endif
	end

SeafloorCavern_Room9_EventScript_15DAFA:: @ 815DAFA
	lockall
	setvar 0x8004, 2
	setvar 0x8005, 3
	setvar 0x8006, 4
	setvar 0x8007, 5
	move 255, SeafloorCavern_Room9_Movement_1A0841
	waitmove 0
	move 255, SeafloorCavern_Room9_Movement_15DD68
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4850, 4
	closebutton
	reappear 0x8004
	move 255, SeafloorCavern_Room9_Movement_1A083F
	waitmove 0
	move 0x8004, SeafloorCavern_Room9_Movement_15DD36
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B486C, 4
	move 0x8004, SeafloorCavern_Room9_Movement_1A0841
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4897, 4
	move 0x8004, SeafloorCavern_Room9_Movement_1A0839
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B491F, 4
	trainerbattle 3, TRAINER_SEAFLOOR_CAVERN_GRUNT_5, 0, SeafloorCavern_Room9_Text_1B49AE
	msgbox SeafloorCavern_Room9_Text_1B49C1, 4
	setweather 0
	doweather
	special 332
	waitstate
	msgbox SeafloorCavern_Room9_Text_1B4A5A, 4
	special 284
	waitstate
	.ifdef SAPPHIRE
	setvar RESULT, 1
	.else
	setvar RESULT, 0
	.endif
	playsfx 209
	setanimation 0, 16
	setanimation 1, 42
	setanimation 2, 0
	doanimation 54
	checkanimation 54
	.ifdef SAPPHIRE
	setvar RESULT, 0
	.else
	setvar RESULT, 1
	.endif
	fanfare 388
	playsfx 107
	special 281
	move 0x8004, SeafloorCavern_Room9_Movement_1A0841
	move 255, SeafloorCavern_Room9_Movement_1A0841
	waitmove 0
	pause 150
	disappear 7
	reappear 1
	waitstate
	pause 60
	move 1, SeafloorCavern_Room9_Movement_15DD4C
	waitmove 0
	special 282
	waitstate
	setvar 0x8004, 1
	setvar 0x8005, 1
	special 310
	waitstate
	move 1, SeafloorCavern_Room9_Movement_15DD57
	waitmove 0
	disappear 1
	pause 4
	setvar 0x8004, 2
	setvar 0x8005, 2
	special 310
	waitstate
	pause 30
	setvar 0x8004, 2
	setvar 0x8005, 3
	setvar 0x8006, 4
	setvar 0x8007, 5
	msgbox SeafloorCavern_Room9_Text_1B4A89, 4
	playsfx 2
	move 255, SeafloorCavern_Room9_Movement_1A083F
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4ADB, 4
	closebutton
	move 0x8004, SeafloorCavern_Room9_Movement_15DD41
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4B11, 4
	closebutton
	playsfx 3
	pause 20
	move 0x8004, SeafloorCavern_Room9_Movement_1A0845
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4C79, 4
	closebutton
	reappear 0x8005
	reappear 0x8006
	reappear 0x8007
	move 0x8007, SeafloorCavern_Room9_Movement_15DD63
	move 0x8006, SeafloorCavern_Room9_Movement_15DD63
	move 0x8005, SeafloorCavern_Room9_Movement_15DD5A
	waitmove 0
	move 0x8004, SeafloorCavern_Room9_Movement_1A083F
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4D02, 4
	playsfx 21
	move 0x8004, SeafloorCavern_Room9_Movement_1A0833
	waitmove 0
	move 0x8004, SeafloorCavern_Room9_Movement_1A0835
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4DD3, 4
	msgbox SeafloorCavern_Room9_Text_1B4E37, 4
	closebutton
	move 0x8005, SeafloorCavern_Room9_Movement_15DD60
	move 0x8004, SeafloorCavern_Room9_Movement_15DD46
	waitmove 0
	msgbox SeafloorCavern_Room9_Text_1B4ECA, 4
	setvar 0x407b, 1
	clearflag 855
	clearflag 856
	clearflag 816
	clearflag 973
	setvar 0x405e, 1
	clearflag 944
	clearflag 945
	setflag 2090
	setflag 854
	setflag 129
	setflag 967
	setvar 0x40c6, 1
	setvar 0x40a2, 1
	setflag 828
	setflag 829
	setflag 831
	setflag 859
	setflag 946
	warp Route128, 255, 38, 22
	waitstate
	releaseall
	end

SeafloorCavern_Room9_Movement_15DD36:: @ 815DD36
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

	.incbin "baserom.gba", 0x15dd3e, 0x3

SeafloorCavern_Room9_Movement_15DD41:: @ 815DD41
	step_left
	step_14
	step_end

	.incbin "baserom.gba", 0x15dd44, 0x2

SeafloorCavern_Room9_Movement_15DD46:: @ 815DD46
	step_01
	step_40
	step_down
	step_41
	step_28
	step_end

SeafloorCavern_Room9_Movement_15DD4C:: @ 815DD4C
	step_14
	step_14
	slow_step_down
	step_14
	step_14
	step_14
	slow_step_down
	step_14
	step_14
	step_14
	step_end

SeafloorCavern_Room9_Movement_15DD57:: @ 815DD57
	step_32
	step_32
	step_end

SeafloorCavern_Room9_Movement_15DD5A:: @ 815DD5A
	step_18
	step_18
	step_18
	step_18
	step_18
	step_end

SeafloorCavern_Room9_Movement_15DD60:: @ 815DD60
	step_right
	step_right
	step_end

SeafloorCavern_Room9_Movement_15DD63:: @ 815DD63
	step_18
	step_18
	step_18
	step_18
	step_end

SeafloorCavern_Room9_Movement_15DD68:: @ 815DD68
	step_14
	step_14
	step_end

