RustboroCity_Gym_MapScripts:: @ 81578D8
	.byte 0

RustboroCity_Gym_EventScript_1578D9:: @ 81578D9
	trainerbattle 1, 265, 0, RustboroCity_Gym_Text_183EE5, RustboroCity_Gym_Text_183FC4, RustboroCity_Gym_EventScript_1578FE
	checkflag 165
	jumpif 0, RustboroCity_Gym_EventScript_15793C
	loadptr 0, RustboroCity_Gym_Text_184252
	callstd 4
	release
	end

RustboroCity_Gym_EventScript_1578FE:: @ 81578FE
	message RustboroCity_Gym_Text_1840AB
	waittext
	call RustboroCity_Gym_EventScript_1A02C5
	loadptr 0, RustboroCity_Gym_Text_1840D5
	callstd 4
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
	setorcopyvar 0x8000, 0x147
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq RustboroCity_Gym_EventScript_1A029B
	setflag 165
	loadptr 0, RustboroCity_Gym_Text_184170
	callstd 4
	release
	end

RustboroCity_Gym_EventScript_157960:: @ 8157960
	trainerbattle 0, 320, 0, RustboroCity_Gym_Text_183D99, RustboroCity_Gym_Text_183DDD
	loadptr 0, RustboroCity_Gym_Text_183DF9
	callstd 6
	end

RustboroCity_Gym_EventScript_157977:: @ 8157977
	trainerbattle 0, 321, 0, RustboroCity_Gym_Text_183E38, RustboroCity_Gym_Text_183E78
	loadptr 0, RustboroCity_Gym_Text_183E98
	callstd 6
	end

RustboroCity_Gym_EventScript_15798E:: @ 815798E
	lock
	faceplayer
	checkflag 1201
	jumpeq RustboroCity_Gym_EventScript_1579A3
	loadptr 0, RustboroCity_Gym_Text_183A4B
	callstd 4
	release
	end

RustboroCity_Gym_EventScript_1579A3:: @ 81579A3
	loadptr 0, RustboroCity_Gym_Text_183C90
	callstd 4
	release
	end

RustboroCity_Gym_EventScript_1579AD:: @ 81579AD
	lockall
	checkflag 2055
	jumpeq RustboroCity_Gym_EventScript_1579CD
	jump RustboroCity_Gym_EventScript_1579D7
	end

RustboroCity_Gym_EventScript_1579BD:: @ 81579BD
	lockall
	checkflag 2055
	jumpeq RustboroCity_Gym_EventScript_1579CD
	jump RustboroCity_Gym_EventScript_1579D7
	end

RustboroCity_Gym_EventScript_1579CD:: @ 81579CD
	loadptr 0, RustboroCity_Gym_Text_1842E6
	callstd 4
	releaseall
	end

RustboroCity_Gym_EventScript_1579D7:: @ 81579D7
	loadptr 0, RustboroCity_Gym_Text_1842CC
	callstd 4
	releaseall
	end

