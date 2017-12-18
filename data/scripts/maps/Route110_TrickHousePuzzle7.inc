Route110_TrickHousePuzzle7_MapScripts:: @ 816314C
	map_script 5, Route110_TrickHousePuzzle7_MapScript1_163161
	map_script 3, Route110_TrickHousePuzzle7_MapScript1_163253
	map_script 1, Route110_TrickHousePuzzle7_MapScript1_16326F
	map_script 2, Route110_TrickHousePuzzle7_MapScript2_16327B
	.byte 0

Route110_TrickHousePuzzle7_MapScript1_163161:: @ 8163161
	call Route110_TrickHousePuzzle7_EventScript_163167
	end

Route110_TrickHousePuzzle7_EventScript_163167:: @ 8163167
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	call_if 1, Route110_TrickHousePuzzle7_EventScript_163195
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	call_if 1, Route110_TrickHousePuzzle7_EventScript_1631A8
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	call_if 1, Route110_TrickHousePuzzle7_EventScript_1631BB
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	call_if 1, Route110_TrickHousePuzzle7_EventScript_1631CE
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	call_if 1, Route110_TrickHousePuzzle7_EventScript_1631E1
	return

Route110_TrickHousePuzzle7_EventScript_163195:: @ 8163195
	setmaptile 13, 17, 610, 0
	setmaptile 12, 16, 575, 1
	return

Route110_TrickHousePuzzle7_EventScript_1631A8:: @ 81631A8
	setmaptile 12, 13, 610, 0
	setmaptile 12, 11, 575, 1
	return

Route110_TrickHousePuzzle7_EventScript_1631BB:: @ 81631BB
	setmaptile 7, 12, 610, 0
	setmaptile 5, 10, 575, 1
	return

Route110_TrickHousePuzzle7_EventScript_1631CE:: @ 81631CE
	setmaptile 6, 6, 636, 0
	setmaptile 4, 4, 575, 1
	return

Route110_TrickHousePuzzle7_EventScript_1631E1:: @ 81631E1
	setmaptile 8, 4, 609, 0
	setmaptile 7, 5, 575, 1
	return

Route110_TrickHousePuzzle7_EventScript_1631F4:: @ 81631F4
	setmaptile 13, 17, 611, 0
	setmaptile 12, 16, 574, 1
	return

Route110_TrickHousePuzzle7_EventScript_163207:: @ 8163207
	setmaptile 12, 13, 609, 0
	setmaptile 12, 11, 574, 1
	return

Route110_TrickHousePuzzle7_EventScript_16321A:: @ 816321A
	setmaptile 7, 12, 611, 0
	setmaptile 5, 10, 574, 1
	return

Route110_TrickHousePuzzle7_EventScript_16322D:: @ 816322D
	setmaptile 6, 6, 635, 0
	setmaptile 4, 4, 574, 1
	return

Route110_TrickHousePuzzle7_EventScript_163240:: @ 8163240
	setmaptile 8, 4, 608, 0
	setmaptile 7, 5, 574, 1
	return

Route110_TrickHousePuzzle7_MapScript1_163253:: @ 8163253
	compare 0x40b6, 1
	goto_if_eq Route110_TrickHousePuzzle7_EventScript_16326E
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	end

Route110_TrickHousePuzzle7_EventScript_16326E:: @ 816326E
	end

Route110_TrickHousePuzzle7_MapScript1_16326F:: @ 816326F
	compare 0x40b6, 1
	call_if 1, Route110_TrickHousePuzzle7_EventScript_163167
	end

Route110_TrickHousePuzzle7_MapScript2_16327B:: @ 816327B
	map_script_2 0x40b6, 1, Route110_TrickHousePuzzle7_EventScript_163285
	.2byte 0

Route110_TrickHousePuzzle7_EventScript_163285:: @ 8163285
	setvar 0x40b6, 0
	end

Route110_TrickHousePuzzle7_EventScript_16328B:: @ 816328B
	lockall
	compare 0x40b1, 0
	goto_if_eq Route110_TrickHousePuzzle7_EventScript_16329D
	goto Route110_TrickHousePuzzle7_EventScript_161892
	end

Route110_TrickHousePuzzle7_EventScript_16329D:: @ 816329D
	setvar 0x40b1, 1
	goto Route110_TrickHousePuzzle7_EventScript_16189C
	end

