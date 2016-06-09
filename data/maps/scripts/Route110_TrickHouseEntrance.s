Route110_TrickHouseEntrance_MapScripts:: @ 8160F2B
	map_script 3, Route110_TrickHouseEntrance_MapScript1_160F3B
	map_script 2, Route110_TrickHouseEntrance_MapScript2_1611CD
	map_script 4, Route110_TrickHouseEntrance_MapScript2_1610B2
	.byte 0

Route110_TrickHouseEntrance_MapScript1_160F3B:: @ 8160F3B
	setflag 2114
	compare 0x40b5, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_160FCE
	compare 0x40c1, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_160FB2
	compare 0x40a6, 1
	jumpeq Route110_TrickHouseEntrance_EventScript_16108E
	compare 0x40a7, 5
	callif 1, Route110_TrickHouseEntrance_EventScript_160FDE
	compare 0x40a7, 3
	callif 1, Route110_TrickHouseEntrance_EventScript_160FDE
	compare 0x40a7, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_160FDE
	switch 0x40a7
	case 0, Route110_TrickHouseEntrance_EventScript_16109A
	case 1, Route110_TrickHouseEntrance_EventScript_1610A0
	case 3, Route110_TrickHouseEntrance_EventScript_1610A6
	case 4, Route110_TrickHouseEntrance_EventScript_1610AC
	end

Route110_TrickHouseEntrance_EventScript_160FB2:: @ 8160FB2
	setvar 0x40a5, 1
	compare 0x4044, 8
	jumpeq Route110_TrickHouseEntrance_EventScript_160FC8
	setvar 0x40a7, 2
	end

Route110_TrickHouseEntrance_EventScript_160FC8:: @ 8160FC8
	setvar 0x40a7, 6
	end

Route110_TrickHouseEntrance_EventScript_160FCE:: @ 8160FCE
	setvar 0x40b5, 0
	setvar 0x40a7, 5
	setvar 0x40a5, 1
	end

Route110_TrickHouseEntrance_EventScript_160FDE:: @ 8160FDE
	setvar 0x40a7, 0
	compare 0x4044, 1
	callif 1, Route110_TrickHouseEntrance_EventScript_16103C
	compare 0x4044, 2
	callif 1, Route110_TrickHouseEntrance_EventScript_161046
	compare 0x4044, 3
	callif 1, Route110_TrickHouseEntrance_EventScript_161050
	compare 0x4044, 4
	callif 1, Route110_TrickHouseEntrance_EventScript_16105A
	compare 0x4044, 5
	callif 1, Route110_TrickHouseEntrance_EventScript_161064
	compare 0x4044, 6
	callif 1, Route110_TrickHouseEntrance_EventScript_16106E
	compare 0x4044, 7
	callif 1, Route110_TrickHouseEntrance_EventScript_161078
	compare 0x4044, 8
	callif 1, Route110_TrickHouseEntrance_EventScript_161082
	return

Route110_TrickHouseEntrance_EventScript_16103C:: @ 816103C
	checkflag 2057
	callif 0, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161046:: @ 8161046
	checkflag 2058
	callif 0, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161050:: @ 8161050
	checkflag 2059
	callif 0, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_16105A:: @ 816105A
	checkflag 2060
	callif 0, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161064:: @ 8161064
	checkflag 2061
	callif 0, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_16106E:: @ 816106E
	checkflag 2062
	callif 0, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161078:: @ 8161078
	checkflag 2052
	callif 0, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161082:: @ 8161082
	setvar 0x40a7, 4
	return

Route110_TrickHouseEntrance_EventScript_161088:: @ 8161088
	setvar 0x40a7, 3
	return

Route110_TrickHouseEntrance_EventScript_16108E:: @ 816108E
	movespriteperm 1, 5, 2
	spritebehave 1, 4
	end

Route110_TrickHouseEntrance_EventScript_16109A:: @ 816109A
	setvar 0x40a5, 0
	end

