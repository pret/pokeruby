RustboroCity_Gym_MapScripts:: @ 81578D8
	.byte 0

RustboroCity_Gym_EventScript_1578D9:: @ 81578D9
	trainerbattle 1, TRAINER_ROXANNE, 0, RustboroCity_Gym_Text_183EE5, RustboroCity_Gym_Text_183FC4, RustboroCity_Gym_EventScript_1578FE
	goto_if_unset FLAG_RECEIVED_TM39, RustboroCity_Gym_EventScript_15793C
	msgbox RustboroCity_Gym_Text_184252, 4
	release
	end

RustboroCity_Gym_EventScript_1578FE:: @ 81578FE
	message RustboroCity_Gym_Text_1840AB
	waitmessage
	call RustboroCity_Gym_EventScript_1A02C5
	msgbox RustboroCity_Gym_Text_1840D5, 4
	setflag FLAG_DEFEATED_RUSTBORO_GYM
	setflag FLAG_BADGE01_GET
	setvar VAR_RUSTBORO_STATE, 1
	addvar VAR_PETALBURG_GYM_STATE, 1
	setvar VAR_SPECIAL_8, 1
	call RustboroCity_Gym_EventScript_1A01C0
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_eq RustboroCity_Gym_EventScript_1A00FB
	goto RustboroCity_Gym_EventScript_15793C
	end

RustboroCity_Gym_EventScript_15793C:: @ 815793C
	giveitem_std ITEM_TM39_ROCK_TOMB
	compare RESULT, 0
	goto_if_eq RustboroCity_Gym_EventScript_1A029B
	setflag FLAG_RECEIVED_TM39
	msgbox RustboroCity_Gym_Text_184170, 4
	release
	end

RustboroCity_Gym_EventScript_157960:: @ 8157960
	trainerbattle 0, TRAINER_JOSH, 0, RustboroCity_Gym_Text_183D99, RustboroCity_Gym_Text_183DDD
	msgbox RustboroCity_Gym_Text_183DF9, 6
	end

RustboroCity_Gym_EventScript_157977:: @ 8157977
	trainerbattle 0, TRAINER_TOMMY, 0, RustboroCity_Gym_Text_183E38, RustboroCity_Gym_Text_183E78
	msgbox RustboroCity_Gym_Text_183E98, 6
	end

RustboroCity_Gym_EventScript_15798E:: @ 815798E
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_RUSTBORO_GYM, RustboroCity_Gym_EventScript_1579A3
	msgbox RustboroCity_Gym_Text_183A4B, 4
	release
	end

RustboroCity_Gym_EventScript_1579A3:: @ 81579A3
	msgbox RustboroCity_Gym_Text_183C90, 4
	release
	end

RustboroCity_Gym_EventScript_1579AD:: @ 81579AD
	lockall
	goto_if_set FLAG_BADGE01_GET, RustboroCity_Gym_EventScript_1579CD
	goto RustboroCity_Gym_EventScript_1579D7
	end

RustboroCity_Gym_EventScript_1579BD:: @ 81579BD
	lockall
	goto_if_set FLAG_BADGE01_GET, RustboroCity_Gym_EventScript_1579CD
	goto RustboroCity_Gym_EventScript_1579D7
	end

RustboroCity_Gym_EventScript_1579CD:: @ 81579CD
	msgbox RustboroCity_Gym_Text_1842E6, 4
	releaseall
	end

RustboroCity_Gym_EventScript_1579D7:: @ 81579D7
	msgbox RustboroCity_Gym_Text_1842CC, 4
	releaseall
	end
