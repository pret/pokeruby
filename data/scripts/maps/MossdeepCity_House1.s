MossdeepCity_House1_MapScripts:: @ 815A82E
	.byte 0

MossdeepCity_House1_EventScript_15A82F:: @ 815A82F
	lock
	faceplayer
	bufferfirstpoke 0
	msgbox MossdeepCity_House1_Text_18D465, 4
	specialval RESULT, 277
	compare RESULT, 0
	jumpif EQUAL, MossdeepCity_House1_EventScript_15A855
	msgbox MossdeepCity_House1_Text_18D475, 4
	release
	end

MossdeepCity_House1_EventScript_15A855:: @ 815A855
	msgbox MossdeepCity_House1_Text_18D4C0, 4
	release
	end

MossdeepCity_House1_EventScript_15A85F:: @ 815A85F
	msgbox MossdeepCity_House1_Text_18D4F1, 2
	end
