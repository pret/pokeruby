Route110_TrickHousePuzzle3_MapScripts:: @ 8161EBD
	map_script 5, Route110_TrickHousePuzzle3_MapScript1_161EC8
	map_script 3, Route110_TrickHousePuzzle3_MapScript1_161EE4
	.byte 0

Route110_TrickHousePuzzle3_MapScript1_161EC8:: @ 8161EC8
	call Route110_TrickHousePuzzle3_EventScript_161F12
	compare 0x4009, 0
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FE5
	compare 0x4009, 1
	callif 1, Route110_TrickHousePuzzle3_EventScript_1622C8
	end

Route110_TrickHousePuzzle3_MapScript1_161EE4:: @ 8161EE4
	setvar 0x4001, 0
	setvar 0x4002, 0
	setvar 0x4003, 0
	setvar 0x4004, 0
	setvar 0x4005, 0
	setvar 0x4006, 0
	setvar 0x4007, 0
	setvar 0x4008, 0
	setvar 0x4009, 0
	end

Route110_TrickHousePuzzle3_EventScript_161F12:: @ 8161F12
	setmaptile 5, 20, 600, 0
	setmaptile 4, 12, 600, 0
	setmaptile 11, 10, 600, 0
	setmaptile 3, 8, 600, 0
	setmaptile 13, 7, 600, 0
	setmaptile 1, 3, 600, 0
	setmaptile 10, 2, 600, 0
	compare 0x4008, 1
	callif 1, Route110_TrickHousePuzzle3_EventScript_161F9F
	compare 0x4008, 2
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FA9
	compare 0x4008, 3
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FB3
	compare 0x4008, 4
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FBD
	compare 0x4008, 5
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FC7
	compare 0x4008, 6
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FD1
	compare 0x4008, 7
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FDB
	return

Route110_TrickHousePuzzle3_EventScript_161F9F:: @ 8161F9F
	setmaptile 5, 20, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FA9:: @ 8161FA9
	setmaptile 4, 12, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FB3:: @ 8161FB3
	setmaptile 11, 10, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FBD:: @ 8161FBD
	setmaptile 3, 8, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FC7:: @ 8161FC7
	setmaptile 13, 7, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FD1:: @ 8161FD1
	setmaptile 1, 3, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FDB:: @ 8161FDB
	setmaptile 10, 2, 601, 0
	return

Route110_TrickHousePuzzle3_EventScript_161FE5:: @ 8161FE5
	setmaptile 1, 6, 587, 0
	setmaptile 2, 6, 588, 0
	setmaptile 1, 7, 595, 0
	setmaptile 2, 7, 596, 0
	setmaptile 4, 9, 587, 0
	setmaptile 5, 9, 588, 0
	setmaptile 4, 10, 595, 0
	setmaptile 5, 10, 596, 0
	setmaptile 4, 18, 587, 0
	setmaptile 5, 18, 588, 0
	setmaptile 4, 19, 595, 0
	setmaptile 5, 19, 596, 0
	setmaptile 7, 3, 587, 0
	setmaptile 8, 3, 588, 0
	setmaptile 7, 4, 595, 0
	setmaptile 8, 4, 596, 0
	setmaptile 7, 9, 587, 0
	setmaptile 8, 9, 588, 0
	setmaptile 7, 10, 595, 0
	setmaptile 8, 10, 596, 0
	setmaptile 7, 18, 587, 0
	setmaptile 8, 18, 588, 0
	setmaptile 7, 19, 595, 0
	setmaptile 8, 19, 596, 0
	setmaptile 13, 3, 587, 0
	setmaptile 14, 3, 588, 0
	setmaptile 13, 4, 595, 0
	setmaptile 14, 4, 596, 0
	setmaptile 13, 9, 587, 0
	setmaptile 14, 9, 588, 0
	setmaptile 13, 10, 595, 0
	setmaptile 14, 10, 596, 0
	setmaptile 13, 15, 587, 0
	setmaptile 14, 15, 588, 0
	setmaptile 13, 16, 595, 0
	setmaptile 14, 16, 596, 0
	setmaptile 3, 13, 589, 1
	setmaptile 3, 14, 597, 0
	setmaptile 6, 7, 589, 1
	setmaptile 6, 8, 597, 0
	setmaptile 9, 16, 589, 1
	setmaptile 9, 17, 597, 0
	setmaptile 12, 4, 589, 1
	setmaptile 12, 5, 597, 0
	setmaptile 12, 10, 589, 1
	setmaptile 12, 11, 597, 0
	setmaptile 1, 15, 568, 0
	setmaptile 2, 15, 569, 0
	setmaptile 1, 16, 576, 1
	setmaptile 2, 16, 577, 1
	setmaptile 4, 6, 568, 0
	setmaptile 5, 6, 569, 0
	setmaptile 4, 7, 576, 1
	setmaptile 5, 7, 577, 1
	setmaptile 7, 12, 568, 0
	setmaptile 8, 12, 569, 0
	setmaptile 7, 13, 576, 1
	setmaptile 8, 13, 577, 1
	setmaptile 10, 12, 568, 0
	setmaptile 11, 12, 569, 0
	setmaptile 10, 13, 576, 1
	setmaptile 11, 13, 577, 1
	setmaptile 10, 18, 568, 0
	setmaptile 11, 18, 569, 0
	setmaptile 10, 19, 576, 1
	setmaptile 11, 19, 577, 1
	setmaptile 3, 4, 570, 1
	setmaptile 3, 5, 578, 1
	setmaptile 6, 10, 570, 1
	setmaptile 6, 11, 578, 1
	setmaptile 6, 13, 570, 1
	setmaptile 6, 14, 578, 1
	setmaptile 6, 16, 570, 1
	setmaptile 6, 17, 578, 1
	setmaptile 9, 4, 570, 1
	setmaptile 9, 5, 578, 1
	setmaptile 9, 7, 570, 1
	setmaptile 9, 8, 578, 1
	setmaptile 12, 13, 570, 1
	setmaptile 12, 14, 578, 1
	setmaptile 12, 16, 570, 1
	setmaptile 12, 17, 578, 1
	return

