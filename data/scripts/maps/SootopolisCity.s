SootopolisCity_MapScripts:: @ 814D07D
	map_script 1, SootopolisCity_MapScript1_14D08D
	map_script 3, SootopolisCity_MapScript1_14D10D
	map_script 5, SootopolisCity_MapScript1_14D165
	.byte 0

SootopolisCity_MapScript1_14D08D:: @ 814D08D
	checkflag 129
	callif 0, SootopolisCity_EventScript_14D0A0
	checkflag 129
	callif 1, SootopolisCity_EventScript_14D0B1
	end

SootopolisCity_EventScript_14D0A0:: @ 814D0A0
	movespriteperm 3, 31, 18
	setmaptile 31, 32, 592, 1
	return

SootopolisCity_EventScript_14D0B1:: @ 814D0B1
	checkflag 113
	callif 0, SootopolisCity_EventScript_14D0BB
	return

SootopolisCity_EventScript_14D0BB:: @ 814D0BB
	setmaptile 9, 6, 584, 1
	setmaptile 9, 17, 584, 1
	setmaptile 9, 26, 584, 1
	setmaptile 44, 17, 584, 1
	setmaptile 8, 35, 584, 1
	setmaptile 53, 28, 584, 1
	setmaptile 45, 6, 584, 1
	setmaptile 48, 25, 584, 1
	setmaptile 31, 32, 592, 1
	return

SootopolisCity_MapScript1_14D10D:: @ 814D10D
	setflag 2077
	checkflag 113
	callif 1, SootopolisCity_EventScript_14D159
	checkflag 2090
	callif 1, SootopolisCity_EventScript_14D123
	end

SootopolisCity_EventScript_14D123:: @ 814D123
	call SootopolisCity_EventScript_1A02C1
	movespriteperm 1, 29, 19
	movespriteperm 2, 33, 19
	compare 0x405e, 1
	callif 1, SootopolisCity_EventScript_14D142
	return

SootopolisCity_EventScript_14D142:: @ 814D142
	movespriteperm 10, 29, 6
	spritebehave 10, 10
	movespriteperm 5, 30, 6
	spritebehave 5, 9
	return

SootopolisCity_EventScript_14D159:: @ 814D159
	movespriteperm 10, 31, 33
	spritebehave 10, 8
	return

SootopolisCity_MapScript1_14D165:: @ 814D165
	warp4 Underwater_SootopolisCity, 255, 9, 6
	end

SootopolisCity_EventScript_14D16E:: @ 814D16E
	lock
	faceplayer
	checkflag 113
	jumpif EQUAL, SootopolisCity_EventScript_14D183
	msgbox SootopolisCity_Text_1696A4, 4
	release
	end

SootopolisCity_EventScript_14D183:: @ 814D183
	msgbox SootopolisCity_Text_16A455, 4
	release
	end

SootopolisCity_EventScript_14D18D:: @ 814D18D
	msgbox SootopolisCity_Text_16A2B2, 2
	end

SootopolisCity_EventScript_14D196:: @ 814D196
	msgbox SootopolisCity_Text_16A2FB, 2
	end

SootopolisCity_EventScript_14D19F:: @ 814D19F
	lock
	faceplayer
	checkdailyflags
	special 148
	checkflag 2258
	jumpif EQUAL, SootopolisCity_EventScript_14D241
	msgbox SootopolisCity_Text_1C63F2, 4
	random 10
	addvar RESULT, 20
	addvar RESULT, 133
	giveitem RESULT
	compare RESULT, 0
	jumpif EQUAL, SootopolisCity_EventScript_1A029B
	setflag 2258
	msgbox SootopolisCity_Text_1C64D0, 4
	random 2
	compare RESULT, 0
	jumpif EQUAL, SootopolisCity_EventScript_14D1FF
	compare RESULT, 1
	jumpif EQUAL, SootopolisCity_EventScript_14D220
	end

SootopolisCity_EventScript_14D1FF:: @ 814D1FF
	giveitem ITEM_FIGY_BERRY
	compare RESULT, 0
	jumpif EQUAL, SootopolisCity_EventScript_1A029B
	msgbox SootopolisCity_Text_1C650B, 4
	release
	end

SootopolisCity_EventScript_14D220:: @ 814D220
	giveitem ITEM_IAPAPA_BERRY
	compare RESULT, 0
	jumpif EQUAL, SootopolisCity_EventScript_1A029B
	msgbox SootopolisCity_Text_1C650B, 4
	release
	end

SootopolisCity_EventScript_14D241:: @ 814D241
	msgbox SootopolisCity_Text_1C6540, 5
	compare RESULT, 1
	jumpif EQUAL, SootopolisCity_EventScript_14D25E
	msgbox SootopolisCity_Text_1C6626, 4
	release
	end

SootopolisCity_EventScript_14D25E:: @ 814D25E
	msgbox SootopolisCity_Text_1C65D4, 4
	release
	end

SootopolisCity_EventScript_14D268:: @ 814D268
	lock
	faceplayer
	checkflag 1236
	jumpif EQUAL, SootopolisCity_EventScript_14D27D
	msgbox SootopolisCity_Text_16A4D6, 4
	release
	end

SootopolisCity_EventScript_14D27D:: @ 814D27D
	msgbox SootopolisCity_Text_16A531, 4
	release
	end

SootopolisCity_EventScript_14D287:: @ 814D287
	lock
	faceplayer
	checkflag 113
	jumpif EQUAL, SootopolisCity_EventScript_14D29C
	msgbox SootopolisCity_Text_169813, 4
	release
	end

