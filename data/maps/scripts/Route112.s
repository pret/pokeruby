Route112_MapScripts:: @ 8150502
	map_script 3, Route112_MapScript1_150508
	.byte 0

Route112_MapScript1_150508:: @ 8150508
	call Route112_EventScript_1A0196
	setvar 0x40bd, 0
	end

Route112_EventScript_150513:: @ 8150513
	loadptr 0, Route112_Text_16FDF0
	callstd 2
	end

Route112_EventScript_15051C:: @ 815051C
	loadptr 0, Route112_Text_16FE3E
	callstd 2
	end

Route112_EventScript_150525:: @ 8150525
	loadptr 0, Route112_Text_16FEED
	callstd 3
	end

Route112_EventScript_15052E:: @ 815052E
	loadptr 0, Route112_Text_16FF19
	callstd 3
	end

Route112_EventScript_150537:: @ 8150537
	loadptr 0, Route112_Text_16FF64
	callstd 3
	end

Route112_EventScript_150540:: @ 8150540
	loadptr 0, Route112_Text_16FE7A
	callstd 2
	end

Route112_EventScript_150549:: @ 8150549
	trainerbattle 0, 626, 0, Route112_Text_1BB619, Route112_Text_1BB655
	loadptr 0, Route112_Text_1BB667
	callstd 6
	end

Route112_EventScript_150560:: @ 8150560
	trainerbattle 0, 627, 0, Route112_Text_1BB6A0, Route112_Text_1BB707
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route112_EventScript_150587
	loadptr 0, Route112_Text_1BB721
	callstd 6
	end

Route112_EventScript_150587:: @ 8150587
	trainerbattle 5, 627, 0, Route112_Text_1BB7C7, Route112_Text_1BB801
	loadptr 0, Route112_Text_1BB819
	callstd 6
	end

Route112_EventScript_15059E:: @ 815059E
	trainerbattle 0, 213, 0, Route112_Text_1BB893, Route112_Text_1BB8B6
	loadptr 0, Route112_Text_1BB8BE
	callstd 6
	end

Route112_EventScript_1505B5:: @ 81505B5
	trainerbattle 0, 471, 0, Route112_Text_1BB8F0, Route112_Text_1BB942
	loadptr 0, Route112_Text_1BB958
	callstd 6
	end