Route110_TrickHousePuzzle7_EventScript_1632A8:: @ 81632A8
	lockall
	setvar 0x40b6, 1
	warpteleport MAP_ROUTE110_TRICK_HOUSE_PUZZLE7, 255, 3, 19
	waitstate
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1632B9:: @ 81632B9
	lockall
	delay 32
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	call_if 0, Route110_TrickHousePuzzle7_EventScript_163195
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	call_if 1, Route110_TrickHousePuzzle7_EventScript_1631F4
	special DrawWholeMapView
	playse 36
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	goto_if 0, Route110_TrickHousePuzzle7_EventScript_1633A4
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	goto_if_eq Route110_TrickHousePuzzle7_EventScript_1633A9
	end

Route110_TrickHousePuzzle7_EventScript_1632E8:: @ 81632E8
	lockall
	delay 32
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	call_if 0, Route110_TrickHousePuzzle7_EventScript_1631A8
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	call_if 1, Route110_TrickHousePuzzle7_EventScript_163207
	special DrawWholeMapView
	playse 36
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	goto_if 0, Route110_TrickHousePuzzle7_EventScript_1633AE
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	goto_if_eq Route110_TrickHousePuzzle7_EventScript_1633B3
	end

Route110_TrickHousePuzzle7_EventScript_163317:: @ 8163317
	lockall
	delay 32
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	call_if 0, Route110_TrickHousePuzzle7_EventScript_1631BB
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	call_if 1, Route110_TrickHousePuzzle7_EventScript_16321A
	special DrawWholeMapView
	playse 36
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	goto_if 0, Route110_TrickHousePuzzle7_EventScript_1633B8
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	goto_if_eq Route110_TrickHousePuzzle7_EventScript_1633BD
	end

Route110_TrickHousePuzzle7_EventScript_163346:: @ 8163346
	lockall
	delay 32
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	call_if 0, Route110_TrickHousePuzzle7_EventScript_1631CE
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	call_if 1, Route110_TrickHousePuzzle7_EventScript_16322D
	special DrawWholeMapView
	playse 36
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	goto_if 0, Route110_TrickHousePuzzle7_EventScript_1633C2
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	goto_if_eq Route110_TrickHousePuzzle7_EventScript_1633C7
	end

Route110_TrickHousePuzzle7_EventScript_163375:: @ 8163375
	lockall
	delay 32
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	call_if 0, Route110_TrickHousePuzzle7_EventScript_1631E1
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	call_if 1, Route110_TrickHousePuzzle7_EventScript_163240
	special DrawWholeMapView
	playse 36
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	goto_if 0, Route110_TrickHousePuzzle7_EventScript_1633CC
	checkflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	goto_if_eq Route110_TrickHousePuzzle7_EventScript_1633D1
	end

Route110_TrickHousePuzzle7_EventScript_1633A4:: @ 81633A4
	setflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633A9:: @ 81633A9
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_1
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633AE:: @ 81633AE
	setflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633B3:: @ 81633B3
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_2
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633B8:: @ 81633B8
	setflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633BD:: @ 81633BD
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_3
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633C2:: @ 81633C2
	setflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633C7:: @ 81633C7
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_4
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633CC:: @ 81633CC
	setflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633D1:: @ 81633D1
	clearflag FLAG_TRICK_HOUSE_PUZZLE_7_SWITCH_5
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633D6:: @ 81633D6
	trainerbattle 0, OPPONENT_JOSHUA, 0, Route110_TrickHousePuzzle7_Text_19DF0B, Route110_TrickHousePuzzle7_Text_19DF4B
	msgbox Route110_TrickHousePuzzle7_Text_19DF7E, 6
	end

Route110_TrickHousePuzzle7_EventScript_1633ED:: @ 81633ED
	trainerbattle 0, OPPONENT_PATRICIA, 0, Route110_TrickHousePuzzle7_Text_19DFBB, Route110_TrickHousePuzzle7_Text_19DFF2
	msgbox Route110_TrickHousePuzzle7_Text_19E00F, 6
	end

Route110_TrickHousePuzzle7_EventScript_163404:: @ 8163404
	trainerbattle 0, OPPONENT_ALEXIS, 0, Route110_TrickHousePuzzle7_Text_19E054, Route110_TrickHousePuzzle7_Text_19E098
	msgbox Route110_TrickHousePuzzle7_Text_19E0B2, 6
	end
