LilycoveCity_DepartmentStoreRooftop_MapScripts:: @ 815A13F
	map_script 3, LilycoveCity_DepartmentStoreRooftop_MapScript1_15A145
	.byte 0

LilycoveCity_DepartmentStoreRooftop_MapScript1_15A145:: @ 815A145
	getpricereduction 3
	compare RESULT, 1
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A15F
	compare RESULT, 0
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A163
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A15F:: @ 815A15F
	clearflag FLAG_HIDE_ROOFTOP_LADY_LILYCOVE_MART
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A163:: @ 815A163
	setflag FLAG_HIDE_ROOFTOP_LADY_LILYCOVE_MART
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A167:: @ 815A167
	lock
	faceplayer
	message LilycoveCity_DepartmentStoreRooftop_Text_1A0BE4
	waitmessage
	pokemartdecoration LilycoveCity_DepartmentStoreRooftop_Decorations
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C02, 4
	release
	end

	.align 2
LilycoveCity_DepartmentStoreRooftop_Decorations:: @ 815A180
	.2byte DECOR_MUD_BALL
	.2byte DECOR_FENCE_LENGTH
	.2byte DECOR_FENCE_WIDTH
	.2byte DECOR_TIRE
	.2byte DECOR_BREAKABLE_DOOR
	.2byte DECOR_SOLID_BOARD
	.2byte DECOR_SAND_ORNAMENT
	.2byte DECOR_STAND
	.2byte DECOR_SLIDE
	.2byte DECOR_TV
	.2byte DECOR_ROUND_TV
	.2byte DECOR_CUTE_TV
	.2byte DECOR_WAILMER_DOLL
	.2byte DECOR_RHYDON_DOLL
	.2byte DECOR_NONE
	release
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1A0:: @ 815A1A0
	lock
	faceplayer
	getpricereduction 3
	compare RESULT, 1
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A1BA
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
	waitmessage
	showmoneybox 0, 0
	nop
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A1DE
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A1DE:: @ 815A1DE
	multichoice 16, 0, 42, 0
	copyvar VAR_TEMP_1, RESULT
	switch VAR_TEMP_1
	case 0, LilycoveCity_DepartmentStoreRooftop_EventScript_15A21C
	case 1, LilycoveCity_DepartmentStoreRooftop_EventScript_15A227
	case 2, LilycoveCity_DepartmentStoreRooftop_EventScript_15A232
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C7C3, 4
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A21C:: @ 815A21C
	setvar VAR_TEMP_0, ITEM_FRESH_WATER
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A267
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A227:: @ 815A227
	setvar VAR_TEMP_0, ITEM_SODA_POP
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A267
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A232:: @ 815A232
	setvar VAR_TEMP_0, ITEM_LEMONADE
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A267
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
	takemoney 0xc8, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A259:: @ 815A259
	takemoney 0x12c, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A260:: @ 815A260
	takemoney 0x15e, 0
	return

LilycoveCity_DepartmentStoreRooftop_EventScript_15A267:: @ 815A267
	compare VAR_TEMP_1, 0
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A23D
	compare VAR_TEMP_1, 1
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A244
	compare VAR_TEMP_1, 2
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A24B
	compare RESULT, 0
	goto_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A37A
	checkitemspace VAR_TEMP_0, 1
	compare RESULT, 0
	goto_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	compare VAR_TEMP_1, 0
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A252
	compare VAR_TEMP_1, 1
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A259
	compare VAR_TEMP_1, 2
	call_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A260
	updatemoneybox 0, 0
	nop
	bufferitemname 0, VAR_TEMP_0
	playse SE_JIHANKI
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C75F, 4
	giveitem VAR_TEMP_0, 1
	bufferitemname 1, VAR_TEMP_0
	bufferstdstring 2, 14
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C, 4
	random 64
	compare RESULT, 0
	goto_if_ne LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	checkitemspace VAR_TEMP_0, 1
	compare RESULT, 0
	goto_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	playse SE_JIHANKI
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C780, 4
	giveitem VAR_TEMP_0, 1
	bufferitemname 1, VAR_TEMP_0
	bufferstdstring 2, 14
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C, 4
	random 64
	compare RESULT, 0
	goto_if_ne LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	checkitemspace VAR_TEMP_0, 1
	compare RESULT, 0
	goto_if_eq LilycoveCity_DepartmentStoreRooftop_EventScript_15A388
	playse SE_JIHANKI
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C780, 4
	giveitem VAR_TEMP_0, 1
	bufferitemname 1, VAR_TEMP_0
	bufferstdstring 2, 14
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C8C, 4
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A36E:: @ 815A36E
	message LilycoveCity_DepartmentStoreRooftop_Text_18C72B
	waitmessage
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A1DE
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A37A:: @ 815A37A
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_18C7AF, 4
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A388:: @ 815A388
	msgbox LilycoveCity_DepartmentStoreRooftop_Text_1A0C79, 4
	goto LilycoveCity_DepartmentStoreRooftop_EventScript_15A396
	end

LilycoveCity_DepartmentStoreRooftop_EventScript_15A396:: @ 815A396
	hidemoneybox 0, 0
	releaseall
	end
