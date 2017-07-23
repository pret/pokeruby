FallarborTown_ContestLobby_EventScript_1A4E92:: @ 81A4E92
LilycoveCity_ContestLobby_EventScript_1A4E92:: @ 81A4E92
SlateportCity_ContestLobby_EventScript_1A4E92:: @ 81A4E92
VerdanturfTown_ContestLobby_EventScript_1A4E92:: @ 81A4E92
	lock
	faceplayer
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 0
	callif 1, FallarborTown_ContestLobby_EventScript_1A4EDD
	compare 0x408a, 0
	jumpif 5, FallarborTown_ContestLobby_EventScript_1A4F4E
	checkflag 1
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F8F
	bufferstd 0, 0x800b
	msgbox FallarborTown_ContestLobby_Text_1A5DFC, 4
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A4EE1
	setflag 1
	jump FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A4EDD:: @ 81A4EDD
	clearflag 1
	return

FallarborTown_ContestLobby_EventScript_1A4EE1:: @ 81A4EE1
	compare CONTEST_RANK, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A4EF6
	msgbox FallarborTown_ContestLobby_Text_1A6340, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4EF6:: @ 81A4EF6
	msgbox FallarborTown_ContestLobby_Text_1A64F4, 5
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F13
	msgbox FallarborTown_ContestLobby_Text_1A65EA, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4F13:: @ 81A4F13
	checkflag 150
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F44
	msgbox FallarborTown_ContestLobby_Text_1A6583, 4
	giveitem ITEM_CONTEST_PASS
	setflag 150
	setflag 1
	msgbox FallarborTown_ContestLobby_Text_1A5E98, 4
	jump FallarborTown_ContestLobby_EventScript_1A4F8F
	end

FallarborTown_ContestLobby_EventScript_1A4F44:: @ 81A4F44
	msgbox FallarborTown_ContestLobby_Text_1A6590, 4
	releaseall
	end

FallarborTown_ContestLobby_EventScript_1A4F4E:: @ 81A4F4E
	msgbox FallarborTown_ContestLobby_Text_1A685A, 4
	switch 0x408a
	case 4, FallarborTown_ContestLobby_EventScript_1A4F67
	end

FallarborTown_ContestLobby_EventScript_1A4F67:: @ 81A4F67
	giveitem ITEM_LUXURY_BALL
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A4F86
	setvar 0x408a, 0
	closebutton
	release
	end

FallarborTown_ContestLobby_EventScript_1A4F86:: @ 81A4F86
	msgbox FallarborTown_ContestLobby_Text_1A68C6, 2
	end

FallarborTown_ContestLobby_EventScript_1A4F8F:: @ 81A4F8F
	message FallarborTown_ContestLobby_Text_1A5E46
	waittext
	multichoice 0, 0, 2, 0
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5097
	case 1, FallarborTown_ContestLobby_EventScript_1A4FCC
	case 2, FallarborTown_ContestLobby_EventScript_1A503E
	case 127, FallarborTown_ContestLobby_EventScript_1A503E
	end

FallarborTown_ContestLobby_EventScript_1A4FCC:: @ 81A4FCC
	message FallarborTown_ContestLobby_Text_1A5E7C
	waittext
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
	jump FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A5022:: @ 81A5022
	msgbox FallarborTown_ContestLobby_Text_1A609B, 4
	jump FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A5030:: @ 81A5030
	msgbox FallarborTown_ContestLobby_Text_1A613F, 4
	jump FallarborTown_ContestLobby_EventScript_1A4FCC
	end

FallarborTown_ContestLobby_EventScript_1A503E:: @ 81A503E
	msgbox FallarborTown_ContestLobby_Text_188559, 4
	release
	end

FallarborTown_ContestLobby_EventScript_1A5048:: @ 81A5048
	msgbox FallarborTown_ContestLobby_Text_1A6319, 4
	choosecontestpkmn
	compare 0x8004, 255
	jumpeq FallarborTown_ContestLobby_EventScript_1A5097
	special sub_80C43F4
	compare RESULT, 0
	jumpeq FallarborTown_ContestLobby_EventScript_1A50C8
	compare RESULT, 1
	jumpeq FallarborTown_ContestLobby_EventScript_1A50D7
	compare RESULT, 2
	jumpeq FallarborTown_ContestLobby_EventScript_1A50FB
	compare RESULT, 3
	jumpeq FallarborTown_ContestLobby_EventScript_1A511F
	compare RESULT, 4
	jumpeq FallarborTown_ContestLobby_EventScript_1A512E
	end

