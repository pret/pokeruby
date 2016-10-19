LilycoveCity_ContestLobby_MapScripts:: @ 8158866
	map_script 3, LilycoveCity_ContestLobby_MapScript1_158871
	map_script 2, LilycoveCity_ContestLobby_MapScript2_158877
	.byte 0

LilycoveCity_ContestLobby_MapScript1_158871:: @ 8158871
	call LilycoveCity_ContestLobby_EventScript_1AE188
	end

LilycoveCity_ContestLobby_MapScript2_158877:: @ 8158877
	map_script_2 0x4099, 1, LilycoveCity_ContestLobby_EventScript_158889
	map_script_2 0x4099, 2, LilycoveCity_ContestLobby_EventScript_158A5B
	.2byte 0

LilycoveCity_ContestLobby_EventScript_158889:: @ 8158889
	checkflag 775
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158898
	setvar 0x4099, 0
	end

LilycoveCity_ContestLobby_EventScript_158898:: @ 8158898
	lockall
	reappear 4
	move 4, LilycoveCity_ContestLobby_Movement_158A3B
	waitmove 4
	move 255, LilycoveCity_ContestLobby_Movement_158A4C
	waitmove 0
	msgbox LilycoveCity_ContestLobby_Text_18890F, 4
	lockall
	fadescreen 1
	showcontestwinner 0
	lockall
	msgbox LilycoveCity_ContestLobby_Text_1889FD, 5
	compare RESULT, 1
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_1588DE
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158918
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_1588DE:: @ 81588DE
	msgbox LilycoveCity_ContestLobby_Text_188AE8, 4
	closebutton
	special 135
	setvar 0x4099, 0
	specialval RESULT, 91
	compare RESULT, 1
	callif 1, LilycoveCity_ContestLobby_EventScript_158948
	move 4, LilycoveCity_ContestLobby_Movement_158A43
	waitmove 0
	disappear 4
	call LilycoveCity_ContestLobby_EventScript_158994
	call LilycoveCity_ContestLobby_EventScript_1589EA
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158918:: @ 8158918
	msgbox LilycoveCity_ContestLobby_Text_188C41, 5
	compare RESULT, 1
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_1588DE
	msgbox LilycoveCity_ContestLobby_Text_188CBD, 4
	closebutton
	move 4, LilycoveCity_ContestLobby_Movement_158A43
	waitmove 0
	setvar 0x4099, 0
	disappear 4
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158948:: @ 8158948
	inccounter GAME_STAT_RECEIVED_RIBBONS
	special 80
	move 4, LilycoveCity_ContestLobby_Movement_158A4E
	waitmove 0
	playsfx 21
	move 4, LilycoveCity_ContestLobby_Movement_1A0833
	waitmove 0
	move 4, LilycoveCity_ContestLobby_Movement_158A52
	waitmove 0
	msgbox LilycoveCity_ContestLobby_Text_188BB5, 4
	fanfare 370
	msgbox LilycoveCity_ContestLobby_Text_188C03, 4
	waitfanfare
	msgbox LilycoveCity_ContestLobby_Text_188C19, 4
	msgbox LilycoveCity_ContestLobby_Text_188C32, 4
	closebutton
	return

LilycoveCity_ContestLobby_EventScript_158994:: @ 8158994
	specialval 0x8004, 137
	switch 0x8004
	case 1, LilycoveCity_ContestLobby_EventScript_1589D6
	case 2, LilycoveCity_ContestLobby_EventScript_1589DA
	case 3, LilycoveCity_ContestLobby_EventScript_1589DE
	case 4, LilycoveCity_ContestLobby_EventScript_1589E2
	case 5, LilycoveCity_ContestLobby_EventScript_1589E6
	return

LilycoveCity_ContestLobby_EventScript_1589D6:: @ 81589D6
	clearflag 776
	return

LilycoveCity_ContestLobby_EventScript_1589DA:: @ 81589DA
	clearflag 777
	return

LilycoveCity_ContestLobby_EventScript_1589DE:: @ 81589DE
	clearflag 778
	return

LilycoveCity_ContestLobby_EventScript_1589E2:: @ 81589E2
	clearflag 779
	return

LilycoveCity_ContestLobby_EventScript_1589E6:: @ 81589E6
	clearflag 780
	return

LilycoveCity_ContestLobby_EventScript_1589EA:: @ 81589EA
	switch 0x8011
	case 0, LilycoveCity_ContestLobby_EventScript_158A27
	case 1, LilycoveCity_ContestLobby_EventScript_158A2B
	case 2, LilycoveCity_ContestLobby_EventScript_158A2F
	case 3, LilycoveCity_ContestLobby_EventScript_158A33
	case 4, LilycoveCity_ContestLobby_EventScript_158A37
	return