SootopolisCity_EventScript_14D29C:: @ 814D29C
	msgbox SootopolisCity_Text_16A587, 4
	release
	end

SootopolisCity_EventScript_14D2A6:: @ 814D2A6
	lock
	faceplayer
	checkflag 113
	jumpif EQUAL, SootopolisCity_EventScript_14D2BB
	msgbox SootopolisCity_Text_1698A0, 4
	release
	end

SootopolisCity_EventScript_14D2BB:: @ 814D2BB
	msgbox SootopolisCity_Text_16A614, 4
	release
	end

SootopolisCity_EventScript_14D2C5:: @ 814D2C5
	lock
	faceplayer
	checkflag 113
	jumpif EQUAL, SootopolisCity_EventScript_14D2DA
	msgbox SootopolisCity_Text_1697A7, 4
	release
	end

SootopolisCity_EventScript_14D2DA:: @ 814D2DA
	msgbox SootopolisCity_Text_16A6AE, 4
	release
	end

SootopolisCity_EventScript_14D2E4:: @ 814D2E4
	msgbox SootopolisCity_Text_16972B, 2
	end

SootopolisCity_EventScript_14D2ED:: @ 814D2ED
	msgbox SootopolisCity_Text_16A6C7, 3
	end

SootopolisCity_EventScript_14D2F6:: @ 814D2F6
	msgbox SootopolisCity_Text_16A711, 3
	end

ClosedSootopolisGymDoorScript:: @ 814D2FF
	msgbox ClosedSootopolisGymDoorText, 3
	end

SootopolisCity_EventScript_14D308:: @ 814D308
	lockall
	move 10, SootopolisCity_Movement_1A083F
	move 255, SootopolisCity_Movement_1A0843
	waitmove 0
	playsfx 21
	move 10, SootopolisCity_Movement_1A0833
	waitmove 0
	move 10, SootopolisCity_Movement_1A0835
	waitmove 0
	move 10, SootopolisCity_Movement_14D413
	waitmove 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169988, 4
	.else
	msgbox SootopolisCity_Text_169E0F, 4
	.endif
	closebutton
	move 10, SootopolisCity_Movement_14D417
	move 255, SootopolisCity_Movement_14D440
	waitmove 10
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_1699FD, 4
	.else
	msgbox SootopolisCity_Text_169E82, 4
	.endif
	playsfx 21
	move 5, SootopolisCity_Movement_1A0833
	waitmove 0
	move 5, SootopolisCity_Movement_1A0835
	waitmove 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169AB7, 4
	.else
	msgbox SootopolisCity_Text_169F3C, 4
	.endif
	closebutton
	pause 30
	move 5, SootopolisCity_Movement_14D46A
	move 10, SootopolisCity_Movement_14D41D
	move 255, SootopolisCity_Movement_14D445
	waitmove 0
	move 5, SootopolisCity_Movement_1A0843
	move 255, SootopolisCity_Movement_1A0843
	waitmove 0
	pause 30
	move 10, SootopolisCity_Movement_1A0845
	waitmove 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169AE7, 4
	.else
	msgbox SootopolisCity_Text_169F6B, 4
	.endif
	closebutton
	pause 30
	move 5, SootopolisCity_Movement_14D47C
	move 255, SootopolisCity_Movement_14D457
	move 10, SootopolisCity_Movement_14D42D
	waitmove 0
	move 5, SootopolisCity_Movement_1A083F
	waitmove 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169BC7, 4
	.else
	msgbox SootopolisCity_Text_16A06C, 4
	.endif
	move 255, SootopolisCity_Movement_1A083F
	waitmove 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169C99, 4
	.else
	msgbox SootopolisCity_Text_16A13E, 4
	.endif
	moveoffscreen 5
	spritebehave 5, 9
	moveoffscreen 10
	spritebehave 10, 10
	setvar 0x405e, 2
	releaseall
	end

SootopolisCity_Movement_14D413:: @ 814D413
	step_left
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D417:: @ 814D417
	step_right
	step_right
	step_right
	step_up
	step_25
	step_end

SootopolisCity_Movement_14D41D:: @ 814D41D
	step_down
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D42D:: @ 814D42D
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
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

SootopolisCity_Movement_14D440:: @ 814D440
	step_right
	step_right
	step_right
	step_right
	step_end

SootopolisCity_Movement_14D445:: @ 814D445
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D457:: @ 814D457
	step_14
	step_14
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

SootopolisCity_Movement_14D46A:: @ 814D46A
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

SootopolisCity_Movement_14D47C:: @ 814D47C
	step_14
	step_14
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

SootopolisCity_EventScript_14D48F:: @ 814D48F
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169D37, 2
	.else
	msgbox SootopolisCity_Text_16A1DB, 2
	.endif
	end

SootopolisCity_EventScript_14D498:: @ 814D498
	lock
	faceplayer
	checkflag 113
	jumpif EQUAL, SootopolisCity_EventScript_14D4AD
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169DA6, 4
	.else
	msgbox SootopolisCity_Text_16A249, 4
	.endif
	release
	end

SootopolisCity_EventScript_14D4AD:: @ 814D4AD
	msgbox SootopolisCity_Text_16A33E, 4
	closebutton
	move LAST_TALKED, SootopolisCity_Movement_1A0845
	waitmove 0
	pause 50
	setanimation 0, 1
	doanimation 30
	pause 15
	disappear LAST_TALKED
	checkanimation 30
	release
	end
