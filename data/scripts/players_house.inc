LittlerootTown_BrendansHouse_2F_EventScript_1B6950:: @ 81B6950
LittlerootTown_MaysHouse_2F_EventScript_1B6950:: @ 81B6950
	setvar VAR_LITTLEROOT_INTRO_STATE, 5
	return

PlayersHouse_1F_EventScript_EnterHouseMovingIn:: @ 81B6956
	msgbox PlayersHouse_1F_Text_IsntItNiceInHere, MSGBOX_DEFAULT
	applymovement VAR_0x8004, Common_Movement_FacePlayer
	waitmovement 0
	compare VAR_0x8005, 0
	call_if_eq PlayersHouse_1F_EventScript_MomFacePlayerMovingInMale
	compare VAR_0x8005, 1
	call_if_eq PlayersHouse_1F_EventScript_MomFacePlayerMovingInFemale
	msgbox PlayersHouse_1F_Text_MoversPokemonGoSetClock, MSGBOX_DEFAULT
	closemessage
	setvar VAR_LITTLEROOT_INTRO_STATE, 4
	applymovement LOCALID_PLAYER, PlayersHouse_1F_Movement_PlayerWalkIn
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	releaseall
	end

PlayersHouse_1F_EventScript_MomFacePlayerMovingInMale:: @ 81B699F
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

PlayersHouse_1F_EventScript_MomFacePlayerMovingInFemale:: @ 81B69AA
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

PlayersHouse_1F_Movement_PlayerWalkIn:: @ 81B69B5
	walk_up
	step_end

PlayersHouse_1F_EventScript_MomGoSeeRoom:: @ 81B69B7
	msgbox PlayersHouse_1F_Text_ArentYouInterestedInRoom, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFastestUp
	applymovement LOCALID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_1B6CDC
	waitmovement 0
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69D3:: @ 81B69D3
	lockall
	setvar VAR_0x8004, 0
	goto LittlerootTown_BrendansHouse_2F_EventScript_1B69EB
	end

LittlerootTown_MaysHouse_2F_EventScript_1B69DF:: @ 81B69DF
	lockall
	setvar VAR_0x8004, 1
	goto LittlerootTown_MaysHouse_2F_EventScript_1B69EB
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69EB:: @ 81B69EB
LittlerootTown_MaysHouse_2F_EventScript_1B69EB:: @ 81B69EB
	goto_if_set FLAG_SET_WALL_CLOCK, LittlerootTown_BrendansHouse_2F_EventScript_1B6A91
	msgbox PlayersHouse_2F_Text_ClockIsStopped, MSGBOX_DEFAULT
	call LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B
	delay 30
	setvar VAR_LITTLEROOT_INTRO_STATE, 6
	setflag FLAG_SET_WALL_CLOCK
	setflag FLAG_HIDE_MACHOKE_MOVER_1
	setflag FLAG_HIDE_MACHOKE_MOVER_2
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_1B6A31
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_1B6A61
	playse SE_EXIT
	removeobject VAR_0x8008
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A31:: @ 81B6A31
	setvar VAR_0x8008, 14
	addobject VAR_0x8008
	applymovement VAR_0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AA2
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox PlayersHouse_2F_Text_HowDoYouLikeYourRoom, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AA9
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A61:: @ 81B6A61
	setvar VAR_0x8008, 14
	addobject VAR_0x8008
	applymovement VAR_0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AAD
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox PlayersHouse_2F_Text_HowDoYouLikeYourRoom, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AB4
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A91:: @ 81B6A91
	incrementgamestat GAME_STAT_CHECKED_CLOCK
	fadescreen FADE_TO_BLACK
	special ScrSpecial_ViewWallClock
	waitstate
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B:: @ 81B6A9B
	fadescreen FADE_TO_BLACK
	special StartWallClock
	waitstate
	return

LittlerootTown_BrendansHouse_2F_Movement_1B6AA2:: @ 81B6AA2
	delay_8
	walk_down
	walk_in_place_fastest_left
	delay_16
	delay_8
	walk_left
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AA9:: @ 81B6AA9
	walk_right
	walk_up
	delay_8
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AAD:: @ 81B6AAD
	delay_8
	walk_down
	walk_in_place_fastest_right
	delay_16
	delay_8
	walk_right
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AB4:: @ 81B6AB4
	walk_left
	walk_up
	delay_8
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
LittlerootTown_MaysHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
	setvar VAR_LITTLEROOT_INTRO_STATE, 7
	releaseall
	end