LilycoveCity_ContestLobby_EventScript_158A27:: @ 8158A27
	setflag 160
	return

LilycoveCity_ContestLobby_EventScript_158A2B:: @ 8158A2B
	setflag 161
	return

LilycoveCity_ContestLobby_EventScript_158A2F:: @ 8158A2F
	setflag 162
	return

LilycoveCity_ContestLobby_EventScript_158A33:: @ 8158A33
	setflag 163
	return

LilycoveCity_ContestLobby_EventScript_158A37:: @ 8158A37
	setflag 164
	return

LilycoveCity_ContestLobby_Movement_158A3B:: @ 8158A3B
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

LilycoveCity_ContestLobby_Movement_158A43:: @ 8158A43
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

LilycoveCity_ContestLobby_Movement_158A4C:: @ 8158A4C
	step_27
	step_end

LilycoveCity_ContestLobby_Movement_158A4E:: @ 8158A4E
	step_down
	step_down
	step_down
	step_end

LilycoveCity_ContestLobby_Movement_158A52:: @ 8158A52
	step_14
	step_14
	step_14
	step_14
	step_16
	step_16
	step_16
	step_28
	step_end

LilycoveCity_ContestLobby_EventScript_158A5B:: @ 8158A5B
	checkflag 775
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158A6A
	setvar 0x4099, 0
	end

LilycoveCity_ContestLobby_EventScript_158A6A:: @ 8158A6A
	lockall
	reappear 11
	move 11, LilycoveCity_ContestLobby_Movement_158B64
	waitmove 11
	move 255, LilycoveCity_ContestLobby_Movement_158B76
	waitmove 0
	msgbox LilycoveCity_ContestLobby_Text_18890F, 4
	lockall
	fadescreen 1
	showcontestwinner 0
	msgbox LilycoveCity_ContestLobby_Text_1889FD, 5
	compare RESULT, 1
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158AAE
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158AE8
	end

LilycoveCity_ContestLobby_EventScript_158AAE:: @ 8158AAE
	msgbox LilycoveCity_ContestLobby_Text_188AE8, 4
	closebutton
	special 135
	setvar 0x4099, 0
	specialval RESULT, 91
	compare RESULT, 1
	callif 1, LilycoveCity_ContestLobby_EventScript_158B18
	move 11, LilycoveCity_ContestLobby_Movement_158B6D
	waitmove 0
	disappear 11
	call LilycoveCity_ContestLobby_EventScript_158994
	call LilycoveCity_ContestLobby_EventScript_1589EA
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158AE8:: @ 8158AE8
	msgbox LilycoveCity_ContestLobby_Text_188C41, 5
	compare RESULT, 1
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158AAE
	msgbox LilycoveCity_ContestLobby_Text_188CBD, 4
	closebutton
	move 11, LilycoveCity_ContestLobby_Movement_158B6D
	waitmove 0
	setvar 0x4099, 0
	disappear 11
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158B18:: @ 8158B18
	inccounter GAME_STAT_RECEIVED_RIBBONS
	special 80
	move 11, LilycoveCity_ContestLobby_Movement_158B78
	waitmove 0
	playsfx 21
	move 11, LilycoveCity_ContestLobby_Movement_1A0833
	waitmove 0
	move 11, LilycoveCity_ContestLobby_Movement_158B7C
	waitmove 0
	msgbox LilycoveCity_ContestLobby_Text_188BB5, 4
	fanfare 370
	msgbox LilycoveCity_ContestLobby_Text_188C03, 4
	waitfanfare
	msgbox LilycoveCity_ContestLobby_Text_188C19, 4
	msgbox LilycoveCity_ContestLobby_Text_188C32, 4
	closebutton
	return

LilycoveCity_ContestLobby_Movement_158B64:: @ 8158B64
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

LilycoveCity_ContestLobby_Movement_158B6D:: @ 8158B6D
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

LilycoveCity_ContestLobby_Movement_158B76:: @ 8158B76
	step_28
	step_end

LilycoveCity_ContestLobby_Movement_158B78:: @ 8158B78
	step_down
	step_down
	step_down
	step_end

LilycoveCity_ContestLobby_Movement_158B7C:: @ 8158B7C
	step_14
	step_14
	step_14
	step_14
	step_16
	step_16
	step_16
	step_27
	step_end

