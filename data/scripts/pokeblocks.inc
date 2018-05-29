FallarborTown_ContestLobby_EventScript_1B7604:: @ 81B7604
	setvar VAR_SPECIAL_8, 4
	setvar VAR_SPECIAL_9, 1
	applymovement VAR_SPECIAL_8, FallarborTown_ContestLobby_Movement_1B7821
	waitmovement 0
	goto FallarborTown_ContestLobby_EventScript_1B7681
	end

SlateportCity_ContestLobby_EventScript_1B761E:: @ 81B761E
	setvar VAR_SPECIAL_8, 2
	setvar VAR_SPECIAL_9, 2
	applymovement 6, SlateportCity_ContestLobby_Movement_1A083D
	applymovement VAR_SPECIAL_8, SlateportCity_ContestLobby_Movement_1B7821
	waitmovement 0
	goto SlateportCity_ContestLobby_EventScript_1B7681
	end

VerdanturfTown_ContestLobby_EventScript_1B763F:: @ 81B763F
	setvar VAR_SPECIAL_8, 2
	setvar VAR_SPECIAL_9, 1
	applymovement VAR_SPECIAL_8, VerdanturfTown_ContestLobby_Movement_1B7821
	waitmovement 0
	goto VerdanturfTown_ContestLobby_EventScript_1B7681
	end

LilycoveCity_ContestLobby_EventScript_1B7659:: @ 81B7659
	setvar VAR_SPECIAL_8, 3
	setvar VAR_SPECIAL_9, 3
	applymovement 9, LilycoveCity_ContestLobby_Movement_1A083D
	applymovement 10, LilycoveCity_ContestLobby_Movement_1A083D
	applymovement VAR_SPECIAL_8, LilycoveCity_ContestLobby_Movement_1B7821
	waitmovement 0
	goto LilycoveCity_ContestLobby_EventScript_1B7681
	end

FallarborTown_ContestLobby_EventScript_1B7681:: @ 81B7681
LilycoveCity_ContestLobby_EventScript_1B7681:: @ 81B7681
SlateportCity_ContestLobby_EventScript_1B7681:: @ 81B7681
VerdanturfTown_ContestLobby_EventScript_1B7681:: @ 81B7681
	lockall
	msgbox FallarborTown_ContestLobby_Text_1B6E63, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B76A1
	compare RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B76E5
	end

FallarborTown_ContestLobby_EventScript_1B76A1:: @ 81B76A1
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7780
	specialvar RESULT, PlayerHasBerries
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B770E
	msgbox FallarborTown_ContestLobby_Text_1B6E9D, 4
	specialvar RESULT, GetFirstFreePokeblockSlot
	compare RESULT, -1
	goto_if_ne FallarborTown_ContestLobby_EventScript_1B76EF
	compare RESULT, -1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7776
	end

FallarborTown_ContestLobby_EventScript_1B76E5:: @ 81B76E5
	msgbox FallarborTown_ContestLobby_Text_1B6EA8, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B76EF:: @ 81B76EF
	msgbox FallarborTown_ContestLobby_Text_1B6ED0, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7734
	compare RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7726
	end

FallarborTown_ContestLobby_EventScript_1B770E:: @ 81B770E
	msgbox FallarborTown_ContestLobby_Text_1B6FF0, 4
	dodailyevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_FALLARBOR, FallarborTown_ContestLobby_EventScript_1B774F
	goto FallarborTown_ContestLobby_EventScript_1B7759
	end

FallarborTown_ContestLobby_EventScript_1B7726:: @ 81B7726
	msgbox FallarborTown_ContestLobby_Text_1B6F1F, 4
	goto FallarborTown_ContestLobby_EventScript_1B7734
	end

FallarborTown_ContestLobby_EventScript_1B7734:: @ 81B7734
	msgbox FallarborTown_ContestLobby_Text_1B6EF1, 4
	goto FallarborTown_ContestLobby_EventScript_1B7742
	end

FallarborTown_ContestLobby_EventScript_1B7742:: @ 81B7742
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_9
	fadescreen 1
	special DoBerryBlending
	waitstate
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B774F:: @ 81B774F
	msgbox FallarborTown_ContestLobby_Text_1B70F6, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7759:: @ 81B7759
	msgbox FallarborTown_ContestLobby_Text_1B704A, 4
	giveitem_std ITEM_PECHA_BERRY
	setflag FLAG_DAILY_RECEIVED_BERRY_FALLARBOR
	goto FallarborTown_ContestLobby_EventScript_1B76EF
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
	setvar VAR_SPECIAL_8, 4
	goto FallarborTown_ContestLobby_EventScript_1B77B6
	end

SlateportCity_ContestLobby_EventScript_1B7795:: @ 81B7795
	setvar VAR_SPECIAL_8, 2
	goto SlateportCity_ContestLobby_EventScript_1B77B6
	end

VerdanturfTown_ContestLobby_EventScript_1B77A0:: @ 81B77A0
	setvar VAR_SPECIAL_8, 2
	goto VerdanturfTown_ContestLobby_EventScript_1B77B6
	end

LilycoveCity_ContestLobby_EventScript_1B77AB:: @ 81B77AB
	setvar VAR_SPECIAL_8, 3
	goto LilycoveCity_ContestLobby_EventScript_1B77B6
	end

