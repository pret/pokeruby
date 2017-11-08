Route124_DivingTreasureHuntersHouse_MapScripts:: @ 8163DFA
	map_script 3, Route124_DivingTreasureHuntersHouse_MapScript1_163E00
	.byte 0

Route124_DivingTreasureHuntersHouse_MapScript1_163E00:: @ 8163E00
	setflag 2139
	end

Route124_DivingTreasureHuntersHouse_EventScript_163E04:: @ 8163E04
	lock
	faceplayer
	checkflag 217
	goto_if_eq Route124_DivingTreasureHuntersHouse_EventScript_163E20
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F416, 4
	setflag 217
	goto Route124_DivingTreasureHuntersHouse_EventScript_163E2E
	end

Route124_DivingTreasureHuntersHouse_EventScript_163E20:: @ 8163E20
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F48F, 4
	goto Route124_DivingTreasureHuntersHouse_EventScript_163E2E
	end

Route124_DivingTreasureHuntersHouse_EventScript_163E2E:: @ 8163E2E
	call Route124_DivingTreasureHuntersHouse_EventScript_163E44
	compare 0x4001, 0
	goto_if_eq Route124_DivingTreasureHuntersHouse_EventScript_164329
	goto Route124_DivingTreasureHuntersHouse_EventScript_163EA2
	end

Route124_DivingTreasureHuntersHouse_EventScript_163E44:: @ 8163E44
	setvar 0x4001, 0
	checkitem ITEM_RED_SHARD, 1
	compare RESULT, 1
	call_if 1, Route124_DivingTreasureHuntersHouse_EventScript_163E8A
	checkitem ITEM_YELLOW_SHARD, 1
	compare RESULT, 1
	call_if 1, Route124_DivingTreasureHuntersHouse_EventScript_163E90
	checkitem ITEM_BLUE_SHARD, 1
	compare RESULT, 1
	call_if 1, Route124_DivingTreasureHuntersHouse_EventScript_163E96
	checkitem ITEM_GREEN_SHARD, 1
	compare RESULT, 1
	call_if 1, Route124_DivingTreasureHuntersHouse_EventScript_163E9C
	return

Route124_DivingTreasureHuntersHouse_EventScript_163E8A:: @ 8163E8A
	addvar 0x4001, 1
	return

Route124_DivingTreasureHuntersHouse_EventScript_163E90:: @ 8163E90
	addvar 0x4001, 2
	return

Route124_DivingTreasureHuntersHouse_EventScript_163E96:: @ 8163E96
	addvar 0x4001, 4
	return

Route124_DivingTreasureHuntersHouse_EventScript_163E9C:: @ 8163E9C
	addvar 0x4001, 8
	return

Route124_DivingTreasureHuntersHouse_EventScript_163EA2:: @ 8163EA2
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F544, 4
	goto Route124_DivingTreasureHuntersHouse_EventScript_163EB0
	end

Route124_DivingTreasureHuntersHouse_EventScript_163EB0:: @ 8163EB0
	message Route124_DivingTreasureHuntersHouse_Text_19F5C5
	waitmessage
	switch 0x4001
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_163F61
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_163F87
	case 3, Route124_DivingTreasureHuntersHouse_EventScript_163FAD
	case 4, Route124_DivingTreasureHuntersHouse_EventScript_163FDE
	case 5, Route124_DivingTreasureHuntersHouse_EventScript_164004
	case 6, Route124_DivingTreasureHuntersHouse_EventScript_164035
	case 7, Route124_DivingTreasureHuntersHouse_EventScript_164066
	case 8, Route124_DivingTreasureHuntersHouse_EventScript_1640A2
	case 9, Route124_DivingTreasureHuntersHouse_EventScript_1640C8
	case 10, Route124_DivingTreasureHuntersHouse_EventScript_1640F9
	case 11, Route124_DivingTreasureHuntersHouse_EventScript_16412A
	case 12, Route124_DivingTreasureHuntersHouse_EventScript_164166
	case 13, Route124_DivingTreasureHuntersHouse_EventScript_164197
	case 14, Route124_DivingTreasureHuntersHouse_EventScript_1641D3
	case 15, Route124_DivingTreasureHuntersHouse_EventScript_16420F
	end

