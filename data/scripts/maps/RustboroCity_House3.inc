RustboroCity_House3_MapScripts:: @ 8157DEC
	.byte 0

RustboroCity_House3_EventScript_157DED:: @ 8157DED
	msgbox RustboroCity_House3_Text_185584, 2
	end

RustboroCity_House3_EventScript_157DF6:: @ 8157DF6
	msgbox RustboroCity_House3_Text_1855FA, 2
	end

RustboroCity_House3_EventScript_157DFF:: @ 8157DFF
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIKACHU, 0
	msgbox RustboroCity_House3_Text_18567D, 4
	waitmoncry
	release
	end
