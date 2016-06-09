SlateportCity_ContestHall_MapScripts:: @ 815554B
	.byte 0

SlateportCity_ContestHall_EventScript_15554C:: @ 815554C
	loadptr 0, SlateportCity_ContestHall_Text_17CB71
	callstd 2
	end

SlateportCity_ContestHall_EventScript_155555:: @ 8155555
	loadptr 0, SlateportCity_ContestHall_Text_17CC80
	callstd 2
	end

SlateportCity_ContestHall_EventScript_15555E:: @ 815555E
	lock
	faceplayer
	checkflag 265
	jumpeq SlateportCity_ContestHall_EventScript_155595
	loadptr 0, SlateportCity_ContestHall_Text_17CCE2
	callstd 4
	setorcopyvar 0x8000, 0x149
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SlateportCity_ContestHall_EventScript_1A029B
	setflag 265
	loadptr 0, SlateportCity_ContestHall_Text_17CE28
	callstd 4
	release
	end

SlateportCity_ContestHall_EventScript_155595:: @ 8155595
	loadptr 0, SlateportCity_ContestHall_Text_17CE28
	callstd 4
	release
	end

SlateportCity_ContestHall_EventScript_15559F:: @ 815559F
	loadptr 0, SlateportCity_ContestHall_Text_17CEF3
	callstd 2
	lockall
	move 3, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555B4:: @ 81555B4
	loadptr 0, SlateportCity_ContestHall_Text_17CFA7
	callstd 2
	lockall
	move 4, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555C9:: @ 81555C9
	loadptr 0, SlateportCity_ContestHall_Text_17D054
	callstd 2
	lockall
	move 5, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555DE:: @ 81555DE
	loadptr 0, SlateportCity_ContestHall_Text_17D07F
	callstd 2
	lockall
	move 6, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_1555F3:: @ 81555F3
	loadptr 0, SlateportCity_ContestHall_Text_17D0F9
	callstd 2
	lockall
	move 7, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155608:: @ 8155608
	loadptr 0, SlateportCity_ContestHall_Text_17D222
	callstd 2
	lockall
	move 8, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_15561D:: @ 815561D
	loadptr 0, SlateportCity_ContestHall_Text_17D39A
	callstd 2
	lockall
	move 9, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155632:: @ 8155632
	loadptr 0, SlateportCity_ContestHall_Text_17D3F0
	callstd 2
	lockall
	move 10, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155647:: @ 8155647
	loadptr 0, SlateportCity_ContestHall_Text_17D300
	callstd 2
	lockall
	move 12, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_15565C:: @ 815565C
	loadptr 0, SlateportCity_ContestHall_Text_17D27F
	callstd 2
	lockall
	move 11, SlateportCity_ContestHall_Movement_1A083D
	waitmove 0
	releaseall
	end

SlateportCity_ContestHall_EventScript_155671:: @ 8155671
	loadptr 0, SlateportCity_ContestHall_Text_17D447
	callstd 3
	end