PlayersHouse_1F_EventScript_PetalburgGymReportMale:: @ 81B6ABF
	applymovement VAR_0x8005, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D
	applymovement LOCALID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_1B6CCC
	waitmovement 0
	playbgm MUS_ENCOUNTER_INTERVIEWER, FALSE
	msgbox PlayersHouse_1F_Text_MaybeDadWillBeOn, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_0x8005, LittlerootTown_BrendansHouse_1F_Movement_1B6BDB
	waitmovement 0
	applymovement LOCALID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_1B6CD2
	waitmovement 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox PlayersHouse_1F_Text_ItsOverWeMissedHim, MSGBOX_DEFAULT
	msgbox PlayersHouse_1F_Text_GoIntroduceYourselfNextDoor, MSGBOX_DEFAULT
	closemessage
	setvar VAR_TEMP_1, 1
	applymovement VAR_0x8005, LittlerootTown_BrendansHouse_1F_Movement_1B6BE1
	waitmovement 0
	goto LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_MaysHouse_1F_EventScript_1B6B2E:: @ 81B6B2E
	applymovement VAR_0x8005, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6B9D
	applymovement LOCALID_PLAYER, LittlerootTown_MaysHouse_1F_Movement_1B6CD4
	waitmovement 0
	playbgm MUS_ENCOUNTER_INTERVIEWER, FALSE
	msgbox PlayersHouse_1F_Text_MaybeDadWillBeOn, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_0x8005, LittlerootTown_MaysHouse_1F_Movement_1B6BDE
	waitmovement 0
	applymovement LOCALID_PLAYER, LittlerootTown_MaysHouse_1F_Movement_1B6CDA
	waitmovement 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6BBE
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox PlayersHouse_1F_Text_ItsOverWeMissedHim, MSGBOX_DEFAULT
	msgbox PlayersHouse_1F_Text_GoIntroduceYourselfNextDoor, MSGBOX_DEFAULT
	closemessage
	setvar VAR_TEMP_1, 1
	applymovement VAR_0x8005, LittlerootTown_MaysHouse_1F_Movement_1B6BE5
	waitmovement 0
	goto LittlerootTown_MaysHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
LittlerootTown_MaysHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
	playse SE_PIN
	applymovement VAR_0x8005, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_0x8005, Common_Movement_Delay48
	waitmovement 0
	msgbox PlayersHouse_1F_Text_OhComeQuickly, MSGBOX_DEFAULT
	closemessage
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
LittlerootTown_MaysHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox PlayersHouse_1F_Text_ReportFromPetalburgGym, MSGBOX_DEFAULT
	fadedefaultbgm
	special TurnOffTVScreen
	setflag FLAG_SYS_TV_HOME
	delay 35
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6BDB:: @ 81B6BDB
	walk_left
	walk_in_place_fastest_right
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BDE:: @ 81B6BDE
	walk_right
	walk_in_place_fastest_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6BE1:: @ 81B6BE1
	walk_left
	walk_down
	walk_in_place_fastest_right
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BE5:: @ 81B6BE5
	walk_right
	walk_down
	walk_in_place_fastest_left
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
LittlerootTown_MaysHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
	lock
	faceplayer
	compare VAR_LITTLEROOT_HOUSES_STATE, 4
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	compare VAR_LITTLEROOT_HOUSES_STATE_2, 4
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	goto_if_set FLAG_BADGE05_GET, LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D
	goto_if_set FLAG_RESCUED_BIRCH, LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	compare VAR_TEMP_1, 1
	goto_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6C80
	compare VAR_LITTLEROOT_INTRO_STATE, 7
	goto_if_ge LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C
	msgbox PlayersHouse_1F_Text_IsntItNiceInHere, MSGBOX_DEFAULT
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C33:: @ 81B6C33
	msgbox PlayersHouse_1F_Text_DadShouldStayLonger, MSGBOX_DEFAULT
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D:: @ 81B6C3D
	goto_if_set FLAG_RECEIVED_AMULET_COIN, LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	msgbox PlayersHouse_1F_Text_GotDadsBadgeHeresSomethingFromMom, MSGBOX_DEFAULT
	giveitem ITEM_AMULET_COIN
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox PlayersHouse_1F_Text_DontPushYourselfTooHard, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_AMULET_COIN
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C72:: @ 81B6C72
	msgbox PlayersHouse_1F_Text_YouShouldRestABit, MSGBOX_DEFAULT
	goto LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C80:: @ 81B6C80
	msgbox PlayersHouse_1F_Text_SeeYouHoney, MSGBOX_DEFAULT
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A:: @ 81B6C8A
	closemessage
	call Common_EventScript_OutOfCenterPartyHeal
	incrementgamestat GAME_STAT_RESTED_AT_HOME
	msgbox PlayersHouse_1F_Text_TakeCareHoney, MSGBOX_DEFAULT
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C:: @ 81B6C9C
	msgbox PlayersHouse_1F_Text_DidYouMeetProfBirch, MSGBOX_DEFAULT
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
LittlerootTown_MaysHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOKE, 0
	msgbox PlayersHouse_1F_Text_Machoke1, MSGBOX_DEFAULT
	waitmoncry
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
LittlerootTown_MaysHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOKE, 0
	msgbox PlayersHouse_1F_Text_Machoke2, MSGBOX_DEFAULT
	waitmoncry
	release
	end

