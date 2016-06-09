MossdeepCity_House1_MapScripts:: @ 815A82E
	.byte 0

MossdeepCity_House1_EventScript_15A82F:: @ 815A82F
	lock
	faceplayer
	bufferfirstpoke 0
	loadptr 0, MossdeepCity_House1_Text_18D465
	callstd 4
	specialval RESULT, 277
	compare RESULT, 0
	jumpeq MossdeepCity_House1_EventScript_15A855
	loadptr 0, MossdeepCity_House1_Text_18D475
	callstd 4
	release
	end

MossdeepCity_House1_EventScript_15A855:: @ 815A855
	loadptr 0, MossdeepCity_House1_Text_18D4C0
	callstd 4
	release
	end

MossdeepCity_House1_EventScript_15A85F:: @ 815A85F
	loadptr 0, MossdeepCity_House1_Text_18D4F1
	callstd 2
	end

