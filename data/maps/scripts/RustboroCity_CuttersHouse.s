RustboroCity_CuttersHouse_MapScripts:: @ 8157D26
	.byte 0

RustboroCity_CuttersHouse_EventScript_157D27:: @ 8157D27
	lock
	faceplayer
	checkflag 137
	jumpeq RustboroCity_CuttersHouse_EventScript_157D53
	loadptr 0, RustboroCity_CuttersHouse_Text_18509C
	callstd 4
	setorcopyvar 0x8000, 0x153
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 137
	loadptr 0, RustboroCity_CuttersHouse_Text_1851C9
	callstd 4
	release
	end

RustboroCity_CuttersHouse_EventScript_157D53:: @ 8157D53
	loadptr 0, RustboroCity_CuttersHouse_Text_1851C9
	callstd 4
	release
	end

RustboroCity_CuttersHouse_EventScript_157D5D:: @ 8157D5D
	loadptr 0, RustboroCity_CuttersHouse_Text_1852B3
	callstd 2
	end

