FallarborTown_ContestLobby_EventScript_1A4E92:: @ 81A4E92
LilycoveCity_ContestLobby_EventScript_1A4E92:: @ 81A4E92
SlateportCity_ContestLobby_EventScript_1A4E92:: @ 81A4E92
VerdanturfTown_ContestLobby_EventScript_1A4E92:: @ 81A4E92
	lock
	faceplayer
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 0
	call_if_eq FallarborTown_ContestLobby_EventScript_1A4EDD
	compare VAR_CONTEST_PRIZE_PICKUP, 0
	goto_if_ne FallarborTown_ContestLobby_EventScript_1A4F4E
	goto_if_set FLAG_TEMP_1, FallarborTown_ContestLobby_EventScript_1A4F8F
	bufferstdstring 0, VAR_SPECIAL_B
	msgbox FallarborTown_ContestLobby_Text_1A5DFC, 4
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A4EE1
	setflag FLAG_TEMP_1
	goto FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A4EDD:: @ 81A4EDD
	clearflag FLAG_TEMP_1
	return

FallarborTown_ContestLobby_EventScript_1A4EE1:: @ 81A4EE1
	compare CONTEST_RANK, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A4EF6
	msgbox FallarborTown_ContestLobby_Text_1A6340, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4EF6:: @ 81A4EF6
	msgbox FallarborTown_ContestLobby_Text_1A64F4, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A4F13
	msgbox FallarborTown_ContestLobby_Text_1A65EA, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4F13:: @ 81A4F13
	goto_if_set FLAG_RECEIVED_CONTEST_PASS, FallarborTown_ContestLobby_EventScript_1A4F44
	msgbox FallarborTown_ContestLobby_Text_1A6583, 4
	giveitem_std ITEM_CONTEST_PASS
	setflag FLAG_RECEIVED_CONTEST_PASS
	setflag FLAG_TEMP_1
	msgbox FallarborTown_ContestLobby_Text_1A5E98, 4
	goto FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A4F44:: @ 81A4F44
	msgbox FallarborTown_ContestLobby_Text_1A6590, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4F4E:: @ 81A4F4E
	msgbox FallarborTown_ContestLobby_Text_1A685A, 4
	switch VAR_CONTEST_PRIZE_PICKUP
	case 4, FallarborTown_ContestLobby_EventScript_1A4F67
	end

FallarborTown_ContestLobby_EventScript_1A4F67:: @ 81A4F67
	giveitem_std ITEM_LUXURY_BALL
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A4F86
	setvar VAR_CONTEST_PRIZE_PICKUP, 0
	closemessage
	release
	end

FallarborTown_ContestLobby_EventScript_1A4F86:: @ 81A4F86
	msgbox FallarborTown_ContestLobby_Text_1A68C6, 2
	end

FallarborTown_ContestLobby_EventScript_1A4F8F:: @ 81A4F8F
	message FallarborTown_ContestLobby_Text_1A5E46
	waitmessage
	multichoice 0, 0, 2, 0
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5097
	case 1, FallarborTown_ContestLobby_EventScript_1A4FCC
	case 2, FallarborTown_ContestLobby_EventScript_1A503E
	case 127, FallarborTown_ContestLobby_EventScript_1A503E
	end

FallarborTown_ContestLobby_EventScript_1A4FCC:: @ 81A4FCC
	message FallarborTown_ContestLobby_Text_1A5E7C
	waitmessage
	multichoice 0, 0, 3, 0
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5014
	case 1, FallarborTown_ContestLobby_EventScript_1A5022
	case 2, FallarborTown_ContestLobby_EventScript_1A5030
	case 3, FallarborTown_ContestLobby_EventScript_1A4F8F
	case 127, FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A5014:: @ 81A5014
	msgbox FallarborTown_ContestLobby_Text_1A5E98, 4
	goto FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A5022:: @ 81A5022
	msgbox FallarborTown_ContestLobby_Text_1A609B, 4
	goto FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A5030:: @ 81A5030
	msgbox FallarborTown_ContestLobby_Text_1A613F, 4
	goto FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A503E:: @ 81A503E
	msgbox FallarborTown_ContestLobby_Text_188559, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1A5048:: @ 81A5048
	msgbox FallarborTown_ContestLobby_Text_1A6319, 4
	choosecontestmon
	compare VAR_SPECIAL_4, 255
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A5097
	special sub_80C43F4
	compare RESULT, 0
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A50C8
	compare RESULT, 1
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A50D7
	compare RESULT, 2
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A50FB
	compare RESULT, 3
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A511F
	compare RESULT, 4
	goto_if_eq FallarborTown_ContestLobby_EventScript_1A512E
	end

FallarborTown_ContestLobby_EventScript_1A5097:: @ 81A5097
	message FallarborTown_ContestLobby_Text_1A6623
	waitmessage
	multichoice 0, 0, 4, 0
	switch RESULT
	case 5, FallarborTown_ContestLobby_EventScript_1A503E
	case 127, FallarborTown_ContestLobby_EventScript_1A503E
	copyvar CONTEST_CATEGORY, RESULT
	goto FallarborTown_ContestLobby_EventScript_1A5048
	end

FallarborTown_ContestLobby_EventScript_1A50C8:: @ 81A50C8
	msgbox FallarborTown_ContestLobby_Text_1A664A, 4
	goto FallarborTown_ContestLobby_EventScript_1A5048
	release
	end

FallarborTown_ContestLobby_EventScript_1A50D7:: @ 81A50D7
	msgbox FallarborTown_ContestLobby_Text_1A67A3, MSGBOX_YESNO
	switch RESULT
	case NO, FallarborTown_ContestLobby_EventScript_1A5048
	case YES, FallarborTown_ContestLobby_EventScript_1A513D
	end

