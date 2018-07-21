Route110_TrickHousePuzzle4_MapScripts:: @ 816274D
	.byte 0

Route110_TrickHousePuzzle4_EventScript_16274E:: @ 816274E
	lockall
	compare VAR_TRICK_HOUSE_PUZZLE_4_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle4_EventScript_162760
	goto Route110_TrickHousePuzzle4_EventScript_161892
	end

Route110_TrickHousePuzzle4_EventScript_162760:: @ 8162760
	setvar VAR_TRICK_HOUSE_PUZZLE_4_STATE, 1
	goto Route110_TrickHousePuzzle4_EventScript_16189C
	end

Route110_TrickHousePuzzle4_EventScript_16276B:: @ 816276B
	trainerbattle 0, TRAINER_CORA, 0, Route110_TrickHousePuzzle4_Text_19D1DE, Route110_TrickHousePuzzle4_Text_19D21F
	msgbox Route110_TrickHousePuzzle4_Text_19D253, 6
	end

Route110_TrickHousePuzzle4_EventScript_162782:: @ 8162782
	trainerbattle 0, TRAINER_YUJI, 0, Route110_TrickHousePuzzle4_Text_19D295, Route110_TrickHousePuzzle4_Text_19D2D1
	msgbox Route110_TrickHousePuzzle4_Text_19D306, 6
	end

Route110_TrickHousePuzzle4_EventScript_162799:: @ 8162799
	trainerbattle 0, TRAINER_JILL, 0, Route110_TrickHousePuzzle4_Text_19D351, Route110_TrickHousePuzzle4_Text_19D380
	msgbox Route110_TrickHousePuzzle4_Text_19D386, 6
	end
