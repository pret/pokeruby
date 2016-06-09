MossdeepCity_House3_MapScripts:: @ 815A971
	.byte 0

MossdeepCity_House3_EventScript_15A972:: @ 815A972
	lock
	faceplayer
	checkflag 152
	jumpeq MossdeepCity_House3_EventScript_15A9B1
	loadptr 0, MossdeepCity_House3_Text_18D909
	callstd 5
	compare RESULT, 0
	jumpeq MossdeepCity_House3_EventScript_15A9BB
	loadptr 0, MossdeepCity_House3_Text_18D9A9
	callstd 4
	setorcopyvar 0x8000, 0x108
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 152
	loadptr 0, MossdeepCity_House3_Text_18D9E3
	callstd 4
	release
	end

MossdeepCity_House3_EventScript_15A9B1:: @ 815A9B1
	loadptr 0, MossdeepCity_House3_Text_18DA44
	callstd 4
	release
	end

MossdeepCity_House3_EventScript_15A9BB:: @ 815A9BB
	loadptr 0, MossdeepCity_House3_Text_18DA26
	callstd 4
	release
	end

