LilycoveCity_House2_MapScripts:: @ 8159BA2
	.byte 0

LilycoveCity_House2_EventScript_159BA3:: @ 8159BA3
	lock
	faceplayer
	checkflag 234
	jumpeq LilycoveCity_House2_EventScript_159BDA
	loadptr 0, LilycoveCity_House2_Text_18B83C
	callstd 4
	setorcopyvar 0x8000, 0x14c
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq LilycoveCity_House2_EventScript_1A029B
	setflag 234
	loadptr 0, LilycoveCity_House2_Text_18B883
	callstd 4
	release
	end

LilycoveCity_House2_EventScript_159BDA:: @ 8159BDA
	loadptr 0, LilycoveCity_House2_Text_18B883
	callstd 4
	release
	end

