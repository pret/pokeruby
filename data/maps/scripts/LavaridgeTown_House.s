LavaridgeTown_House_MapScripts:: @ 81538AD
	.byte 0

LavaridgeTown_House_EventScript_1538AE:: @ 81538AE
	loadptr 0, LavaridgeTown_House_Text_176D07
	callstd 2
	end

LavaridgeTown_House_EventScript_1538B7:: @ 81538B7
	lock
	faceplayer
	checksound
	pokecry SPECIES_ZIGZAGOON, 0
	loadptr 0, LavaridgeTown_House_Text_176D94
	callstd 4
	waitpokecry
	release
	end