FallarborTown_ContestLobby_EventScript_1A50FB:: @ 81A50FB
	msgbox FallarborTown_ContestLobby_Text_1A6724, MSGBOX_YESNO
	switch RESULT
	case NO, FallarborTown_ContestLobby_EventScript_1A5048
	case YES, FallarborTown_ContestLobby_EventScript_1A513D
	end

FallarborTown_ContestLobby_EventScript_1A511F:: @ 81A511F
	msgbox FallarborTown_ContestLobby_Text_1A669F, 4
	goto FallarborTown_ContestLobby_EventScript_1A5048
	release
	end

FallarborTown_ContestLobby_EventScript_1A512E:: @ 81A512E
	msgbox FallarborTown_ContestLobby_Text_1A66DC, 4
	goto FallarborTown_ContestLobby_EventScript_1A5048
	release
	end

FallarborTown_ContestLobby_EventScript_1A513D:: @ 81A513D
	msgbox FallarborTown_ContestLobby_Text_1A67C1, 4
	closemessage
	releaseall
	setvar VAR_LINK_CONTEST_ROOM_STATE, 1
	return

LinkContestRoom1_EventScript_1A514D:: @ 81A514D
	setvar VAR_SPECIAL_6, 0
	lockall
	applymovement 14, LinkContestRoom1_Movement_1A5DBF
	waitmovement 0
	applymovement 1, LinkContestRoom1_Movement_1A5D85
	waitmovement 0
	releaseall
	call LinkContestRoom1_EventScript_1A51A0
	call LinkContestRoom1_EventScript_1A51EA
	call LinkContestRoom1_EventScript_1A5245
	call LinkContestRoom1_EventScript_1A527A
	call LinkContestRoom1_EventScript_1A58EE
	call LinkContestRoom1_EventScript_1A594A
	call LinkContestRoom1_EventScript_1A59FC
	call LinkContestRoom1_EventScript_1A5A49
	call LinkContestRoom1_EventScript_1A5A90
	call LinkContestRoom1_EventScript_1A5BAB
	setvar VAR_LINK_CONTEST_ROOM_STATE, 2
	return

LinkContestRoom1_EventScript_1A51A0:: @ 81A51A0
	switch CONTEST_RANK
	case 0, LinkContestRoom1_EventScript_1A51D2
	case 1, LinkContestRoom1_EventScript_1A51D8
	case 2, LinkContestRoom1_EventScript_1A51DE
	case 3, LinkContestRoom1_EventScript_1A51E4
	return

LinkContestRoom1_EventScript_1A51D2:: @ 81A51D2
	setvar VAR_SPECIAL_9, 5
	return

LinkContestRoom1_EventScript_1A51D8:: @ 81A51D8
	setvar VAR_SPECIAL_9, 6
	return

LinkContestRoom1_EventScript_1A51DE:: @ 81A51DE
	setvar VAR_SPECIAL_9, 7
	return

LinkContestRoom1_EventScript_1A51E4:: @ 81A51E4
	setvar VAR_SPECIAL_9, 8
	return

LinkContestRoom1_EventScript_1A51EA:: @ 81A51EA
	switch CONTEST_CATEGORY
	case 0, LinkContestRoom1_EventScript_1A5227
	case 1, LinkContestRoom1_EventScript_1A522D
	case 2, LinkContestRoom1_EventScript_1A5233
	case 3, LinkContestRoom1_EventScript_1A5239
	case 4, LinkContestRoom1_EventScript_1A523F
	return

LinkContestRoom1_EventScript_1A5227:: @ 81A5227
	setvar VAR_SPECIAL_8, 0
	return

LinkContestRoom1_EventScript_1A522D:: @ 81A522D
	setvar VAR_SPECIAL_8, 1
	return

LinkContestRoom1_EventScript_1A5233:: @ 81A5233
	setvar VAR_SPECIAL_8, 2
	return

LinkContestRoom1_EventScript_1A5239:: @ 81A5239
	setvar VAR_SPECIAL_8, 3
	return

LinkContestRoom1_EventScript_1A523F:: @ 81A523F
	setvar VAR_SPECIAL_8, 4
	return

LinkContestRoom1_EventScript_1A5245:: @ 81A5245
	bufferstdstring 1, VAR_SPECIAL_8
	bufferstdstring 2, VAR_SPECIAL_9
	call LinkContestRoom1_EventScript_1A525F
	lockall
	applymovement 1, LinkContestRoom1_Movement_1A5D87
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A525F:: @ 81A525F
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A5273
	msgbox LinkContestRoom1_Text_1A68F0, 3
	return

LinkContestRoom1_EventScript_1A5273:: @ 81A5273
	messageautoscroll LinkContestRoom1_Text_1A6976
	waitmessage
	return

LinkContestRoom1_EventScript_1A527A:: @ 81A527A
	call LinkContestRoom1_EventScript_1A52AE
	call LinkContestRoom1_EventScript_1A5323
	call LinkContestRoom1_EventScript_1A5455
	call LinkContestRoom1_EventScript_1A53E5
	call LinkContestRoom1_EventScript_1A5880
	addvar VAR_SPECIAL_6, 1
	compare VAR_SPECIAL_6, 4
	goto_if_ne LinkContestRoom1_EventScript_1A527A
	call LinkContestRoom1_EventScript_1A5377
	setvar VAR_TEMP_1, 6
	return

LinkContestRoom1_EventScript_1A52AE:: @ 81A52AE
	compare VAR_SPECIAL_6, 0
	goto_if_eq LinkContestRoom1_EventScript_1A52DB
	compare VAR_SPECIAL_6, 1
	goto_if_eq LinkContestRoom1_EventScript_1A52ED
	compare VAR_SPECIAL_6, 2
	goto_if_eq LinkContestRoom1_EventScript_1A52FF
	compare VAR_SPECIAL_6, 3
	goto_if_eq LinkContestRoom1_EventScript_1A5311
	return