Route110_TrickHouseEntrance_EventScript_1610A0:: @ 81610A0
	setvar 0x40a5, 1
	end

Route110_TrickHouseEntrance_EventScript_1610A6:: @ 81610A6
	setvar 0x40a5, 1
	end

Route110_TrickHouseEntrance_EventScript_1610AC:: @ 81610AC
	setvar 0x40a5, 1
	end

Route110_TrickHouseEntrance_MapScript2_1610B2:: @ 81610B2
	map_script_2 0x40a6, 1, Route110_TrickHouseEntrance_EventScript_1610F4
	map_script_2 0x40a7, 0, Route110_TrickHouseEntrance_EventScript_161105
	map_script_2 0x40a7, 1, Route110_TrickHouseEntrance_EventScript_1611AB
	map_script_2 0x40a7, 2, Route110_TrickHouseEntrance_EventScript_1611AF
	map_script_2 0x40a7, 3, Route110_TrickHouseEntrance_EventScript_1611AF
	map_script_2 0x40a7, 4, Route110_TrickHouseEntrance_EventScript_1611AB
	map_script_2 0x40a7, 5, Route110_TrickHouseEntrance_EventScript_1611AB
	map_script_2 0x40a7, 6, Route110_TrickHouseEntrance_EventScript_1611BE
	.2byte 0

Route110_TrickHouseEntrance_EventScript_1610F4:: @ 81610F4
	reappear 1
	spritevisible 1, 29, 0
	spriteface 1, 4
	spriteface 255, 3
	end

Route110_TrickHouseEntrance_EventScript_161105:: @ 8161105
	reappear 1
	spriteinvisible 1, 29, 0
	switch 0x4044
	case 0, Route110_TrickHouseEntrance_EventScript_16116B
	case 1, Route110_TrickHouseEntrance_EventScript_161173
	case 2, Route110_TrickHouseEntrance_EventScript_161193
	case 3, Route110_TrickHouseEntrance_EventScript_161183
	case 4, Route110_TrickHouseEntrance_EventScript_16118B
	case 5, Route110_TrickHouseEntrance_EventScript_16117B
	case 6, Route110_TrickHouseEntrance_EventScript_16119B
	case 7, Route110_TrickHouseEntrance_EventScript_1611A3
	end

Route110_TrickHouseEntrance_EventScript_16116B:: @ 816116B
	movesprite 1, 6, 3
	end

Route110_TrickHouseEntrance_EventScript_161173:: @ 8161173
	movesprite 1, 11, 5
	end

Route110_TrickHouseEntrance_EventScript_16117B:: @ 816117B
	movesprite 1, 11, 1
	end

Route110_TrickHouseEntrance_EventScript_161183:: @ 8161183
	movesprite 1, 3, 1
	end

Route110_TrickHouseEntrance_EventScript_16118B:: @ 816118B
	movesprite 1, 0, 5
	end

Route110_TrickHouseEntrance_EventScript_161193:: @ 8161193
	movesprite 1, 9, 1
	end

Route110_TrickHouseEntrance_EventScript_16119B:: @ 816119B
	movesprite 1, 8, 1
	end

Route110_TrickHouseEntrance_EventScript_1611A3:: @ 81611A3
	movesprite 1, 4, 4
	end

Route110_TrickHouseEntrance_EventScript_1611AB:: @ 81611AB
	disappear 1
	end

Route110_TrickHouseEntrance_EventScript_1611AF:: @ 81611AF
	reappear 1
	movesprite 1, 5, 2
	spriteface 1, 2
	end

Route110_TrickHouseEntrance_EventScript_1611BE:: @ 81611BE
	reappear 1
	movesprite 1, 5, 2
	spriteface 1, 1
	end

Route110_TrickHouseEntrance_MapScript2_1611CD:: @ 81611CD
	map_script_2 0x40a6, 1, Route110_TrickHouseEntrance_EventScript_1611D7
	.2byte 0

