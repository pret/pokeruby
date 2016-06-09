Route110_TrickHousePuzzle4_MapScripts:: @ 816274D
	.byte 0

Route110_TrickHousePuzzle4_EventScript_16274E:: @ 816274E
	lockall
	compare 0x40ae, 0
	jumpeq Route110_TrickHousePuzzle4_EventScript_162760
	jump Route110_TrickHousePuzzle4_EventScript_161892
	end

Route110_TrickHousePuzzle4_EventScript_162760:: @ 8162760
	setvar 0x40ae, 1
	jump Route110_TrickHousePuzzle4_EventScript_16189C
	end

Route110_TrickHousePuzzle4_EventScript_16276B:: @ 816276B
	trainerbattle 0, 428, 0, Route110_TrickHousePuzzle4_Text_19D1DE, Route110_TrickHousePuzzle4_Text_19D21F
	loadptr 0, Route110_TrickHousePuzzle4_Text_19D253
	callstd 6
	end

Route110_TrickHousePuzzle4_EventScript_162782:: @ 8162782
	trainerbattle 0, 188, 0, Route110_TrickHousePuzzle4_Text_19D295, Route110_TrickHousePuzzle4_Text_19D2D1
	loadptr 0, Route110_TrickHousePuzzle4_Text_19D306
	callstd 6
	end

Route110_TrickHousePuzzle4_EventScript_162799:: @ 8162799
	trainerbattle 0, 429, 0, Route110_TrickHousePuzzle4_Text_19D351, Route110_TrickHousePuzzle4_Text_19D380
	loadptr 0, Route110_TrickHousePuzzle4_Text_19D386
	callstd 6
	end

