RustboroCity_Gym_MapScripts:: @ 81578D8
	.byte 0

RustboroCity_Gym_EventScript_1578D9:: @ 81578D9
	trainerbattle_single TRAINER_ROXANNE, RustboroCity_Gym_Text_183EE5, RustboroCity_Gym_Text_183FC4, RustboroCity_Gym_EventScript_1578FE, NO_MUSIC
	goto_if_unset FLAG_RECEIVED_TM39, RustboroCity_Gym_EventScript_15793C
	msgbox RustboroCity_Gym_Text_184252, MSGBOX_DEFAULT
	release
	end

RustboroCity_Gym_EventScript_1578FE:: @ 81578FE
	message RustboroCity_Gym_Text_1840AB
	waitmessage
	call RustboroCity_Gym_EventScript_1A02C5
	msgbox RustboroCity_Gym_Text_1840D5, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_RUSTBORO_GYM
	setflag FLAG_BADGE01_GET
	setvar VAR_RUSTBORO_STATE, 1
	addvar VAR_PETALBURG_GYM_STATE, 1
	setvar VAR_0x8008, 1
	call Common_EventScript_SetGymTrainers
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_eq Common_EventScript_ReadyPetalburgGymForBattle
	goto RustboroCity_Gym_EventScript_15793C
	end

RustboroCity_Gym_EventScript_15793C:: @ 815793C
	giveitem ITEM_TM39_ROCK_TOMB
	compare VAR_RESULT, 0
	goto_if_eq RustboroCity_Gym_EventScript_1A029B
	setflag FLAG_RECEIVED_TM39
	msgbox RustboroCity_Gym_Text_184170, MSGBOX_DEFAULT
	release
	end

RustboroCity_Gym_EventScript_157960:: @ 8157960
	trainerbattle_single TRAINER_JOSH, RustboroCity_Gym_Text_183D99, RustboroCity_Gym_Text_183DDD
	msgbox RustboroCity_Gym_Text_183DF9, MSGBOX_AUTOCLOSE
	end

RustboroCity_Gym_EventScript_157977:: @ 8157977
	trainerbattle_single TRAINER_TOMMY, RustboroCity_Gym_Text_183E38, RustboroCity_Gym_Text_183E78
	msgbox RustboroCity_Gym_Text_183E98, MSGBOX_AUTOCLOSE
	end

RustboroCity_Gym_EventScript_15798E:: @ 815798E
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_RUSTBORO_GYM, RustboroCity_Gym_EventScript_1579A3
	msgbox RustboroCity_Gym_Text_183A4B, MSGBOX_DEFAULT
	release
	end

RustboroCity_Gym_EventScript_1579A3:: @ 81579A3
	msgbox RustboroCity_Gym_Text_183C90, MSGBOX_DEFAULT
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
	msgbox RustboroCity_Gym_Text_1842E6, MSGBOX_DEFAULT
	releaseall
	end

RustboroCity_Gym_EventScript_1579D7:: @ 81579D7
	msgbox RustboroCity_Gym_Text_1842CC, MSGBOX_DEFAULT
	releaseall
	end
