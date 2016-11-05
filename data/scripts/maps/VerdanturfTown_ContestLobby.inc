VerdanturfTown_ContestLobby_MapScripts:: @ 8153D6A
	map_script 3, VerdanturfTown_ContestLobby_MapScript1_153D70
	.byte 0

VerdanturfTown_ContestLobby_MapScript1_153D70:: @ 8153D70
	call VerdanturfTown_ContestLobby_EventScript_1AE188
	end

VerdanturfTown_ContestLobby_EventScript_153D76:: @ 8153D76
	setvar 0x800b, 5
	setvar CONTEST_RANK, 0
	call VerdanturfTown_ContestLobby_EventScript_1A4E92
	call VerdanturfTown_ContestLobby_EventScript_153DA1
	special 83
	call VerdanturfTown_ContestLobby_EventScript_15FBDB
	setvar 0x4088, 1
	warp LinkContestRoom1, 255, 7, 5
	waitstate
	end

VerdanturfTown_ContestLobby_EventScript_153DA1:: @ 8153DA1
	lockall
	move 1, VerdanturfTown_ContestLobby_Movement_153E25
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 545, 1
	setmaptile 4, 3, 609, 1
	special 142
	move 1, VerdanturfTown_ContestLobby_Movement_153E28
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 721, 1
	setmaptile 4, 3, 729, 1
	special 142
	pause 20
	move 1, VerdanturfTown_ContestLobby_Movement_153E35
	waitmove 0
	move 255, VerdanturfTown_ContestLobby_Movement_153E23
	waitmove 0
	msgbox VerdanturfTown_ContestLobby_Text_1A6832, 4
	closebutton
	move 1, VerdanturfTown_ContestLobby_Movement_153E2C
	move 255, VerdanturfTown_ContestLobby_Movement_153E19
	waitmove 0
	releaseall
	return

VerdanturfTown_ContestLobby_Movement_153E19:: @ 8153E19
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

VerdanturfTown_ContestLobby_Movement_153E23:: @ 8153E23
	step_27
	step_end

VerdanturfTown_ContestLobby_Movement_153E25:: @ 8153E25
	step_left
	step_25
	step_end

VerdanturfTown_ContestLobby_Movement_153E28:: @ 8153E28
	step_down
	step_down
	step_26
	step_end

VerdanturfTown_ContestLobby_Movement_153E2C:: @ 8153E2C
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_13
	step_54
	step_end

VerdanturfTown_ContestLobby_Movement_153E35:: @ 8153E35
	step_28
	step_end

VerdanturfTown_ContestLobby_EventScript_153E37:: @ 8153E37
	lockall
	fadescreen 1
	showcontestwinner 1
	releaseall
	end

VerdanturfTown_ContestLobby_EventScript_153E3E:: @ 8153E3E
	msgbox VerdanturfTown_ContestLobby_Text_177D6C, 2
	end

VerdanturfTown_ContestLobby_EventScript_153E47:: @ 8153E47
	lock
	faceplayer
	checkflag 235
	jumpeq VerdanturfTown_ContestLobby_EventScript_153E76
	msgbox VerdanturfTown_ContestLobby_Text_177DEC, 4
	giveitem ITEM_TM45
	compare RESULT, 0
	jumpeq VerdanturfTown_ContestLobby_EventScript_1A029B
	setflag 235
	release
	end

VerdanturfTown_ContestLobby_EventScript_153E76:: @ 8153E76
	msgbox VerdanturfTown_ContestLobby_Text_177E98, 4
	release
	end

VerdanturfTown_ContestLobby_EventScript_153E80:: @ 8153E80
	msgbox VerdanturfTown_ContestLobby_Text_177ECD, 2
	end

VerdanturfTown_ContestLobby_EventScript_153E89:: @ 8153E89
	lockall
	special 259
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end
