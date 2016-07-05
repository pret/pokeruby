LilycoveCity_DepartmentStoreRooftop_MapScripts:: @ 815A13F
	map_script 3, LilycoveCity_DepartmentStoreRooftop_MapScript1_15A145
	.byte 0

LilycoveCity_DepartmentStoreRooftop_MapScript1_15A145:: @ 815A145
	event_96 3
	compare RESULT, 1
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A15F
	compare RESULT, 0
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A163
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A15F:: @ 815A15F
	clearflag 962
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A163:: @ 815A163
	setflag 962
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A167:: @ 815A167
	lock
	faceplayer
	message LilycoveCity_DepartmentStoreRooftop_Text_1A0BE4
	waittext
	pokemartdecor LilycoveCity_DepartmentStoreRooftop_PokemartDecor_15A180
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C02, 4
	release
	end

	.align 2
LilycoveCity_DepartmentStoreRooftop_PokemartDecor_15A180:: @ 815A180
	.2byte 39
	.2byte 35
	.2byte 36
	.2byte 37
	.2byte 40
	.2byte 33
	.2byte 41
	.2byte 38
	.2byte 34
	.2byte 45
	.2byte 46
	.2byte 47
	.2byte 117
	.2byte 112
	.2byte 0
	release
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1A0:: @ 815A1A0
	lock
	faceplayer
	event_96 3
	compare RESULT, 1
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1BA
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C61F, 4
	release
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1BA:: @ 815A1BA
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C685, 4
	release
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1C4:: @ 815A1C4
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C70E, 2
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1CD:: @ 815A1CD
	lockall
	message LilycoveCity_DepartmentStoreRooftop_Text_18C72B
	waittext
	showmoney 0, 0
	snop
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A1DE
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1DE:: @ 815A1DE
	multichoice 16, 0, 42, 0
	copyvar 0x4001, RESULT
	switch 0x4001
	case 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A21C
	case 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A227
	case 2, LilycoveCity_DepartmentStoreRooftop_EventScript_15A232
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C7C3, 4
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A21C:: @ 815A21C
	setvar 0x4000, 26
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A267
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A227:: @ 815A227
	setvar 0x4000, 27
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A267
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A232:: @ 815A232
	setvar 0x4000, 28
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A267
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A23D:: @ 815A23D
	checkmoney 0xc8, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A244:: @ 815A244
	checkmoney 0x12c, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A24B:: @ 815A24B
	checkmoney 0x15e, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A252:: @ 815A252
	paymoney 0xc8, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A259:: @ 815A259
	paymoney 0x12c, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A260:: @ 815A260
	paymoney 0x15e, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A267:: @ 815A267
	compare 0x4001, 0
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A23D
	compare 0x4001, 1
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A244
	compare 0x4001, 2
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A24B
	compare RESULT, 0
	jumpeq LilycoveCity_DepartmentStoreRooftop_EventScript_15A37A
	checkitemspace 0x4000, 1
	compare RESULT, 0
	jumpeq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	compare 0x4001, 0
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A252
	compare 0x4001, 1
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A259
	compare 0x4001, 2
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A260
	updatemoney 0, 0
	snop
	bufferitem 0, 0x4000
	playsfx 106
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C75F, 4
	additem 0x4000, 1
	bufferitem 1, 0x4000
	bufferstd 2, 14
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C, 4
	random 64
	compare RESULT, 0
	jumpif 5, LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	checkitemspace 0x4000, 1
	compare RESULT, 0
	jumpeq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	playsfx 106
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C780, 4
	additem 0x4000, 1
	bufferitem 1, 0x4000
	bufferstd 2, 14
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C, 4
	random 64
	compare RESULT, 0
	jumpif 5, LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	checkitemspace 0x4000, 1
	compare RESULT, 0
	jumpeq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	playsfx 106
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C780, 4
	additem 0x4000, 1
	bufferitem 1, 0x4000
	bufferstd 2, 14
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C, 4
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E:: @ 815A36E
	message LilycoveCity_DepartmentStoreRooftop_Text_18C72B
	waittext
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A1DE
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A37A:: @ 815A37A
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C7AF, 4
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A388:: @ 815A388
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C79, 4
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A396:: @ 815A396
	hidemoney 0, 0
	releaseall
	end