FallarborTown_ContestLobby_EventScript_1A5097:: @ 81A5097
	message FallarborTown_ContestLobby_Text_1A6623
	waittext
	multichoice 0, 0, 4, 0
	switch RESULT
	case 5, FallarborTown_ContestLobby_EventScript_1A503E
	case 127, FallarborTown_ContestLobby_EventScript_1A503E
	copyvar CONTEST_CATEGORY, RESULT
	jump FallarborTown_ContestLobby_EventScript_1A5048
	end

FallarborTown_ContestLobby_EventScript_1A50C8:: @ 81A50C8
	msgbox FallarborTown_ContestLobby_Text_1A664A, 4
	jump FallarborTown_ContestLobby_EventScript_1A5048
	release
	end

FallarborTown_ContestLobby_EventScript_1A50D7:: @ 81A50D7
	msgbox FallarborTown_ContestLobby_Text_1A67A3, 5
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5048
	case 1, FallarborTown_ContestLobby_EventScript_1A513D
	end

FallarborTown_ContestLobby_EventScript_1A50FB:: @ 81A50FB
	msgbox FallarborTown_ContestLobby_Text_1A6724, 5
	switch RESULT
	case 0, FallarborTown_ContestLobby_EventScript_1A5048
	case 1, FallarborTown_ContestLobby_EventScript_1A513D
	end

FallarborTown_ContestLobby_EventScript_1A511F:: @ 81A511F
	msgbox FallarborTown_ContestLobby_Text_1A669F, 4
	jump FallarborTown_ContestLobby_EventScript_1A5048
	release
	end

FallarborTown_ContestLobby_EventScript_1A512E:: @ 81A512E
	msgbox FallarborTown_ContestLobby_Text_1A66DC, 4
	jump FallarborTown_ContestLobby_EventScript_1A5048
	release
	end

FallarborTown_ContestLobby_EventScript_1A513D:: @ 81A513D
	msgbox FallarborTown_ContestLobby_Text_1A67C1, 4
	closebutton
	releaseall
	setvar 0x4086, 1
	return

LinkContestRoom1_EventScript_1A514D:: @ 81A514D
	setvar 0x8006, 0
	lockall
	move 14, LinkContestRoom1_Movement_1A5DBF
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5D85
	waitmove 0
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
	setvar 0x4086, 2
	return

LinkContestRoom1_EventScript_1A51A0:: @ 81A51A0
	switch CONTEST_RANK
	case 0, LinkContestRoom1_EventScript_1A51D2
	case 1, LinkContestRoom1_EventScript_1A51D8
	case 2, LinkContestRoom1_EventScript_1A51DE
	case 3, LinkContestRoom1_EventScript_1A51E4
	return

LinkContestRoom1_EventScript_1A51D2:: @ 81A51D2
	setvar 0x8009, 5
	return

LinkContestRoom1_EventScript_1A51D8:: @ 81A51D8
	setvar 0x8009, 6
	return

LinkContestRoom1_EventScript_1A51DE:: @ 81A51DE
	setvar 0x8009, 7
	return

LinkContestRoom1_EventScript_1A51E4:: @ 81A51E4
	setvar 0x8009, 8
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
	setvar 0x8008, 0
	return

LinkContestRoom1_EventScript_1A522D:: @ 81A522D
	setvar 0x8008, 1
	return

LinkContestRoom1_EventScript_1A5233:: @ 81A5233
	setvar 0x8008, 2
	return

LinkContestRoom1_EventScript_1A5239:: @ 81A5239
	setvar 0x8008, 3
	return

LinkContestRoom1_EventScript_1A523F:: @ 81A523F
	setvar 0x8008, 4
	return

LinkContestRoom1_EventScript_1A5245:: @ 81A5245
	bufferstd 1, 0x8008
	bufferstd 2, 0x8009
	call LinkContestRoom1_EventScript_1A525F
	lockall
	move 1, LinkContestRoom1_Movement_1A5D87
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A525F:: @ 81A525F
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5273
	msgbox LinkContestRoom1_Text_1A68F0, 3
	return

LinkContestRoom1_EventScript_1A5273:: @ 81A5273
	message2 LinkContestRoom1_Text_1A6976
	waittext
	return

LinkContestRoom1_EventScript_1A527A:: @ 81A527A
	call LinkContestRoom1_EventScript_1A52AE
	call LinkContestRoom1_EventScript_1A5323
	call LinkContestRoom1_EventScript_1A5455
	call LinkContestRoom1_EventScript_1A53E5
	call LinkContestRoom1_EventScript_1A5880
	addvar 0x8006, 1
	compare 0x8006, 4
	jumpif 5, LinkContestRoom1_EventScript_1A527A
	call LinkContestRoom1_EventScript_1A5377
	setvar 0x4001, 6
	return

