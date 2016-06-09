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
	pokemartdecor LilycoveCity_DepartmentStoreRooftop_Pokemart_15A180
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15a17e, 0x2

LilycoveCity_DepartmentStoreRooftop_Pokemart_15A180:: @ 815A180
	.2byte ITEM_BLUE_FLUTE
	.2byte ITEM_MAX_ETHER
	.2byte ITEM_ELIXIR
	.2byte ITEM_MAX_ELIXIR
	.2byte ITEM_YELLOW_FLUTE
	.2byte ITEM_REVIVAL_HERB
	.2byte ITEM_RED_FLUTE
	.2byte ITEM_LAVA_COOKIE
	.2byte ITEM_ETHER
	.2byte ITEM_SACRED_ASH
	.2byte ITEM_SHOAL_SALT
	.2byte ITEM_SHOAL_SHELL
	.2byte 117
	.2byte 112
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1A0:: @ 815A1A0
	lock
	faceplayer
	event_96 3
	compare RESULT, 1
	callif 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A1BA
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C61F
	callstd 4
	release
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1BA:: @ 815A1BA
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C685
	callstd 4
	release
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1C4:: @ 815A1C4
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C70E
	callstd 2
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
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C7C3
	callstd 4
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
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C75F
	callstd 4
	additem 0x4000, 1
	bufferitem 1, 0x4000
	bufferstd 2, 14
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C
	callstd 4
	random 64
	compare RESULT, 0
	jumpif 5, LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	checkitemspace 0x4000, 1
	compare RESULT, 0
	jumpeq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	playsfx 106
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C780
	callstd 4
	additem 0x4000, 1
	bufferitem 1, 0x4000
	bufferstd 2, 14
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C
	callstd 4
	random 64
	compare RESULT, 0
	jumpif 5, LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	checkitemspace 0x4000, 1
	compare RESULT, 0
	jumpeq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	playsfx 106
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C780
	callstd 4
	additem 0x4000, 1
	bufferitem 1, 0x4000
	bufferstd 2, 14
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C
	callstd 4
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E:: @ 815A36E
	message LilycoveCity_DepartmentStoreRooftop_Text_18C72B
	waittext
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A1DE
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A37A:: @ 815A37A
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_18C7AF
	callstd 4
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A388:: @ 815A388
	loadptr 0, LilycoveCity_DepartmentStoreRooftop_Text_1A0C79
	callstd 4
	jump LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A396:: @ 815A396
	hidemoney 0, 0
	releaseall
	end

