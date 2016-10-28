FallarborTown_ContestLobby_EventScript_1B7604:: @ 81B7604
	setvar 0x8008, 4
	setvar 0x8009, 1
	move 0x8008, FallarborTown_ContestLobby_Movement_1B7821
	waitmove 0
	jump FallarborTown_ContestLobby_EventScript_1B7681
	end

SlateportCity_ContestLobby_EventScript_1B761E:: @ 81B761E
	setvar 0x8008, 2
	setvar 0x8009, 2
	move 6, SlateportCity_ContestLobby_Movement_1A083D
	move 0x8008, SlateportCity_ContestLobby_Movement_1B7821
	waitmove 0
	jump SlateportCity_ContestLobby_EventScript_1B7681
	end

VerdanturfTown_ContestLobby_EventScript_1B763F:: @ 81B763F
	setvar 0x8008, 2
	setvar 0x8009, 1
	move 0x8008, VerdanturfTown_ContestLobby_Movement_1B7821
	waitmove 0
	jump VerdanturfTown_ContestLobby_EventScript_1B7681
	end

LilycoveCity_ContestLobby_EventScript_1B7659:: @ 81B7659
	setvar 0x8008, 3
	setvar 0x8009, 3
	move 9, LilycoveCity_ContestLobby_Movement_1A083D
	move 10, LilycoveCity_ContestLobby_Movement_1A083D
	move 0x8008, LilycoveCity_ContestLobby_Movement_1B7821
	waitmove 0
	jump LilycoveCity_ContestLobby_EventScript_1B7681
	end

FallarborTown_ContestLobby_EventScript_1B7681:: @ 81B7681
LilycoveCity_ContestLobby_EventScript_1B7681:: @ 81B7681
SlateportCity_ContestLobby_EventScript_1B7681:: @ 81B7681
VerdanturfTown_ContestLobby_EventScript_1B7681:: @ 81B7681
	lockall
	msgbox FallarborTown_ContestLobby_Text_1B6E63, 5
	compare RESULT, 1
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B76A1
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B76E5
	end

FallarborTown_ContestLobby_EventScript_1B76A1:: @ 81B76A1
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7780
	specialval RESULT, 49
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B770E
	msgbox FallarborTown_ContestLobby_Text_1B6E9D, 4
	specialval RESULT, 160
	compare RESULT, 65535
	jumpif NOT_EQUAL, FallarborTown_ContestLobby_EventScript_1B76EF
	compare RESULT, 65535
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7776
	end

FallarborTown_ContestLobby_EventScript_1B76E5:: @ 81B76E5
	msgbox FallarborTown_ContestLobby_Text_1B6EA8, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B76EF:: @ 81B76EF
	msgbox FallarborTown_ContestLobby_Text_1B6ED0, 5
	compare RESULT, 1
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7734
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7726
	end

FallarborTown_ContestLobby_EventScript_1B770E:: @ 81B770E
	msgbox FallarborTown_ContestLobby_Text_1B6FF0, 4
	checkdailyflags
	checkflag 2241
	jumpif FLAG_IS_SET, FallarborTown_ContestLobby_EventScript_1B774F
	jump FallarborTown_ContestLobby_EventScript_1B7759
	end

FallarborTown_ContestLobby_EventScript_1B7726:: @ 81B7726
	msgbox FallarborTown_ContestLobby_Text_1B6F1F, 4
	jump FallarborTown_ContestLobby_EventScript_1B7734
	end

FallarborTown_ContestLobby_EventScript_1B7734:: @ 81B7734
	msgbox FallarborTown_ContestLobby_Text_1B6EF1, 4
	jump FallarborTown_ContestLobby_EventScript_1B7742
	end

FallarborTown_ContestLobby_EventScript_1B7742:: @ 81B7742
	copyvar 0x8004, 0x8009
	fadescreen 1
	special 161
	waitstate
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B774F:: @ 81B774F
	msgbox FallarborTown_ContestLobby_Text_1B70F6, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7759:: @ 81B7759
	msgbox FallarborTown_ContestLobby_Text_1B704A, 4
	giveitem ITEM_PECHA_BERRY
	setflag 2241
	jump FallarborTown_ContestLobby_EventScript_1B76EF
	end

FallarborTown_ContestLobby_EventScript_1B7776:: @ 81B7776
	msgbox FallarborTown_ContestLobby_Text_1B717C, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7780:: @ 81B7780
	msgbox FallarborTown_ContestLobby_Text_1B71D2, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B778A:: @ 81B778A
	setvar 0x8008, 4
	jump FallarborTown_ContestLobby_EventScript_1B77B6
	end

SlateportCity_ContestLobby_EventScript_1B7795:: @ 81B7795
	setvar 0x8008, 2
	jump SlateportCity_ContestLobby_EventScript_1B77B6
	end

VerdanturfTown_ContestLobby_EventScript_1B77A0:: @ 81B77A0
	setvar 0x8008, 2
	jump VerdanturfTown_ContestLobby_EventScript_1B77B6
	end

LilycoveCity_ContestLobby_EventScript_1B77AB:: @ 81B77AB
	setvar 0x8008, 3
	jump LilycoveCity_ContestLobby_EventScript_1B77B6
	end

