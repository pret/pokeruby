Route110_TrickHousePuzzle6_MapScripts:: @ 81630CD
	map_script 3, Route110_TrickHousePuzzle6_MapScript1_1630D8
	map_script 4, Route110_TrickHousePuzzle6_MapScript2_1630DC
	.byte 0

Route110_TrickHousePuzzle6_MapScript1_1630D8:: @ 81630D8
	special RotatingGate_InitPuzzle
	end

Route110_TrickHousePuzzle6_MapScript2_1630DC:: @ 81630DC
	map_script_2 0x4000, 16384, Route110_TrickHousePuzzle6_EventScript_1630E6
	.2byte 0

Route110_TrickHousePuzzle6_EventScript_1630E6:: @ 81630E6
	special RotatingGate_InitPuzzleAndGraphics
	end

Route110_TrickHousePuzzle6_EventScript_1630EA:: @ 81630EA
	lockall
	compare 0x40b0, 0
	jumpeq Route110_TrickHousePuzzle6_EventScript_1630FC
	jump Route110_TrickHousePuzzle6_EventScript_161892
	end

Route110_TrickHousePuzzle6_EventScript_1630FC:: @ 81630FC
	setvar 0x40b0, 1
	jump Route110_TrickHousePuzzle6_EventScript_16189C
	end

Route110_TrickHousePuzzle6_EventScript_163107:: @ 8163107
	trainerbattle 0, OPPONENT_SOPHIA, 0, Route110_TrickHousePuzzle6_Text_19DC87, Route110_TrickHousePuzzle6_Text_19DCC6
	msgbox Route110_TrickHousePuzzle6_Text_19DCE7, 6
	end

Route110_TrickHousePuzzle6_EventScript_16311E:: @ 816311E
	trainerbattle 0, OPPONENT_BENNY, 0, Route110_TrickHousePuzzle6_Text_19DD49, Route110_TrickHousePuzzle6_Text_19DD83
	msgbox Route110_TrickHousePuzzle6_Text_19DD96, 6
	end

Route110_TrickHousePuzzle6_EventScript_163135:: @ 8163135
	trainerbattle 0, OPPONENT_SEBASTIAN, 0, Route110_TrickHousePuzzle6_Text_19DDCF, Route110_TrickHousePuzzle6_Text_19DDFE
	msgbox Route110_TrickHousePuzzle6_Text_19DE44, 6
	end
