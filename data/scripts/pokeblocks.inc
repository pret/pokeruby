FallarborTown_ContestLobby_EventScript_BerryBlender2:: @ 81B7604
	setvar VAR_0x8008, 4
	setvar VAR_0x8009, 1
	applymovement VAR_0x8008, FallarborTown_ContestLobby_Movement_1B7821
	waitmovement 0
	goto FallarborTown_ContestLobby_EventScript_1B7681
	end

SlateportCity_ContestLobby_EventScript_1B761E:: @ 81B761E
	setvar VAR_0x8008, 2
	setvar VAR_0x8009, 2
	applymovement 6, Common_Movement_FaceOriginalDirection
	applymovement VAR_0x8008, SlateportCity_ContestLobby_Movement_1B7821
	waitmovement 0
	goto SlateportCity_ContestLobby_EventScript_1B7681
	end

VerdanturfTown_ContestLobby_EventScript_1B763F:: @ 81B763F
	setvar VAR_0x8008, 2
	setvar VAR_0x8009, 1
	applymovement VAR_0x8008, VerdanturfTown_ContestLobby_Movement_1B7821
	waitmovement 0
	goto VerdanturfTown_ContestLobby_EventScript_1B7681
	end

LilycoveCity_ContestLobby_EventScript_1B7659:: @ 81B7659
	setvar VAR_0x8008, 3
	setvar VAR_0x8009, 3
	applymovement 9, Common_Movement_FaceOriginalDirection
	applymovement 10, Common_Movement_FaceOriginalDirection
	applymovement VAR_0x8008, LilycoveCity_ContestLobby_Movement_1B7821
	waitmovement 0
	goto LilycoveCity_ContestLobby_EventScript_1B7681
	end

FallarborTown_ContestLobby_EventScript_1B7681:: @ 81B7681
LilycoveCity_ContestLobby_EventScript_1B7681:: @ 81B7681
SlateportCity_ContestLobby_EventScript_1B7681:: @ 81B7681
VerdanturfTown_ContestLobby_EventScript_1B7681:: @ 81B7681
	lockall
	msgbox FallarborTown_ContestLobby_Text_1B6E63, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B76A1
	compare VAR_RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B76E5
	end

FallarborTown_ContestLobby_EventScript_1B76A1:: @ 81B76A1
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7780
	specialvar VAR_RESULT, PlayerHasBerries
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B770E
	msgbox FallarborTown_ContestLobby_Text_1B6E9D, MSGBOX_DEFAULT
	specialvar VAR_RESULT, GetFirstFreePokeblockSlot
	compare VAR_RESULT, -1
	goto_if_ne FallarborTown_ContestLobby_EventScript_1B76EF
	compare VAR_RESULT, -1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7776
	end

FallarborTown_ContestLobby_EventScript_1B76E5:: @ 81B76E5
	msgbox FallarborTown_ContestLobby_Text_1B6EA8, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B76EF:: @ 81B76EF
	msgbox FallarborTown_ContestLobby_Text_1B6ED0, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7734
	compare VAR_RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7726
	end

FallarborTown_ContestLobby_EventScript_1B770E:: @ 81B770E
	msgbox FallarborTown_ContestLobby_Text_1B6FF0, MSGBOX_DEFAULT
	dotimebasedevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_FALLARBOR, FallarborTown_ContestLobby_EventScript_1B774F
	goto FallarborTown_ContestLobby_EventScript_1B7759
	end

FallarborTown_ContestLobby_EventScript_1B7726:: @ 81B7726
	msgbox FallarborTown_ContestLobby_Text_1B6F1F, MSGBOX_DEFAULT
	goto FallarborTown_ContestLobby_EventScript_1B7734
	end

FallarborTown_ContestLobby_EventScript_1B7734:: @ 81B7734
	msgbox FallarborTown_ContestLobby_Text_1B6EF1, MSGBOX_DEFAULT
	goto FallarborTown_ContestLobby_EventScript_1B7742
	end

FallarborTown_ContestLobby_EventScript_1B7742:: @ 81B7742
	copyvar VAR_0x8004, VAR_0x8009
	fadescreen FADE_TO_BLACK
	special DoBerryBlending
	waitstate
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B774F:: @ 81B774F
	msgbox FallarborTown_ContestLobby_Text_1B70F6, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7759:: @ 81B7759
	msgbox FallarborTown_ContestLobby_Text_1B704A, MSGBOX_DEFAULT
	giveitem ITEM_PECHA_BERRY
	setflag FLAG_DAILY_RECEIVED_BERRY_FALLARBOR
	goto FallarborTown_ContestLobby_EventScript_1B76EF
	end

FallarborTown_ContestLobby_EventScript_1B7776:: @ 81B7776
	msgbox FallarborTown_ContestLobby_Text_1B717C, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7780:: @ 81B7780
	msgbox FallarborTown_ContestLobby_Text_1B71D2, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_BerryBlenderMan:: @ 81B778A
	setvar VAR_0x8008, 4
	goto VerdanturfTown_ContestLobby_EventScript_BerryBlendWithNPC
	end

SlateportCity_ContestLobby_EventScript_1B7795:: @ 81B7795
	setvar VAR_0x8008, 2
	goto VerdanturfTown_ContestLobby_EventScript_BerryBlendWithNPC
	end

VerdanturfTown_ContestLobby_EventScript_1B77A0:: @ 81B77A0
	setvar VAR_0x8008, 2
	goto VerdanturfTown_ContestLobby_EventScript_BerryBlendWithNPC
	end