FallarborTown_ContestLobby_EventScript_1B77B6:: @ 81B77B6
LilycoveCity_ContestLobby_EventScript_1B77B6:: @ 81B77B6
SlateportCity_ContestLobby_EventScript_1B77B6:: @ 81B77B6
VerdanturfTown_ContestLobby_EventScript_1B77B6:: @ 81B77B6
	lock
	faceplayer
	msgbox FallarborTown_ContestLobby_Text_1B742F, 4
	specialvar RESULT, PlayerHasBerries
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B77DC
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B77E6
	end

FallarborTown_ContestLobby_EventScript_1B77DC:: @ 81B77DC
	msgbox FallarborTown_ContestLobby_Text_1B7469, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1B77E6:: @ 81B77E6
	dodailyevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_FALLARBOR, FallarborTown_ContestLobby_EventScript_1B77F6
	goto FallarborTown_ContestLobby_EventScript_1B7800
	end

FallarborTown_ContestLobby_EventScript_1B77F6:: @ 81B77F6
	msgbox FallarborTown_ContestLobby_Text_1B7578, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1B7800:: @ 81B7800
	msgbox FallarborTown_ContestLobby_Text_1B74B4, 4
	giveitem_std ITEM_PECHA_BERRY
	setflag FLAG_DAILY_RECEIVED_BERRY_FALLARBOR
	msgbox FallarborTown_ContestLobby_Text_1B753A, 4
	release
	end

FallarborTown_ContestLobby_Movement_1B7821:: @ 81B7821
LilycoveCity_ContestLobby_Movement_1B7821:: @ 81B7821
SlateportCity_ContestLobby_Movement_1B7821:: @ 81B7821
VerdanturfTown_ContestLobby_Movement_1B7821:: @ 81B7821
	walk_in_place_fastest_right
	end_movement

FallarborTown_ContestLobby_EventScript_1B7823:: @ 81B7823
	goto FallarborTown_ContestLobby_EventScript_1B783B
	end

SlateportCity_ContestLobby_EventScript_1B7829:: @ 81B7829
	goto SlateportCity_ContestLobby_EventScript_1B783B
	end

VerdanturfTown_ContestLobby_EventScript_1B782F:: @ 81B782F
	goto VerdanturfTown_ContestLobby_EventScript_1B783B
	end

LilycoveCity_ContestLobby_EventScript_1B7835:: @ 81B7835
	goto LilycoveCity_ContestLobby_EventScript_1B783B
	end

FallarborTown_ContestLobby_EventScript_1B783B:: @ 81B783B
LilycoveCity_ContestLobby_EventScript_1B783B:: @ 81B783B
SlateportCity_ContestLobby_EventScript_1B783B:: @ 81B783B
VerdanturfTown_ContestLobby_EventScript_1B783B:: @ 81B783B
	lockall
	specialvar RESULT, PlayerHasBerries
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7897
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7942
	specialvar RESULT, GetFirstFreePokeblockSlot
	compare RESULT, -1
	goto_if_ne FallarborTown_ContestLobby_EventScript_1B7878
	compare RESULT, -1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7938
	end

FallarborTown_ContestLobby_EventScript_1B7878:: @ 81B7878
	msgbox FallarborTown_ContestLobby_Text_1B727C, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B78A1
	compare RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7936
	end

FallarborTown_ContestLobby_EventScript_1B7897:: @ 81B7897
	msgbox FallarborTown_ContestLobby_Text_1B7381, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B78A1:: @ 81B78A1
	call S_DoSaveDialog
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7936
	message FallarborTown_ContestLobby_Text_1B7304
	waitmessage
	special sub_8083614
	waitstate
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7980
	compare RESULT, 2
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B794C
	compare RESULT, 3
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7959
	compare RESULT, 5
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7966
	compare RESULT, 6
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7973
	end

FallarborTown_ContestLobby_EventScript_1B78F3:: @ 81B78F3
	msgbox FallarborTown_ContestLobby_Text_1B733B, 4
	goto FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B7901:: @ 81B7901
	msgbox FallarborTown_ContestLobby_Text_1B7347, 4
	goto FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B790F:: @ 81B790F
	msgbox FallarborTown_ContestLobby_Text_1B735A, 4
	goto FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B791D:: @ 81B791D
	setvar VAR_SPECIAL_4, 0
	fadescreen 1
	removeobject 240
	removeobject 239
	removeobject 238
	removeobject 237
	special DoBerryBlending
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
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A4A30, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7959:: @ 81B7959
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A4B1D, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7966:: @ 81B7966
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A10EB, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7973:: @ 81B7973
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A4A85, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7980:: @ 81B7980
	fadescreen 1
	specialvar RESULT, GetLinkPartnerNames
	copyvar VAR_SPECIAL_8, RESULT
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	special SpawnBerryBlenderLinkPlayerSprites
	goto FallarborTown_ContestLobby_EventScript_1B799A
	end

FallarborTown_ContestLobby_EventScript_1B799A:: @ 81B799A
	fadescreen 0
	switch VAR_SPECIAL_8
	case 2, FallarborTown_ContestLobby_EventScript_1B78F3
	case 3, FallarborTown_ContestLobby_EventScript_1B7901
	case 4, FallarborTown_ContestLobby_EventScript_1B790F
	end
