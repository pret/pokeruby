RustboroCity_CuttersHouse_MapScripts:: @ 8157D26
	.byte 0

RustboroCity_CuttersHouse_EventScript_157D27:: @ 8157D27
	lock
	faceplayer
	checkflag 137
	goto_if_eq RustboroCity_CuttersHouse_EventScript_157D53
	msgbox RustboroCity_CuttersHouse_Text_18509C, 4
	giveitem ITEM_HM01
	setflag 137
	msgbox RustboroCity_CuttersHouse_Text_1851C9, 4
	release
	end

RustboroCity_CuttersHouse_EventScript_157D53:: @ 8157D53
	msgbox RustboroCity_CuttersHouse_Text_1851C9, 4
	release
	end

RustboroCity_CuttersHouse_EventScript_157D5D:: @ 8157D5D
	msgbox RustboroCity_CuttersHouse_Text_1852B3, 2
	end