LilycoveCity_ContestLobby_EventScript_158B85:: @ 8158B85
	lockall
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158BBA
	checkflag 2
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158BAE
	message LilycoveCity_ContestLobby_Text_18848C
	waittext
	setflag 2
	jump LilycoveCity_ContestLobby_EventScript_158BF0
	end

LilycoveCity_ContestLobby_EventScript_158BAE:: @ 8158BAE
	message LilycoveCity_ContestLobby_Text_188584
	waittext
	jump LilycoveCity_ContestLobby_EventScript_158BF0
	end

LilycoveCity_ContestLobby_EventScript_158BBA:: @ 8158BBA
	msgbox LilycoveCity_ContestLobby_Text_1A63F4, 4
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_158BC4:: @ 8158BC4
	msgbox LilycoveCity_ContestLobby_Text_188521, 5
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158C35
	call LilycoveCity_ContestLobby_EventScript_19F806
	hidebox 0, 0, 15, 9
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158C35
	setflag 3
	return

LilycoveCity_ContestLobby_EventScript_158BF0:: @ 8158BF0
	multichoice 0, 0, 2, 0
	switch RESULT
	case 0, LilycoveCity_ContestLobby_EventScript_158CEA
	case 1, LilycoveCity_ContestLobby_EventScript_158C27
	case 2, LilycoveCity_ContestLobby_EventScript_158C35
	case 127, LilycoveCity_ContestLobby_EventScript_158C35
	end

LilycoveCity_ContestLobby_EventScript_158C27:: @ 8158C27
	msgbox LilycoveCity_ContestLobby_Text_1885A7, 4
	jump LilycoveCity_ContestLobby_EventScript_158B85
	end

LilycoveCity_ContestLobby_EventScript_158C35:: @ 8158C35
	msgbox LilycoveCity_ContestLobby_Text_188559, 4
	releaseall
	clearflag 3
	end

LilycoveCity_ContestLobby_EventScript_158C42:: @ 8158C42
	msgbox LilycoveCity_ContestLobby_Text_188703, 4
	setvar 0x8010, 0
	choosecontestpkmn
	compare 0x8004, 255
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158CEA
	special 84
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158C96
	compare RESULT, 1
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158CC0
	compare RESULT, 2
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158CC0
	compare RESULT, 3
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158CA4
	compare RESULT, 4
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158CB2
	end

LilycoveCity_ContestLobby_EventScript_158C96:: @ 8158C96
	msgbox LilycoveCity_ContestLobby_Text_1A664A, 4
	jump LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158CA4:: @ 8158CA4
	msgbox LilycoveCity_ContestLobby_Text_1A669F, 4
	jump LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158CB2:: @ 8158CB2
	msgbox LilycoveCity_ContestLobby_Text_1A66DC, 4
	jump LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158CC0:: @ 8158CC0
	copyvar 0x8008, 0x8004
	message LilycoveCity_ContestLobby_Text_1A67A3
	waittext
	yesnobox 20, 8
	switch RESULT
	case 0, LilycoveCity_ContestLobby_EventScript_158C42
	case 1, LilycoveCity_ContestLobby_EventScript_158D24
	end

LilycoveCity_ContestLobby_EventScript_158CEA:: @ 8158CEA
	checkflag 3
	callif 0, LilycoveCity_ContestLobby_EventScript_158BC4
	message LilycoveCity_ContestLobby_Text_1886DC
	waittext
	multichoice 0, 0, 4, 0
	switch RESULT
	case 5, LilycoveCity_ContestLobby_EventScript_158C35
	case 127, LilycoveCity_ContestLobby_EventScript_158C35
	copyvar 0x8011, RESULT
	jump LilycoveCity_ContestLobby_EventScript_158C42
	end

LilycoveCity_ContestLobby_EventScript_158D24:: @ 8158D24
	message LilycoveCity_ContestLobby_Text_1887C7
	waittext
	copyvar 0x8004, RESULT
	special 92
	waitstate
	compare RESULT, 3
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158D90
	compare RESULT, 5
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158DA1
	compare RESULT, 6
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158DB2
	message2 LilycoveCity_ContestLobby_Text_18872A
	waittext
	contestlinktransfer
	switch 0x8004
	case 0, LilycoveCity_ContestLobby_EventScript_158DD1
	case 1, LilycoveCity_ContestLobby_EventScript_158D82
	case 2, LilycoveCity_ContestLobby_EventScript_158DC3
	end

LilycoveCity_ContestLobby_EventScript_158D82:: @ 8158D82
	msgbox LilycoveCity_ContestLobby_Text_188750, 4
	jump LilycoveCity_ContestLobby_EventScript_158CEA
	end

