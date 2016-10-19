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
	msgbox Route113_Text_16FF7F, 2
	end

Route113_EventScript_15060E:: @ 815060E
	msgbox Route113_Text_16FFEE, 2
	end

Route113_EventScript_150617:: @ 8150617
	msgbox Route113_Text_170065, 3
	end

Route113_EventScript_150620:: @ 8150620
	msgbox Route113_Text_17007B, 3
	end

Route113_EventScript_150629:: @ 8150629
	msgbox Route113_Text_17011D, 3
	end

Route113_EventScript_150632:: @ 8150632
	msgbox Route113_Text_170096, 3
	end

Route113_EventScript_15063B:: @ 815063B
	trainerbattle 0, OPPONENT_NEAL, 0, Route113_Text_1BB9BA, Route113_Text_1BB9E6
	msgbox Route113_Text_1BB9FB, 6
	end

Route113_EventScript_150652:: @ 8150652
	trainerbattle 0, OPPONENT_DILLON, 0, Route113_Text_1BBA62, Route113_Text_1BBA9B
	msgbox Route113_Text_1BBAB7, 6
	end

Route113_EventScript_150669:: @ 8150669
	trainerbattle 0, OPPONENT_MADELINE_1, 0, Route113_Text_1BBB27, Route113_Text_1BBB7A
	specialval RESULT, 57
	compare RESULT, 1
	jumpif EQUAL, Route113_EventScript_150690
	msgbox Route113_Text_1BBB9A, 6
	end

Route113_EventScript_150690:: @ 8150690
	trainerbattle 5, OPPONENT_MADELINE_1, 0, Route113_Text_1BBBCE, Route113_Text_1BBC0D
	msgbox Route113_Text_1BBC1C, 6
	end

Route113_EventScript_1506A7:: @ 81506A7
	trainerbattle 0, OPPONENT_LAO_1, 0, Route113_Text_1BBC59, Route113_Text_1BBC90
	specialval RESULT, 57
	compare RESULT, 1
	jumpif EQUAL, Route113_EventScript_1506CE
	msgbox Route113_Text_1BBCAB, 6
	end

Route113_EventScript_1506CE:: @ 81506CE
	trainerbattle 5, OPPONENT_LAO_1, 0, Route113_Text_1BBCE6, Route113_Text_1BBD1D
	msgbox Route113_Text_1BBD38, 6
	end

Route113_EventScript_1506E5:: @ 81506E5
	trainerbattle 0, OPPONENT_LUNG, 0, Route113_Text_1BBD92, Route113_Text_1BBDC6
	msgbox Route113_Text_1BBE1D, 6
	end

Route113_EventScript_1506FC:: @ 81506FC
	trainerbattle 4, OPPONENT_TORI_AND_TIA, 0, Route113_Text_1BBE65, Route113_Text_1BBEA1, Route113_Text_1BBF25
	msgbox Route113_Text_1BBEE4, 6
	end

Route113_EventScript_150717:: @ 8150717
	trainerbattle 4, OPPONENT_TORI_AND_TIA, 0, Route113_Text_1BBF62, Route113_Text_1BBF9D, Route113_Text_1BC021
	msgbox Route113_Text_1BBFE2, 6
	end
