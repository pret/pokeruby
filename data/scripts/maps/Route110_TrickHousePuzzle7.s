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
	checkflag 194
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_163195
	checkflag 195
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1631A8
	checkflag 196
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1631BB
	checkflag 197
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1631CE
	checkflag 198
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1631E1
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
	jumpif EQUAL, Route110_TrickHousePuzzle7_EventScript_16326E
	clearflag 194
	clearflag 195
	clearflag 196
	clearflag 197
	clearflag 198
	end

Route110_TrickHousePuzzle7_EventScript_16326E:: @ 816326E
	end

Route110_TrickHousePuzzle7_MapScript1_16326F:: @ 816326F
	compare 0x40b6, 1
	callif 1, Route110_TrickHousePuzzle7_EventScript_163167
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
	jumpif EQUAL, Route110_TrickHousePuzzle7_EventScript_16329D
	jump Route110_TrickHousePuzzle7_EventScript_161892
	end

Route110_TrickHousePuzzle7_EventScript_16329D:: @ 816329D
	setvar 0x40b1, 1
	jump Route110_TrickHousePuzzle7_EventScript_16189C
	end

Route110_TrickHousePuzzle7_EventScript_1632A8:: @ 81632A8
	lockall
	setvar 0x40b6, 1
	warpteleport Route110_TrickHousePuzzle7, 255, 3, 19
	waitstate
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1632B9:: @ 81632B9
	lockall
	pause 32
	checkflag 194
	callif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_163195
	checkflag 194
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1631F4
	special 142
	playsfx 36
	checkflag 194
	jumpif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1633A4
	checkflag 194
	jumpif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1633A9
	end

Route110_TrickHousePuzzle7_EventScript_1632E8:: @ 81632E8
	lockall
	pause 32
	checkflag 195
	callif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1631A8
	checkflag 195
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_163207
	special 142
	playsfx 36
	checkflag 195
	jumpif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1633AE
	checkflag 195
	jumpif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1633B3
	end

Route110_TrickHousePuzzle7_EventScript_163317:: @ 8163317
	lockall
	pause 32
	checkflag 196
	callif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1631BB
	checkflag 196
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_16321A
	special 142
	playsfx 36
	checkflag 196
	jumpif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1633B8
	checkflag 196
	jumpif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1633BD
	end

Route110_TrickHousePuzzle7_EventScript_163346:: @ 8163346
	lockall
	pause 32
	checkflag 197
	callif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1631CE
	checkflag 197
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_16322D
	special 142
	playsfx 36
	checkflag 197
	jumpif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1633C2
	checkflag 197
	jumpif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1633C7
	end

Route110_TrickHousePuzzle7_EventScript_163375:: @ 8163375
	lockall
	pause 32
	checkflag 198
	callif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1631E1
	checkflag 198
	callif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_163240
	special 142
	playsfx 36
	checkflag 198
	jumpif FLAG_NOT_SET, Route110_TrickHousePuzzle7_EventScript_1633CC
	checkflag 198
	jumpif FLAG_IS_SET, Route110_TrickHousePuzzle7_EventScript_1633D1
	end

Route110_TrickHousePuzzle7_EventScript_1633A4:: @ 81633A4
	setflag 194
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633A9:: @ 81633A9
	clearflag 194
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633AE:: @ 81633AE
	setflag 195
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633B3:: @ 81633B3
	clearflag 195
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633B8:: @ 81633B8
	setflag 196
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633BD:: @ 81633BD
	clearflag 196
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633C2:: @ 81633C2
	setflag 197
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633C7:: @ 81633C7
	clearflag 197
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633CC:: @ 81633CC
	setflag 198
	releaseall
	end

Route110_TrickHousePuzzle7_EventScript_1633D1:: @ 81633D1
	clearflag 198
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
