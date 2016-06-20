Route110_TrickHouseEnd_MapScripts:: @ 8161936
	map_script 5, Route110_TrickHouseEnd_MapScript1_16194B
	map_script 3, Route110_TrickHouseEnd_MapScript1_161957
	map_script 2, Route110_TrickHouseEnd_MapScript2_16197C
	map_script 4, Route110_TrickHouseEnd_MapScript2_161965
	.byte 0

Route110_TrickHouseEnd_MapScript1_16194B:: @ 816194B
	compare 0x4001, 1
	callif 1, Route110_TrickHouseEnd_EventScript_161994
	end

Route110_TrickHouseEnd_MapScript1_161957:: @ 8161957
	setvar 0x4001, 0
	setvar 0x4002, 0
	special 261
	end

Route110_TrickHouseEnd_MapScript2_161965:: @ 8161965
	map_script_2 0x4002, 0, Route110_TrickHouseEnd_EventScript_16196F
	.2byte 0

Route110_TrickHouseEnd_EventScript_16196F:: @ 816196F
	reappear 1
	spritevisible 1, 29, 1
	spriteface 1, 4
	end

Route110_TrickHouseEnd_MapScript2_16197C:: @ 816197C
	map_script_2 0x4001, 0, Route110_TrickHouseEnd_EventScript_161986
	.2byte 0

Route110_TrickHouseEnd_EventScript_161986:: @ 8161986
	setvar 0x4001, 1
	call Route110_TrickHouseEnd_EventScript_161994
	special 142
	end

Route110_TrickHouseEnd_EventScript_161994:: @ 8161994
	setmaptile 10, 1, 539, 1
	return

Route110_TrickHouseEnd_EventScript_16199E:: @ 816199E
	lock
	faceplayer
	msgbox Route110_TrickHouseEnd_Text_19C281, 4
	setvar 0x4002, 1
	switch 0x4044
	case 0, Route110_TrickHouseEnd_EventScript_161A0B
	case 1, Route110_TrickHouseEnd_EventScript_161A47
	case 2, Route110_TrickHouseEnd_EventScript_161A83
	case 3, Route110_TrickHouseEnd_EventScript_161ABF
	case 4, Route110_TrickHouseEnd_EventScript_161AFB
	case 5, Route110_TrickHouseEnd_EventScript_161B37
	case 6, Route110_TrickHouseEnd_EventScript_161B73
	case 7, Route110_TrickHouseEnd_EventScript_161BAF
	end

Route110_TrickHouseEnd_EventScript_161A0B:: @ 8161A0B
	msgbox Route110_TrickHouseEnd_Text_19C2B2, 4
	msgbox Route110_TrickHouseEnd_Text_19C90B, 4
	setvar 0x40c1, 0
	giveitem ITEM_RARE_CANDY
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, 4
	closebutton
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161A47:: @ 8161A47
	msgbox Route110_TrickHouseEnd_Text_19C333, 4
	msgbox Route110_TrickHouseEnd_Text_19C90B, 4
	setvar 0x40c1, 0
	giveitem ITEM_TIMER_BALL
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, 4
	closebutton
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161A83:: @ 8161A83
	msgbox Route110_TrickHouseEnd_Text_19C3A7, 4
	msgbox Route110_TrickHouseEnd_Text_19C90B, 4
	setvar 0x40c1, 0
	giveitem ITEM_HARD_STONE
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, 4
	closebutton
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161ABF:: @ 8161ABF
	msgbox Route110_TrickHouseEnd_Text_19C41F, 4
	msgbox Route110_TrickHouseEnd_Text_19C90B, 4
	setvar 0x40c1, 0
	giveitem ITEM_SMOKE_BALL
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, 4
	closebutton
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161AFB:: @ 8161AFB
	msgbox Route110_TrickHouseEnd_Text_19C491, 4
	msgbox Route110_TrickHouseEnd_Text_19C90B, 4
	setvar 0x40c1, 0
	giveitem ITEM_TM12
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, 4
	closebutton
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161B37:: @ 8161B37
	msgbox Route110_TrickHouseEnd_Text_19C515, 4
	msgbox Route110_TrickHouseEnd_Text_19C90B, 4
	setvar 0x40c1, 0
	giveitem ITEM_MAGNET
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, 4
	closebutton
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161B73:: @ 8161B73
	msgbox Route110_TrickHouseEnd_Text_19C567, 4
	msgbox Route110_TrickHouseEnd_Text_19C90B, 4
	setvar 0x40c1, 0
	giveitem ITEM_PP_MAX
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C4E
	msgbox Route110_TrickHouseEnd_Text_19C9BD, 4
	closebutton
	call Route110_TrickHouseEnd_EventScript_161C2E
	release
	end