LinkContestRoom1_EventScript_1A52DB:: @ 81A52DB
	lockall
	applymovement 3, LinkContestRoom1_Movement_1A5DCE
	waitmovement 0
	releaseall
	setvar VAR_SPECIAL_B, 3
	return

LinkContestRoom1_EventScript_1A52ED:: @ 81A52ED
	lockall
	applymovement 4, LinkContestRoom1_Movement_1A5DDA
	waitmovement 0
	releaseall
	setvar VAR_SPECIAL_B, 4
	return

LinkContestRoom1_EventScript_1A52FF:: @ 81A52FF
	lockall
	applymovement 5, LinkContestRoom1_Movement_1A5DE2
	waitmovement 0
	releaseall
	setvar VAR_SPECIAL_B, 5
	return

LinkContestRoom1_EventScript_1A5311:: @ 81A5311
	lockall
	applymovement 14, LinkContestRoom1_Movement_1A5DEA
	waitmovement 0
	releaseall
	setvar VAR_SPECIAL_B, 14
	return

LinkContestRoom1_EventScript_1A5323:: @ 81A5323
	special sub_80C4C64
	addvar VAR_SPECIAL_6, 1
	buffernumberstring 1, VAR_SPECIAL_6
	lockall
	applymovement VAR_SPECIAL_B, LinkContestRoom1_Movement_1A5D9C
	waitmovement 0
	releaseall
	addobject 13
	playse SE_DANSA
	lockall
	applymovement VAR_SPECIAL_B, LinkContestRoom1_Movement_1A5D9C
	waitmovement 0
	releaseall
	addvar VAR_SPECIAL_6, -1
	playse SE_BOWA2
	special ShowContestEntryMonPic
	call LinkContestRoom1_EventScript_1A535E
	return

LinkContestRoom1_EventScript_1A535E:: @ 81A535E
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A5370
	message LinkContestRoom1_Text_1A6A04
	waitmessage
	return

LinkContestRoom1_EventScript_1A5370:: @ 81A5370
	messageautoscroll LinkContestRoom1_Text_1A6A04
	waitmessage
	return

LinkContestRoom1_EventScript_1A5377:: @ 81A5377
	call LinkContestRoom1_EventScript_1A53B3
	call LinkContestRoom1_EventScript_1A53CE
	playse SE_W227B
	waitmessage
	call LinkContestRoom1_EventScript_1A5A90
	applymovement 1, LinkContestRoom1_Movement_1A5D9F
	waitmovement 0
	applymovement 2, LinkContestRoom1_Movement_1A5DA1
	waitmovement 0
	delay 20
	applymovement 1, LinkContestRoom1_Movement_1A5D8F
	applymovement 2, LinkContestRoom1_Movement_1A5D8F
	waitmovement 0
	return

LinkContestRoom1_EventScript_1A53B3:: @ 81A53B3
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A53C7
	msgbox LinkContestRoom1_Text_1A6A1F, 4
	return

LinkContestRoom1_EventScript_1A53C7:: @ 81A53C7
	messageautoscroll LinkContestRoom1_Text_1A6A1F
	waitmessage
	return

LinkContestRoom1_EventScript_1A53CE:: @ 81A53CE
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A53DF
	message LinkContestRoom1_Text_1A6AE1
	return

LinkContestRoom1_EventScript_1A53DF:: @ 81A53DF
	messageautoscroll LinkContestRoom1_Text_1A6AE1
	return

LinkContestRoom1_EventScript_1A53E5:: @ 81A53E5
	applymovement 1, LinkContestRoom1_Movement_1A5DAF
	waitmovement 0
	playse SE_W227B
	call LinkContestRoom1_EventScript_1A5AE4
	applymovement 9, LinkContestRoom1_Movement_1A5DB7
	applymovement 12, LinkContestRoom1_Movement_1A5DBB
	applymovement 7, LinkContestRoom1_Movement_1A5DB7
	waitmovement 0
	applymovement 1, LinkContestRoom1_Movement_1A5DB7
	waitmovement 0
	applymovement 10, LinkContestRoom1_Movement_1A5DAF
	applymovement 11, LinkContestRoom1_Movement_1A5DBB
	applymovement 6, LinkContestRoom1_Movement_1A5DB3
	applymovement 8, LinkContestRoom1_Movement_1A5DAF
	waitmovement 0
	applymovement 1, LinkContestRoom1_Movement_1A5DC1
	waitmovement 0
	applymovement 1, LinkContestRoom1_Movement_1A5DCA
	applymovement 2, LinkContestRoom1_Movement_1A5DC5
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5455:: @ 81A5455
	special sub_80C47A0
	compare VAR_CONTEST_LOCATION, 1
	call_if_eq LinkContestRoom1_EventScript_1A555A
	compare VAR_CONTEST_LOCATION, 2
	call_if_eq LinkContestRoom1_EventScript_1A55B8
	compare VAR_CONTEST_LOCATION, 3
	call_if_eq LinkContestRoom1_EventScript_1A5616
	compare VAR_CONTEST_LOCATION, 4
	call_if_eq LinkContestRoom1_EventScript_1A5674
	compare VAR_CONTEST_LOCATION, 5
	call_if_eq LinkContestRoom1_EventScript_1A56D2
	setvar VAR_TEMP_1, 9
	setvar VAR_TEMP_2, 9
	setvar VAR_TEMP_3, 9
	setvar VAR_TEMP_4, 9
	setvar VAR_TEMP_5, 9
	setvar VAR_TEMP_6, 9
	setvar VAR_TEMP_7, 9
	setvar VAR_TEMP_8, 9
	compare VAR_TEMP_0, 0
	call_if_gt LinkContestRoom1_EventScript_1A54EB
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	setvar VAR_TEMP_5, 0
	setvar VAR_TEMP_6, 0
	setvar VAR_TEMP_7, 0
	setvar VAR_TEMP_8, 0
	return

