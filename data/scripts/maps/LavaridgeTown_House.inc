LavaridgeTown_House_MapScripts:: @ 81538AD
	.byte 0

LavaridgeTown_House_EventScript_1538AE:: @ 81538AE
	msgbox LavaridgeTown_House_Text_176D07, 2
	end

LavaridgeTown_House_EventScript_1538B7:: @ 81538B7
	lock
	faceplayer
	waitse
	playmoncry SPECIES_ZIGZAGOON, 0
	msgbox LavaridgeTown_House_Text_176D94, 4
	waitmoncry
	release
	end
