Route112_CableCarStation_MapScripts:: @ 815C033
	map_script 3, Route112_CableCarStation_MapScript1_15C03E
	map_script 2, Route112_CableCarStation_MapScript2_15C05E
	.byte 0

Route112_CableCarStation_MapScript1_15C03E:: @ 815C03E
	warp6 Route112, 255, 28, 28
	compare 0x40a3, 2
	callif 1, Route112_CableCarStation_EventScript_15C052
	end

Route112_CableCarStation_EventScript_15C052:: @ 815C052
	movespriteperm 1, 7, 4
	spritebehave 1, 9
	return

Route112_CableCarStation_MapScript2_15C05E:: @ 815C05E
	map_script_2 0x40a3, 2, Route112_CableCarStation_EventScript_15C068
	.2byte 0

Route112_CableCarStation_EventScript_15C068:: @ 815C068
	lockall
	move 255, Route112_CableCarStation_Movement_15C0F5
	move 1, Route112_CableCarStation_Movement_15C0EB
	waitmove 0
	setvar 0x40a3, 0
	movespriteperm 1, 6, 7
	spritebehave 1, 8
	releaseall
	end

Route112_CableCarStation_EventScript_15C08C:: @ 815C08C
	lock
	faceplayer
	msgbox Route112_CableCarStation_Text_1924F5, 5
	compare RESULT, 1
	jumpeq Route112_CableCarStation_EventScript_15C0AD
	compare RESULT, 0
	jumpeq Route112_CableCarStation_EventScript_15C0DC
	end

Route112_CableCarStation_EventScript_15C0AD:: @ 815C0AD
	msgbox Route112_CableCarStation_Text_1925A9, 4
	closebutton
	move 1, Route112_CableCarStation_Movement_15C0E6
	move 255, Route112_CableCarStation_Movement_15C0F0
	waitmove 0
	setvar 0x8004, 0
	setvar 0x40a3, 1
	inccounter GAME_STAT_RODE_CABLE_CAR
	special 151
	special 152
	waitstate
	release
	end

Route112_CableCarStation_EventScript_15C0DC:: @ 815C0DC
	msgbox Route112_CableCarStation_Text_192548, 4
	release
	end

Route112_CableCarStation_Movement_15C0E6:: @ 815C0E6
	step_up
	step_up
	step_right
	step_27
	step_end

Route112_CableCarStation_Movement_15C0EB:: @ 815C0EB
	step_14
	step_left
	step_down
	step_down
	step_end

Route112_CableCarStation_Movement_15C0F0:: @ 815C0F0
	step_up
	step_up
	step_up
	step_14
	step_end

Route112_CableCarStation_Movement_15C0F5:: @ 815C0F5
	step_down
	step_down
	step_down
	step_14
	step_end
