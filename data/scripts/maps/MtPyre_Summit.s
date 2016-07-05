MtPyre_Summit_MapScripts:: @ 815D4B1
	map_script 3, MtPyre_Summit_MapScript1_15D4B7
	.byte 0

MtPyre_Summit_MapScript1_15D4B7:: @ 815D4B7
	call MtPyre_Summit_EventScript_1A0196
	end

MtPyre_Summit_EventScript_15D4BD:: @ 815D4BD
	lockall
	setvar 0x8008, 0
	jump MtPyre_Summit_EventScript_15D4E1
	end

MtPyre_Summit_EventScript_15D4C9:: @ 815D4C9
	lockall
	setvar 0x8008, 1
	jump MtPyre_Summit_EventScript_15D4E1
	end

MtPyre_Summit_EventScript_15D4D5:: @ 815D4D5
	lockall
	setvar 0x8008, 2
	jump MtPyre_Summit_EventScript_15D4E1
	end

MtPyre_Summit_EventScript_15D4E1:: @ 815D4E1
	move 255, MtPyre_Summit_Movement_1A0841
	waitmove 0
	move 2, MtPyre_Summit_Movement_1A0845
	waitmove 0
	pause 50
	compare 0x8008, 0
	callif 1, MtPyre_Summit_EventScript_15D593
	compare 0x8008, 1
	callif 1, MtPyre_Summit_EventScript_15D59E
	compare 0x8008, 2
	callif 1, MtPyre_Summit_EventScript_15D59F
	.ifdef SAPPHIRE
	msgbox UnknownString_81B52B0, 4
	.else
	msgbox MtPyre_Summit_Text_1B5EEC, 4
	.endif
	closebutton
	fadescreen 1
	disappear 2
	disappear 4
	disappear 5
	disappear 6
	setflag 916
	setflag 917
	fadescreen 0
	pause 20
	call MtPyre_Summit_EventScript_15D57A
	compare 0x8008, 0
	callif 1, MtPyre_Summit_EventScript_15D5AA
	compare 0x8008, 1
	callif 1, MtPyre_Summit_EventScript_15D5BF
	compare 0x8008, 2
	callif 1, MtPyre_Summit_EventScript_15D5CA
	.ifdef SAPPHIRE
	msgbox UnknownString_81B53AB, 4
	.else
	msgbox MtPyre_Summit_Text_1B5FE6, 4
	.endif
	giveitem ITEM_RED_OR_BLUE_ORB
	setflag 212
	releaseall
	end

MtPyre_Summit_EventScript_15D57A:: @ 815D57A
	setflag 111
	setvar 0x4058, 1
	clearflag 840
	clearflag 835
	setvar 0x40a0, 1
	setvar 0x40b9, 1
	return

MtPyre_Summit_EventScript_15D593:: @ 815D593
	move 2, MtPyre_Summit_Movement_15D5E9
	waitmove 0
	return

MtPyre_Summit_EventScript_15D59E:: @ 815D59E
	return

MtPyre_Summit_EventScript_15D59F:: @ 815D59F
	move 2, MtPyre_Summit_Movement_15D5EC
	waitmove 0
	return

MtPyre_Summit_EventScript_15D5AA:: @ 815D5AA
	move 3, MtPyre_Summit_Movement_15D5DF
	waitmove 0
	move 255, MtPyre_Summit_Movement_1A0843
	waitmove 0
	return

MtPyre_Summit_EventScript_15D5BF:: @ 815D5BF
	move 3, MtPyre_Summit_Movement_15D5E3
	waitmove 0
	return

MtPyre_Summit_EventScript_15D5CA:: @ 815D5CA
	move 3, MtPyre_Summit_Movement_15D5E5
	waitmove 0
	move 255, MtPyre_Summit_Movement_1A083F
	waitmove 0
	return

MtPyre_Summit_Movement_15D5DF:: @ 815D5DF
	step_down
	step_down
	step_27
	step_end

MtPyre_Summit_Movement_15D5E3:: @ 815D5E3
	step_down
	step_end

MtPyre_Summit_Movement_15D5E5:: @ 815D5E5
	step_down
	step_down
	step_28
	step_end

MtPyre_Summit_Movement_15D5E9:: @ 815D5E9
	step_left
	step_25
	step_end

MtPyre_Summit_Movement_15D5EC:: @ 815D5EC
	step_right
	step_25
	step_end

MtPyre_Summit_EventScript_15D5EF:: @ 815D5EF
	lock
	faceplayer
	.ifdef SAPPHIRE
	msgbox UnknownString_81B586F, 5
	.else
	msgbox MtPyre_Summit_Text_1B64B3, 5
	.endif
	compare RESULT, 1
	callif 1, MtPyre_Summit_EventScript_15D611
	compare RESULT, 0
	callif 1, MtPyre_Summit_EventScript_15D61A
	release
	end

MtPyre_Summit_EventScript_15D611:: @ 815D611
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5992, 4
	.else
	msgbox MtPyre_Summit_Text_1B65D6, 4
	.endif
	return

MtPyre_Summit_EventScript_15D61A:: @ 815D61A
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5BD7, 4
	.else
	msgbox MtPyre_Summit_Text_1B6823, 4
	.endif
	return

