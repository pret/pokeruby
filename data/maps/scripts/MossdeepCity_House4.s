MossdeepCity_House4_MapScripts:: @ 815AB30
	.byte 0

MossdeepCity_House4_EventScript_15AB31:: @ 815AB31
	lock
	faceplayer
	checkflag 2052
	jumpeq MossdeepCity_House4_EventScript_15AB46
	loadptr 0, MossdeepCity_House4_Text_18E0E3
	callstd 4
	release
	end

MossdeepCity_House4_EventScript_15AB46:: @ 815AB46
	loadptr 0, MossdeepCity_House4_Text_18E125
	callstd 4
	release
	end

MossdeepCity_House4_EventScript_15AB50:: @ 815AB50
	lock
	faceplayer
	special 7
	compare RESULT, 0
	jumpeq MossdeepCity_House4_EventScript_15AB6D
	special 278
	loadptr 0, MossdeepCity_House4_Text_18E17E
	callstd 4
	release
	end

MossdeepCity_House4_EventScript_15AB6D:: @ 815AB6D
	loadptr 0, MossdeepCity_House4_Text_18E1A7
	callstd 4
	release
	end

MossdeepCity_House4_EventScript_15AB77:: @ 815AB77
	lock
	faceplayer
	checksound
	pokecry SPECIES_SKITTY, 0
	loadptr 0, MossdeepCity_House4_Text_18E1E1
	callstd 4
	waitpokecry
	release
	end

