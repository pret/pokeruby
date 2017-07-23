BerryTreeScript:: @ 81A14DD
	special FieldObjectInteractionGetBerryTreeData
	switch 0x8004
	case 255, Route102_EventScript_1A1533
	case 0, Route102_EventScript_1A153D
	case 1, Route102_EventScript_1A1595
	case 2, Route102_EventScript_1A15A2
	case 3, Route102_EventScript_1A15AF
	case 4, Route102_EventScript_1A15BC
	case 5, Route102_EventScript_1A15F9
	end

Route102_EventScript_1A1533:: @ 81A1533
	lockall
	message Route102_Text_1A1946
	waittext
	waitbutton
	releaseall
	end

Route102_EventScript_1A153D:: @ 81A153D
	lock
	faceplayer
	specialval RESULT, PlayerHasBerries
	compare RESULT, 1
	jumpeq Route102_EventScript_1A1558
	message Route102_Text_1A16B6
	waittext
	waitbutton
	release
	end

Route102_EventScript_1A1558:: @ 81A1558
	msgbox Route102_Text_1A16CD, 5
	compare RESULT, 1
	jumpeq Route102_EventScript_1A1577
	compare RESULT, 0
	jumpeq Route102_EventScript_1A1593
	end

Route102_EventScript_1A1577:: @ 81A1577
	fadescreen 1
	closebutton
	special sub_80B4EE4
	waitstate
	compare ITEM_ID, 0
	jumpeq Route102_EventScript_1A1593
	removeitem ITEM_ID, 1
	call Route102_EventScript_1A16A9

Route102_EventScript_1A1593:: @ 81A1593
	release
	end

Route102_EventScript_1A1595:: @ 81A1595
	lockall
	message Route102_Text_1A172C
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15A2:: @ 81A15A2
	lockall
	message Route102_Text_1A174B
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15AF:: @ 81A15AF
	lockall
	message Route102_Text_1A175C
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15BC:: @ 81A15BC
	call Route102_EventScript_1A15CE
	lockall
	message Route102_Text_1A177D
	waittext
	waitbutton
	jump Route102_EventScript_1A165F

Route102_EventScript_1A15CE:: @ 81A15CE
	compare 0x8005, 0
	jumpeq Route102_EventScript_1A15F2
	compare 0x8005, 4
	jumpeq Route102_EventScript_1A15EB
	buffertext 1, Route102_Text_1A17B7
	return

Route102_EventScript_1A15EB:: @ 81A15EB
	buffertext 1, Route102_Text_1A179F
	return

Route102_EventScript_1A15F2:: @ 81A15F2
	buffertext 1, Route102_Text_1A17B0
	return

Route102_EventScript_1A15F9:: @ 81A15F9
	buffernum 1, 0x8006
	lock
	faceplayer
	msgbox Route102_Text_1A17C0, 5
	compare RESULT, 1
	jumpeq Route102_EventScript_1A161D
	compare RESULT, 0
	jumpeq Route102_EventScript_1A164B

Route102_EventScript_1A161D:: @ 81A161D
	special FieldObjectInteractionPickBerryTree
	compare 0x8004, 0
	jumpeq Route102_EventScript_1A1642
	special FieldObjectInteractionRemoveBerryTree
	message Route102_Text_1A17FD
	fanfare 387
	waittext
	waitfanfare
	waitbutton
	message Route102_Text_1A181A
	waittext
	waitbutton
	release
	end

Route102_EventScript_1A1642:: @ 81A1642
	message Route102_Text_1A1881
	waittext
	waitbutton
	release
	end

Route102_EventScript_1A164B:: @ 81A164B
	message Route102_Text_1A18C5
	waittext
	waitbutton
	release
	end

gUnknown_081A1654:: @ 81A1654
	lockall
	special FieldObjectInteractionGetBerryTreeData
	call Route102_EventScript_1A16A9
	releaseall
	end

Route102_EventScript_1A165F:: @ 81A165F
	checkitem ITEM_WAILMER_PAIL, 1
	compare RESULT, 0
	jumpeq Route102_EventScript_1A168D
	msgbox Route102_Text_1A18E6, 5
	compare RESULT, 1
	jumpeq Route102_EventScript_1A1693
	compare RESULT, 0
	jumpeq Route102_EventScript_1A168D

Route102_EventScript_1A168D:: @ 81A168D
	releaseall
	end

gUnknown_081A168F:: @ 81A168F
	special FieldObjectInteractionGetBerryTreeData
	lockall

Route102_EventScript_1A1693:: @ 81A1693
	message Route102_Text_1A1912
	waittext
	special FieldObjectInteractionWaterBerryTree
	special DoWateringBerryTreeAnim
	waitstate
	message Route102_Text_1A1925
	waittext
	waitbutton
	releaseall
	end

Route102_EventScript_1A16A9:: @ 81A16A9
	special FieldObjectInteractionPlantBerryTree
	inccounter GAME_STAT_PLANTED_BERRIES
	message Route102_Text_1A16FB
	waittext
	waitbutton
	return