LinkContestRoom1_EventScript_1A54EB:: @ 81A54EB
	setvar RESULT, 8
	special ScriptRandom
	compare RESULT, 0
	call_if_eq LinkContestRoom1_EventScript_1A5760
	compare RESULT, 1
	call_if_eq LinkContestRoom1_EventScript_1A5784
	compare RESULT, 2
	call_if_eq LinkContestRoom1_EventScript_1A57A8
	compare RESULT, 3
	call_if_eq LinkContestRoom1_EventScript_1A57CC
	compare RESULT, 4
	call_if_eq LinkContestRoom1_EventScript_1A57F0
	compare RESULT, 5
	call_if_eq LinkContestRoom1_EventScript_1A5814
	compare RESULT, 6
	call_if_eq LinkContestRoom1_EventScript_1A5838
	compare RESULT, 7
	call_if_eq LinkContestRoom1_EventScript_1A585C
	compare VAR_TEMP_0, 0
	goto_if_gt LinkContestRoom1_EventScript_1A54EB
	waitmovement 0
	return

LinkContestRoom1_EventScript_1A555A:: @ 81A555A
	compare VAR_SPECIAL_4, 80
	goto_if_gt LinkContestRoom1_EventScript_1A575A
	compare VAR_SPECIAL_4, 70
	goto_if_gt LinkContestRoom1_EventScript_1A5754
	compare VAR_SPECIAL_4, 60
	goto_if_gt LinkContestRoom1_EventScript_1A574E
	compare VAR_SPECIAL_4, 50
	goto_if_gt LinkContestRoom1_EventScript_1A5748
	compare VAR_SPECIAL_4, 40
	goto_if_gt LinkContestRoom1_EventScript_1A5742
	compare VAR_SPECIAL_4, 30
	goto_if_gt LinkContestRoom1_EventScript_1A573C
	compare VAR_SPECIAL_4, 20
	goto_if_gt LinkContestRoom1_EventScript_1A5736
	compare VAR_SPECIAL_4, 10
	goto_if_gt LinkContestRoom1_EventScript_1A5730
	setvar VAR_TEMP_0, 0
	return

LinkContestRoom1_EventScript_1A55B8:: @ 81A55B8
	compare VAR_SPECIAL_4, 230
	goto_if_gt LinkContestRoom1_EventScript_1A575A
	compare VAR_SPECIAL_4, 210
	goto_if_gt LinkContestRoom1_EventScript_1A5754
	compare VAR_SPECIAL_4, 190
	goto_if_gt LinkContestRoom1_EventScript_1A574E
	compare VAR_SPECIAL_4, 170
	goto_if_gt LinkContestRoom1_EventScript_1A5748
	compare VAR_SPECIAL_4, 150
	goto_if_gt LinkContestRoom1_EventScript_1A5742
	compare VAR_SPECIAL_4, 130
	goto_if_gt LinkContestRoom1_EventScript_1A573C
	compare VAR_SPECIAL_4, 110
	goto_if_gt LinkContestRoom1_EventScript_1A5736
	compare VAR_SPECIAL_4, 90
	goto_if_gt LinkContestRoom1_EventScript_1A5730
	setvar VAR_TEMP_0, 0
	return

LinkContestRoom1_EventScript_1A5616:: @ 81A5616
	compare VAR_SPECIAL_4, 380
	goto_if_gt LinkContestRoom1_EventScript_1A575A
	compare VAR_SPECIAL_4, 350
	goto_if_gt LinkContestRoom1_EventScript_1A5754
	compare VAR_SPECIAL_4, 320
	goto_if_gt LinkContestRoom1_EventScript_1A574E
	compare VAR_SPECIAL_4, 290
	goto_if_gt LinkContestRoom1_EventScript_1A5748
	compare VAR_SPECIAL_4, 260
	goto_if_gt LinkContestRoom1_EventScript_1A5742
	compare VAR_SPECIAL_4, 230
	goto_if_gt LinkContestRoom1_EventScript_1A573C
	compare VAR_SPECIAL_4, 200
	goto_if_gt LinkContestRoom1_EventScript_1A5736
	compare VAR_SPECIAL_4, 170
	goto_if_gt LinkContestRoom1_EventScript_1A5730
	setvar VAR_TEMP_0, 0
	return

LinkContestRoom1_EventScript_1A5674:: @ 81A5674
	compare VAR_SPECIAL_4, 600
	goto_if_gt LinkContestRoom1_EventScript_1A575A
	compare VAR_SPECIAL_4, 560
	goto_if_gt LinkContestRoom1_EventScript_1A5754
	compare VAR_SPECIAL_4, 520
	goto_if_gt LinkContestRoom1_EventScript_1A574E
	compare VAR_SPECIAL_4, 480
	goto_if_gt LinkContestRoom1_EventScript_1A5748
	compare VAR_SPECIAL_4, 440
	goto_if_gt LinkContestRoom1_EventScript_1A5742
	compare VAR_SPECIAL_4, 400
	goto_if_gt LinkContestRoom1_EventScript_1A573C
	compare VAR_SPECIAL_4, 360
	goto_if_gt LinkContestRoom1_EventScript_1A5736
	compare VAR_SPECIAL_4, 320
	goto_if_gt LinkContestRoom1_EventScript_1A5730
	setvar VAR_TEMP_0, 0
	return

