Route117_EventScript_1B222D:: @ 81B222D
	lock
	faceplayer
	special GetDaycareMonNicknames
	specialvar RESULT, GetDaycareState
	compare RESULT, 1
	goto_if_eq Route117_EventScript_1B2262
	compare RESULT, 2
	goto_if_eq Route117_EventScript_1B22E7
	compare RESULT, 3
	goto_if_eq Route117_EventScript_1B22FE
	msgbox Route117_Text_1B25CB, 4
	release
	end

Route117_EventScript_1B2262:: @ 81B2262
	msgbox Route117_Text_1B2659, 5
	compare RESULT, 1
	goto_if_eq Route117_EventScript_1B2298
	msgbox Route117_Text_1B28C4, 5
	compare RESULT, 1
	goto_if_eq Route117_EventScript_1B2298
	msgbox Route117_Text_1B2745, 4
	clearflag 134
	special RejectEggFromDayCare
	release
	end

Route117_EventScript_1B2298:: @ 81B2298
	specialvar RESULT, CalculatePlayerPartyCount
	compare RESULT, 6
	goto_if 5, Route117_EventScript_1B22B2
	msgbox Route117_Text_1B2766, 4
	release
	end

Route117_EventScript_1B22B2:: @ 81B22B2
	message Route117_Text_1B27A2
	playfanfare 367
	waitfanfare
	waitmessage
	waitbutton
	msgbox Route117_Text_1B27CD, 4
	special GiveEggFromDaycare
	clearflag 134
	release
	end

Route117_EventScript_1B22CD:: @ 81B22CD
	specialvar RESULT, sub_8042B4C
	compare RESULT, 1
	call_if 1, Route117_EventScript_1B22DE
	return

Route117_EventScript_1B22DE:: @ 81B22DE
	msgbox Route117_Text_1B27E3, 4
	return

Route117_EventScript_1B22E7:: @ 81B22E7
	special GetDaycareMonNicknames
	msgbox Route117_Text_1B2710, 4
	setvar 0x8004, 0
	call Route117_EventScript_1B22CD
	release
	end

Route117_EventScript_1B22FE:: @ 81B22FE
	special GetDaycareMonNicknames
	msgbox Route117_Text_1B2897, 4
	special SetDaycareCompatibilityString
	special ShowFieldMessageStringVar4
	waitmessage
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
	specialvar RESULT, GetDaycareState
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B2407
	compare RESULT, 2
	goto_if_eq Route117_PokemonDayCare_EventScript_1B242B
	compare RESULT, 3
	goto_if_eq Route117_PokemonDayCare_EventScript_1B2558
	msgbox Route117_PokemonDayCare_Text_1B28F2, 5
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B236C
	msgbox Route117_PokemonDayCare_Text_1B2A14, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B236C:: @ 81B236C
	specialvar RESULT, sub_8095B6C
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B23F3
	msgbox Route117_PokemonDayCare_Text_1B2947, 4
	fadescreen 1
	special ChooseSendDaycareMon
	waitstate
	compare 0x8004, 255
	goto_if_eq Route117_PokemonDayCare_EventScript_1B23D0
	specialvar RESULT, sub_8095C10
	compare RESULT, 0
	goto_if_eq Route117_PokemonDayCare_EventScript_1B23FD
	specialvar 0x8005, GetSelectedDaycareMonNickname
	waitse
	playpokecry 0x8005, 0
	msgbox Route117_PokemonDayCare_Text_1B296E, 4
	waitpokecry
	special StoreSelectedPokemonInDaycare
	incrementgamestat GAME_STAT_USED_DAYCARE
	specialvar RESULT, GetDaycareState
	compare RESULT, 2
	goto_if_eq Route117_PokemonDayCare_EventScript_1B23DA
	release
	end

