FallarborTown_House2_MapScripts:: @ 8153C90
	.byte 0

FallarborTown_House2_EventScript_153C91:: @ 8153C91
	lockall
	move 1, FallarborTown_House2_Movement_1A0839
	waitmove 0
	checkflag 1
	jumpeq FallarborTown_House2_EventScript_153CB6
	loadptr 0, FallarborTown_House2_Text_177AF4
	callstd 4
	setflag 1
	jump FallarborTown_House2_EventScript_153CB6
	end

FallarborTown_House2_EventScript_153CB6:: @ 8153CB6
	checkitem ITEM_HEART_SCALE, 1
	compare RESULT, 0
	jumpeq FallarborTown_House2_EventScript_153D60
	loadptr 0, FallarborTown_House2_Text_177BDB
	callstd 5
	switch RESULT
	case 0, FallarborTown_House2_EventScript_153D60
	jump FallarborTown_House2_EventScript_153CE4
	end

FallarborTown_House2_EventScript_153CE4:: @ 8153CE4
	loadptr 0, FallarborTown_House2_Text_177C3F
	callstd 4
	special 219
	waitstate
	compare 0x8004, 255
	jumpeq FallarborTown_House2_EventScript_153D60
	special 328
	compare RESULT, 1
	jumpeq FallarborTown_House2_EventScript_153D52
	compare 0x8005, 0
	jumpeq FallarborTown_House2_EventScript_153D44
	jump FallarborTown_House2_EventScript_153D1A
	end

FallarborTown_House2_EventScript_153D1A:: @ 8153D1A
	loadptr 0, FallarborTown_House2_Text_177C5D
	callstd 4
	special 224
	waitstate
	compare 0x8004, 0
	jumpeq FallarborTown_House2_EventScript_153CE4
	loadptr 0, FallarborTown_House2_Text_177CC3
	callstd 4
	removeitem ITEM_HEART_SCALE, 1
	jump FallarborTown_House2_EventScript_153D60
	end

FallarborTown_House2_EventScript_153D44:: @ 8153D44
	loadptr 0, FallarborTown_House2_Text_177C78
	callstd 4
	jump FallarborTown_House2_EventScript_153CE4
	end

FallarborTown_House2_EventScript_153D52:: @ 8153D52
	loadptr 0, FallarborTown_House2_Text_177D33
	callstd 4
	jump FallarborTown_House2_EventScript_153CE4
	end

FallarborTown_House2_EventScript_153D60:: @ 8153D60
	loadptr 0, FallarborTown_House2_Text_177CEF
	callstd 4
	releaseall
	end

