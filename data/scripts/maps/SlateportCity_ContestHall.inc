SlateportCity_ContestHall_MapScripts:: @ 815554B
	.byte 0

SlateportCity_ContestHall_EventScript_15554C:: @ 815554C
	msgbox SlateportCity_ContestHall_Text_17CB71, 2
	end

SlateportCity_ContestHall_EventScript_155555:: @ 8155555
	msgbox SlateportCity_ContestHall_Text_17CC80, 2
	end

SlateportCity_ContestHall_EventScript_15555E:: @ 815555E
	lock
	faceplayer
	checkflag 265
	goto_if_eq SlateportCity_ContestHall_EventScript_155595
	msgbox SlateportCity_ContestHall_Text_17CCE2, 4
	giveitem ITEM_TM41
	compare_var_to_imm RESULT, 0
	goto_if_eq SlateportCity_ContestHall_EventScript_1A029B
	setflag 265
	msgbox SlateportCity_ContestHall_Text_17CE28, 4
	release
	end

SlateportCity_ContestHall_EventScript_155595:: @ 8155595
	msgbox SlateportCity_ContestHall_Text_17CE28, 4
	release
	end

SlateportCity_ContestHall_EventScript_15559F:: @ 815559F
	msgbox SlateportCity_ContestHall_Text_17CEF3, 2
	lockall
	move 3, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555B4:: @ 81555B4
	msgbox SlateportCity_ContestHall_Text_17CFA7, 2
	lockall
	move 4, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555C9:: @ 81555C9
	msgbox SlateportCity_ContestHall_Text_17D054, 2
	lockall
	move 5, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555DE:: @ 81555DE
	msgbox SlateportCity_ContestHall_Text_17D07F, 2
	lockall
	move 6, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555F3:: @ 81555F3
	msgbox SlateportCity_ContestHall_Text_17D0F9, 2
	lockall
	move 7, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155608:: @ 8155608
	msgbox SlateportCity_ContestHall_Text_17D222, 2
	lockall
	move 8, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_15561D:: @ 815561D
	msgbox SlateportCity_ContestHall_Text_17D39A, 2
	lockall
	move 9, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155632:: @ 8155632
	msgbox SlateportCity_ContestHall_Text_17D3F0, 2
	lockall
	move 10, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155647:: @ 8155647
	msgbox SlateportCity_ContestHall_Text_17D300, 2
	lockall
	move 12, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_15565C:: @ 815565C
	msgbox SlateportCity_ContestHall_Text_17D27F, 2
	lockall
	move 11, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155671:: @ 8155671
	msgbox SlateportCity_ContestHall_Text_17D447, 3
	end