LilycoveCity_ContestLobby_EventScript_1B77AB:: @ 81B77AB
	setvar VAR_0x8008, 3
	goto VerdanturfTown_ContestLobby_EventScript_BerryBlendWithNPC
	end

VerdanturfTown_ContestLobby_EventScript_BerryBlendWithNPC:: @ 81B77B6
	lock
	faceplayer
	msgbox FallarborTown_ContestLobby_Text_1B742F, MSGBOX_DEFAULT
	specialvar VAR_RESULT, PlayerHasBerries
	compare VAR_RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B77DC
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B77E6
	end

FallarborTown_ContestLobby_EventScript_1B77DC:: @ 81B77DC
	msgbox FallarborTown_ContestLobby_Text_1B7469, MSGBOX_DEFAULT
	release
	end

FallarborTown_ContestLobby_EventScript_1B77E6:: @ 81B77E6
	dotimebasedevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_FALLARBOR, FallarborTown_ContestLobby_EventScript_1B77F6
	goto FallarborTown_ContestLobby_EventScript_1B7800
	end

FallarborTown_ContestLobby_EventScript_1B77F6:: @ 81B77F6
	msgbox FallarborTown_ContestLobby_Text_1B7578, MSGBOX_DEFAULT
	release
	end

FallarborTown_ContestLobby_EventScript_1B7800:: @ 81B7800
	msgbox FallarborTown_ContestLobby_Text_1B74B4, MSGBOX_DEFAULT
	giveitem ITEM_PECHA_BERRY
	setflag FLAG_DAILY_RECEIVED_BERRY_FALLARBOR
	msgbox FallarborTown_ContestLobby_Text_1B753A, MSGBOX_DEFAULT
	release
	end

FallarborTown_ContestLobby_Movement_1B7821:: @ 81B7821
LilycoveCity_ContestLobby_Movement_1B7821:: @ 81B7821
SlateportCity_ContestLobby_Movement_1B7821:: @ 81B7821
VerdanturfTown_ContestLobby_Movement_1B7821:: @ 81B7821
	walk_in_place_fastest_right
	step_end

FallarborTown_ContestLobby_EventScript_BerryBlender1:: @ 81B7823
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
	specialvar VAR_RESULT, PlayerHasBerries
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7897
	checkitem ITEM_POKEBLOCK_CASE, 1
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7942
	specialvar VAR_RESULT, GetFirstFreePokeblockSlot
	compare VAR_RESULT, -1
	goto_if_ne FallarborTown_ContestLobby_EventScript_1B7878
	compare VAR_RESULT, -1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7938
	end

FallarborTown_ContestLobby_EventScript_1B7878:: @ 81B7878
	msgbox FallarborTown_ContestLobby_Text_1B727C, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B78A1
	compare VAR_RESULT, NO
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7936
	end

FallarborTown_ContestLobby_EventScript_1B7897:: @ 81B7897
	msgbox FallarborTown_ContestLobby_Text_1B7381, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B78A1:: @ 81B78A1
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7936
	message FallarborTown_ContestLobby_Text_1B7304
	waitmessage
	special sub_8083614
	waitstate
	compare VAR_RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7980
	compare VAR_RESULT, 2
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B794C
	compare VAR_RESULT, 3
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7959
	compare VAR_RESULT, 5
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7966
	compare VAR_RESULT, 6
	goto_if_eq FallarborTown_ContestLobby_EventScript_1B7973
	end

FallarborTown_ContestLobby_EventScript_1B78F3:: @ 81B78F3
	msgbox FallarborTown_ContestLobby_Text_1B733B, MSGBOX_DEFAULT
	goto FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B7901:: @ 81B7901
	msgbox FallarborTown_ContestLobby_Text_1B7347, MSGBOX_DEFAULT
	goto FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B790F:: @ 81B790F
	msgbox FallarborTown_ContestLobby_Text_1B735A, MSGBOX_DEFAULT
	goto FallarborTown_ContestLobby_EventScript_1B791D
	end

FallarborTown_ContestLobby_EventScript_1B791D:: @ 81B791D
	setvar VAR_0x8004, 0
	fadescreen FADE_TO_BLACK
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
	msgbox FallarborTown_ContestLobby_Text_1B73B7, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7942:: @ 81B7942
	msgbox FallarborTown_ContestLobby_Text_1B73F1, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B794C:: @ 81B794C
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A4A30, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7959:: @ 81B7959
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A4B1D, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7966:: @ 81B7966
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A10EB, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7973:: @ 81B7973
	special CloseLink
	msgbox FallarborTown_ContestLobby_Text_1A4A85, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1B7980:: @ 81B7980
	fadescreen FADE_TO_BLACK
	specialvar VAR_RESULT, GetLinkPartnerNames
	copyvar VAR_0x8008, VAR_RESULT
	copyvar VAR_0x8004, VAR_0x8008
	special SpawnBerryBlenderLinkPlayerSprites
	goto FallarborTown_ContestLobby_EventScript_1B799A
	end

FallarborTown_ContestLobby_EventScript_1B799A:: @ 81B799A
	fadescreen FADE_FROM_BLACK
	switch VAR_0x8008
	case 2, FallarborTown_ContestLobby_EventScript_1B78F3
	case 3, FallarborTown_ContestLobby_EventScript_1B7901
	case 4, FallarborTown_ContestLobby_EventScript_1B790F
	end