FallarborTown_ContestLobby_EventScript_1B77B6:: @ 81B77B6
LilycoveCity_ContestLobby_EventScript_1B77B6:: @ 81B77B6
SlateportCity_ContestLobby_EventScript_1B77B6:: @ 81B77B6
VerdanturfTown_ContestLobby_EventScript_1B77B6:: @ 81B77B6
	lock
	faceplayer
	msgbox FallarborTown_ContestLobby_Text_1B742F, 4
	specialval RESULT, 49
	compare RESULT, 1
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B77DC
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B77E6
	end

FallarborTown_ContestLobby_EventScript_1B77DC:: @ 81B77DC
	msgbox FallarborTown_ContestLobby_Text_1B7469, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1B77E6:: @ 81B77E6
	checkdailyflags
	checkflag 2241
	jumpif FLAG_IS_SET, FallarborTown_ContestLobby_EventScript_1B77F6
	jump FallarborTown_ContestLobby_EventScript_1B7800
	end

FallarborTown_ContestLobby_EventScript_1B77F6:: @ 81B77F6
	msgbox FallarborTown_ContestLobby_Text_1B7578, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1B7800:: @ 81B7800
	msgbox FallarborTown_ContestLobby_Text_1B74B4, 4
	giveitem ITEM_PECHA_BERRY
	setflag 2241
	msgbox FallarborTown_ContestLobby_Text_1B753A, 4
	release
	end

FallarborTown_ContestLobby_Movement_1B7821:: @ 81B7821
LilycoveCity_ContestLobby_Movement_1B7821:: @ 81B7821
SlateportCity_ContestLobby_Movement_1B7821:: @ 81B7821
VerdanturfTown_ContestLobby_Movement_1B7821:: @ 81B7821
	step_28
	step_end

FallarborTown_ContestLobby_EventScript_1B7823:: @ 81B7823
	jump FallarborTown_ContestLobby_EventScript_1B783B
	end

SlateportCity_ContestLobby_EventScript_1B7829:: @ 81B7829
	jump SlateportCity_ContestLobby_EventScript_1B783B
	end

VerdanturfTown_ContestLobby_EventScript_1B782F:: @ 81B782F
	jump VerdanturfTown_ContestLobby_EventScript_1B783B
	end

LilycoveCity_ContestLobby_EventScript_1B7835:: @ 81B7835
	jump LilycoveCity_ContestLobby_EventScript_1B783B
	end

FallarborTown_ContestLobby_EventScript_1B783B:: @ 81B783B
LilycoveCity_ContestLobby_EventScript_1B783B:: @ 81B783B
SlateportCity_ContestLobby_EventScript_1B783B:: @ 81B783B
VerdanturfTown_ContestLobby_EventScript_1B783B:: @ 81B783B
	lockall
	specialval RESULT, 49
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7897
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7942
	specialval RESULT, 160
	compare RESULT, 65535
	jumpif NOT_EQUAL, FallarborTown_ContestLobby_EventScript_1B7878
	compare RESULT, 65535
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7938
	end

FallarborTown_ContestLobby_EventScript_1B7878:: @ 81B7878
	msgbox FallarborTown_ContestLobby_Text_1B727C, 5
	compare RESULT, 1
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B78A1
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7936
	end

FallarborTown_ContestLobby_EventScript_1B7897:: @ 81B7897
	msgbox FallarborTown_ContestLobby_Text_1B7381, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B78A1:: @ 81B78A1
	call FallarborTown_ContestLobby_EventScript_19F806
	compare RESULT, 0
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7936
	message FallarborTown_ContestLobby_Text_1B7304
	waittext
	special 36
	waitstate
	compare RESULT, 1
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7980
	compare RESULT, 2
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B794C
	compare RESULT, 3
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7959
	compare RESULT, 5
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7966
	compare RESULT, 6
	jumpif EQUAL, FallarborTown_ContestLobby_EventScript_1B7973
	end

FallarborTown_ContestLobby_EventScript_1B78F3:: @ 81B78F3
	msgbox FallarborTown_ContestLobby_Text_1B733B, 4
	jump FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B7901:: @ 81B7901
	msgbox FallarborTown_ContestLobby_Text_1B7347, 4
	jump FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B790F:: @ 81B790F
	msgbox FallarborTown_ContestLobby_Text_1B735A, 4
	jump FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B791D:: @ 81B791D
	setvar 0x8004, 0
	fadescreen 1
	disappear 240
	disappear 239
	disappear 238
	disappear 237
	special 161
	waitstate
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7936:: @ 81B7936
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7938:: @ 81B7938
	msgbox FallarborTown_ContestLobby_Text_1B73B7, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7942:: @ 81B7942
	msgbox FallarborTown_ContestLobby_Text_1B73F1, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B794C:: @ 81B794C
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A4A30, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7959:: @ 81B7959
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A4B1D, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7966:: @ 81B7966
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A10EB, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7973:: @ 81B7973
	special 31
	msgbox FallarborTown_ContestLobby_Text_1A4A85, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7980:: @ 81B7980
	fadescreen 1
	specialval RESULT, 37
	copyvar 0x8008, RESULT
	copyvar 0x8004, 0x8008
	special 38
	jump FallarborTown_ContestLobby_EventScript_1B799A
	end

FallarborTown_ContestLobby_EventScript_1B799A:: @ 81B799A
	fadescreen 0
	switch 0x8008
	case 2, FallarborTown_ContestLobby_EventScript_1B78F3
	case 3, FallarborTown_ContestLobby_EventScript_1B7901
	case 4, FallarborTown_ContestLobby_EventScript_1B790F
	end