Route110_TrickHousePuzzle3_EventScript_1622C8:: @ 81622C8
	setmaptile 1, 6, 571, 0
	setmaptile 2, 6, 572, 0
	setmaptile 1, 7, 579, 1
	setmaptile 2, 7, 580, 1
	setmaptile 4, 9, 571, 0
	setmaptile 5, 9, 572, 0
	setmaptile 4, 10, 579, 1
	setmaptile 5, 10, 580, 1
	setmaptile 4, 18, 571, 0
	setmaptile 5, 18, 572, 0
	setmaptile 4, 19, 579, 1
	setmaptile 5, 19, 580, 1
	setmaptile 7, 3, 571, 0
	setmaptile 8, 3, 572, 0
	setmaptile 7, 4, 579, 1
	setmaptile 8, 4, 580, 1
	setmaptile 7, 9, 571, 0
	setmaptile 8, 9, 572, 0
	setmaptile 7, 10, 579, 1
	setmaptile 8, 10, 580, 1
	setmaptile 7, 18, 571, 0
	setmaptile 8, 18, 572, 0
	setmaptile 7, 19, 579, 1
	setmaptile 8, 19, 580, 1
	setmaptile 13, 3, 571, 0
	setmaptile 14, 3, 572, 0
	setmaptile 13, 4, 579, 1
	setmaptile 14, 4, 580, 1
	setmaptile 13, 9, 571, 0
	setmaptile 14, 9, 572, 0
	setmaptile 13, 10, 579, 1
	setmaptile 14, 10, 580, 1
	setmaptile 13, 15, 571, 0
	setmaptile 14, 15, 572, 0
	setmaptile 13, 16, 579, 1
	setmaptile 14, 16, 580, 1
	setmaptile 3, 13, 573, 1
	setmaptile 3, 14, 581, 1
	setmaptile 6, 7, 573, 1
	setmaptile 6, 8, 581, 1
	setmaptile 9, 16, 573, 1
	setmaptile 9, 17, 581, 1
	setmaptile 12, 4, 573, 1
	setmaptile 12, 5, 581, 1
	setmaptile 12, 10, 573, 1
	setmaptile 12, 11, 581, 1
	setmaptile 1, 15, 584, 0
	setmaptile 2, 15, 585, 0
	setmaptile 1, 16, 592, 0
	setmaptile 2, 16, 593, 0
	setmaptile 4, 6, 584, 0
	setmaptile 5, 6, 585, 0
	setmaptile 4, 7, 592, 0
	setmaptile 5, 7, 593, 0
	setmaptile 7, 12, 584, 0
	setmaptile 8, 12, 585, 0
	setmaptile 7, 13, 592, 0
	setmaptile 8, 13, 593, 0
	setmaptile 10, 12, 584, 0
	setmaptile 11, 12, 585, 0
	setmaptile 10, 13, 592, 0
	setmaptile 11, 13, 593, 0
	setmaptile 10, 18, 584, 0
	setmaptile 11, 18, 585, 0
	setmaptile 10, 19, 592, 0
	setmaptile 11, 19, 593, 0
	setmaptile 3, 4, 586, 1
	setmaptile 3, 5, 594, 0
	setmaptile 6, 10, 586, 1
	setmaptile 6, 11, 594, 0
	setmaptile 6, 13, 586, 1
	setmaptile 6, 14, 594, 0
	setmaptile 6, 16, 586, 1
	setmaptile 6, 17, 594, 0
	setmaptile 9, 4, 586, 1
	setmaptile 9, 5, 594, 0
	setmaptile 9, 7, 586, 1
	setmaptile 9, 8, 594, 0
	setmaptile 12, 13, 586, 1
	setmaptile 12, 14, 594, 0
	setmaptile 12, 16, 586, 1
	setmaptile 12, 17, 594, 0
	return