Route117_PokemonDayCare_EventScript_1B23D0:: @ 81B23D0
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B23DA:: @ 81B23DA
	msgbox Route117_PokemonDayCare_Text_1B29AD, 5
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B236C
	goto Route117_PokemonDayCare_EventScript_1B23D0
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
	specialvar RESULT, GetNumLevelsGainedFromDaycare
	compare RESULT, 0
	call_if 5, Route117_PokemonDayCare_EventScript_1B2411
	return

Route117_PokemonDayCare_EventScript_1B242B:: @ 81B242B
	msgbox Route117_PokemonDayCare_Text_1B2A88, 4
	setvar 0x8004, 0
	call Route117_PokemonDayCare_EventScript_1B241A
	msgbox Route117_PokemonDayCare_Text_1B29AD, 5
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B236C
	msgbox Route117_PokemonDayCare_Text_1B2BF6, 5
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B2469
	goto Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2469:: @ 81B2469
	specialvar RESULT, CalculatePlayerPartyCount
	compare RESULT, 6
	goto_if_eq Route117_PokemonDayCare_EventScript_1B2539
	specialvar RESULT, GetDaycareState
	setvar 0x8004, 0
	compare RESULT, 2
	goto_if_eq Route117_PokemonDayCare_EventScript_1B24A8
	special ShowDaycareLevelMenu
	waitstate
	copyvar 0x8004, RESULT
	compare RESULT, 2
	goto_if_eq Route117_PokemonDayCare_EventScript_1B23D0
	goto Route117_PokemonDayCare_EventScript_1B24A8
	end

Route117_PokemonDayCare_EventScript_1B24A8:: @ 81B24A8
	special GetDaycareCost
	msgbox Route117_PokemonDayCare_Text_1B2B49, 5
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B24C4
	goto Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B24C4:: @ 81B24C4
	specialvar RESULT, sub_80B7CE8
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B24DE
	msgbox Route117_PokemonDayCare_Text_1B2A30, 4
	release
	end

Route117_PokemonDayCare_EventScript_1B24DE:: @ 81B24DE
	applymovement 1, Route117_PokemonDayCare_Movement_1B2543
	waitmovement 0
	specialvar RESULT, TakePokemonFromDaycare
	special sub_80B7D0C
	playse 95
	msgbox Route117_PokemonDayCare_Text_1B2B75, 4
	waitse
	playpokecry RESULT, 0
	msgbox Route117_PokemonDayCare_Text_1B2B93, 4
	waitpokecry
	specialvar RESULT, GetDaycareState
	compare RESULT, 2
	goto_if_eq Route117_PokemonDayCare_EventScript_1B2520
	goto Route117_PokemonDayCare_EventScript_1B23D0
	end

Route117_PokemonDayCare_EventScript_1B2520:: @ 81B2520
	msgbox Route117_PokemonDayCare_Text_1B2A4F, 5
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B2469
	goto Route117_PokemonDayCare_EventScript_1B23D0
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

@ 81B2557
	end

Route117_PokemonDayCare_EventScript_1B2558:: @ 81B2558
	msgbox Route117_PokemonDayCare_Text_1B2A88, 4
	setvar 0x8004, 0
	call Route117_PokemonDayCare_EventScript_1B241A
	setvar 0x8004, 1
	call Route117_PokemonDayCare_EventScript_1B241A
	msgbox Route117_PokemonDayCare_Text_1B2BF6, 5
	compare RESULT, 1
	goto_if_eq Route117_PokemonDayCare_EventScript_1B2469
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

@ 81B2591
	special ShowDaycareLevelMenu
	waitstate
	compare RESULT, 2
	goto_if_eq Route117_PokemonDayCare_EventScript_1B23D0
	copyvar 0x8004, RESULT
	specialvar RESULT, TakePokemonFromDaycare
	msgbox Route117_PokemonDayCare_Text_1B2B75, 4
	msgbox Route117_PokemonDayCare_Text_1B2A76, 4
	release
	end

S_EggHatch:: @ 81B25BC
	lockall
	msgbox UnknownString_81B2C68, 4
	special EggHatch
	waitstate
	releaseall
	end