LittlerootTown_BrendansHouse_1F_Movement_1B6CCC:: @ 81B6CCC
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CD2:: @ 81B6CD2
	walk_left
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CD4:: @ 81B6CD4
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CDA:: @ 81B6CDA
	walk_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CDC:: @ 81B6CDC
	walk_up
	step_end

PlayersHouse_1F_EventScript_GetSSTicketAndSeeLatiTV:: @ 81B6CDE
	lockall
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6E28
	applymovement VAR_0x8009, Common_Movement_FacePlayer
	waitmovement 0
	playse SE_PIN
	applymovement VAR_0x8009, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_0x8009, Common_Movement_Delay48
	waitmovement 0
	delay 20
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8
	msgbox PlayersHouse_1F_Text_TicketFromBrineyCameForYou, MSGBOX_DEFAULT
	giveitem ITEM_SS_TICKET
	msgbox PlayersHouse_1F_Text_PortsInSlateportLilycove, MSGBOX_DEFAULT
	closemessage
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE
	msgbox PlayersHouse_1F_Text_BetterGetBackToGym, MSGBOX_DEFAULT
	closemessage
	compare VAR_0x8008, 0
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9
	compare VAR_0x8008, 1
	call_if_eq LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B
	playse SE_DOOR
	removeobject VAR_0x8009
	setflag FLAG_RECEIVED_SS_TICKET
	setvar VAR_LITTLEROOT_HOUSES_STATE, 4
	setvar VAR_LITTLEROOT_HOUSES_STATE_2, 4
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD:: @ 81B6DAD
	setvar VAR_0x8008, 0
	setvar VAR_0x8009, 5
	setvar VAR_0x800A, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD:: @ 81B6DBD
	setvar VAR_0x8008, 1
	setvar VAR_0x8009, 5
	setvar VAR_0x800A, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD:: @ 81B6DCD
	applymovement VAR_0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E33
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8:: @ 81B6DD8
	applymovement VAR_0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E36
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3:: @ 81B6DE3
	applymovement VAR_0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E39
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE:: @ 81B6DEE
	applymovement VAR_0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E3B
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9:: @ 81B6DF9
	applymovement LOCALID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	applymovement VAR_0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E3D
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B:: @ 81B6E0B
	applymovement LOCALID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	applymovement VAR_0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E43
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D:: @ 81B6E1D
	applymovement LOCALID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_1B6E49
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E28:: @ 81B6E28
	applymovement LOCALID_PLAYER, LittlerootTown_BrendansHouse_1F_Movement_1B6E54
	waitmovement 0
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6E33:: @ 81B6E33
	walk_right
	walk_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E36:: @ 81B6E36
	walk_left
	walk_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E39:: @ 81B6E39
	walk_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3B:: @ 81B6E3B
	walk_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3D:: @ 81B6E3D
	walk_down
	walk_right
	walk_right
	walk_down
	delay_8
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E43:: @ 81B6E43
	walk_down
	walk_left
	walk_left
	walk_down
	delay_8
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E49:: @ 81B6E49
	delay_16
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E4F:: @ 81B6E4F
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_down
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E54:: @ 81B6E54
	delay_16
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_right
	step_end