Route110_TrickHousePuzzle3_EventScript_1625AB:: @ 81625AB
	lockall
	setvar 0x4008, 1
	jump Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625B7:: @ 81625B7
	lockall
	setvar 0x4008, 2
	jump Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625C3:: @ 81625C3
	lockall
	setvar 0x4008, 3
	jump Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625CF:: @ 81625CF
	lockall
	setvar 0x4008, 4
	jump Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625DB:: @ 81625DB
	lockall
	setvar 0x4008, 5
	jump Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625E7:: @ 81625E7
	lockall
	setvar 0x4008, 6
	jump Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625F3:: @ 81625F3
	lockall
	setvar 0x4008, 7
	jump Route110_TrickHousePuzzle3_EventScript_1625FF
	end

Route110_TrickHousePuzzle3_EventScript_1625FF:: @ 81625FF
	call Route110_TrickHousePuzzle3_EventScript_162612
	playsfx 21
	call Route110_TrickHousePuzzle3_EventScript_161F12
	jump Route110_TrickHousePuzzle3_EventScript_1626AD
	end

Route110_TrickHousePuzzle3_EventScript_162612:: @ 8162612
	setvar 0x4001, 0
	setvar 0x4002, 0
	setvar 0x4003, 0
	setvar 0x4004, 0
	setvar 0x4005, 0
	setvar 0x4006, 0
	setvar 0x4007, 0
	compare 0x4008, 1
	callif 1, Route110_TrickHousePuzzle3_EventScript_162683
	compare 0x4008, 2
	callif 1, Route110_TrickHousePuzzle3_EventScript_162689
	compare 0x4008, 3
	callif 1, Route110_TrickHousePuzzle3_EventScript_16268F
	compare 0x4008, 4
	callif 1, Route110_TrickHousePuzzle3_EventScript_162695
	compare 0x4008, 5
	callif 1, Route110_TrickHousePuzzle3_EventScript_16269B
	compare 0x4008, 6
	callif 1, Route110_TrickHousePuzzle3_EventScript_1626A1
	compare 0x4008, 7
	callif 1, Route110_TrickHousePuzzle3_EventScript_1626A7
	return

Route110_TrickHousePuzzle3_EventScript_162683:: @ 8162683
	setvar 0x4001, 1
	return

Route110_TrickHousePuzzle3_EventScript_162689:: @ 8162689
	setvar 0x4002, 1
	return

Route110_TrickHousePuzzle3_EventScript_16268F:: @ 816268F
	setvar 0x4003, 1
	return

Route110_TrickHousePuzzle3_EventScript_162695:: @ 8162695
	setvar 0x4004, 1
	return

Route110_TrickHousePuzzle3_EventScript_16269B:: @ 816269B
	setvar 0x4005, 1
	return

Route110_TrickHousePuzzle3_EventScript_1626A1:: @ 81626A1
	setvar 0x4006, 1
	return

Route110_TrickHousePuzzle3_EventScript_1626A7:: @ 81626A7
	setvar 0x4007, 1
	return

Route110_TrickHousePuzzle3_EventScript_1626AD:: @ 81626AD
	compare 0x4009, 1
	callif 1, Route110_TrickHousePuzzle3_EventScript_161FE5
	compare 0x4009, 0
	callif 1, Route110_TrickHousePuzzle3_EventScript_1622C8
	special 142
	compare 0x4009, 1
	jumpeq Route110_TrickHousePuzzle3_EventScript_1626DD
	compare 0x4009, 0
	jumpeq Route110_TrickHousePuzzle3_EventScript_1626E4
	end

Route110_TrickHousePuzzle3_EventScript_1626DD:: @ 81626DD
	setvar 0x4009, 0
	releaseall
	end

Route110_TrickHousePuzzle3_EventScript_1626E4:: @ 81626E4
	setvar 0x4009, 1
	releaseall
	end

Route110_TrickHousePuzzle3_EventScript_1626EB:: @ 81626EB
	lockall
	compare 0x40ad, 0
	jumpeq Route110_TrickHousePuzzle3_EventScript_1626FD
	jump Route110_TrickHousePuzzle3_EventScript_161892
	end

Route110_TrickHousePuzzle3_EventScript_1626FD:: @ 81626FD
	setvar 0x40ad, 1
	jump Route110_TrickHousePuzzle3_EventScript_16189C
	end

Route110_TrickHousePuzzle3_EventScript_162708:: @ 8162708
	trainerbattle 0, 215, 0, Route110_TrickHousePuzzle3_Text_19CF76, Route110_TrickHousePuzzle3_Text_19CF9D
	msgbox Route110_TrickHousePuzzle3_Text_19CFE6, 6
	end

Route110_TrickHousePuzzle3_EventScript_16271F:: @ 816271F
	trainerbattle 0, 473, 0, Route110_TrickHousePuzzle3_Text_19D026, Route110_TrickHousePuzzle3_Text_19D065
	msgbox Route110_TrickHousePuzzle3_Text_19D07A, 6
	end

Route110_TrickHousePuzzle3_EventScript_162736:: @ 8162736
	trainerbattle 0, 630, 0, Route110_TrickHousePuzzle3_Text_19D0AE, Route110_TrickHousePuzzle3_Text_19D0F0
	msgbox Route110_TrickHousePuzzle3_Text_19D110, 6
	end