Route124_DivingTreasureHuntersHouse_EventScript_163F61:: @ 8163F61
	multichoice 0, 0, 58, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_163F87:: @ 8163F87
	multichoice 0, 0, 59, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_163FAD:: @ 8163FAD
	multichoice 0, 0, 60, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_163FDE:: @ 8163FDE
	multichoice 0, 0, 61, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_164004:: @ 8164004
	multichoice 0, 0, 62, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_164035:: @ 8164035
	multichoice 0, 0, 63, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_164066:: @ 8164066
	multichoice 0, 0, 64, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 3, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_1640A2:: @ 81640A2
	multichoice 0, 0, 65, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_1640C8:: @ 81640C8
	multichoice 0, 0, 66, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_1640F9:: @ 81640F9
	multichoice 0, 0, 67, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_16412A:: @ 816412A
	multichoice 0, 0, 68, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 3, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_164166:: @ 8164166
	multichoice 0, 0, 69, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_164197:: @ 8164197
	multichoice 0, 0, 70, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 3, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_1641D3:: @ 81641D3
	multichoice 0, 0, 71, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 3, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_16420F:: @ 816420F
	multichoice 0, 0, 72, 0
	switch RESULT
	case 0, Route124_DivingTreasureHuntersHouse_EventScript_164256
	case 1, Route124_DivingTreasureHuntersHouse_EventScript_164265
	case 2, Route124_DivingTreasureHuntersHouse_EventScript_164274
	case 3, Route124_DivingTreasureHuntersHouse_EventScript_164283
	case 4, Route124_DivingTreasureHuntersHouse_EventScript_16431F
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_164256:: @ 8164256
	setvar 0x8008, 48
	setvar 0x8009, 95
	goto Route124_DivingTreasureHuntersHouse_EventScript_164292

Route124_DivingTreasureHuntersHouse_EventScript_164265:: @ 8164265
	setvar 0x8008, 50
	setvar 0x8009, 96
	goto Route124_DivingTreasureHuntersHouse_EventScript_164292

Route124_DivingTreasureHuntersHouse_EventScript_164274:: @ 8164274
	setvar 0x8008, 49
	setvar 0x8009, 97
	goto Route124_DivingTreasureHuntersHouse_EventScript_164292

Route124_DivingTreasureHuntersHouse_EventScript_164283:: @ 8164283
	setvar 0x8008, 51
	setvar 0x8009, 98
	goto Route124_DivingTreasureHuntersHouse_EventScript_164292

Route124_DivingTreasureHuntersHouse_EventScript_164292:: @ 8164292
	getitemname 0, 0x8008
	getitemname 1, 0x8009
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F5E0, 5
	compare RESULT, 0
	goto_if_eq Route124_DivingTreasureHuntersHouse_EventScript_16431F
	checkitemspace 0x8009, 1
	compare RESULT, 1
	goto_if_eq Route124_DivingTreasureHuntersHouse_EventScript_1642D3
	checkitem 0x8008, 2
	compare RESULT, 0
	goto_if_eq Route124_DivingTreasureHuntersHouse_EventScript_1642D3
	goto Route124_DivingTreasureHuntersHouse_EventScript_164315
	end

Route124_DivingTreasureHuntersHouse_EventScript_1642D3:: @ 81642D3
	removeitem 0x8008, 1
	giveitem 0x8009
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F606, 4
	call Route124_DivingTreasureHuntersHouse_EventScript_163E44
	compare 0x4001, 0
	goto_if_eq Route124_DivingTreasureHuntersHouse_EventScript_164333
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F629, 5
	compare RESULT, 1
	goto_if_eq Route124_DivingTreasureHuntersHouse_EventScript_163EB0
	goto Route124_DivingTreasureHuntersHouse_EventScript_16431F
	end

Route124_DivingTreasureHuntersHouse_EventScript_164315:: @ 8164315
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F64E, 4
	release
	end

Route124_DivingTreasureHuntersHouse_EventScript_16431F:: @ 816431F
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F686, 4
	release
	end

Route124_DivingTreasureHuntersHouse_EventScript_164329:: @ 8164329
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F4D1, 4
	release
	end

Route124_DivingTreasureHuntersHouse_EventScript_164333:: @ 8164333
	release
	end

Route124_DivingTreasureHuntersHouse_EventScript_164335:: @ 8164335
	msgbox Route124_DivingTreasureHuntersHouse_Text_19F6C5, 3
	end