Route110_TrickHouseEntrance_EventScript_1611D7:: @ 81611D7
	lockall
	pause 20
	compare 0x4044, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_161327
	loadptr 0, Route110_TrickHouseEntrance_Text_19BD82
	callstd 4
	closebutton
	pause 20
	move 1, Route110_TrickHouseEntrance_Movement_161315
	waitmove 0
	playsfx 178
	move 1, Route110_TrickHouseEntrance_Movement_16131E
	waitmove 0
	disappear 1
	setvar 0x40a7, 1
	setvar 0x40a6, 0
	releaseall
	end

	.incbin "baserom.gba", 0x161218, 0x2

Route110_TrickHouseEntrance_EventScript_16121A:: @ 816121A
	lockall
	switch 0x40a7
	case 0, Route110_TrickHouseEntrance_EventScript_16124D
	case 2, Route110_TrickHouseEntrance_EventScript_16136E
	case 3, Route110_TrickHouseEntrance_EventScript_161330
	case 6, Route110_TrickHouseEntrance_EventScript_161518
	end

Route110_TrickHouseEntrance_EventScript_16124D:: @ 816124D
	playsfx 21
	move 255, Route110_TrickHouseEntrance_Movement_1A0833
	waitmove 0
	move 255, Route110_TrickHouseEntrance_Movement_1A0835
	waitmove 0
	compare 0x4044, 0
	callif 1, Route110_TrickHouseEntrance_EventScript_1612CD
	compare 0x4044, 1
	callif 1, Route110_TrickHouseEntrance_EventScript_1612D6
	compare 0x4044, 2
	callif 1, Route110_TrickHouseEntrance_EventScript_1612DF
	compare 0x4044, 3
	callif 1, Route110_TrickHouseEntrance_EventScript_1612E8
	compare 0x4044, 4
	callif 1, Route110_TrickHouseEntrance_EventScript_1612F1
	compare 0x4044, 5
	callif 1, Route110_TrickHouseEntrance_EventScript_1612FA
	compare 0x4044, 6
	callif 1, Route110_TrickHouseEntrance_EventScript_161303
	compare 0x4044, 7
	callif 1, Route110_TrickHouseEntrance_EventScript_16130C
	closebutton
	setvar 0x40a6, 1
	warp Route110_TrickHouseEntrance, 255, 6, 2
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1612CD:: @ 81612CD
	loadptr 0, Route110_TrickHouseEntrance_Text_19BA6E
	callstd 4
	return

Route110_TrickHouseEntrance_EventScript_1612D6:: @ 81612D6
	loadptr 0, Route110_TrickHouseEntrance_Text_19BAC0
	callstd 4
	return

Route110_TrickHouseEntrance_EventScript_1612DF:: @ 81612DF
	loadptr 0, Route110_TrickHouseEntrance_Text_19BB11
	callstd 4
	return

Route110_TrickHouseEntrance_EventScript_1612E8:: @ 81612E8
	loadptr 0, Route110_TrickHouseEntrance_Text_19BB61
	callstd 4
	return

Route110_TrickHouseEntrance_EventScript_1612F1:: @ 81612F1
	loadptr 0, Route110_TrickHouseEntrance_Text_19BBB4
	callstd 4
	return

Route110_TrickHouseEntrance_EventScript_1612FA:: @ 81612FA
	loadptr 0, Route110_TrickHouseEntrance_Text_19BC04
	callstd 4
	return

Route110_TrickHouseEntrance_EventScript_161303:: @ 8161303
	loadptr 0, Route110_TrickHouseEntrance_Text_19BC55
	callstd 4
	return

Route110_TrickHouseEntrance_EventScript_16130C:: @ 816130C
	loadptr 0, Route110_TrickHouseEntrance_Text_19BCA8
	callstd 4
	return

