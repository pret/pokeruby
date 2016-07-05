FortreeCity_House5_MapScripts:: @ 8158231
	.byte 0

FortreeCity_House5_EventScript_158232:: @ 8158232
	msgbox FortreeCity_House5_Text_18696D, 2
	end

FortreeCity_House5_EventScript_15823B:: @ 815823B
	msgbox FortreeCity_House5_Text_1869D6, 2
	end

FortreeCity_House5_EventScript_158244:: @ 8158244
	lock
	faceplayer
	checksound
	pokecry SPECIES_ZIGZAGOON, 0
	msgbox FortreeCity_House5_Text_186A4F, 4
	waitpokecry
	release
	end
