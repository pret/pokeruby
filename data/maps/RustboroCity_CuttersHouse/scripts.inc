RustboroCity_CuttersHouse_MapScripts:: @ 8157D26
	.byte 0

RustboroCity_CuttersHouse_EventScript_157D27:: @ 8157D27
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_HM01, RustboroCity_CuttersHouse_EventScript_157D53
	msgbox RustboroCity_CuttersHouse_Text_18509C, MSGBOX_DEFAULT
	giveitem ITEM_HM01_CUT
	setflag FLAG_RECEIVED_HM01
	msgbox RustboroCity_CuttersHouse_Text_1851C9, MSGBOX_DEFAULT
	release
	end

RustboroCity_CuttersHouse_EventScript_157D53:: @ 8157D53
	msgbox RustboroCity_CuttersHouse_Text_1851C9, MSGBOX_DEFAULT
	release
	end

RustboroCity_CuttersHouse_EventScript_157D5D:: @ 8157D5D
	msgbox RustboroCity_CuttersHouse_Text_1852B3, MSGBOX_NPC
	end