LinkContestRoom1_EventScript_1A56D2:: @ 81A56D2
	compare VAR_SPECIAL_4, 600
	goto_if_gt LinkContestRoom1_EventScript_1A575A
	compare VAR_SPECIAL_4, 550
	goto_if_gt LinkContestRoom1_EventScript_1A5754
	compare VAR_SPECIAL_4, 500
	goto_if_gt LinkContestRoom1_EventScript_1A574E
	compare VAR_SPECIAL_4, 450
	goto_if_gt LinkContestRoom1_EventScript_1A5748
	compare VAR_SPECIAL_4, 400
	goto_if_gt LinkContestRoom1_EventScript_1A5742
	compare VAR_SPECIAL_4, 300
	goto_if_gt LinkContestRoom1_EventScript_1A573C
	compare VAR_SPECIAL_4, 200
	goto_if_gt LinkContestRoom1_EventScript_1A5736
	compare VAR_SPECIAL_4, 100
	goto_if_gt LinkContestRoom1_EventScript_1A5730
	setvar VAR_TEMP_0, 0
	return

LinkContestRoom1_EventScript_1A5730:: @ 81A5730
	setvar VAR_TEMP_0, 1
	return

LinkContestRoom1_EventScript_1A5736:: @ 81A5736
	setvar VAR_TEMP_0, 2
	return

LinkContestRoom1_EventScript_1A573C:: @ 81A573C
	setvar VAR_TEMP_0, 3
	return

LinkContestRoom1_EventScript_1A5742:: @ 81A5742
	setvar VAR_TEMP_0, 4
	return

LinkContestRoom1_EventScript_1A5748:: @ 81A5748
	setvar VAR_TEMP_0, 5
	return

LinkContestRoom1_EventScript_1A574E:: @ 81A574E
	setvar VAR_TEMP_0, 6
	return

LinkContestRoom1_EventScript_1A5754:: @ 81A5754
	setvar VAR_TEMP_0, 7
	return

LinkContestRoom1_EventScript_1A575A:: @ 81A575A
	setvar VAR_TEMP_0, 8
	return

LinkContestRoom1_EventScript_1A5760:: @ 81A5760
	compare VAR_TEMP_1, 1
	goto_if_eq LinkContestRoom1_EventScript_1A5783
	applymovement 6, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_1, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A5783:: @ 81A5783
	return

LinkContestRoom1_EventScript_1A5784:: @ 81A5784
	compare VAR_TEMP_2, 1
	goto_if_eq LinkContestRoom1_EventScript_1A57A7
	applymovement 12, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_2, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A57A7:: @ 81A57A7
	return

LinkContestRoom1_EventScript_1A57A8:: @ 81A57A8
	compare VAR_TEMP_3, 1
	goto_if_eq LinkContestRoom1_EventScript_1A57CB
	applymovement 7, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_3, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A57CB:: @ 81A57CB
	return

LinkContestRoom1_EventScript_1A57CC:: @ 81A57CC
	compare VAR_TEMP_4, 1
	goto_if_eq LinkContestRoom1_EventScript_1A57EF
	applymovement 8, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_4, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A57EF:: @ 81A57EF
	return

LinkContestRoom1_EventScript_1A57F0:: @ 81A57F0
	compare VAR_TEMP_5, 1
	goto_if_eq LinkContestRoom1_EventScript_1A5813
	applymovement 9, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_5, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A5813:: @ 81A5813
	return

LinkContestRoom1_EventScript_1A5814:: @ 81A5814
	compare VAR_TEMP_6, 1
	goto_if_eq LinkContestRoom1_EventScript_1A5837
	applymovement 10, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_6, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A5837:: @ 81A5837
	return

LinkContestRoom1_EventScript_1A5838:: @ 81A5838
	compare VAR_TEMP_7, 1
	goto_if_eq LinkContestRoom1_EventScript_1A585B
	applymovement 11, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_7, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A585B:: @ 81A585B
	return

LinkContestRoom1_EventScript_1A585C:: @ 81A585C
	compare VAR_TEMP_8, 1
	goto_if_eq LinkContestRoom1_EventScript_1A587F
	applymovement 15, LinkContestRoom1_Movement_1A5D8D
	playse SE_PIN
	delay 14
	setvar VAR_TEMP_8, 1
	addvar VAR_TEMP_0, -1
	return

LinkContestRoom1_EventScript_1A587F:: @ 81A587F
	return

LinkContestRoom1_EventScript_1A5880:: @ 81A5880
	closemessage
	release
	removeobject 13
	special sub_80C5164
	switch VAR_SPECIAL_6
	case 0, LinkContestRoom1_EventScript_1A58BA
	case 1, LinkContestRoom1_EventScript_1A58C7
	case 2, LinkContestRoom1_EventScript_1A58D4
	case 3, LinkContestRoom1_EventScript_1A58E1
	return

LinkContestRoom1_EventScript_1A58BA:: @ 81A58BA
	lockall
	applymovement VAR_SPECIAL_B, LinkContestRoom1_Movement_1A5DD4
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58C7:: @ 81A58C7
	lockall
	applymovement VAR_SPECIAL_B, LinkContestRoom1_Movement_1A5DDE
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58D4:: @ 81A58D4
	lockall
	applymovement VAR_SPECIAL_B, LinkContestRoom1_Movement_1A5DE6
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58E1:: @ 81A58E1
	lockall
	applymovement VAR_SPECIAL_B, LinkContestRoom1_Movement_1A5DF0
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58EE:: @ 81A58EE
	lockall
	applymovement 1, LinkContestRoom1_Movement_1A5DA3
	waitmovement 0
	call LinkContestRoom1_EventScript_1A5930
	waitmessage
	applymovement 1, LinkContestRoom1_Movement_1A5D91
	applymovement 2, LinkContestRoom1_Movement_1A5D95
	waitmovement 0
	releaseall
	setvar VAR_TEMP_9, 1
	startcontest
	setvar VAR_TEMP_9, 0
	lockall
	applymovement 1, LinkContestRoom1_Movement_1A5D95
	applymovement 2, LinkContestRoom1_Movement_1A5D91
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5930:: @ 81A5930
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A5944
	msgbox LinkContestRoom1_Text_1A6AF5, 3
	return

