LilycoveCity_Harbor_MapScripts:: @ 8159893
	map_script 3, LilycoveCity_Harbor_MapScript1_159899
	.byte 0

LilycoveCity_Harbor_MapScript1_159899:: @ 8159899
	warp6 LilycoveCity, 255, 12, 33
	end

LilycoveCity_Harbor_EventScript_1598A2:: @ 81598A2
	lock
	faceplayer
	checkitem ITEM_EON_TICKET, 1
	compare RESULT, 1
	jumpif EQUAL, LilycoveCity_Harbor_EventScript_1599EE
	jump LilycoveCity_Harbor_EventScript_1598BA
	end

LilycoveCity_Harbor_EventScript_1598BA:: @ 81598BA
	checkflag 2052
	jumpif FLAG_IS_SET, LilycoveCity_Harbor_EventScript_1598CD
	msgbox LilycoveCity_Harbor_Text_18B306, 4
	release
	end

LilycoveCity_Harbor_EventScript_1598CD:: @ 81598CD
	msgbox LilycoveCity_Harbor_Text_18B36F, 4
	checkitem ITEM_SS_TICKET, 1
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_Harbor_EventScript_159929
	message LilycoveCity_Harbor_Text_18B406
	waittext
	jump LilycoveCity_Harbor_EventScript_1598F1
	end

LilycoveCity_Harbor_EventScript_1598F1:: @ 81598F1
	multichoicedef 18, 6, 56, 2, 0
	switch RESULT
	case 0, LilycoveCity_Harbor_EventScript_159933
	case 1, LilycoveCity_Harbor_EventScript_15995B
	case 2, LilycoveCity_Harbor_EventScript_1599E4
	case 127, LilycoveCity_Harbor_EventScript_1599E4
	end

LilycoveCity_Harbor_EventScript_159929:: @ 8159929
	msgbox LilycoveCity_Harbor_Text_18B3A9, 4
	release
	end

LilycoveCity_Harbor_EventScript_159933:: @ 8159933
	msgbox LilycoveCity_Harbor_Text_18B47D, 5
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_Harbor_EventScript_15997E
	setvar 0x40b4, 5
	call LilycoveCity_Harbor_EventScript_15998A
	warp SSTidalCorridor, 255, 1, 10
	waitstate
	release
	end

LilycoveCity_Harbor_EventScript_15995B:: @ 815995B
	msgbox LilycoveCity_Harbor_Text_18B499, 5
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_Harbor_EventScript_15997E
	call LilycoveCity_Harbor_EventScript_15998A
	warp BattleTower_Outside, 255, 19, 23
	waitstate
	release
	end

LilycoveCity_Harbor_EventScript_15997E:: @ 815997E
	message LilycoveCity_Harbor_Text_18B4E2
	waittext
	jump LilycoveCity_Harbor_EventScript_1598F1
	end

LilycoveCity_Harbor_EventScript_15998A:: @ 815998A
	msgbox LilycoveCity_Harbor_Text_18B4B3, 4
	closebutton
	move LAST_TALKED, LilycoveCity_Harbor_Movement_1A0841
	waitmove 0
	pause 30
	spriteinvisible LAST_TALKED, 13, 10
	compare FACING, 2
	callif EQUAL, LilycoveCity_Harbor_EventScript_1599D9
	compare FACING, 4
	callif EQUAL, LilycoveCity_Harbor_EventScript_1599CE
	pause 30
	spriteinvisible 255, 0, 0
	setvar 0x8004, 2
	call LilycoveCity_Harbor_EventScript_1A040E
	return

LilycoveCity_Harbor_EventScript_1599CE:: @ 81599CE
	move 255, LilycoveCity_Harbor_Movement_159A86
	waitmove 0
	return

LilycoveCity_Harbor_EventScript_1599D9:: @ 81599D9
	move 255, LilycoveCity_Harbor_Movement_159A89
	waitmove 0
	return

LilycoveCity_Harbor_EventScript_1599E4:: @ 81599E4
	msgbox LilycoveCity_Harbor_Text_18B45B, 4
	release
	end

LilycoveCity_Harbor_EventScript_1599EE:: @ 81599EE
	checkflag 2052
	jumpif FLAG_NOT_SET, LilycoveCity_Harbor_EventScript_1598BA
	checkflag 206
	jumpif FLAG_IS_SET, LilycoveCity_Harbor_EventScript_1598BA
	checkflag 2131
	jumpif FLAG_NOT_SET, LilycoveCity_Harbor_EventScript_1598BA
	msgbox LilycoveCity_Harbor_Text_1C50F2, 4
	closebutton
	move LAST_TALKED, LilycoveCity_Harbor_Movement_1A0841
	waitmove 0
	pause 30
	spriteinvisible LAST_TALKED, 13, 10
	pause 60
	reappear 4
	pause 30
	move 4, LilycoveCity_Harbor_Movement_1A0839
	waitmove 0
	msgbox LilycoveCity_Harbor_Text_1C5120, 4
	closebutton
	move 4, LilycoveCity_Harbor_Movement_1A0841
	waitmove 0
	pause 30
	disappear 4
	compare FACING, 2
	callif EQUAL, LilycoveCity_Harbor_EventScript_1599D9
	compare FACING, 4
	callif EQUAL, LilycoveCity_Harbor_EventScript_1599CE
	pause 30
	spriteinvisible 255, 0, 0
	special 0
	setvar 0x8004, 2
	call LilycoveCity_Harbor_EventScript_1A040E
	warp SouthernIsland_Exterior, 255, 13, 22
	waitstate
	release
	end

LilycoveCity_Harbor_Movement_159A86:: @ 8159A86
	step_right
	step_26
	step_end

LilycoveCity_Harbor_Movement_159A89:: @ 8159A89
	step_up
	step_end

@ 8159A8B
	step_up
	step_end

LilycoveCity_Harbor_EventScript_159A8D:: @ 8159A8D
	lock
	faceplayer
	checkflag 2052
	jumpif FLAG_IS_SET, LilycoveCity_Harbor_EventScript_159AA2
	msgbox LilycoveCity_Harbor_Text_18B504, 4
	release
	end

LilycoveCity_Harbor_EventScript_159AA2:: @ 8159AA2
	msgbox LilycoveCity_Harbor_Text_18B58E, 4
	release
	end
