Route110_TrickHousePuzzle3_MapScripts:: @ 8161EBD
	map_script 5, Route110_TrickHousePuzzle3_MapScript1_161EC8
	map_script 3, Route110_TrickHousePuzzle3_MapScript1_161EE4
	.byte 0

Route110_TrickHousePuzzle3_MapScript1_161EC8:: @ 8161EC8
	call Route110_TrickHousePuzzle3_EventScript_161F12
	compare VAR_TEMP_9, 0
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FE5
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_1622C8
	end

Route110_TrickHousePuzzle3_MapScript1_161EE4:: @ 8161EE4
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	setvar VAR_TEMP_5, 0
	setvar VAR_TEMP_6, 0
	setvar VAR_TEMP_7, 0
	setvar VAR_TEMP_8, 0
	setvar VAR_TEMP_9, 0
	end

Route110_TrickHousePuzzle3_EventScript_161F12:: @ 8161F12
	setmetatile 5, 20, 600, 0
	setmetatile 4, 12, 600, 0
	setmetatile 11, 10, 600, 0
	setmetatile 3, 8, 600, 0
	setmetatile 13, 7, 600, 0
	setmetatile 1, 3, 600, 0
	setmetatile 10, 2, 600, 0
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161F9F
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FA9
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FB3
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FBD
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FC7
	compare VAR_TEMP_8, 6
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FD1
	compare VAR_TEMP_8, 7
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FDB
	return

Route110_TrickHousePuzzle3_EventScript_161F9F:: @ 8161F9F
	setmetatile 5, 20, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FA9:: @ 8161FA9
	setmetatile 4, 12, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FB3:: @ 8161FB3
	setmetatile 11, 10, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FBD:: @ 8161FBD
	setmetatile 3, 8, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FC7:: @ 8161FC7
	setmetatile 13, 7, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FD1:: @ 8161FD1
	setmetatile 1, 3, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FDB:: @ 8161FDB
	setmetatile 10, 2, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FE5:: @ 8161FE5
	setmetatile 1, 6, 587, 0
	setmetatile 2, 6, 588, 0
	setmetatile 1, 7, 595, 0
	setmetatile 2, 7, 596, 0
	setmetatile 4, 9, 587, 0
	setmetatile 5, 9, 588, 0
	setmetatile 4, 10, 595, 0
	setmetatile 5, 10, 596, 0
	setmetatile 4, 18, 587, 0
	setmetatile 5, 18, 588, 0
	setmetatile 4, 19, 595, 0
	setmetatile 5, 19, 596, 0
	setmetatile 7, 3, 587, 0
	setmetatile 8, 3, 588, 0
	setmetatile 7, 4, 595, 0
	setmetatile 8, 4, 596, 0
	setmetatile 7, 9, 587, 0
	setmetatile 8, 9, 588, 0
	setmetatile 7, 10, 595, 0
	setmetatile 8, 10, 596, 0
	setmetatile 7, 18, 587, 0
	setmetatile 8, 18, 588, 0
	setmetatile 7, 19, 595, 0
	setmetatile 8, 19, 596, 0
	setmetatile 13, 3, 587, 0
	setmetatile 14, 3, 588, 0
	setmetatile 13, 4, 595, 0
	setmetatile 14, 4, 596, 0
	setmetatile 13, 9, 587, 0
	setmetatile 14, 9, 588, 0
	setmetatile 13, 10, 595, 0
	setmetatile 14, 10, 596, 0
	setmetatile 13, 15, 587, 0
	setmetatile 14, 15, 588, 0
	setmetatile 13, 16, 595, 0
	setmetatile 14, 16, 596, 0
	setmetatile 3, 13, 589, 1
	setmetatile 3, 14, 597, 0
	setmetatile 6, 7, 589, 1
	setmetatile 6, 8, 597, 0
	setmetatile 9, 16, 589, 1
	setmetatile 9, 17, 597, 0
	setmetatile 12, 4, 589, 1
	setmetatile 12, 5, 597, 0
	setmetatile 12, 10, 589, 1
	setmetatile 12, 11, 597, 0
	setmetatile 1, 15, 568, 0
	setmetatile 2, 15, 569, 0
	setmetatile 1, 16, 576, 1
	setmetatile 2, 16, 577, 1
	setmetatile 4, 6, 568, 0
	setmetatile 5, 6, 569, 0
	setmetatile 4, 7, 576, 1
	setmetatile 5, 7, 577, 1
	setmetatile 7, 12, 568, 0
	setmetatile 8, 12, 569, 0
	setmetatile 7, 13, 576, 1
	setmetatile 8, 13, 577, 1
	setmetatile 10, 12, 568, 0
	setmetatile 11, 12, 569, 0
	setmetatile 10, 13, 576, 1
	setmetatile 11, 13, 577, 1
	setmetatile 10, 18, 568, 0
	setmetatile 11, 18, 569, 0
	setmetatile 10, 19, 576, 1
	setmetatile 11, 19, 577, 1
	setmetatile 3, 4, 570, 1
	setmetatile 3, 5, 578, 1
	setmetatile 6, 10, 570, 1
	setmetatile 6, 11, 578, 1
	setmetatile 6, 13, 570, 1
	setmetatile 6, 14, 578, 1
	setmetatile 6, 16, 570, 1
	setmetatile 6, 17, 578, 1
	setmetatile 9, 4, 570, 1
	setmetatile 9, 5, 578, 1
	setmetatile 9, 7, 570, 1
	setmetatile 9, 8, 578, 1
	setmetatile 12, 13, 570, 1
	setmetatile 12, 14, 578, 1
	setmetatile 12, 16, 570, 1
	setmetatile 12, 17, 578, 1
	return

