FallarborTown_House2_MapScripts:: @ 8153C90
	.byte 0

FallarborTown_House2_EventScript_153C91:: @ 8153C91
	lockall
	move 1, FallarborTown_House2_Movement_1A0839
	waitmove 0
	checkflag 1
	jumpif FLAG_IS_SET, FallarborTown_House2_EventScript_153CB6
	msgbox FallarborTown_House2_Text_177AF4, 4
	setflag 1
	jump FallarborTown_House2_EventScript_153CB6
	end

FallarborTown_House2_EventScript_153CB6:: @ 8153CB6
	checkitem ITEM_HEART_SCALE, 1
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_House2_EventScript_153D60
	msgbox FallarborTown_House2_Text_177BDB, 5
	switch RESULT
	case 0, FallarborTown_House2_EventScript_153D60
	jump FallarborTown_House2_EventScript_153CE4
	end

FallarborTown_House2_EventScript_153CE4:: @ 8153CE4
	msgbox FallarborTown_House2_Text_177C3F, 4
	special 219
	waitstate
	compare 0x8004, 255
	jumpif EQUAL, FallarborTown_House2_EventScript_153D60
	special 328
	compare RESULT, 1
	jumpif EQUAL, FallarborTown_House2_EventScript_153D52
	compare 0x8005, 0
	jumpif EQUAL, FallarborTown_House2_EventScript_153D44
	jump FallarborTown_House2_EventScript_153D1A
	end

FallarborTown_House2_EventScript_153D1A:: @ 8153D1A
	msgbox FallarborTown_House2_Text_177C5D, 4
	special 224
	waitstate
	compare 0x8004, 0
	jumpif EQUAL, FallarborTown_House2_EventScript_153CE4
	msgbox FallarborTown_House2_Text_177CC3, 4
	removeitem ITEM_HEART_SCALE, 1
	jump FallarborTown_House2_EventScript_153D60
	end

FallarborTown_House2_EventScript_153D44:: @ 8153D44
	msgbox FallarborTown_House2_Text_177C78, 4
	jump FallarborTown_House2_EventScript_153CE4
	end

FallarborTown_House2_EventScript_153D52:: @ 8153D52
	msgbox FallarborTown_House2_Text_177D33, 4
	jump FallarborTown_House2_EventScript_153CE4
	end

FallarborTown_House2_EventScript_153D60:: @ 8153D60
	msgbox FallarborTown_House2_Text_177CEF, 4
	releaseall
	end