LinkContestRoom1_EventScript_1A52AE:: @ 81A52AE
	compare 0x8006, 0
	jumpeq LinkContestRoom1_EventScript_1A52DB
	compare 0x8006, 1
	jumpeq LinkContestRoom1_EventScript_1A52ED
	compare 0x8006, 2
	jumpeq LinkContestRoom1_EventScript_1A52FF
	compare 0x8006, 3
	jumpeq LinkContestRoom1_EventScript_1A5311
	return

LinkContestRoom1_EventScript_1A52DB:: @ 81A52DB
	lockall
	move 3, LinkContestRoom1_Movement_1A5DCE
	waitmove 0
	releaseall
	setvar 0x800b, 3
	return

LinkContestRoom1_EventScript_1A52ED:: @ 81A52ED
	lockall
	move 4, LinkContestRoom1_Movement_1A5DDA
	waitmove 0
	releaseall
	setvar 0x800b, 4
	return

LinkContestRoom1_EventScript_1A52FF:: @ 81A52FF
	lockall
	move 5, LinkContestRoom1_Movement_1A5DE2
	waitmove 0
	releaseall
	setvar 0x800b, 5
	return

LinkContestRoom1_EventScript_1A5311:: @ 81A5311
	lockall
	move 14, LinkContestRoom1_Movement_1A5DEA
	waitmove 0
	releaseall
	setvar 0x800b, 14
	return

LinkContestRoom1_EventScript_1A5323:: @ 81A5323
	special sub_80C4C64
	addvar 0x8006, 1
	buffernum 1, 0x8006
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5D9C
	waitmove 0
	releaseall
	reappear 13
	playsfx 10
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5D9C
	waitmove 0
	releaseall
	addvar 0x8006, -1
	playsfx 15
	special ShowContestEntryMonPic
	call LinkContestRoom1_EventScript_1A535E
	return

LinkContestRoom1_EventScript_1A535E:: @ 81A535E
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5370
	message LinkContestRoom1_Text_1A6A04
	waittext
	return

LinkContestRoom1_EventScript_1A5370:: @ 81A5370
	message2 LinkContestRoom1_Text_1A6A04
	waittext
	return

LinkContestRoom1_EventScript_1A5377:: @ 81A5377
	call LinkContestRoom1_EventScript_1A53B3
	call LinkContestRoom1_EventScript_1A53CE
	playsfx 223
	waittext
	call LinkContestRoom1_EventScript_1A5A90
	move 1, LinkContestRoom1_Movement_1A5D9F
	waitmove 0
	move 2, LinkContestRoom1_Movement_1A5DA1
	waitmove 0
	pause 20
	move 1, LinkContestRoom1_Movement_1A5D8F
	move 2, LinkContestRoom1_Movement_1A5D8F
	waitmove 0
	return

LinkContestRoom1_EventScript_1A53B3:: @ 81A53B3
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A53C7
	msgbox LinkContestRoom1_Text_1A6A1F, 4
	return

LinkContestRoom1_EventScript_1A53C7:: @ 81A53C7
	message2 LinkContestRoom1_Text_1A6A1F
	waittext
	return

LinkContestRoom1_EventScript_1A53CE:: @ 81A53CE
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A53DF
	message LinkContestRoom1_Text_1A6AE1
	return

LinkContestRoom1_EventScript_1A53DF:: @ 81A53DF
	message2 LinkContestRoom1_Text_1A6AE1
	return

LinkContestRoom1_EventScript_1A53E5:: @ 81A53E5
	move 1, LinkContestRoom1_Movement_1A5DAF
	waitmove 0
	playsfx 223
	call LinkContestRoom1_EventScript_1A5AE4
	move 9, LinkContestRoom1_Movement_1A5DB7
	move 12, LinkContestRoom1_Movement_1A5DBB
	move 7, LinkContestRoom1_Movement_1A5DB7
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5DB7
	waitmove 0
	move 10, LinkContestRoom1_Movement_1A5DAF
	move 11, LinkContestRoom1_Movement_1A5DBB
	move 6, LinkContestRoom1_Movement_1A5DB3
	move 8, LinkContestRoom1_Movement_1A5DAF
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5DC1
	waitmove 0
	move 1, LinkContestRoom1_Movement_1A5DCA
	move 2, LinkContestRoom1_Movement_1A5DC5
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5455:: @ 81A5455
	special sub_80C47A0
	compare 0x4088, 1
	callif 1, LinkContestRoom1_EventScript_1A555A
	compare 0x4088, 2
	callif 1, LinkContestRoom1_EventScript_1A55B8
	compare 0x4088, 3
	callif 1, LinkContestRoom1_EventScript_1A5616
	compare 0x4088, 4
	callif 1, LinkContestRoom1_EventScript_1A5674
	compare 0x4088, 5
	callif 1, LinkContestRoom1_EventScript_1A56D2
	setvar 0x4001, 9
	setvar 0x4002, 9
	setvar 0x4003, 9
	setvar 0x4004, 9
	setvar 0x4005, 9
	setvar 0x4006, 9
	setvar 0x4007, 9
	setvar 0x4008, 9
	compare 0x4000, 0
	callif 2, LinkContestRoom1_EventScript_1A54EB
	setvar 0x4001, 0
	setvar 0x4002, 0
	setvar 0x4003, 0
	setvar 0x4004, 0
	setvar 0x4005, 0
	setvar 0x4006, 0
	setvar 0x4007, 0
	setvar 0x4008, 0
	return

