FallarborTown_ContestLobby_MapScripts:: @ 81539C1
	map_script 3, FallarborTown_ContestLobby_MapScript1_1539C7
	.byte 0

FallarborTown_ContestLobby_MapScript1_1539C7:: @ 81539C7
	call FallarborTown_ContestLobby_EventScript_1AE188
	end

FallarborTown_ContestLobby_EventScript_1539CD:: @ 81539CD
	setvar 0x800b, 6
	setvar CONTEST_RANK, 1
	call FallarborTown_ContestLobby_EventScript_1A4E92
	call FallarborTown_ContestLobby_EventScript_1539F8
	special sub_80C4BF0
	call FallarborTown_ContestLobby_EventScript_15FBDB
	setvar 0x4088, 2
	warp LinkContestRoom1, 255, 7, 5
	waitstate
	end

FallarborTown_ContestLobby_EventScript_1539F8:: @ 81539F8
	lockall
	move 1, FallarborTown_ContestLobby_Movement_153A7C
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 545, 1
	setmaptile 4, 3, 609, 1
	special DrawWholeMapView
	move 1, FallarborTown_ContestLobby_Movement_153A7F
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 721, 1
	setmaptile 4, 3, 729, 1
	special DrawWholeMapView
	pause 20
	move 1, FallarborTown_ContestLobby_Movement_153A8C
	waitmove 0
	move 255, FallarborTown_ContestLobby_Movement_153A7A
	waitmove 0
	msgbox FallarborTown_ContestLobby_Text_1A6832, 4
	closebutton
	move 1, FallarborTown_ContestLobby_Movement_153A83
	move 255, FallarborTown_ContestLobby_Movement_153A70
	waitmove 0
	releaseall
	return

FallarborTown_ContestLobby_Movement_153A70:: @ 8153A70
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

FallarborTown_ContestLobby_Movement_153A7A:: @ 8153A7A
	step_27
	step_end

FallarborTown_ContestLobby_Movement_153A7C:: @ 8153A7C
	step_left
	step_25
	step_end

FallarborTown_ContestLobby_Movement_153A7F:: @ 8153A7F
	step_down
	step_down
	step_26
	step_end

FallarborTown_ContestLobby_Movement_153A83:: @ 8153A83
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_13
	step_54
	step_end

FallarborTown_ContestLobby_Movement_153A8C:: @ 8153A8C
	step_28
	step_end

FallarborTown_ContestLobby_EventScript_153A8E:: @ 8153A8E
	msgbox FallarborTown_ContestLobby_Text_177141, 2
	end

FallarborTown_ContestLobby_EventScript_153A97:: @ 8153A97
	checkflag 270
	goto_if_eq FallarborTown_ContestLobby_EventScript_153AA9
	msgbox FallarborTown_ContestLobby_Text_177246, 2
	end

FallarborTown_ContestLobby_EventScript_153AA9:: @ 8153AA9
	msgbox FallarborTown_ContestLobby_Text_1772D8, 2
	end

FallarborTown_ContestLobby_EventScript_153AB2:: @ 8153AB2
	msgbox FallarborTown_ContestLobby_Text_1771F2, 2
	end

FallarborTown_ContestLobby_EventScript_153ABB:: @ 8153ABB
	lockall
	fadescreen 1
	showcontestwinner 2
	releaseall
	end

FallarborTown_ContestLobby_EventScript_153AC2:: @ 8153AC2
	lockall
	special ShowBerryBlenderRecordWindow
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end
