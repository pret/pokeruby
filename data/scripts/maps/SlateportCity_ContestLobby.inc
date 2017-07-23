SlateportCity_ContestLobby_MapScripts:: @ 8155411
	map_script 3, SlateportCity_ContestLobby_MapScript1_155417
	.byte 0

SlateportCity_ContestLobby_MapScript1_155417:: @ 8155417
	call SlateportCity_ContestLobby_EventScript_1AE188
	end

SlateportCity_ContestLobby_EventScript_15541D:: @ 815541D
	setvar 0x800b, 7
	setvar CONTEST_RANK, 2
	call SlateportCity_ContestLobby_EventScript_1A4E92
	call SlateportCity_ContestLobby_EventScript_155448
	special sub_80C4BF0
	call SlateportCity_ContestLobby_EventScript_15FBDB
	setvar 0x4088, 3
	warp LinkContestRoom1, 255, 7, 5
	waitstate
	end

SlateportCity_ContestLobby_EventScript_155448:: @ 8155448
	lockall
	move 1, SlateportCity_ContestLobby_Movement_1554CC
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 545, 1
	setmaptile 4, 3, 609, 1
	special DrawWholeMapView
	move 1, SlateportCity_ContestLobby_Movement_1554CF
	waitmove 0
	playsfx 71
	setmaptile 4, 2, 721, 1
	setmaptile 4, 3, 729, 1
	special DrawWholeMapView
	pause 20
	move 1, SlateportCity_ContestLobby_Movement_1554DC
	waitmove 0
	move 255, SlateportCity_ContestLobby_Movement_1554CA
	waitmove 0
	msgbox SlateportCity_ContestLobby_Text_1A6832, 4
	closebutton
	move 1, SlateportCity_ContestLobby_Movement_1554D3
	move 255, SlateportCity_ContestLobby_Movement_1554C0
	waitmove 0
	releaseall
	return

SlateportCity_ContestLobby_Movement_1554C0:: @ 81554C0
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

SlateportCity_ContestLobby_Movement_1554CA:: @ 81554CA
	step_27
	step_end

SlateportCity_ContestLobby_Movement_1554CC:: @ 81554CC
	step_left
	step_25
	step_end

SlateportCity_ContestLobby_Movement_1554CF:: @ 81554CF
	step_down
	step_down
	step_26
	step_end

SlateportCity_ContestLobby_Movement_1554D3:: @ 81554D3
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_13
	step_54
	step_end

SlateportCity_ContestLobby_Movement_1554DC:: @ 81554DC
	step_28
	step_end

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
	checkflag 95
	jumpeq SlateportCity_ContestLobby_EventScript_155526
	move 7, SlateportCity_ContestLobby_Movement_1A0839
	waitmove 0
	msgbox SlateportCity_ContestLobby_Text_17CA67, 4
	giveitem ITEM_POKEBLOCK_CASE
	setflag 95
	releaseall
	end

SlateportCity_ContestLobby_EventScript_155526:: @ 8155526
	msgbox SlateportCity_ContestLobby_Text_17CA88, 2
	end

SlateportCity_ContestLobby_EventScript_15552F:: @ 815552F
	lockall
	fadescreen 1
	showcontestwinner 3
	releaseall
	end

SlateportCity_ContestLobby_EventScript_155536:: @ 8155536
	msgbox SlateportCity_ContestLobby_Text_1B7225, 2
	end

@ 815553F
	lockall
	special ShowBerryBlenderRecordWindow
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end