LinkContestRoom1_EventScript_1A54EB:: @ 81A54EB
	setvar RESULT, 8
	special ScriptRandom
	compare RESULT, 0
	callif 1, LinkContestRoom1_EventScript_1A5760
	compare RESULT, 1
	callif 1, LinkContestRoom1_EventScript_1A5784
	compare RESULT, 2
	callif 1, LinkContestRoom1_EventScript_1A57A8
	compare RESULT, 3
	callif 1, LinkContestRoom1_EventScript_1A57CC
	compare RESULT, 4
	callif 1, LinkContestRoom1_EventScript_1A57F0
	compare RESULT, 5
	callif 1, LinkContestRoom1_EventScript_1A5814
	compare RESULT, 6
	callif 1, LinkContestRoom1_EventScript_1A5838
	compare RESULT, 7
	callif 1, LinkContestRoom1_EventScript_1A585C
	compare 0x4000, 0
	jumpif 2, LinkContestRoom1_EventScript_1A54EB
	waitmove 0
	return

LinkContestRoom1_EventScript_1A555A:: @ 81A555A
	compare 0x8004, 80
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 70
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 60
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 50
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 40
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 30
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 20
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 10
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A55B8:: @ 81A55B8
	compare 0x8004, 230
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 210
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 190
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 170
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 150
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 130
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 110
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 90
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A5616:: @ 81A5616
	compare 0x8004, 380
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 350
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 320
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 290
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 260
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 230
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 200
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 170
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A5674:: @ 81A5674
	compare 0x8004, 600
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 560
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 520
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 480
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 440
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 400
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 360
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 320
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A56D2:: @ 81A56D2
	compare 0x8004, 600
	jumpif 2, LinkContestRoom1_EventScript_1A575A
	compare 0x8004, 550
	jumpif 2, LinkContestRoom1_EventScript_1A5754
	compare 0x8004, 500
	jumpif 2, LinkContestRoom1_EventScript_1A574E
	compare 0x8004, 450
	jumpif 2, LinkContestRoom1_EventScript_1A5748
	compare 0x8004, 400
	jumpif 2, LinkContestRoom1_EventScript_1A5742
	compare 0x8004, 300
	jumpif 2, LinkContestRoom1_EventScript_1A573C
	compare 0x8004, 200
	jumpif 2, LinkContestRoom1_EventScript_1A5736
	compare 0x8004, 100
	jumpif 2, LinkContestRoom1_EventScript_1A5730
	setvar 0x4000, 0
	return

LinkContestRoom1_EventScript_1A5730:: @ 81A5730
	setvar 0x4000, 1
	return

LinkContestRoom1_EventScript_1A5736:: @ 81A5736
	setvar 0x4000, 2
	return

LinkContestRoom1_EventScript_1A573C:: @ 81A573C
	setvar 0x4000, 3
	return

LinkContestRoom1_EventScript_1A5742:: @ 81A5742
	setvar 0x4000, 4
	return

LinkContestRoom1_EventScript_1A5748:: @ 81A5748
	setvar 0x4000, 5
	return

LinkContestRoom1_EventScript_1A574E:: @ 81A574E
	setvar 0x4000, 6
	return

LinkContestRoom1_EventScript_1A5754:: @ 81A5754
	setvar 0x4000, 7
	return

LinkContestRoom1_EventScript_1A575A:: @ 81A575A
	setvar 0x4000, 8
	return

LinkContestRoom1_EventScript_1A5760:: @ 81A5760
	compare 0x4001, 1
	jumpeq LinkContestRoom1_EventScript_1A5783
	move 6, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4001, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A5783:: @ 81A5783
	return

