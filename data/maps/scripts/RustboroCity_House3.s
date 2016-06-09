RustboroCity_House3_MapScripts:: @ 8157DEC
	.byte 0

RustboroCity_House3_EventScript_157DED:: @ 8157DED
	loadptr 0, RustboroCity_House3_Text_185584
	callstd 2
	end

RustboroCity_House3_EventScript_157DF6:: @ 8157DF6
	loadptr 0, RustboroCity_House3_Text_1855FA
	callstd 2
	end

RustboroCity_House3_EventScript_157DFF:: @ 8157DFF
	lock
	faceplayer
	checksound
	pokecry SPECIES_PIKACHU, 0
	loadptr 0, RustboroCity_House3_Text_18567D
	callstd 4
	waitpokecry
	release
	end