LilycoveCity_ContestLobby_EventScript_158D90:: @ 8158D90
	special 31
	msgbox LilycoveCity_ContestLobby_Text_18878D, 4
	closebutton
	releaseall
	clearflag 3
	end

LilycoveCity_ContestLobby_EventScript_158DA1:: @ 8158DA1
	special 31
	msgbox LilycoveCity_ContestLobby_Text_1887F4, 4
	closebutton
	releaseall
	clearflag 3
	end

LilycoveCity_ContestLobby_EventScript_158DB2:: @ 8158DB2
	special 31
	msgbox LilycoveCity_ContestLobby_Text_18881F, 4
	closebutton
	releaseall
	clearflag 3
	end

LilycoveCity_ContestLobby_EventScript_158DC3:: @ 8158DC3
	msgbox LilycoveCity_ContestLobby_Text_18873A, 4
	jump LilycoveCity_ContestLobby_EventScript_158CEA
	end

LilycoveCity_ContestLobby_EventScript_158DD1:: @ 8158DD1
	special 77
	addvar 0x8004, 1
	buffernum 1, 32772
	message2 LilycoveCity_ContestLobby_Text_188845
	waittext
	addvar 0x8004, 65535
	jump LilycoveCity_ContestLobby_EventScript_158DEE
	end

LilycoveCity_ContestLobby_EventScript_158DEE:: @ 8158DEE
	call LilycoveCity_ContestLobby_EventScript_158E0B
	setvar 0x4086, 1
	special 86
	setvar 0x4088, 5
	setvar 0x8010, 3
	call LilycoveCity_ContestLobby_EventScript_158F08
	end

LilycoveCity_ContestLobby_EventScript_158E0B:: @ 8158E0B
	lockall
	message2 LilycoveCity_ContestLobby_Text_1888C6
	waittext
	pause 20
	closebutton
	move 2, LilycoveCity_ContestLobby_Movement_158E9C
	waitmove 0
	playsfx 71
	setmaptile 9, 2, 545, 1
	setmaptile 9, 3, 609, 1
	special 142
	move 2, LilycoveCity_ContestLobby_Movement_158EA0
	waitmove 0
	playsfx 71
	setmaptile 9, 2, 721, 1
	setmaptile 9, 3, 729, 1
	special 142
	pause 20
	move 2, LilycoveCity_ContestLobby_Movement_158EAE
	waitmove 0
	move 255, LilycoveCity_ContestLobby_Movement_158E99
	waitmove 0
	message2 LilycoveCity_ContestLobby_Text_1A6832
	waittext
	pause 20
	closebutton
	move 2, LilycoveCity_ContestLobby_Movement_158EA4
	move 255, LilycoveCity_ContestLobby_Movement_158E8E
	waitmove 0
	releaseall
	return

LilycoveCity_ContestLobby_Movement_158E8E:: @ 8158E8E
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_13
	step_54
	step_end

LilycoveCity_ContestLobby_Movement_158E99:: @ 8158E99
	step_28
	step_right
	step_end

LilycoveCity_ContestLobby_Movement_158E9C:: @ 8158E9C
	step_right
	step_right
	step_25
	step_end

LilycoveCity_ContestLobby_Movement_158EA0:: @ 8158EA0
	step_down
	step_down
	step_26
	step_end

LilycoveCity_ContestLobby_Movement_158EA4:: @ 8158EA4
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_13
	step_54
	step_end

LilycoveCity_ContestLobby_Movement_158EAE:: @ 8158EAE
	step_27
	step_end

LilycoveCity_ContestLobby_EventScript_158EB0:: @ 8158EB0
	specialval RESULT, 90
	compare RESULT, 1
	jumpif EQUAL, LilycoveCity_ContestLobby_EventScript_158EE8
	setvar 0x800b, 8
	setvar 0x8010, 3
	call LilycoveCity_ContestLobby_EventScript_1A4E92
	call LilycoveCity_ContestLobby_EventScript_158F86
	special 83
	call LilycoveCity_ContestLobby_EventScript_15FBDB
	setvar 0x4088, 4
	call LilycoveCity_ContestLobby_EventScript_158F08
	waitstate
	end

LilycoveCity_ContestLobby_EventScript_158EE8:: @ 8158EE8
	setflag 775
	copyvar 0x4094, 0x1
	additem ITEM_CONTEST_PASS, 1
	setvar 0x800b, 8
	setvar 0x8010, 3
	setvar 0x4099, 1
	setflag 2107
	end

