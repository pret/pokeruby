Route113_MapScripts:: @ 81505CC
	map_script 5, Route113_MapScript1_1505D7
	map_script 3, Route113_MapScript1_1505DA
	.byte 0

Route113_MapScript1_1505D7:: @ 81505D7
	tileeffect 1
	end

Route113_MapScript1_1505DA:: @ 81505DA
	call Route113_EventScript_1505E5
	call Route113_EventScript_1A0196
	end

Route113_EventScript_1505E5:: @ 81505E5
	getplayerxy 0x4000, 0x4001
	compare 0x4000, 19
	jumpif 0, Route113_EventScript_150604
	compare 0x4000, 84
	jumpif 2, Route113_EventScript_150604
	setweather 7
	return

Route113_EventScript_150604:: @ 8150604
	return

Route113_EventScript_150605:: @ 8150605
	loadptr 0, Route113_Text_16FF7F
	callstd 2
	end

Route113_EventScript_15060E:: @ 815060E
	loadptr 0, Route113_Text_16FFEE
	callstd 2
	end

Route113_EventScript_150617:: @ 8150617
	loadptr 0, Route113_Text_170065
	callstd 3
	end

Route113_EventScript_150620:: @ 8150620
	loadptr 0, Route113_Text_17007B
	callstd 3
	end

Route113_EventScript_150629:: @ 8150629
	loadptr 0, Route113_Text_17011D
	callstd 3
	end

Route113_EventScript_150632:: @ 8150632
	loadptr 0, Route113_Text_170096
	callstd 3
	end

Route113_EventScript_15063B:: @ 815063B
	trainerbattle 0, 326, 0, Route113_Text_1BB9BA, Route113_Text_1BB9E6
	loadptr 0, Route113_Text_1BB9FB
	callstd 6
	end

Route113_EventScript_150652:: @ 8150652
	trainerbattle 0, 327, 0, Route113_Text_1BBA62, Route113_Text_1BBA9B
	loadptr 0, Route113_Text_1BBAB7
	callstd 6
	end

Route113_EventScript_150669:: @ 8150669
	trainerbattle 0, 434, 0, Route113_Text_1BBB27, Route113_Text_1BBB7A
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route113_EventScript_150690
	loadptr 0, Route113_Text_1BBB9A
	callstd 6
	end

Route113_EventScript_150690:: @ 8150690
	trainerbattle 5, 434, 0, Route113_Text_1BBBCE, Route113_Text_1BBC0D
	loadptr 0, Route113_Text_1BBC1C
	callstd 6
	end

Route113_EventScript_1506A7:: @ 81506A7
	trainerbattle 0, 419, 0, Route113_Text_1BBC59, Route113_Text_1BBC90
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route113_EventScript_1506CE
	loadptr 0, Route113_Text_1BBCAB
	callstd 6
	end

Route113_EventScript_1506CE:: @ 81506CE
	trainerbattle 5, 419, 0, Route113_Text_1BBCE6, Route113_Text_1BBD1D
	loadptr 0, Route113_Text_1BBD38
	callstd 6
	end

Route113_EventScript_1506E5:: @ 81506E5
	trainerbattle 0, 420, 0, Route113_Text_1BBD92, Route113_Text_1BBDC6
	loadptr 0, Route113_Text_1BBE1D
	callstd 6
	end

Route113_EventScript_1506FC:: @ 81506FC
	trainerbattle 4, 677, 0, Route113_Text_1BBE65, Route113_Text_1BBEA1, Route113_Text_1BBF25
	loadptr 0, Route113_Text_1BBEE4
	callstd 6
	end

Route113_EventScript_150717:: @ 8150717
	trainerbattle 4, 677, 0, Route113_Text_1BBF62, Route113_Text_1BBF9D, Route113_Text_1BC021
	loadptr 0, Route113_Text_1BBFE2
	callstd 6
	end

