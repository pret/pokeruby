FortreeCity_House5_MapScripts:: @ 8158231
	.byte 0

FortreeCity_House5_EventScript_158232:: @ 8158232
	msgbox FortreeCity_House5_Text_18696D, MSGBOX_NPC
	end

FortreeCity_House5_EventScript_15823B:: @ 815823B
	msgbox FortreeCity_House5_Text_1869D6, MSGBOX_NPC
	end

FortreeCity_House5_EventScript_158244:: @ 8158244
	lock
	faceplayer
	waitse
	playmoncry SPECIES_ZIGZAGOON, 0
	msgbox FortreeCity_House5_Text_186A4F, MSGBOX_DEFAULT
	waitmoncry
	release
	end