LinkContestRoom1_EventScript_1A5944:: @ 81A5944
	messageautoscroll LinkContestRoom1_Text_1A6AF5
	return

LinkContestRoom1_EventScript_1A594A:: @ 81A594A
	call LinkContestRoom1_EventScript_1A5984
	call LinkContestRoom1_EventScript_1A59A2
	applymovement 1, LinkContestRoom1_Movement_1A5D8B
	waitmovement 0
	call LinkContestRoom1_EventScript_1A59C0
	call LinkContestRoom1_EventScript_1A59DE
	applymovement 1, LinkContestRoom1_Movement_1A5D8F
	waitmovement 0
	closemessage
	releaseall
	setvar VAR_TEMP_9, 1
	showcontestresults
	setvar VAR_TEMP_9, 0
	playbgm MUS_CON_FAN, FALSE
	return

LinkContestRoom1_EventScript_1A5984:: @ 81A5984
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A5998
	msgbox LinkContestRoom1_Text_1A6C06, 4
	return

LinkContestRoom1_EventScript_1A5998:: @ 81A5998
	messageautoscroll LinkContestRoom1_Text_1A6C06
	waitmessage
	delay 30
	return

LinkContestRoom1_EventScript_1A59A2:: @ 81A59A2
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A59B6
	msgbox LinkContestRoom1_Text_1A6C21, 4
	return

LinkContestRoom1_EventScript_1A59B6:: @ 81A59B6
	messageautoscroll LinkContestRoom1_Text_1A6C21
	waitmessage
	delay 30
	return

LinkContestRoom1_EventScript_1A59C0:: @ 81A59C0
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A59D4
	msgbox LinkContestRoom1_Text_1A6C9D, 4
	return

LinkContestRoom1_EventScript_1A59D4:: @ 81A59D4
	messageautoscroll LinkContestRoom1_Text_1A6C9D
	waitmessage
	delay 30
	return

LinkContestRoom1_EventScript_1A59DE:: @ 81A59DE
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A59F2
	msgbox LinkContestRoom1_Text_1A6D16, 4
	return

LinkContestRoom1_EventScript_1A59F2:: @ 81A59F2
	messageautoscroll LinkContestRoom1_Text_1A6D16
	waitmessage
	delay 30
	return

LinkContestRoom1_EventScript_1A59FC:: @ 81A59FC
	special sub_80C47C0
	switch VAR_SPECIAL_5
	case 0, LinkContestRoom1_EventScript_1A5A31
	case 1, LinkContestRoom1_EventScript_1A5A37
	case 2, LinkContestRoom1_EventScript_1A5A3D
	case 3, LinkContestRoom1_EventScript_1A5A43
	return

LinkContestRoom1_EventScript_1A5A31:: @ 81A5A31
	setvar VAR_TEMP_3, 3
	return

LinkContestRoom1_EventScript_1A5A37:: @ 81A5A37
	setvar VAR_TEMP_3, 4
	return

LinkContestRoom1_EventScript_1A5A3D:: @ 81A5A3D
	setvar VAR_TEMP_3, 5
	return

LinkContestRoom1_EventScript_1A5A43:: @ 81A5A43
	setvar VAR_TEMP_3, 14
	return

LinkContestRoom1_EventScript_1A5A49:: @ 81A5A49
	special sub_80C47F0
	special sub_80C4858
	addvar VAR_SPECIAL_5, 1
	buffernumberstring 1, VAR_SPECIAL_5
	addvar VAR_SPECIAL_5, -1
	call LinkContestRoom1_EventScript_1A5A75
	applymovement VAR_TEMP_3, LinkContestRoom1_Movement_1A5D99
	waitmovement 0
	playse SE_W227B
	setvar VAR_TEMP_1, 0
	return

LinkContestRoom1_EventScript_1A5A75:: @ 81A5A75
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A5A89
	msgbox LinkContestRoom1_Text_1A6D3C, 4
	return

LinkContestRoom1_EventScript_1A5A89:: @ 81A5A89
	messageautoscroll LinkContestRoom1_Text_1A6D3C
	waitmessage
	return

LinkContestRoom1_EventScript_1A5A90:: @ 81A5A90
	addvar VAR_TEMP_1, 1
	lockall
	compare VAR_CONTEST_LOCATION, 1
	call_if_gt LinkContestRoom1_EventScript_1A5AE4
	applymovement 9, LinkContestRoom1_Movement_1A5DB7
	applymovement 12, LinkContestRoom1_Movement_1A5DBB
	applymovement 7, LinkContestRoom1_Movement_1A5DB7
	delay 30
	applymovement 10, LinkContestRoom1_Movement_1A5DAF
	applymovement 11, LinkContestRoom1_Movement_1A5DBB
	applymovement 6, LinkContestRoom1_Movement_1A5DB3
	applymovement 8, LinkContestRoom1_Movement_1A5DAF
	compare VAR_TEMP_1, 4
	goto_if_ne LinkContestRoom1_EventScript_1A5A90
	delay 30
	return

