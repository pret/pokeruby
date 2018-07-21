Route112_MapScripts:: @ 8150502
	map_script 3, Route112_MapScript1_150508
	.byte 0

Route112_MapScript1_150508:: @ 8150508
	call Route112_EventScript_1A0196
	setvar VAR_JAGGED_PASS_ASH_WEATHER, 0
	end

Route112_EventScript_150513:: @ 8150513
	msgbox Route112_Text_16FDF0, 2
	end

Route112_EventScript_15051C:: @ 815051C
	msgbox Route112_Text_16FE3E, 2
	end

Route112_EventScript_150525:: @ 8150525
	msgbox Route112_Text_16FEED, 3
	end

Route112_EventScript_15052E:: @ 815052E
	msgbox Route112_Text_16FF19, 3
	end

Route112_EventScript_150537:: @ 8150537
	msgbox Route112_Text_16FF64, 3
	end

Route112_EventScript_150540:: @ 8150540
	msgbox Route112_Text_16FE7A, 2
	end

Route112_EventScript_150549:: @ 8150549
	trainerbattle 0, TRAINER_BRICE, 0, Route112_Text_1BB619, Route112_Text_1BB655
	msgbox Route112_Text_1BB667, 6
	end

Route112_EventScript_150560:: @ 8150560
	trainerbattle 0, TRAINER_TRENT_1, 0, Route112_Text_1BB6A0, Route112_Text_1BB707
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route112_EventScript_150587
	msgbox Route112_Text_1BB721, 6
	end

Route112_EventScript_150587:: @ 8150587
	trainerbattle 5, TRAINER_TRENT_1, 0, Route112_Text_1BB7C7, Route112_Text_1BB801
	msgbox Route112_Text_1BB819, 6
	end

Route112_EventScript_15059E:: @ 815059E
	trainerbattle 0, TRAINER_LARRY, 0, Route112_Text_1BB893, Route112_Text_1BB8B6
	msgbox Route112_Text_1BB8BE, 6
	end

Route112_EventScript_1505B5:: @ 81505B5
	trainerbattle 0, TRAINER_CAROL, 0, Route112_Text_1BB8F0, Route112_Text_1BB942
	msgbox Route112_Text_1BB958, 6
	end