LinkContestRoom1_EventScript_1A5784:: @ 81A5784
	compare 0x4002, 1
	jumpeq LinkContestRoom1_EventScript_1A57A7
	move 12, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4002, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A57A7:: @ 81A57A7
	return

LinkContestRoom1_EventScript_1A57A8:: @ 81A57A8
	compare 0x4003, 1
	jumpeq LinkContestRoom1_EventScript_1A57CB
	move 7, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4003, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A57CB:: @ 81A57CB
	return

LinkContestRoom1_EventScript_1A57CC:: @ 81A57CC
	compare 0x4004, 1
	jumpeq LinkContestRoom1_EventScript_1A57EF
	move 8, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4004, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A57EF:: @ 81A57EF
	return

LinkContestRoom1_EventScript_1A57F0:: @ 81A57F0
	compare 0x4005, 1
	jumpeq LinkContestRoom1_EventScript_1A5813
	move 9, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4005, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A5813:: @ 81A5813
	return

LinkContestRoom1_EventScript_1A5814:: @ 81A5814
	compare 0x4006, 1
	jumpeq LinkContestRoom1_EventScript_1A5837
	move 10, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4006, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A5837:: @ 81A5837
	return

LinkContestRoom1_EventScript_1A5838:: @ 81A5838
	compare 0x4007, 1
	jumpeq LinkContestRoom1_EventScript_1A585B
	move 11, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4007, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A585B:: @ 81A585B
	return

LinkContestRoom1_EventScript_1A585C:: @ 81A585C
	compare 0x4008, 1
	jumpeq LinkContestRoom1_EventScript_1A587F
	move 15, LinkContestRoom1_Movement_1A5D8D
	playsfx 21
	pause 14
	setvar 0x4008, 1
	addvar 0x4000, 65535
	return

LinkContestRoom1_EventScript_1A587F:: @ 81A587F
	return

LinkContestRoom1_EventScript_1A5880:: @ 81A5880
	closebutton
	release
	disappear 13
	special sub_80C5164
	switch 0x8006
	case 0, LinkContestRoom1_EventScript_1A58BA
	case 1, LinkContestRoom1_EventScript_1A58C7
	case 2, LinkContestRoom1_EventScript_1A58D4
	case 3, LinkContestRoom1_EventScript_1A58E1
	return

LinkContestRoom1_EventScript_1A58BA:: @ 81A58BA
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DD4
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58C7:: @ 81A58C7
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DDE
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58D4:: @ 81A58D4
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DE6
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58E1:: @ 81A58E1
	lockall
	move 0x800b, LinkContestRoom1_Movement_1A5DF0
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A58EE:: @ 81A58EE
	lockall
	move 1, LinkContestRoom1_Movement_1A5DA3
	waitmove 0
	call LinkContestRoom1_EventScript_1A5930
	waittext
	move 1, LinkContestRoom1_Movement_1A5D91
	move 2, LinkContestRoom1_Movement_1A5D95
	waitmove 0
	releaseall
	setvar 0x4009, 1
	startcontest
	setvar 0x4009, 0
	lockall
	move 1, LinkContestRoom1_Movement_1A5D95
	move 2, LinkContestRoom1_Movement_1A5D91
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5930:: @ 81A5930
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5944
	msgbox LinkContestRoom1_Text_1A6AF5, 3
	return

LinkContestRoom1_EventScript_1A5944:: @ 81A5944
	message2 LinkContestRoom1_Text_1A6AF5
	return

LinkContestRoom1_EventScript_1A594A:: @ 81A594A
	call LinkContestRoom1_EventScript_1A5984
	call LinkContestRoom1_EventScript_1A59A2
	move 1, LinkContestRoom1_Movement_1A5D8B
	waitmove 0
	call LinkContestRoom1_EventScript_1A59C0
	call LinkContestRoom1_EventScript_1A59DE
	move 1, LinkContestRoom1_Movement_1A5D8F
	waitmove 0
	closebutton
	releaseall
	setvar 0x4009, 1
	showcontestresults
	setvar 0x4009, 0
	playmusic 439, 0
	return

LinkContestRoom1_EventScript_1A5984:: @ 81A5984
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5998
	msgbox LinkContestRoom1_Text_1A6C06, 4
	return

LinkContestRoom1_EventScript_1A5998:: @ 81A5998
	message2 LinkContestRoom1_Text_1A6C06
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59A2:: @ 81A59A2
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A59B6
	msgbox LinkContestRoom1_Text_1A6C21, 4
	return

LinkContestRoom1_EventScript_1A59B6:: @ 81A59B6
	message2 LinkContestRoom1_Text_1A6C21
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59C0:: @ 81A59C0
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A59D4
	msgbox LinkContestRoom1_Text_1A6C9D, 4
	return

