Route131_MapScripts:: @ 815243E
	map_script 3, Route131_MapScript1_152444
	.byte 0

Route131_MapScript1_152444:: @ 8152444
	call_if_set FLAG_SYS_GAME_CLEAR, Route131_EventScript_15244E
	end

Route131_EventScript_15244E:: @ 815244E
	setmaplayoutindex 320
	return

Route131_EventScript_152452:: @ 8152452
	trainerbattle 0, TRAINER_RICHARD, 0, Route131_Text_1C25B3, Route131_Text_1C25F8
	msgbox Route131_Text_1C262A, 6
	end

Route131_EventScript_152469:: @ 8152469
	trainerbattle 0, TRAINER_HERMAN, 0, Route131_Text_1C26B9, Route131_Text_1C271F
	msgbox Route131_Text_1C2726, 6
	end

Route131_EventScript_152480:: @ 8152480
	trainerbattle 0, TRAINER_SUSIE, 0, Route131_Text_1C2774, Route131_Text_1C27A4
	msgbox Route131_Text_1C27CF, 6
	end

Route131_EventScript_152497:: @ 8152497
	trainerbattle 0, TRAINER_KARA, 0, Route131_Text_1C284A, Route131_Text_1C2883
	msgbox Route131_Text_1C2898, 6
	end

Route131_EventScript_1524AE:: @ 81524AE
	trainerbattle 4, TRAINER_RELI_AND_IAN, 0, Route131_Text_1C28E2, Route131_Text_1C2918, Route131_Text_1C29B2
	msgbox Route131_Text_1C2950, 6
	end

Route131_EventScript_1524C9:: @ 81524C9
	trainerbattle 4, TRAINER_RELI_AND_IAN, 0, Route131_Text_1C29F3, Route131_Text_1C2A20, Route131_Text_1C2ACA
	msgbox Route131_Text_1C2A5D, 6
	end
