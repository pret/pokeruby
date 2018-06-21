FallarborTown_ContestLobby_MapScripts:: @ 81539C1
	map_script 3, FallarborTown_ContestLobby_MapScript1_1539C7
	.byte 0

FallarborTown_ContestLobby_MapScript1_1539C7:: @ 81539C7
	call FallarborTown_ContestLobby_EventScript_1AE188
	end

FallarborTown_ContestLobby_EventScript_1539CD:: @ 81539CD
	setvar VAR_SPECIAL_B, 6
	setvar CONTEST_RANK, 1
	call FallarborTown_ContestLobby_EventScript_1A4E92
	call FallarborTown_ContestLobby_EventScript_1539F8
	special SetContestTrainerGfxIds
	call FallarborTown_ContestLobby_EventScript_15FBDB
	setvar VAR_CONTEST_LOCATION, 2
	warp MAP_LINK_CONTEST_ROOM1, 255, 7, 5
	waitstate
	end

FallarborTown_ContestLobby_EventScript_1539F8:: @ 81539F8
	lockall
	applymovement 1, FallarborTown_ContestLobby_Movement_153A7C
	waitmovement 0
	playse SE_HASHI
	setmetatile 4, 2, 545, 1
	setmetatile 4, 3, 609, 1
	special DrawWholeMapView
	applymovement 1, FallarborTown_ContestLobby_Movement_153A7F
	waitmovement 0
	playse SE_HASHI
	setmetatile 4, 2, 721, 1
	setmetatile 4, 3, 729, 1
	special DrawWholeMapView
	delay 20
	applymovement 1, FallarborTown_ContestLobby_Movement_153A8C
	waitmovement 0
	applymovement 255, FallarborTown_ContestLobby_Movement_153A7A
	waitmovement 0
	msgbox FallarborTown_ContestLobby_Text_1A6832, 4
	closemessage
	applymovement 1, FallarborTown_ContestLobby_Movement_153A83
	applymovement 255, FallarborTown_ContestLobby_Movement_153A70
	waitmovement 0
	releaseall
	return

FallarborTown_ContestLobby_Movement_153A70:: @ 8153A70
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	end_movement

FallarborTown_ContestLobby_Movement_153A7A:: @ 8153A7A
	walk_in_place_fastest_left
	end_movement

FallarborTown_ContestLobby_Movement_153A7C:: @ 8153A7C
	walk_left
	walk_in_place_fastest_down
	end_movement

FallarborTown_ContestLobby_Movement_153A7F:: @ 8153A7F
	walk_down
	walk_down
	walk_in_place_fastest_up
	end_movement

FallarborTown_ContestLobby_Movement_153A83:: @ 8153A83
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	end_movement

FallarborTown_ContestLobby_Movement_153A8C:: @ 8153A8C
	walk_in_place_fastest_right
	end_movement

FallarborTown_ContestLobby_EventScript_153A8E:: @ 8153A8E
	msgbox FallarborTown_ContestLobby_Text_177141, 2
	end

FallarborTown_ContestLobby_EventScript_153A97:: @ 8153A97
	goto_if_set FLAG_CONTEST_SKETCH_CREATED, FallarborTown_ContestLobby_EventScript_153AA9
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
	drawcontestwinner 2
	releaseall
	end

FallarborTown_ContestLobby_EventScript_153AC2:: @ 8153AC2
	lockall
	special ShowBerryBlenderRecordWindow
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
