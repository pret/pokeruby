Route110_TrickHousePuzzle1_MapScripts:: @ 8161CF8
	map_script 1, Route110_TrickHousePuzzle1_MapScript1_161CFE
	.byte 0

Route110_TrickHousePuzzle1_MapScript1_161CFE:: @ 8161CFE
	compare 0x40ab, 2
	jumpeq Route110_TrickHousePuzzle1_EventScript_161D0A
	end

Route110_TrickHousePuzzle1_EventScript_161D0A:: @ 8161D0A
	setmaptile 13, 1, 523, 0
	end

Route110_TrickHousePuzzle1_EventScript_161D14:: @ 8161D14
	lockall
	compare 0x40ab, 0
	jumpeq Route110_TrickHousePuzzle1_EventScript_161D26
	jump Route110_TrickHousePuzzle1_EventScript_161892
	end

Route110_TrickHousePuzzle1_EventScript_161D26:: @ 8161D26
	setvar 0x40ab, 1
	jump Route110_TrickHousePuzzle1_EventScript_16189C
	end

Route110_TrickHousePuzzle1_EventScript_161D31:: @ 8161D31
	trainerbattle 0, OPPONENT_SALLY, 0, Route110_TrickHousePuzzle1_Text_19CB4F, Route110_TrickHousePuzzle1_Text_19CB93
	msgbox Route110_TrickHousePuzzle1_Text_19CBAB, 6
	end

Route110_TrickHousePuzzle1_EventScript_161D48:: @ 8161D48
	trainerbattle 0, OPPONENT_EDDIE, 0, Route110_TrickHousePuzzle1_Text_19CBD6, Route110_TrickHousePuzzle1_Text_19CC06
	msgbox Route110_TrickHousePuzzle1_Text_19CC1B, 6
	end

Route110_TrickHousePuzzle1_EventScript_161D5F:: @ 8161D5F
	trainerbattle 0, OPPONENT_ROBIN, 0, Route110_TrickHousePuzzle1_Text_19CC68, Route110_TrickHousePuzzle1_Text_19CC86
	msgbox Route110_TrickHousePuzzle1_Text_19CCAA, 6
	end
