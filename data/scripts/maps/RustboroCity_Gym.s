RustboroCity_Gym_MapScripts:: @ 81578D8
	.byte 0

RustboroCity_Gym_EventScript_1578D9:: @ 81578D9
	trainerbattle 1, OPPONENT_ROXANNE, 0, RustboroCity_Gym_Text_183EE5, RustboroCity_Gym_Text_183FC4, RustboroCity_Gym_EventScript_1578FE
	checkflag 165
	jumpif 0, RustboroCity_Gym_EventScript_15793C
	msgbox RustboroCity_Gym_Text_184252, 4
	release
	end

RustboroCity_Gym_EventScript_1578FE:: @ 81578FE
	message RustboroCity_Gym_Text_1840AB
	waittext
	call RustboroCity_Gym_EventScript_1A02C5
	msgbox RustboroCity_Gym_Text_1840D5, 4
	setflag 1201
	setflag 2055
	setvar 0x405a, 1
	addvar 0x4085, 1
	setvar 0x8008, 1
	call RustboroCity_Gym_EventScript_1A01C0
	compare 0x4085, 6
	callif 1, RustboroCity_Gym_EventScript_1A00FB
	jump RustboroCity_Gym_EventScript_15793C
	end

RustboroCity_Gym_EventScript_15793C:: @ 815793C
	giveitem ITEM_TM39
	compare RESULT, 0
	jumpif EQUAL, RustboroCity_Gym_EventScript_1A029B
	setflag 165
	msgbox RustboroCity_Gym_Text_184170, 4
	release
	end

RustboroCity_Gym_EventScript_157960:: @ 8157960
	trainerbattle 0, OPPONENT_JOSH, 0, RustboroCity_Gym_Text_183D99, RustboroCity_Gym_Text_183DDD
	msgbox RustboroCity_Gym_Text_183DF9, 6
	end

RustboroCity_Gym_EventScript_157977:: @ 8157977
	trainerbattle 0, OPPONENT_TOMMY, 0, RustboroCity_Gym_Text_183E38, RustboroCity_Gym_Text_183E78
	msgbox RustboroCity_Gym_Text_183E98, 6
	end

RustboroCity_Gym_EventScript_15798E:: @ 815798E
	lock
	faceplayer
	checkflag 1201
	jumpif EQUAL, RustboroCity_Gym_EventScript_1579A3
	msgbox RustboroCity_Gym_Text_183A4B, 4
	release
	end

RustboroCity_Gym_EventScript_1579A3:: @ 81579A3
	msgbox RustboroCity_Gym_Text_183C90, 4
	release
	end

RustboroCity_Gym_EventScript_1579AD:: @ 81579AD
	lockall
	checkflag 2055
	jumpif EQUAL, RustboroCity_Gym_EventScript_1579CD
	jump RustboroCity_Gym_EventScript_1579D7
	end

RustboroCity_Gym_EventScript_1579BD:: @ 81579BD
	lockall
	checkflag 2055
	jumpif EQUAL, RustboroCity_Gym_EventScript_1579CD
	jump RustboroCity_Gym_EventScript_1579D7
	end

RustboroCity_Gym_EventScript_1579CD:: @ 81579CD
	msgbox RustboroCity_Gym_Text_1842E6, 4
	releaseall
	end

RustboroCity_Gym_EventScript_1579D7:: @ 81579D7
	msgbox RustboroCity_Gym_Text_1842CC, 4
	releaseall
	end
