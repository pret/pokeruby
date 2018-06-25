SlateportCity_ContestLobby_MapScripts:: @ 8155411
	map_script 3, SlateportCity_ContestLobby_MapScript1_155417
	.byte 0

SlateportCity_ContestLobby_MapScript1_155417:: @ 8155417
	call SlateportCity_ContestLobby_EventScript_1AE188
	end

SlateportCity_ContestLobby_EventScript_15541D:: @ 815541D
	setvar VAR_SPECIAL_B, 7
	setvar CONTEST_RANK, 2
	call SlateportCity_ContestLobby_EventScript_1A4E92
	call SlateportCity_ContestLobby_EventScript_155448
	special SetContestTrainerGfxIds
	call SlateportCity_ContestLobby_EventScript_15FBDB
	setvar VAR_CONTEST_LOCATION, 3
	warp MAP_LINK_CONTEST_ROOM1, 255, 7, 5
	waitstate
	end

SlateportCity_ContestLobby_EventScript_155448:: @ 8155448
	lockall
	applymovement 1, SlateportCity_ContestLobby_Movement_1554CC
	waitmovement 0
	playse SE_HASHI
	setmetatile 4, 2, 545, 1
	setmetatile 4, 3, 609, 1
	special DrawWholeMapView
	applymovement 1, SlateportCity_ContestLobby_Movement_1554CF
	waitmovement 0
	playse SE_HASHI
	setmetatile 4, 2, 721, 1
	setmetatile 4, 3, 729, 1
	special DrawWholeMapView
	delay 20
	applymovement 1, SlateportCity_ContestLobby_Movement_1554DC
	waitmovement 0
	applymovement 255, SlateportCity_ContestLobby_Movement_1554CA
	waitmovement 0
	msgbox SlateportCity_ContestLobby_Text_1A6832, 4
	closemessage
	applymovement 1, SlateportCity_ContestLobby_Movement_1554D3
	applymovement 255, SlateportCity_ContestLobby_Movement_1554C0
	waitmovement 0
	releaseall
	return

SlateportCity_ContestLobby_Movement_1554C0:: @ 81554C0
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

SlateportCity_ContestLobby_Movement_1554CA:: @ 81554CA
	walk_in_place_fastest_left
	end_movement

SlateportCity_ContestLobby_Movement_1554CC:: @ 81554CC
	walk_left
	walk_in_place_fastest_down
	end_movement

SlateportCity_ContestLobby_Movement_1554CF:: @ 81554CF
	walk_down
	walk_down
	walk_in_place_fastest_up
	end_movement

SlateportCity_ContestLobby_Movement_1554D3:: @ 81554D3
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	delay_8
	set_invisible
	end_movement

SlateportCity_ContestLobby_Movement_1554DC:: @ 81554DC
	walk_in_place_fastest_right
	end_movement

SlateportCity_ContestLobby_EventScript_1554DE:: @ 81554DE
	msgbox SlateportCity_ContestLobby_Text_17C937, 2
	end

SlateportCity_ContestLobby_EventScript_1554E7:: @ 81554E7
	msgbox SlateportCity_ContestLobby_Text_17C9D5, 2
	end

SlateportCity_ContestLobby_EventScript_1554F0:: @ 81554F0
	msgbox SlateportCity_ContestLobby_Text_17CAEC, 2
	end

SlateportCity_ContestLobby_EventScript_1554F9:: @ 81554F9
	lockall
	goto_if_set FLAG_RECEIVED_POKEBLOCK_CASE, SlateportCity_ContestLobby_EventScript_155526
	applymovement 7, SlateportCity_ContestLobby_Movement_1A0839
	waitmovement 0
	msgbox SlateportCity_ContestLobby_Text_17CA67, 4
	giveitem_std ITEM_POKEBLOCK_CASE
	setflag FLAG_RECEIVED_POKEBLOCK_CASE
	releaseall
	end

SlateportCity_ContestLobby_EventScript_155526:: @ 8155526
	msgbox SlateportCity_ContestLobby_Text_17CA88, 2
	end

SlateportCity_ContestLobby_EventScript_15552F:: @ 815552F
	lockall
	fadescreen 1
	drawcontestwinner 3
	releaseall
	end

SlateportCity_ContestLobby_EventScript_155536:: @ 8155536
	msgbox SlateportCity_ContestLobby_Text_1B7225, 2
	end

@ 815553F
	lockall
	special ShowBerryBlenderRecordWindow
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end
