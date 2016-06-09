RustboroCity_Flat2_1F_MapScripts:: @ 8157D79
	.byte 0

RustboroCity_Flat2_1F_EventScript_157D7A:: @ 8157D7A
	loadptr 0, RustboroCity_Flat2_1F_Text_1853DD
	callstd 2
	end

RustboroCity_Flat2_1F_EventScript_157D83:: @ 8157D83
	lock
	faceplayer
	checksound
	pokecry SPECIES_SKITTY, 0
	loadptr 0, RustboroCity_Flat2_1F_Text_185410
	callstd 4
	waitpokecry
	release
	end