MtPyre_Summit_EventScript_15D623:: @ 815D623
	lock
	faceplayer
	checkflag 259
	jumpeq MtPyre_Summit_EventScript_15D6C4
	checkflag 113
	jumpeq MtPyre_Summit_EventScript_15D64A
	checkflag 129
	jumpeq MtPyre_Summit_EventScript_15D6BA
	.ifdef SAPPHIRE
	msgbox UnknownString_81B54BE, 4
	.else
	msgbox MtPyre_Summit_Text_1B60F9, 4
	.endif
	release
	end

MtPyre_Summit_EventScript_15D64A:: @ 815D64A
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5647, 5
	.else
	msgbox MtPyre_Summit_Text_1B6283, 5
	.endif
	compare RESULT, 1
	jumpeq MtPyre_Summit_EventScript_15D669
	compare RESULT, 0
	jumpeq MtPyre_Summit_EventScript_15D69B
	end

MtPyre_Summit_EventScript_15D669:: @ 815D669
	setvar 0x8004, ITEM_RED_OR_BLUE_ORB
	call MtPyre_Summit_EventScript_1A067F
	closebutton
	move LAST_TALKED, MtPyre_Summit_Movement_1A0841
	waitmove 0
	pause 40
	move LAST_TALKED, MtPyre_Summit_Movement_1A0839
	waitmove 0
	pause 10
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5762, 4
	.else
	msgbox MtPyre_Summit_Text_1B639C, 4
	.endif
	setflag 259
	release
	end

MtPyre_Summit_EventScript_15D69B:: @ 815D69B
	.ifdef SAPPHIRE
	msgbox UnknownString_81B56AB, 5
	.else
	msgbox MtPyre_Summit_Text_1B62E7, 5
	.endif
	compare RESULT, 1
	jumpeq MtPyre_Summit_EventScript_15D669
	compare RESULT, 0
	jumpeq MtPyre_Summit_EventScript_15D69B
	end

MtPyre_Summit_EventScript_15D6BA:: @ 815D6BA
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5540, 4
	.else
	msgbox MtPyre_Summit_Text_1B617B, 4
	.endif
	release
	end

MtPyre_Summit_EventScript_15D6C4:: @ 815D6C4
	.ifdef SAPPHIRE
	msgbox UnknownString_81B57BE, 4
	.else
	msgbox MtPyre_Summit_Text_1B63F8, 4
	.endif
	release
	end

MtPyre_Summit_EventScript_15D6CE:: @ 815D6CE
	lockall
	setvar 0x8008, 0
	jump MtPyre_Summit_EventScript_15D6F2
	end

MtPyre_Summit_EventScript_15D6DA:: @ 815D6DA
	lockall
	setvar 0x8008, 1
	jump MtPyre_Summit_EventScript_15D6F2
	end

MtPyre_Summit_EventScript_15D6E6:: @ 815D6E6
	lockall
	setvar 0x8008, 2
	jump MtPyre_Summit_EventScript_15D6F2
	end

MtPyre_Summit_EventScript_15D6F2:: @ 815D6F2
	move 255, MtPyre_Summit_Movement_1A0841
	waitmove 0
	move 2, MtPyre_Summit_Movement_1A0845
	waitmove 0
	pause 50
	compare 0x8008, 0
	callif 1, MtPyre_Summit_EventScript_15D75E
	compare 0x8008, 1
	callif 1, MtPyre_Summit_EventScript_15D769
	compare 0x8008, 2
	callif 1, MtPyre_Summit_EventScript_15D774
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5BFC, 4
	.else
	msgbox MtPyre_Summit_Text_1B6848, 4
	.endif
	closebutton
	compare 0x8008, 0
	callif 1, MtPyre_Summit_EventScript_15D77F
	compare 0x8008, 1
	callif 1, MtPyre_Summit_EventScript_15D78A
	compare 0x8008, 2
	callif 1, MtPyre_Summit_EventScript_15D795
	disappear 2
	setvar 0x40b9, 3
	releaseall
	end

MtPyre_Summit_EventScript_15D75E:: @ 815D75E
	move 2, MtPyre_Summit_Movement_15D7A0
	waitmove 0
	return

MtPyre_Summit_EventScript_15D769:: @ 815D769
	move 2, MtPyre_Summit_Movement_15D7A3
	waitmove 0
	return

MtPyre_Summit_EventScript_15D774:: @ 815D774
	move 2, MtPyre_Summit_Movement_15D7A4
	waitmove 0
	return

MtPyre_Summit_EventScript_15D77F:: @ 815D77F
	move 2, MtPyre_Summit_Movement_15D7A7
	waitmove 0
	return

MtPyre_Summit_EventScript_15D78A:: @ 815D78A
	move 2, MtPyre_Summit_Movement_15D7B0
	waitmove 0
	return

MtPyre_Summit_EventScript_15D795:: @ 815D795
	move 2, MtPyre_Summit_Movement_15D7B9
	waitmove 0
	return

MtPyre_Summit_Movement_15D7A0:: @ 815D7A0
	step_left
	step_25
	step_end

MtPyre_Summit_Movement_15D7A3:: @ 815D7A3
	step_end

MtPyre_Summit_Movement_15D7A4:: @ 815D7A4
	step_right
	step_25
	step_end

MtPyre_Summit_Movement_15D7A7:: @ 815D7A7
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

MtPyre_Summit_Movement_15D7B0:: @ 815D7B0
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

MtPyre_Summit_Movement_15D7B9:: @ 815D7B9
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
