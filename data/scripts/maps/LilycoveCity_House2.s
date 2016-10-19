LilycoveCity_House2_MapScripts:: @ 8159BA2
	.byte 0

LilycoveCity_House2_EventScript_159BA3:: @ 8159BA3
	lock
	faceplayer
	checkflag 234
	jumpif FLAG_IS_SET, LilycoveCity_House2_EventScript_159BDA
	msgbox LilycoveCity_House2_Text_18B83C, 4
	giveitem ITEM_TM44
	compare RESULT, 0
	jumpif EQUAL, LilycoveCity_House2_EventScript_1A029B
	setflag 234
	msgbox LilycoveCity_House2_Text_18B883, 4
	release
	end

LilycoveCity_House2_EventScript_159BDA:: @ 8159BDA
	msgbox LilycoveCity_House2_Text_18B883, 4
	release
	end