LinkContestRoom1_EventScript_1A59D4:: @ 81A59D4
	message2 LinkContestRoom1_Text_1A6C9D
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59DE:: @ 81A59DE
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A59F2
	msgbox LinkContestRoom1_Text_1A6D16, 4
	return

LinkContestRoom1_EventScript_1A59F2:: @ 81A59F2
	message2 LinkContestRoom1_Text_1A6D16
	waittext
	pause 30
	return

LinkContestRoom1_EventScript_1A59FC:: @ 81A59FC
	special sub_80C47C0
	switch 0x8005
	case 0, LinkContestRoom1_EventScript_1A5A31
	case 1, LinkContestRoom1_EventScript_1A5A37
	case 2, LinkContestRoom1_EventScript_1A5A3D
	case 3, LinkContestRoom1_EventScript_1A5A43
	return

LinkContestRoom1_EventScript_1A5A31:: @ 81A5A31
	setvar 0x4003, 3
	return

LinkContestRoom1_EventScript_1A5A37:: @ 81A5A37
	setvar 0x4003, 4
	return

LinkContestRoom1_EventScript_1A5A3D:: @ 81A5A3D
	setvar 0x4003, 5
	return

LinkContestRoom1_EventScript_1A5A43:: @ 81A5A43
	setvar 0x4003, 14
	return

LinkContestRoom1_EventScript_1A5A49:: @ 81A5A49
	special sub_80C47F0
	special sub_80C4858
	addvar 0x8005, 1
	buffernum 1, 0x8005
	addvar 0x8005, -1
	call LinkContestRoom1_EventScript_1A5A75
	move 0x4003, LinkContestRoom1_Movement_1A5D99
	waitmove 0
	playsfx 223
	setvar 0x4001, 0
	return

LinkContestRoom1_EventScript_1A5A75:: @ 81A5A75
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5A89
	msgbox LinkContestRoom1_Text_1A6D3C, 4
	return

LinkContestRoom1_EventScript_1A5A89:: @ 81A5A89
	message2 LinkContestRoom1_Text_1A6D3C
	waittext
	return

LinkContestRoom1_EventScript_1A5A90:: @ 81A5A90
	addvar 0x4001, 1
	lockall
	compare 0x4088, 1
	callif 2, LinkContestRoom1_EventScript_1A5AE4
	move 9, LinkContestRoom1_Movement_1A5DB7
	move 12, LinkContestRoom1_Movement_1A5DBB
	move 7, LinkContestRoom1_Movement_1A5DB7
	pause 30
	move 10, LinkContestRoom1_Movement_1A5DAF
	move 11, LinkContestRoom1_Movement_1A5DBB
	move 6, LinkContestRoom1_Movement_1A5DB3
	move 8, LinkContestRoom1_Movement_1A5DAF
	compare 0x4001, 4
	jumpif 5, LinkContestRoom1_EventScript_1A5A90
	pause 30
	return

LinkContestRoom1_EventScript_1A5AE4:: @ 81A5AE4
	vspriteface 0, 1
	vspriteface 2, 1
	vspriteface 4, 4
	vspriteface 6, 1
	vspriteface 8, 1
	vspriteface 10, 1
	vspriteface 12, 1
	vspriteface 14, 1
	vspriteface 16, 1
	vspriteface 18, 1
	vspriteface 20, 4
	vspriteface 22, 4
	vspriteface 25, 4
	vspriteface 27, 3
	vspriteface 28, 4
	pause 10
	vspriteface 0, 4
	vspriteface 2, 4
	vspriteface 4, 4
	vspriteface 6, 4
	vspriteface 8, 4
	vspriteface 10, 3
	vspriteface 12, 3
	vspriteface 14, 3
	vspriteface 16, 3
	vspriteface 18, 3
	vspriteface 20, 1
	vspriteface 22, 1
	vspriteface 25, 2
	vspriteface 27, 2
	vspriteface 28, 2
	pause 10
	vspriteface 1, 2
	vspriteface 3, 2
	vspriteface 5, 2
	vspriteface 7, 2
	vspriteface 9, 4
	vspriteface 11, 2
	vspriteface 15, 2
	vspriteface 13, 2
	vspriteface 17, 2
	vspriteface 19, 2
	vspriteface 21, 3
	vspriteface 23, 3
	vspriteface 24, 3
	vspriteface 26, 4
	vspriteface 29, 3
	vspriteface 30, 3
	pause 10
	vspriteface 1, 4
	vspriteface 3, 4
	vspriteface 5, 4
	vspriteface 7, 4
	vspriteface 9, 4
	vspriteface 11, 3
	vspriteface 15, 3
	vspriteface 13, 3
	vspriteface 17, 3
	vspriteface 19, 3
	vspriteface 21, 1
	vspriteface 23, 1
	vspriteface 24, 1
	vspriteface 26, 2
	vspriteface 29, 2
	vspriteface 30, 2
	pause 10
	return

