VerdanturfTown_ContestLobby_MapScripts:: @ 8153D6A
	map_script MAP_SCRIPT_ON_TRANSITION, VerdanturfTown_ContestLobby_MapScript1_153D70
	.byte 0

VerdanturfTown_ContestLobby_MapScript1_153D70:: @ 8153D70
	call VerdanturfTown_ContestLobby_EventScript_1AE188
	end

VerdanturfTown_ContestLobby_EventScript_153D76:: @ 8153D76
	setvar VAR_0x800B, 5
	setvar VAR_CONTEST_RANK, 0
	call VerdanturfTown_ContestLobby_EventScript_1A4E92
	call VerdanturfTown_ContestLobby_EventScript_153DA1
	special SetContestTrainerGfxIds
	call VerdanturfTown_ContestLobby_EventScript_15FBDB
	setvar VAR_CONTEST_LOCATION, 1
	warp MAP_LINK_CONTEST_ROOM1, 255, 7, 5
	waitstate
	end

VerdanturfTown_ContestLobby_EventScript_153DA1:: @ 8153DA1
	lockall
	applymovement 1, VerdanturfTown_ContestLobby_Movement_153E25
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 4, 2, METATILE_Contest_WallShadow, 1
	setmetatile 4, 3, METATILE_Contest_FloorShadow, 1
	special DrawWholeMapView
	applymovement 1, VerdanturfTown_ContestLobby_Movement_153E28
	waitmovement 0
	playse SE_BRIDGE_WALK
	setmetatile 4, 2, METATILE_Contest_CounterFlap_Top, 1
	setmetatile 4, 3, METATILE_Contest_CounterFlap_Bottom, 1
	special DrawWholeMapView
	delay 20
	applymovement 1, VerdanturfTown_ContestLobby_Movement_153E35
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, VerdanturfTown_ContestLobby_Movement_153E23
	waitmovement 0
	msgbox VerdanturfTown_ContestLobby_Text_1A6832, MSGBOX_DEFAULT
	closemessage
	applymovement 1, VerdanturfTown_ContestLobby_Movement_153E2C
	applymovement OBJ_EVENT_ID_PLAYER, VerdanturfTown_ContestLobby_Movement_153E19
	waitmovement 0
	releaseall
	return

VerdanturfTown_ContestLobby_Movement_153E19:: @ 8153E19
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

VerdanturfTown_ContestLobby_Movement_153E23:: @ 8153E23
	walk_in_place_fastest_left
	step_end

VerdanturfTown_ContestLobby_Movement_153E25:: @ 8153E25
	walk_left
	walk_in_place_fastest_down
	step_end

VerdanturfTown_ContestLobby_Movement_153E28:: @ 8153E28
	walk_down
	walk_down
	walk_in_place_fastest_up
	step_end

VerdanturfTown_ContestLobby_Movement_153E2C:: @ 8153E2C
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	step_end

VerdanturfTown_ContestLobby_Movement_153E35:: @ 8153E35
	walk_in_place_fastest_right
	step_end

VerdanturfTown_ContestLobby_EventScript_153E37:: @ 8153E37
	lockall
	fadescreen FADE_TO_BLACK
	showcontestwinner 1
	releaseall
	end

VerdanturfTown_ContestLobby_EventScript_153E3E:: @ 8153E3E
	msgbox VerdanturfTown_ContestLobby_Text_177D6C, MSGBOX_NPC
	end

VerdanturfTown_ContestLobby_EventScript_153E47:: @ 8153E47
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM45, VerdanturfTown_ContestLobby_EventScript_153E76
	msgbox VerdanturfTown_ContestLobby_Text_177DEC, MSGBOX_DEFAULT
	giveitem ITEM_TM45_ATTRACT
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_TM45
	release
	end

VerdanturfTown_ContestLobby_EventScript_153E76:: @ 8153E76
	msgbox VerdanturfTown_ContestLobby_Text_177E98, MSGBOX_DEFAULT
	release
	end

VerdanturfTown_ContestLobby_EventScript_153E80:: @ 8153E80
	msgbox VerdanturfTown_ContestLobby_Text_177ECD, MSGBOX_NPC
	end

VerdanturfTown_ContestLobby_EventScript_153E89:: @ 8153E89
	lockall
	special ShowBerryBlenderRecordWindow
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
