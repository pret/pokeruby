Route121_SafariZoneEntrance_MapScripts:: @ 815C323
	map_script 2, Route121_SafariZoneEntrance_MapScript2_15C329
	.byte 0

Route121_SafariZoneEntrance_MapScript2_15C329:: @ 815C329
	map_script_2 0x40a4, 1, Route121_SafariZoneEntrance_EventScript_15C333
	.2byte 0

Route121_SafariZoneEntrance_EventScript_15C333:: @ 815C333
	lockall
	move 255, Route121_SafariZoneEntrance_Movement_15C348
	waitmove 0
	special 206
	setvar 0x40a4, 0
	releaseall
	end

Route121_SafariZoneEntrance_Movement_15C348:: @ 815C348
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

Route121_SafariZoneEntrance_EventScript_15C351:: @ 815C351
	loadptr 0, Route121_SafariZoneEntrance_Text_1C35D0
	callstd 2
	end

Route121_SafariZoneEntrance_EventScript_15C35A:: @ 815C35A
	lock
	faceplayer
	loadptr 0, Route121_SafariZoneEntrance_Text_1C3704
	callstd 5
	compare RESULT, 1
	jumpeq Route121_SafariZoneEntrance_EventScript_15C379
	loadptr 0, Route121_SafariZoneEntrance_Text_1C373C
	callstd 4
	release
	end

Route121_SafariZoneEntrance_EventScript_15C379:: @ 815C379
	loadptr 0, Route121_SafariZoneEntrance_Text_1C375F
	callstd 4
	release
	end

Route121_SafariZoneEntrance_EventScript_15C383:: @ 815C383
	lockall
	move 255, Route121_SafariZoneEntrance_Movement_1A0841
	waitmove 0
	showmoney 0, 0
	snop
	loadptr 0, Route121_SafariZoneEntrance_Text_1C3832
	callstd 5
	compare RESULT, 1
	jumpeq Route121_SafariZoneEntrance_EventScript_15C3B3
	loadptr 0, Route121_SafariZoneEntrance_Text_1C3895
	callstd 4
	jump Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C3B3:: @ 815C3B3
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare RESULT, 0
	jumpeq Route121_SafariZoneEntrance_EventScript_15C450
	call Route121_SafariZoneEntrance_EventScript_15C425
	checkmoney 0x1f4, 0
	compare RESULT, 0
	jumpeq Route121_SafariZoneEntrance_EventScript_15C45E
	loadptr 0, Route121_SafariZoneEntrance_Text_1C38D9
	callstd 4
	paymoney 0x1f4, 0
	updatemoney 0, 0
	snop
	loadptr 0, Route121_SafariZoneEntrance_Text_1C38F4
	callstd 4
	fanfare 370
	message Route121_SafariZoneEntrance_Text_1C3910
	waitfanfare
	waittext
	loadptr 0, Route121_SafariZoneEntrance_Text_1C392D
	callstd 4
	closebutton
	hidemoney 0, 0
	move 255, Route121_SafariZoneEntrance_Movement_15C47E
	waitmove 0
	special 205
	setvar 0x40a4, 2
	warp SafariZone_Southeast, 255, 32, 33
	waitstate
	end

Route121_SafariZoneEntrance_EventScript_15C425:: @ 815C425
	countpokemon
	compare RESULT, 6
	jumpif 5, Route121_SafariZoneEntrance_EventScript_15C44F
	specialval RESULT, 304
	compare RESULT, 1
	jumpeq Route121_SafariZoneEntrance_EventScript_15C44F
	loadptr 0, Route121_SafariZoneEntrance_Text_1C39A3
	callstd 4
	jump Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C44F:: @ 815C44F
	return

Route121_SafariZoneEntrance_EventScript_15C450:: @ 815C450
	loadptr 0, Route121_SafariZoneEntrance_Text_1C39C3
	callstd 4
	jump Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C45E:: @ 815C45E
	loadptr 0, Route121_SafariZoneEntrance_Text_1C38B5
	callstd 4
	jump Route121_SafariZoneEntrance_EventScript_15C46C
	end

Route121_SafariZoneEntrance_EventScript_15C46C:: @ 815C46C
	closebutton
	hidemoney 0, 0
	move 255, Route121_SafariZoneEntrance_Movement_15C47C
	waitmove 0
	releaseall
	end

Route121_SafariZoneEntrance_Movement_15C47C:: @ 815C47C
	step_right
	step_end

Route121_SafariZoneEntrance_Movement_15C47E:: @ 815C47E
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_down
	step_14
	step_end

Route121_SafariZoneEntrance_EventScript_15C487:: @ 815C487
	loadptr 0, Route121_SafariZoneEntrance_Text_1C3E4B
	callstd 3
	end