Route110_TrickHousePuzzle3_EventScript_1622C8:: @ 81622C8
	setmetatile 1, 6, 571, 0
	setmetatile 2, 6, 572, 0
	setmetatile 1, 7, 579, 1
	setmetatile 2, 7, 580, 1
	setmetatile 4, 9, 571, 0
	setmetatile 5, 9, 572, 0
	setmetatile 4, 10, 579, 1
	setmetatile 5, 10, 580, 1
	setmetatile 4, 18, 571, 0
	setmetatile 5, 18, 572, 0
	setmetatile 4, 19, 579, 1
	setmetatile 5, 19, 580, 1
	setmetatile 7, 3, 571, 0
	setmetatile 8, 3, 572, 0
	setmetatile 7, 4, 579, 1
	setmetatile 8, 4, 580, 1
	setmetatile 7, 9, 571, 0
	setmetatile 8, 9, 572, 0
	setmetatile 7, 10, 579, 1
	setmetatile 8, 10, 580, 1
	setmetatile 7, 18, 571, 0
	setmetatile 8, 18, 572, 0
	setmetatile 7, 19, 579, 1
	setmetatile 8, 19, 580, 1
	setmetatile 13, 3, 571, 0
	setmetatile 14, 3, 572, 0
	setmetatile 13, 4, 579, 1
	setmetatile 14, 4, 580, 1
	setmetatile 13, 9, 571, 0
	setmetatile 14, 9, 572, 0
	setmetatile 13, 10, 579, 1
	setmetatile 14, 10, 580, 1
	setmetatile 13, 15, 571, 0
	setmetatile 14, 15, 572, 0
	setmetatile 13, 16, 579, 1
	setmetatile 14, 16, 580, 1
	setmetatile 3, 13, 573, 1
	setmetatile 3, 14, 581, 1
	setmetatile 6, 7, 573, 1
	setmetatile 6, 8, 581, 1
	setmetatile 9, 16, 573, 1
	setmetatile 9, 17, 581, 1
	setmetatile 12, 4, 573, 1
	setmetatile 12, 5, 581, 1
	setmetatile 12, 10, 573, 1
	setmetatile 12, 11, 581, 1
	setmetatile 1, 15, 584, 0
	setmetatile 2, 15, 585, 0
	setmetatile 1, 16, 592, 0
	setmetatile 2, 16, 593, 0
	setmetatile 4, 6, 584, 0
	setmetatile 5, 6, 585, 0
	setmetatile 4, 7, 592, 0
	setmetatile 5, 7, 593, 0
	setmetatile 7, 12, 584, 0
	setmetatile 8, 12, 585, 0
	setmetatile 7, 13, 592, 0
	setmetatile 8, 13, 593, 0
	setmetatile 10, 12, 584, 0
	setmetatile 11, 12, 585, 0
	setmetatile 10, 13, 592, 0
	setmetatile 11, 13, 593, 0
	setmetatile 10, 18, 584, 0
	setmetatile 11, 18, 585, 0
	setmetatile 10, 19, 592, 0
	setmetatile 11, 19, 593, 0
	setmetatile 3, 4, 586, 1
	setmetatile 3, 5, 594, 0
	setmetatile 6, 10, 586, 1
	setmetatile 6, 11, 594, 0
	setmetatile 6, 13, 586, 1
	setmetatile 6, 14, 594, 0
	setmetatile 6, 16, 586, 1
	setmetatile 6, 17, 594, 0
	setmetatile 9, 4, 586, 1
	setmetatile 9, 5, 594, 0
	setmetatile 9, 7, 586, 1
	setmetatile 9, 8, 594, 0
	setmetatile 12, 13, 586, 1
	setmetatile 12, 14, 594, 0
	setmetatile 12, 16, 586, 1
	setmetatile 12, 17, 594, 0
	return