LilycoveCity_ContestLobby_EventScript_158F08:: @ 8158F08
	switch 0x8011
	case 0, LilycoveCity_ContestLobby_EventScript_158F45
	case 1, LilycoveCity_ContestLobby_EventScript_158F52
	case 2, LilycoveCity_ContestLobby_EventScript_158F5F
	case 3, LilycoveCity_ContestLobby_EventScript_158F6C
	case 4, LilycoveCity_ContestLobby_EventScript_158F79
	return

LilycoveCity_ContestLobby_EventScript_158F45:: @ 8158F45
	warp3 LinkContestRoom4, 255, 7, 5
	special 300
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F52:: @ 8158F52
	warp3 LinkContestRoom2, 255, 7, 5
	special 300
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F5F:: @ 8158F5F
	warp3 LinkContestRoom6, 255, 7, 5
	special 300
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F6C:: @ 8158F6C
	warp3 LinkContestRoom5, 255, 7, 5
	special 300
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F79:: @ 8158F79
	warp3 LinkContestRoom3, 255, 7, 5
	special 300
	waitstate
	return

LilycoveCity_ContestLobby_EventScript_158F86:: @ 8158F86
	lockall
	move 1, LilycoveCity_ContestLobby_Movement_15900B
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 545, 1
	setmaptile 4, 3, 609, 1
	special 142
	move 1, LilycoveCity_ContestLobby_Movement_15900F
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 721, 1
	setmaptile 4, 3, 729, 1
	special 142
	pause 20
	move 1, LilycoveCity_ContestLobby_Movement_15901C
	waitmove 0
	move 255, LilycoveCity_ContestLobby_Movement_159008
	waitmove 0
	msgbox LilycoveCity_ContestLobby_Text_1A6832, 4
	closebutton
	move 1, LilycoveCity_ContestLobby_Movement_159013
	move 255, LilycoveCity_ContestLobby_Movement_158FFE
	waitmove 0
	releaseall
	return

LilycoveCity_ContestLobby_Movement_158FFE:: @ 8158FFE
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_13
	step_54
	step_end

LilycoveCity_ContestLobby_Movement_159008:: @ 8159008
	step_27
	step_left
	step_end

LilycoveCity_ContestLobby_Movement_15900B:: @ 815900B
	step_left
	step_left
	step_25
	step_end

LilycoveCity_ContestLobby_Movement_15900F:: @ 815900F
	step_down
	step_down
	step_26
	step_end

LilycoveCity_ContestLobby_Movement_159013:: @ 8159013
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_13
	step_54
	step_end

LilycoveCity_ContestLobby_Movement_15901C:: @ 815901C
	step_28
	step_end

LilycoveCity_ContestLobby_EventScript_15901E:: @ 815901E
	msgbox LilycoveCity_ContestLobby_Text_188D3C, 2
	end

LilycoveCity_ContestLobby_EventScript_159027:: @ 8159027
	checkflag 150
	jumpif 0, LilycoveCity_ContestLobby_EventScript_159039
	msgbox LilycoveCity_ContestLobby_Text_188DDA, 2
	end

LilycoveCity_ContestLobby_EventScript_159039:: @ 8159039
	msgbox LilycoveCity_ContestLobby_Text_188E47, 2
	end

LilycoveCity_ContestLobby_EventScript_159042:: @ 8159042
	msgbox LilycoveCity_ContestLobby_Text_188F07, 2
	end

LilycoveCity_ContestLobby_EventScript_15904B:: @ 815904B
	msgbox LilycoveCity_ContestLobby_Text_188F81, 2
	end

LilycoveCity_ContestLobby_EventScript_159054:: @ 8159054
	msgbox LilycoveCity_ContestLobby_Text_188FE3, 2
	end

LilycoveCity_ContestLobby_EventScript_15905D:: @ 815905D
	msgbox LilycoveCity_ContestLobby_Text_18904D, 2
	end

LilycoveCity_ContestLobby_EventScript_159066:: @ 8159066
	lockall
	fadescreen 1
	showcontestwinner 6
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_15906D:: @ 815906D
	lockall
	fadescreen 1
	showcontestwinner 7
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_159074:: @ 8159074
	lockall
	fadescreen 1
	showcontestwinner 8
	releaseall
	end

LilycoveCity_ContestLobby_EventScript_15907B:: @ 815907B
	msgbox LilycoveCity_ContestLobby_Text_1B7225, 2
	end

LilycoveCity_ContestLobby_EventScript_159084:: @ 8159084
	msgbox LilycoveCity_ContestLobby_Text_1B7241, 2
	end

LilycoveCity_ContestLobby_EventScript_15908D:: @ 815908D
SlateportCity_ContestLobby_EventScript_15908D:: @ 815908D
	lockall
	special 259
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end