LinkContestRoom1_EventScript_1A5AE4:: @ 81A5AE4
	turnvobject 0, 1
	turnvobject 2, 1
	turnvobject 4, 4
	turnvobject 6, 1
	turnvobject 8, 1
	turnvobject 10, 1
	turnvobject 12, 1
	turnvobject 14, 1
	turnvobject 16, 1
	turnvobject 18, 1
	turnvobject 20, 4
	turnvobject 22, 4
	turnvobject 25, 4
	turnvobject 27, 3
	turnvobject 28, 4
	delay 10
	turnvobject 0, 4
	turnvobject 2, 4
	turnvobject 4, 4
	turnvobject 6, 4
	turnvobject 8, 4
	turnvobject 10, 3
	turnvobject 12, 3
	turnvobject 14, 3
	turnvobject 16, 3
	turnvobject 18, 3
	turnvobject 20, 1
	turnvobject 22, 1
	turnvobject 25, 2
	turnvobject 27, 2
	turnvobject 28, 2
	delay 10
	turnvobject 1, 2
	turnvobject 3, 2
	turnvobject 5, 2
	turnvobject 7, 2
	turnvobject 9, 4
	turnvobject 11, 2
	turnvobject 15, 2
	turnvobject 13, 2
	turnvobject 17, 2
	turnvobject 19, 2
	turnvobject 21, 3
	turnvobject 23, 3
	turnvobject 24, 3
	turnvobject 26, 4
	turnvobject 29, 3
	turnvobject 30, 3
	delay 10
	turnvobject 1, 4
	turnvobject 3, 4
	turnvobject 5, 4
	turnvobject 7, 4
	turnvobject 9, 4
	turnvobject 11, 3
	turnvobject 15, 3
	turnvobject 13, 3
	turnvobject 17, 3
	turnvobject 19, 3
	turnvobject 21, 1
	turnvobject 23, 1
	turnvobject 24, 1
	turnvobject 26, 2
	turnvobject 29, 2
	turnvobject 30, 2
	delay 10
	return

LinkContestRoom1_EventScript_1A5BAB:: @ 81A5BAB
	compare VAR_CONTEST_LOCATION, 5
	goto_if_eq LinkContestRoom1_EventScript_1A5C4C
	call LinkContestRoom1_EventScript_1A5C12
	goto_if_set FLAG_TEMP_2, LinkContestRoom1_EventScript_1A5BF6
	msgbox LinkContestRoom1_Text_1A6DC5, 3
	waitmessage
	call LinkContestRoom1_EventScript_1A5C7F
	call LinkContestRoom1_EventScript_1A5CE5
	playse SE_W227B
	setvar VAR_TEMP_1, 0
	call LinkContestRoom1_EventScript_1A5A90
	delay 30
	special sub_80C4CF8
	compare VAR_SPECIAL_4, 1
	goto_if_eq LinkContestRoom1_EventScript_1A5C46
	return

LinkContestRoom1_EventScript_1A5BF6:: @ 81A5BF6
	incrementgamestat GAME_STAT_WON_CONTEST
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	delay 90
	special sub_80C4CF8
	compare VAR_SPECIAL_4, 1
	goto_if_eq LinkContestRoom1_EventScript_1A5C46
	return

LinkContestRoom1_EventScript_1A5C12:: @ 81A5C12
	specialvar RESULT, sub_80C4440
	compare RESULT, 1
	goto_if_eq LinkContestRoom1_EventScript_1A5C23
	return

LinkContestRoom1_EventScript_1A5C23:: @ 81A5C23
	special sub_80C47C0
	compare VAR_SPECIAL_5, 3
	goto_if_eq LinkContestRoom1_EventScript_1A5C32
	return

LinkContestRoom1_EventScript_1A5C32:: @ 81A5C32
	compare CONTEST_RANK, 3
	goto_if_eq LinkContestRoom1_EventScript_1A5C41
	setflag FLAG_TEMP_2
	return

LinkContestRoom1_EventScript_1A5C41:: @ 81A5C41
	return

LinkContestRoom1_EventScript_1A5C42:: @ 81A5C42
	setflag FLAG_CONTEST_SKETCH_CREATED
	return

LinkContestRoom1_EventScript_1A5C46:: @ 81A5C46
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 1
	return

LinkContestRoom1_EventScript_1A5C4C:: @ 81A5C4C
	delay 60
	call LinkContestRoom1_EventScript_1A5C6A
	special sub_80C4CF8
	compare VAR_SPECIAL_4, 1
	goto_if_eq LinkContestRoom1_EventScript_1A5C64
	closemessage
	return

LinkContestRoom1_EventScript_1A5C64:: @ 81A5C64
	setvar VAR_LILYCOVE_CONTEST_LOBBY_STATE, 2
	return

LinkContestRoom1_EventScript_1A5C6A:: @ 81A5C6A
	special sub_80C496C
	special sub_80C47C0
	compare VAR_SPECIAL_4, VAR_SPECIAL_5
	goto_if_eq LinkContestRoom1_EventScript_1A5C7C
	return

LinkContestRoom1_EventScript_1A5C7C:: @ 81A5C7C
	incrementgamestat GAME_STAT_WON_LINK_CONTEST
	return

LinkContestRoom1_EventScript_1A5C7F:: @ 81A5C7F
	switch VAR_SPECIAL_5
	case 0, LinkContestRoom1_EventScript_1A5CB1
	case 1, LinkContestRoom1_EventScript_1A5CBE
	case 2, LinkContestRoom1_EventScript_1A5CCB
	case 3, LinkContestRoom1_EventScript_1A5CD8
	return