Route110_TrickHousePuzzle3_EventScript_1625AB:: @ 81625AB
	lockall
	setvar VAR_TEMP_8, 1
	goto Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625B7:: @ 81625B7
	lockall
	setvar VAR_TEMP_8, 2
	goto Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625C3:: @ 81625C3
	lockall
	setvar VAR_TEMP_8, 3
	goto Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625CF:: @ 81625CF
	lockall
	setvar VAR_TEMP_8, 4
	goto Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625DB:: @ 81625DB
	lockall
	setvar VAR_TEMP_8, 5
	goto Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625E7:: @ 81625E7
	lockall
	setvar VAR_TEMP_8, 6
	goto Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625F3:: @ 81625F3
	lockall
	setvar VAR_TEMP_8, 7
	goto Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625FF:: @ 81625FF
	call Route110_TrickHousePuzzle3_EventScript_162612
	playse SE_PIN
	call Route110_TrickHousePuzzle3_EventScript_161F12
	goto Route110_TrickHousePuzzle3_EventScript_1626AD
	end

Route110_TrickHousePuzzle3_EventScript_162612:: @ 8162612
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	setvar VAR_TEMP_5, 0
	setvar VAR_TEMP_6, 0
	setvar VAR_TEMP_7, 0
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_162683
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle3_EventScript_162689
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle3_EventScript_16268F
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle3_EventScript_162695
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle3_EventScript_16269B
	compare VAR_TEMP_8, 6
	call_if_eq Route110_TrickHousePuzzle3_EventScript_1626A1
	compare VAR_TEMP_8, 7
	call_if_eq Route110_TrickHousePuzzle3_EventScript_1626A7
	return

Route110_TrickHousePuzzle3_EventScript_162683:: @ 8162683
	setvar VAR_TEMP_1, 1
	return

Route110_TrickHousePuzzle3_EventScript_162689:: @ 8162689
	setvar VAR_TEMP_2, 1
	return

Route110_TrickHousePuzzle3_EventScript_16268F:: @ 816268F
	setvar VAR_TEMP_3, 1
	return

Route110_TrickHousePuzzle3_EventScript_162695:: @ 8162695
	setvar VAR_TEMP_4, 1
	return

Route110_TrickHousePuzzle3_EventScript_16269B:: @ 816269B
	setvar VAR_TEMP_5, 1
	return

Route110_TrickHousePuzzle3_EventScript_1626A1:: @ 81626A1
	setvar VAR_TEMP_6, 1
	return

Route110_TrickHousePuzzle3_EventScript_1626A7:: @ 81626A7
	setvar VAR_TEMP_7, 1
	return

Route110_TrickHousePuzzle3_EventScript_1626AD:: @ 81626AD
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_161FE5
	compare VAR_TEMP_9, 0
	call_if_eq Route110_TrickHousePuzzle3_EventScript_1622C8
	special DrawWholeMapView
	compare VAR_TEMP_9, 1
	goto_if_eq Route110_TrickHousePuzzle3_EventScript_1626DD
	compare VAR_TEMP_9, 0
	goto_if_eq Route110_TrickHousePuzzle3_EventScript_1626E4
	end

Route110_TrickHousePuzzle3_EventScript_1626DD:: @ 81626DD
	setvar VAR_TEMP_9, 0
	releaseall
	end

Route110_TrickHousePuzzle3_EventScript_1626E4:: @ 81626E4
	setvar VAR_TEMP_9, 1
	releaseall
	end

Route110_TrickHousePuzzle3_EventScript_1626EB:: @ 81626EB
	lockall
	compare VAR_TRICK_HOUSE_PUZZLE_3_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle3_EventScript_1626FD
	goto Route110_TrickHousePuzzle3_EventScript_161892
	end

Route110_TrickHousePuzzle3_EventScript_1626FD:: @ 81626FD
	setvar VAR_TRICK_HOUSE_PUZZLE_3_STATE, 1
	goto Route110_TrickHousePuzzle3_EventScript_16189C
	end

Route110_TrickHousePuzzle3_EventScript_162708:: @ 8162708
	trainerbattle 0, TRAINER_JUSTIN, 0, Route110_TrickHousePuzzle3_Text_19CF76, Route110_TrickHousePuzzle3_Text_19CF9D
	msgbox Route110_TrickHousePuzzle3_Text_19CFE6, 6
	end

Route110_TrickHousePuzzle3_EventScript_16271F:: @ 816271F
	trainerbattle 0, TRAINER_MARTHA, 0, Route110_TrickHousePuzzle3_Text_19D026, Route110_TrickHousePuzzle3_Text_19D065
	msgbox Route110_TrickHousePuzzle3_Text_19D07A, 6
	end

Route110_TrickHousePuzzle3_EventScript_162736:: @ 8162736
	trainerbattle 0, TRAINER_ALAN, 0, Route110_TrickHousePuzzle3_Text_19D0AE, Route110_TrickHousePuzzle3_Text_19D0F0
	msgbox Route110_TrickHousePuzzle3_Text_19D110, 6
	end
