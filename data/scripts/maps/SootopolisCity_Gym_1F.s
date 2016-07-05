SootopolisCity_Gym_1F_MapScripts:: @ 815AF07
	map_script 2, SootopolisCity_Gym_1F_MapScript2_15AF86
	map_script 5, SootopolisCity_Gym_1F_MapScript1_15AF22
	map_script 1, SootopolisCity_Gym_1F_MapScript1_15AF25
	map_script 3, SootopolisCity_Gym_1F_MapScript1_15AF1C
	.byte 0

SootopolisCity_Gym_1F_MapScript1_15AF1C:: @ 815AF1C
	setvar 0x4022, 1
	end

SootopolisCity_Gym_1F_MapScript1_15AF22:: @ 815AF22
	tileeffect 4
	end

SootopolisCity_Gym_1F_MapScript1_15AF25:: @ 815AF25
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special 309
	end

SootopolisCity_Gym_1F_EventScript_15AF2E:: @ 815AF2E
	compare 0x4022, 8
	jumpif 0, SootopolisCity_Gym_1F_EventScript_15AF85
	compare 0x4022, 28
	jumpif 0, SootopolisCity_Gym_1F_EventScript_15AF73
	compare 0x4022, 69
	jumpif 0, SootopolisCity_Gym_1F_EventScript_15AF61
	setmaptile 8, 4, 519, 0
	setmaptile 8, 5, 519, 0

SootopolisCity_Gym_1F_EventScript_15AF61:: @ 815AF61
	setmaptile 8, 10, 519, 0
	setmaptile 8, 11, 519, 0

SootopolisCity_Gym_1F_EventScript_15AF73:: @ 815AF73
	setmaptile 8, 15, 519, 0
	setmaptile 8, 16, 519, 0

SootopolisCity_Gym_1F_EventScript_15AF85:: @ 815AF85
	return

SootopolisCity_Gym_1F_MapScript2_15AF86:: @ 815AF86
	map_script_2 0x4022, 8, SootopolisCity_Gym_1F_EventScript_15AFA8
	map_script_2 0x4022, 28, SootopolisCity_Gym_1F_EventScript_15AFBC
	map_script_2 0x4022, 69, SootopolisCity_Gym_1F_EventScript_15AFD0
	map_script_2 0x4022, 0, SootopolisCity_Gym_1F_EventScript_15AFE4
	.2byte 0

SootopolisCity_Gym_1F_EventScript_15AFA8:: @ 815AFA8
	addvar 0x4022, 1
	pause 40
	playsfx 40
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special 142
	end

SootopolisCity_Gym_1F_EventScript_15AFBC:: @ 815AFBC
	addvar 0x4022, 1
	pause 40
	playsfx 40
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special 142
	end

SootopolisCity_Gym_1F_EventScript_15AFD0:: @ 815AFD0
	addvar 0x4022, 1
	pause 40
	playsfx 40
	call SootopolisCity_Gym_1F_EventScript_15AF2E
	special 142
	end

SootopolisCity_Gym_1F_EventScript_15AFE4:: @ 815AFE4
	lockall
	pause 20
	move 255, SootopolisCity_Gym_1F_Movement_15AFFD
	waitmove 0
	playsfx 43
	pause 60
	warphole SootopolisCity_Gym_B1F
	waitstate
	end

SootopolisCity_Gym_1F_Movement_15AFFD:: @ 815AFFD
	step_54
	step_end

SootopolisCity_Gym_1F_EventScript_15AFFF:: @ 815AFFF
	trainerbattle 1, 272, 0, SootopolisCity_Gym_1F_Text_18F0CA, SootopolisCity_Gym_1F_Text_18F282, SootopolisCity_Gym_1F_EventScript_15B02D
	checkflag 172
	jumpif 0, SootopolisCity_Gym_1F_EventScript_15B056
	checkflag 2060
	jumpif 0, SootopolisCity_Gym_1F_EventScript_15B07A
	msgbox SootopolisCity_Gym_1F_Text_18F4D7, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B02D:: @ 815B02D
	message SootopolisCity_Gym_1F_Text_18F342
	waittext
	call SootopolisCity_Gym_1F_EventScript_1A02C5
	msgbox SootopolisCity_Gym_1F_Text_18F36B, 4
	setflag 1236
	setflag 2062
	setvar 0x8008, 8
	call SootopolisCity_Gym_1F_EventScript_1A01C0
	jump SootopolisCity_Gym_1F_EventScript_15B056
	end

SootopolisCity_Gym_1F_EventScript_15B056:: @ 815B056
	giveitem ITEM_TM03
	compare RESULT, 0
	jumpeq SootopolisCity_Gym_1F_EventScript_1A029B
	msgbox SootopolisCity_Gym_1F_Text_18F466, 4
	setflag 172
	release
	end

SootopolisCity_Gym_1F_EventScript_15B07A:: @ 815B07A
	msgbox SootopolisCity_Gym_1F_Text_18F5B4, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B084:: @ 815B084
	lock
	faceplayer
	checkflag 1236
	jumpeq SootopolisCity_Gym_1F_EventScript_15B099
	msgbox SootopolisCity_Gym_1F_Text_18E8A5, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B099:: @ 815B099
	msgbox SootopolisCity_Gym_1F_Text_18E9C9, 4
	release
	end

SootopolisCity_Gym_1F_EventScript_15B0A3:: @ 815B0A3
	lockall
	checkflag 2062
	jumpeq SootopolisCity_Gym_1F_EventScript_15B0C3
	jump SootopolisCity_Gym_1F_EventScript_15B0CD
	end

SootopolisCity_Gym_1F_EventScript_15B0B3:: @ 815B0B3
	lockall
	checkflag 2062
	jumpeq SootopolisCity_Gym_1F_EventScript_15B0C3
	jump SootopolisCity_Gym_1F_EventScript_15B0CD
	end

SootopolisCity_Gym_1F_EventScript_15B0C3:: @ 815B0C3
	msgbox SootopolisCity_Gym_1F_Text_18F665, 4
	releaseall
	end

SootopolisCity_Gym_1F_EventScript_15B0CD:: @ 815B0CD
	msgbox SootopolisCity_Gym_1F_Text_18F649, 4
	releaseall
	end