LinkContestRoom1_EventScript_1A5BAB:: @ 81A5BAB
	compare 0x4088, 5
	jumpeq LinkContestRoom1_EventScript_1A5C4C
	call LinkContestRoom1_EventScript_1A5C12
	checkflag 2
	jumpeq LinkContestRoom1_EventScript_1A5BF6
	msgbox LinkContestRoom1_Text_1A6DC5, 3
	waittext
	call LinkContestRoom1_EventScript_1A5C7F
	call LinkContestRoom1_EventScript_1A5CE5
	playsfx 223
	setvar 0x4001, 0
	call LinkContestRoom1_EventScript_1A5A90
	pause 30
	special sub_80C4CF8
	compare 0x8004, 1
	jumpeq LinkContestRoom1_EventScript_1A5C46
	return

LinkContestRoom1_EventScript_1A5BF6:: @ 81A5BF6
	inccounter GAME_STAT_WON_CONTEST
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	pause 90
	special sub_80C4CF8
	compare 0x8004, 1
	jumpeq LinkContestRoom1_EventScript_1A5C46
	return

LinkContestRoom1_EventScript_1A5C12:: @ 81A5C12
	specialval RESULT, sub_80C4440
	compare RESULT, 1
	jumpeq LinkContestRoom1_EventScript_1A5C23
	return

LinkContestRoom1_EventScript_1A5C23:: @ 81A5C23
	special sub_80C47C0
	compare 0x8005, 3
	jumpeq LinkContestRoom1_EventScript_1A5C32
	return

LinkContestRoom1_EventScript_1A5C32:: @ 81A5C32
	compare CONTEST_RANK, 3
	jumpeq LinkContestRoom1_EventScript_1A5C41
	setflag 2
	return

LinkContestRoom1_EventScript_1A5C41:: @ 81A5C41
	return

LinkContestRoom1_EventScript_1A5C42:: @ 81A5C42
	setflag 270
	return

LinkContestRoom1_EventScript_1A5C46:: @ 81A5C46
	setvar 0x4099, 1
	return

LinkContestRoom1_EventScript_1A5C4C:: @ 81A5C4C
	pause 60
	call LinkContestRoom1_EventScript_1A5C6A
	special sub_80C4CF8
	compare 0x8004, 1
	jumpeq LinkContestRoom1_EventScript_1A5C64
	closebutton
	return

LinkContestRoom1_EventScript_1A5C64:: @ 81A5C64
	setvar 0x4099, 2
	return

LinkContestRoom1_EventScript_1A5C6A:: @ 81A5C6A
	special sub_80C496C
	special sub_80C47C0
	comparevars 0x8004, 0x8005
	jumpeq LinkContestRoom1_EventScript_1A5C7C
	return

LinkContestRoom1_EventScript_1A5C7C:: @ 81A5C7C
	inccounter GAME_STAT_WON_LINK_CONTEST
	return

LinkContestRoom1_EventScript_1A5C7F:: @ 81A5C7F
	switch 0x8005
	case 0, LinkContestRoom1_EventScript_1A5CB1
	case 1, LinkContestRoom1_EventScript_1A5CBE
	case 2, LinkContestRoom1_EventScript_1A5CCB
	case 3, LinkContestRoom1_EventScript_1A5CD8
	return

LinkContestRoom1_EventScript_1A5CB1:: @ 81A5CB1
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DF6
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CBE:: @ 81A5CBE
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DFA
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CCB:: @ 81A5CCB
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DA5
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CD8:: @ 81A5CD8
	lockall
	move 0x4003, LinkContestRoom1_Movement_1A5DA9
	waitmove 0
	releaseall
	return

LinkContestRoom1_EventScript_1A5CE5:: @ 81A5CE5
	special sub_80C47C0
	compare 0x8005, 3
	jumpeq LinkContestRoom1_EventScript_1A5CFC
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5CFC:: @ 81A5CFC
	compare 0x4088, 2
	callif 1, LinkContestRoom1_EventScript_1A5C42
	inccounter GAME_STAT_WON_CONTEST
	specialval RESULT, sub_80C4440
	compare RESULT, 0
	jumpeq LinkContestRoom1_EventScript_1A5D5B
	compare CONTEST_RANK, 3
	jumpeq LinkContestRoom1_EventScript_1A5D3B
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5D2D:: @ 81A5D2D
	msgbox LinkContestRoom1_Text_1A6E1F, 3
	setvar 0x408a, 4
	return