LinkContestRoom1_EventScript_1A5CB1:: @ 81A5CB1
	lockall
	applymovement VAR_TEMP_3, LinkContestRoom1_Movement_1A5DF6
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CBE:: @ 81A5CBE
	lockall
	applymovement VAR_TEMP_3, LinkContestRoom1_Movement_1A5DFA
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CCB:: @ 81A5CCB
	lockall
	applymovement VAR_TEMP_3, LinkContestRoom1_Movement_1A5DA5
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CD8:: @ 81A5CD8
	lockall
	applymovement VAR_TEMP_3, LinkContestRoom1_Movement_1A5DA9
	waitmovement 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CE5:: @ 81A5CE5
	special sub_80C47C0
	compare VAR_SPECIAL_5, 3
	goto_if_eq LinkContestRoom1_EventScript_1A5CFC
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5CFC:: @ 81A5CFC
	compare VAR_CONTEST_LOCATION, 2
	call_if_eq LinkContestRoom1_EventScript_1A5C42
	incrementgamestat GAME_STAT_WON_CONTEST
	specialvar RESULT, sub_80C4440
	compare RESULT, 0
	goto_if_eq LinkContestRoom1_EventScript_1A5D5B
	compare CONTEST_RANK, 3
	goto_if_eq LinkContestRoom1_EventScript_1A5D3B
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5D2D:: @ 81A5D2D
	msgbox LinkContestRoom1_Text_1A6E1F, 3
	setvar VAR_CONTEST_PRIZE_PICKUP, 4
	return

LinkContestRoom1_EventScript_1A5D3B:: @ 81A5D3B
	giveitem_std ITEM_LUXURY_BALL
	compare RESULT, 0
	goto_if_eq LinkContestRoom1_EventScript_1A5D2D
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5D5B:: @ 81A5D5B
	special sub_80C44C0
	incrementgamestat GAME_STAT_RECEIVED_RIBBONS
	setflag FLAG_SYS_RIBBON_GET
	lockall
	msgbox LinkContestRoom1_Text_1A6D6A, 4
	playfanfare MUS_FANFA4
	msgbox LinkContestRoom1_Text_1A6D96, 4
	waitfanfare
	special sub_80C4858
	msgbox LinkContestRoom1_Text_1A6DAC, 4
	releaseall
	return

LinkContestRoom1_Movement_1A5D85:: @ 81A5D85
	walk_down
	end_movement

LinkContestRoom1_Movement_1A5D87:: @ 81A5D87
	lock_facing_direction
	walk_up
	unlock_facing_direction
	end_movement

LinkContestRoom1_Movement_1A5D8B:: @ 81A5D8B
	walk_in_place_fastest_right
	end_movement

LinkContestRoom1_Movement_1A5D8D:: @ 81A5D8D
	emote_heart
	end_movement

LinkContestRoom1_Movement_1A5D8F:: @ 81A5D8F
	walk_in_place_fastest_down
	end_movement

LinkContestRoom1_Movement_1A5D91:: @ 81A5D91
	walk_left
	walk_left
	walk_in_place_fastest_down
	end_movement

LinkContestRoom1_Movement_1A5D95:: @ 81A5D95
	walk_right
	walk_right
	walk_in_place_fastest_down
	end_movement

LinkContestRoom1_Movement_1A5D99:: @ 81A5D99
	walk_up
	walk_in_place_fastest_down
	end_movement

LinkContestRoom1_Movement_1A5D9C:: @ 81A5D9C
	delay_16
	delay_16
	end_movement

LinkContestRoom1_Movement_1A5D9F:: @ 81A5D9F
	walk_in_place_fastest_right
	end_movement

LinkContestRoom1_Movement_1A5DA1:: @ 81A5DA1
	walk_in_place_fastest_left
	end_movement

LinkContestRoom1_Movement_1A5DA3:: @ 81A5DA3
	walk_in_place_fastest_down
	end_movement

LinkContestRoom1_Movement_1A5DA5:: @ 81A5DA5
	walk_left
	walk_left
	walk_up
	end_movement

LinkContestRoom1_Movement_1A5DA9:: @ 81A5DA9
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	end_movement

LinkContestRoom1_Movement_1A5DAF:: @ 81A5DAF
	face_left
	delay_16
	face_original_direction
	end_movement

LinkContestRoom1_Movement_1A5DB3:: @ 81A5DB3
	face_up
	delay_16
	face_original_direction
	end_movement

LinkContestRoom1_Movement_1A5DB7:: @ 81A5DB7
	face_right
	delay_16
	face_original_direction
	end_movement

LinkContestRoom1_Movement_1A5DBB:: @ 81A5DBB
	face_down
	delay_16
	face_original_direction
	end_movement

LinkContestRoom1_Movement_1A5DBF:: @ 81A5DBF
	face_up
	end_movement

LinkContestRoom1_Movement_1A5DC1:: @ 81A5DC1
	face_up
	delay_16
	walk_in_place_fastest_right
	end_movement

LinkContestRoom1_Movement_1A5DC5:: @ 81A5DC5
	walk_in_place_fastest_left
	delay_16
	delay_16
	walk_in_place_fastest_down
	end_movement

LinkContestRoom1_Movement_1A5DCA:: @ 81A5DCA
	delay_16
	delay_16
	walk_in_place_fastest_down
	end_movement

LinkContestRoom1_Movement_1A5DCE:: @ 81A5DCE
	walk_up
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DD4:: @ 81A5DD4
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_down
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DDA:: @ 81A5DDA
	walk_up
	walk_right
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DDE:: @ 81A5DDE
	walk_fast_left
	walk_fast_down
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DE2:: @ 81A5DE2
	walk_up
	walk_left
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DE6:: @ 81A5DE6
	walk_fast_right
	walk_fast_down
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DEA:: @ 81A5DEA
	walk_up
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DF0:: @ 81A5DF0
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_in_place_fastest_up
	end_movement

LinkContestRoom1_Movement_1A5DF6:: @ 81A5DF6
	walk_right
	walk_right
	walk_up
	end_movement

LinkContestRoom1_Movement_1A5DFA:: @ 81A5DFA
	walk_up
	end_movement
