Route110_TrickHousePuzzle8_MapScripts:: @ 816341B
	.byte 0

Route110_TrickHousePuzzle8_EventScript_16341C:: @ 816341C
	lockall
	compare VAR_TRICK_HOUSE_PUZZLE_8_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle8_EventScript_16342E
	goto Route110_TrickHousePuzzle8_EventScript_161892
	end

Route110_TrickHousePuzzle8_EventScript_16342E:: @ 816342E
	setvar VAR_TRICK_HOUSE_PUZZLE_8_STATE, 1
	goto Route110_TrickHousePuzzle8_EventScript_16189C
	end

Route110_TrickHousePuzzle8_EventScript_163439:: @ 8163439
	trainerbattle 0, TRAINER_VINCENT, 0, Route110_TrickHousePuzzle8_Text_19E178, Route110_TrickHousePuzzle8_Text_19E1A1
	msgbox Route110_TrickHousePuzzle8_Text_19E1C5, 6
	end

Route110_TrickHousePuzzle8_EventScript_163450:: @ 8163450
	trainerbattle 0, TRAINER_ELAINE, 0, Route110_TrickHousePuzzle8_Text_19E201, Route110_TrickHousePuzzle8_Text_19E22C
	msgbox Route110_TrickHousePuzzle8_Text_19E24C, 6
	end

Route110_TrickHousePuzzle8_EventScript_163467:: @ 8163467
	trainerbattle 0, TRAINER_LEROY, 0, Route110_TrickHousePuzzle8_Text_19E284, Route110_TrickHousePuzzle8_Text_19E2C1
	msgbox Route110_TrickHousePuzzle8_Text_19E2EE, 6
	end