LinkContestRoom1_EventScript_1A5D3B:: @ 81A5D3B
	giveitem ITEM_LUXURY_BALL
	compare RESULT, 0
	jumpeq LinkContestRoom1_EventScript_1A5D2D
	msgbox LinkContestRoom1_Text_1A6DF1, 3
	return

LinkContestRoom1_EventScript_1A5D5B:: @ 81A5D5B
	special sub_80C44C0
	inccounter GAME_STAT_RECEIVED_RIBBONS
	setflag 2107
	lockall
	msgbox LinkContestRoom1_Text_1A6D6A, 4
	fanfare 370
	msgbox LinkContestRoom1_Text_1A6D96, 4
	waitfanfare
	special sub_80C4858
	msgbox LinkContestRoom1_Text_1A6DAC, 4
	releaseall
	return

LinkContestRoom1_Movement_1A5D85:: @ 81A5D85
	step_down
	step_end

LinkContestRoom1_Movement_1A5D87:: @ 81A5D87
	step_40
	step_up
	step_41
	step_end

LinkContestRoom1_Movement_1A5D8B:: @ 81A5D8B
	step_28
	step_end

LinkContestRoom1_Movement_1A5D8D:: @ 81A5D8D
	step_58
	step_end

LinkContestRoom1_Movement_1A5D8F:: @ 81A5D8F
	step_25
	step_end

LinkContestRoom1_Movement_1A5D91:: @ 81A5D91
	step_left
	step_left
	step_25
	step_end

LinkContestRoom1_Movement_1A5D95:: @ 81A5D95
	step_right
	step_right
	step_25
	step_end

LinkContestRoom1_Movement_1A5D99:: @ 81A5D99
	step_up
	step_25
	step_end

LinkContestRoom1_Movement_1A5D9C:: @ 81A5D9C
	step_14
	step_14
	step_end

LinkContestRoom1_Movement_1A5D9F:: @ 81A5D9F
	step_28
	step_end

LinkContestRoom1_Movement_1A5DA1:: @ 81A5DA1
	step_27
	step_end

LinkContestRoom1_Movement_1A5DA3:: @ 81A5DA3
	step_25
	step_end

LinkContestRoom1_Movement_1A5DA5:: @ 81A5DA5
	step_left
	step_left
	step_up
	step_end

LinkContestRoom1_Movement_1A5DA9:: @ 81A5DA9
	step_left
	step_left
	step_left
	step_left
	step_up
	step_end

LinkContestRoom1_Movement_1A5DAF:: @ 81A5DAF
	step_02
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DB3:: @ 81A5DB3
	step_01
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DB7:: @ 81A5DB7
	step_03
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DBB:: @ 81A5DBB
	step_00
	step_14
	step_4e
	step_end

LinkContestRoom1_Movement_1A5DBF:: @ 81A5DBF
	step_01
	step_end

LinkContestRoom1_Movement_1A5DC1:: @ 81A5DC1
	step_01
	step_14
	step_28
	step_end

LinkContestRoom1_Movement_1A5DC5:: @ 81A5DC5
	step_27
	step_14
	step_14
	step_25
	step_end

LinkContestRoom1_Movement_1A5DCA:: @ 81A5DCA
	step_14
	step_14
	step_25
	step_end

LinkContestRoom1_Movement_1A5DCE:: @ 81A5DCE
	step_up
	step_right
	step_right
	step_right
	step_26
	step_end

LinkContestRoom1_Movement_1A5DD4:: @ 81A5DD4
	step_17
	step_17
	step_17
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DDA:: @ 81A5DDA
	step_up
	step_right
	step_26
	step_end

LinkContestRoom1_Movement_1A5DDE:: @ 81A5DDE
	step_17
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DE2:: @ 81A5DE2
	step_up
	step_left
	step_26
	step_end

LinkContestRoom1_Movement_1A5DE6:: @ 81A5DE6
	step_18
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DEA:: @ 81A5DEA
	step_up
	step_left
	step_left
	step_left
	step_26
	step_end

LinkContestRoom1_Movement_1A5DF0:: @ 81A5DF0
	step_18
	step_18
	step_18
	step_15
	step_26
	step_end

LinkContestRoom1_Movement_1A5DF6:: @ 81A5DF6
	step_right
	step_right
	step_up
	step_end

LinkContestRoom1_Movement_1A5DFA:: @ 81A5DFA
	step_up
	step_end
