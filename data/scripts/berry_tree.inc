S_BerryTree:: @ 81A14DD
	special EventObjectInteractionGetBerryTreeData
	switch VAR_SPECIAL_4
	case 255, BerryTree_EventScript_1A1533
	case 0, BerryTree_EventScript_1A153D
	case 1, BerryTree_EventScript_1A1595
	case 2, BerryTree_EventScript_1A15A2
	case 3, BerryTree_EventScript_1A15AF
	case 4, BerryTree_EventScript_1A15BC
	case 5, BerryTree_EventScript_1A15F9
	end

BerryTree_EventScript_1A1533:: @ 81A1533
	lockall
	message Route102_Text_1A1946
	waitmessage
	waitbuttonpress
	releaseall
	end

BerryTree_EventScript_1A153D:: @ 81A153D
	lock
	faceplayer
	specialvar RESULT, PlayerHasBerries
	compare RESULT, 1
	goto_if_eq BerryTree_EventScript_1A1558
	message Route102_Text_1A16B6
	waitmessage
	waitbuttonpress
	release
	end

BerryTree_EventScript_1A1558:: @ 81A1558
	msgbox Route102_Text_1A16CD, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq BerryTree_EventScript_1A1577
	compare RESULT, NO
	goto_if_eq BerryTree_EventScript_1A1593
	end

BerryTree_EventScript_1A1577:: @ 81A1577
	fadescreen 1
	closemessage
	special Berry_FadeAndGoToBerryBagMenu
	waitstate
	compare ITEM_ID, 0
	goto_if_eq BerryTree_EventScript_1A1593
	takeitem ITEM_ID, 1
	call S_PlantBerryTree
BerryTree_EventScript_1A1593:: @ 81A1593
	release
	end

BerryTree_EventScript_1A1595:: @ 81A1595
	lockall
	message Route102_Text_1A172C
	waitmessage
	waitbuttonpress
	goto BerryTree_EventScript_1A165F

BerryTree_EventScript_1A15A2:: @ 81A15A2
	lockall
	message Route102_Text_1A174B
	waitmessage
	waitbuttonpress
	goto BerryTree_EventScript_1A165F

BerryTree_EventScript_1A15AF:: @ 81A15AF
	lockall
	message Route102_Text_1A175C
	waitmessage
	waitbuttonpress
	goto BerryTree_EventScript_1A165F

BerryTree_EventScript_1A15BC:: @ 81A15BC
	call BerryTree_EventScript_1A15CE
	lockall
	message Route102_Text_1A177D
	waitmessage
	waitbuttonpress
	goto BerryTree_EventScript_1A165F

BerryTree_EventScript_1A15CE:: @ 81A15CE
	compare VAR_SPECIAL_5, 0
	goto_if_eq BerryTree_EventScript_1A15F2
	compare VAR_SPECIAL_5, 4
	goto_if_eq BerryTree_EventScript_1A15EB
	bufferstring 1, Route102_Text_1A17B7
	return

BerryTree_EventScript_1A15EB:: @ 81A15EB
	bufferstring 1, Route102_Text_1A179F
	return

BerryTree_EventScript_1A15F2:: @ 81A15F2
	bufferstring 1, Route102_Text_1A17B0
	return

BerryTree_EventScript_1A15F9:: @ 81A15F9
	buffernumberstring 1, VAR_SPECIAL_6
	lock
	faceplayer
	msgbox Route102_Text_1A17C0, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq BerryTree_EventScript_1A161D
	compare RESULT, NO
	goto_if_eq BerryTree_EventScript_1A164B

BerryTree_EventScript_1A161D:: @ 81A161D
	special EventObjectInteractionPickBerryTree
	compare VAR_SPECIAL_4, 0
	goto_if_eq BerryTree_EventScript_1A1642
	special EventObjectInteractionRemoveBerryTree
	message Route102_Text_1A17FD
	playfanfare MUS_ME_KINOMI
	waitmessage
	waitfanfare
	waitbuttonpress
	message Route102_Text_1A181A
	waitmessage
	waitbuttonpress
	release
	end

BerryTree_EventScript_1A1642:: @ 81A1642
	message Route102_Text_1A1881
	waitmessage
	waitbuttonpress
	release
	end

BerryTree_EventScript_1A164B:: @ 81A164B
	message Route102_Text_1A18C5
	waitmessage
	waitbuttonpress
	release
	end

S_PlantBerryTreeFromBag:: @ 81A1654
	lockall
	special EventObjectInteractionGetBerryTreeData
	call S_PlantBerryTree
	releaseall
	end

BerryTree_EventScript_1A165F:: @ 81A165F
	checkitem ITEM_WAILMER_PAIL, 1
	compare RESULT, 0
	goto_if_eq BerryTree_EventScript_1A168D
	msgbox Route102_Text_1A18E6, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq S_WaterBerryTree
	compare RESULT, NO
	goto_if_eq BerryTree_EventScript_1A168D
BerryTree_EventScript_1A168D:: @ 81A168D
	releaseall
	end

S_WaterBerryTreeFromBag:: @ 81A168F
	special EventObjectInteractionGetBerryTreeData
	lockall
S_WaterBerryTree:: @ 81A1693
	message Route102_Text_1A1912
	waitmessage
	special EventObjectInteractionWaterBerryTree
	special DoWateringBerryTreeAnim
	waitstate
	message Route102_Text_1A1925
	waitmessage
	waitbuttonpress
	releaseall
	end

S_PlantBerryTree:: @ 81A16A9
	special EventObjectInteractionPlantBerryTree
	incrementgamestat GAME_STAT_PLANTED_BERRIES
	message Route102_Text_1A16FB
	waitmessage
	waitbuttonpress
	return