Route110_TrickHouseEnd_EventScript_161BAF:: @ 8161BAF
	msgbox Route110_TrickHouseEnd_Text_19C5AF, 4
	closebutton
	compare FACING, 1
	callif 1, Route110_TrickHouseEnd_EventScript_161C74
	compare FACING, 2
	callif 1, Route110_TrickHouseEnd_EventScript_161C7F
	compare FACING, 3
	callif 1, Route110_TrickHouseEnd_EventScript_161C8A
	compare FACING, 4
	callif 1, Route110_TrickHouseEnd_EventScript_161C95
	pause 30
	msgbox Route110_TrickHouseEnd_Text_19C602, 4
	closebutton
	move 1, Route110_TrickHouseEnd_Movement_1A0839
	waitmove 0
	pause 30
	msgbox Route110_TrickHouseEnd_Text_19C691, 4
	setvar 0x40c1, 0
	.ifdef SAPPHIRE
	givedecoration 32
	.else
	givedecoration 31
	.endc
	compare RESULT, 0
	callif 1, Route110_TrickHouseEnd_EventScript_161C61
	msgbox Route110_TrickHouseEnd_Text_19C85C, 4
	call Route110_TrickHouseEnd_EventScript_161C2E
	special 260
	release
	end

Route110_TrickHouseEnd_EventScript_161C2E:: @ 8161C2E
	move 1, Route110_TrickHouseEnd_Movement_161315
	waitmove 0
	playsfx 178
	move 1, Route110_TrickHouseEnd_Movement_16131E
	waitmove 0
	disappear 1
	addvar 0x4044, 1
	return

Route110_TrickHouseEnd_EventScript_161C4E:: @ 8161C4E
	call Route110_TrickHouseEnd_EventScript_1A02A5
	msgbox Route110_TrickHouseEnd_Text_19C92E, 4
	setvar 0x40c1, 1
	return

Route110_TrickHouseEnd_EventScript_161C61:: @ 8161C61
	call Route110_TrickHouseEnd_EventScript_1A02B8
	msgbox Route110_TrickHouseEnd_Text_19C7D7, 4
	setvar 0x40c1, 1
	return

Route110_TrickHouseEnd_EventScript_161C74:: @ 8161C74
	move 1, Route110_TrickHouseEnd_Movement_1A0845
	waitmove 0
	return

Route110_TrickHouseEnd_EventScript_161C7F:: @ 8161C7F
	move 1, Route110_TrickHouseEnd_Movement_1A0841
	waitmove 0
	return

Route110_TrickHouseEnd_EventScript_161C8A:: @ 8161C8A
	move 1, Route110_TrickHouseEnd_Movement_1A083F
	waitmove 0
	return

Route110_TrickHouseEnd_EventScript_161C95:: @ 8161C95
	move 1, Route110_TrickHouseEnd_Movement_1A0843
	waitmove 0
	return

Route110_TrickHouseEnd_EventScript_161CA0:: @ 8161CA0
	lockall
	spriteface 1, 3
	playsfx 21
	move 1, Route110_TrickHouseEnd_Movement_1A0833
	waitmove 0
	pause 20
	move 1, Route110_TrickHouseEnd_Movement_161CEA
	waitmove 0
	playsfx 178
	move 255, Route110_TrickHouseEnd_Movement_1A0845
	waitmove 0
	msgbox Route110_TrickHouseEnd_Text_19CA8B, 4
	closebutton
	move 255, Route110_TrickHouseEnd_Movement_161CE8
	waitmove 0
	pause 4
	spriteface 1, 4
	releaseall
	end

Route110_TrickHouseEnd_Movement_161CE8:: @ 8161CE8
	step_down
	step_end

Route110_TrickHouseEnd_Movement_161CEA:: @ 8161CEA
	step_48
	step_end

