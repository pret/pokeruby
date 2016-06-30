Route117_EventScript_1B222D:: @ 81B222D
	lock
	faceplayer
	special 181
	specialval RESULT, 182
	compare RESULT, 1
	jumpeq Route117_EventScript_1B2262
	compare RESULT, 2
	jumpeq Route117_EventScript_1B22E7
	compare RESULT, 3
	jumpeq Route117_EventScript_1B22FE
	msgbox Route117_Text_1B25CB, 4
	release
	end

Route117_EventScript_1B2262:: @ 81B2262
	msgbox Route117_Text_1B2659, 5
	compare RESULT, 1
	jumpeq Route117_EventScript_1B2298
	msgbox Route117_Text_1B28C4, 5
	compare RESULT, 1
	jumpeq Route117_EventScript_1B2298
	msgbox Route117_Text_1B2745, 4
	clearflag 134
	special 183
	release
	end

Route117_EventScript_1B2298:: @ 81B2298
	specialval RESULT, 131
	compare RESULT, 6
	jumpif 5, Route117_EventScript_1B22B2
	msgbox Route117_Text_1B2766, 4
	release
	end

Route117_EventScript_1B22B2:: @ 81B22B2
	message Route117_Text_1B27A2
	fanfare 367
	waitfanfare
	waittext
	waitbutton
	msgbox Route117_Text_1B27CD, 4
	special 184
	clearflag 134
	release
	end

Route117_EventScript_1B22CD:: @ 81B22CD
	specialval RESULT, 195
	compare RESULT, 1
	callif 1, Route117_EventScript_1B22DE
	return

Route117_EventScript_1B22DE:: @ 81B22DE
	msgbox Route117_Text_1B27E3, 4
	return

Route117_EventScript_1B22E7:: @ 81B22E7
	special 181
	msgbox Route117_Text_1B2710, 4
	setvar 0x8004, 0
	call Route117_EventScript_1B22CD
	release
	end

Route117_EventScript_1B22FE:: @ 81B22FE
	special 181
	msgbox Route117_Text_1B2897, 4
	special 185
	special 141
	waittext
	waitbutton
	setvar 0x8004, 0
	call Route117_EventScript_1B22CD
	setvar 0x8004, 1
	call Route117_EventScript_1B22CD
	release
	end

Route117_PokemonDayCare_EventScript_1B2327:: @ 81B2327
	lock
	faceplayer
	specialval RESULT, 182
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2407
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B242B
	compare RESULT, 3
	jumpeq Route117_PokemonDayCare_EventScript_1B2558
	msgbox Route117_PokemonDayCare_Text_1B28F2, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B236C
	msgbox Route117_PokemonDayCare_Text_1B2A14, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B236C:: @ 81B236C
	specialval RESULT, 132
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B23F3
	msgbox Route117_PokemonDayCare_Text_1B2947, 4
	fadescreen 1
	special 188
	waitstate
	compare 0x8004, 255
	jumpeq Route117_PokemonDayCare_EventScript_1B23D0
	specialval RESULT, 133
	compare RESULT, 0
	jumpeq Route117_PokemonDayCare_EventScript_1B23FD
	specialval 0x8005, 186
	checksound
	pokecry 0x8005, 0
	msgbox Route117_PokemonDayCare_Text_1B296E, 4
	waitpokecry
	special 187
	inccounter 47
	specialval RESULT, 182
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B23DA
	release
	end

Route117_PokemonDayCare_EventScript_1B23D0:: @ 81B23D0
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B23DA:: @ 81B23DA
	msgbox Route117_PokemonDayCare_Text_1B29AD, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B236C
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B23F3:: @ 81B23F3
	msgbox Route117_PokemonDayCare_Text_1B2BBB, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B23FD:: @ 81B23FD
	msgbox Route117_PokemonDayCare_Text_1B2C17, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B2407:: @ 81B2407
	msgbox Route117_PokemonDayCare_Text_1B29F4, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B2411:: @ 81B2411
	msgbox Route117_PokemonDayCare_Text_1B2ACC, 4
	return

Route117_PokemonDayCare_EventScript_1B241A:: @ 81B241A
	specialval RESULT, 190
	compare RESULT, 0
	callif 5, Route117_PokemonDayCare_EventScript_1B2411
	return

Route117_PokemonDayCare_EventScript_1B242B:: @ 81B242B
	msgbox Route117_PokemonDayCare_Text_1B2A88, 4
	setvar 0x8004, 0
	call Route117_PokemonDayCare_EventScript_1B241A
	msgbox Route117_PokemonDayCare_Text_1B29AD, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B236C
	msgbox Route117_PokemonDayCare_Text_1B2BF6, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2469
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2469:: @ 81B2469
	specialval RESULT, 131
	compare RESULT, 6
	jumpeq Route117_PokemonDayCare_EventScript_1B2539
	specialval RESULT, 182
	setvar 0x8004, 0
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B24A8
	special 189
	waitstate
	copyvar 0x8004, RESULT
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B23D0
	jump Route117_PokemonDayCare_EventScript_1B24A8
	end

Route117_PokemonDayCare_EventScript_1B24A8:: @ 81B24A8
	special 191
	msgbox Route117_PokemonDayCare_Text_1B2B49, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B24C4
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B24C4:: @ 81B24C4
	specialval RESULT, 197
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B24DE
	msgbox Route117_PokemonDayCare_Text_1B2A30, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B24DE:: @ 81B24DE
	move 1, Route117_PokemonDayCare_Movement_1B2543
	waitmove 0
	specialval RESULT, 192
	special 198
	playsfx 95
	msgbox Route117_PokemonDayCare_Text_1B2B75, 4
	checksound
	pokecry RESULT, 0
	msgbox Route117_PokemonDayCare_Text_1B2B93, 4
	waitpokecry
	specialval RESULT, 182
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B2520
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2520:: @ 81B2520
	msgbox Route117_PokemonDayCare_Text_1B2A4F, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2469
	jump Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2539:: @ 81B2539
	msgbox Route117_PokemonDayCare_Text_1B2AEF, 4
	release
	end

Route117_PokemonDayCare_Movement_1B2543:: @ 81B2543
	step_14
	step_14
	step_02
	step_14
	step_14
	step_03
	step_14
	step_14
	step_01
	slow_step_up
	step_54
	step_14
	step_14
	step_14
	step_14
	step_14
	step_00
	step_55
	slow_step_down
	step_end

	.incbin "baserom.gba", 0x1b2557, 0x1

Route117_PokemonDayCare_EventScript_1B2558:: @ 81B2558
	msgbox Route117_PokemonDayCare_Text_1B2A88, 4
	setvar 0x8004, 0
	call Route117_PokemonDayCare_EventScript_1B241A
	setvar 0x8004, 1
	call Route117_PokemonDayCare_EventScript_1B241A
	msgbox Route117_PokemonDayCare_Text_1B2BF6, 5
	compare RESULT, 1
	jumpeq Route117_PokemonDayCare_EventScript_1B2469
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

@ 81B2591
	special 189
	waitstate
	compare RESULT, 2
	jumpeq Route117_PokemonDayCare_EventScript_1B23D0
	copyvar 0x8004, RESULT
	specialval RESULT, 192
	msgbox Route117_PokemonDayCare_Text_1B2B75, 4
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

Event_EggHatch:: @ 81B25BC
	lockall
	msgbox UnknownString_81B2C68, 4
	special 194
	waitstate
	releaseall
	end
